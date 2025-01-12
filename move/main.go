package main

import (
	"fmt"
	"io"
	"os"
	"path/filepath"
)

func main() {
	homeDir, err := os.UserHomeDir()
	if err != nil {
		fmt.Println("Error getting home directory:", err)
		return
	}

	configFolder := filepath.Join(homeDir, ".config")

	_, err = os.Stat(configFolder)
	if err != nil {
		err := os.MkdirAll(configFolder, 0755)
		if err != nil {
			fmt.Println("Error creating config folder:", err)
			return
		}
		fmt.Println("Created config folder.")
	}

	nvimFolder := filepath.Join(configFolder, "nvim")

	_, err = os.Stat(nvimFolder)
	if err == nil {
		err = os.RemoveAll(nvimFolder)
		if err != nil {
			fmt.Println("Error removing existing nvim configuration:", err)
			return
		}
		fmt.Println("Removed existing nvim configuration.")
	}

	err = os.MkdirAll(nvimFolder, 0755)
	if err != nil {
		fmt.Println("Error creating nvim folder:", err)
		return
	}

	nvimOriginalPath, err := os.Getwd()
	if err != nil {
		fmt.Println("Error getting current directory:", err)
		return
	}

	nvimOriginalPath = filepath.Dir(nvimOriginalPath)

	nvimOriginalPath = filepath.Join(nvimOriginalPath, "nvim")

	err = filepath.Walk(nvimOriginalPath, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}

		relPath, err := filepath.Rel(nvimOriginalPath, path)
		if err != nil {
			return err
		}

		destPath := filepath.Join(nvimFolder, relPath)

		if info.IsDir() {
			return os.MkdirAll(destPath, info.Mode())
		}

		return copyFile(path, destPath)
	})

	if err != nil {
		fmt.Println("Error copying nvim configuration:", err)
	} else {
		fmt.Println("Copied nvim configuration.")
	}
}

func copyFile(src, dst string) error {
	sourceFile, err := os.Open(src)
	if err != nil {
		return err
	}
	defer sourceFile.Close()

	destFile, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer destFile.Close()

	_, err = io.Copy(destFile, sourceFile)
	return err
}
