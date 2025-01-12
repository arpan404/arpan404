package main

import (
	"fmt"
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

	if err := os.MkdirAll(configFolder, 0755); err != nil {
		fmt.Println("Error creating config folder:", err)
		return
	}

	nvimFolder := filepath.Join(configFolder, "nvim")

	if _, err := os.Stat(nvimFolder); err == nil {
		if err := os.RemoveAll(nvimFolder); err != nil {
			fmt.Println("Error removing existing nvim configuration:", err)
			return
		}
		fmt.Println("Removed existing nvim configuration.")
	}

	currentDir, err := os.Getwd()
	if err != nil {
		fmt.Println("Error getting current directory:", err)
		return
	}

	nvimSourcePath := filepath.Join(filepath.Dir(currentDir), "nvim")

	err = os.Symlink(nvimSourcePath, nvimFolder)
	if err != nil {
		fmt.Println("Error creating symbolic link:", err)
		return
	}

	fmt.Println("Successfully linked nvim configuration.")
}
