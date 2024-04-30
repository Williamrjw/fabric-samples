package main

import (
	"log"
	"os"

	"github.com/hyperledger/fabric-sdk-go/pkg/gateway"
)

var contract *gateway.Contract

func initBlockchain() {
	log.Println("Initializing blockchain")

	// 连接到部署在docker容器中的fabric网络以及对应的合约
	wallet, err := gateway.NewFileSystemWallet("wallet")
	if err != nil {
	    log.Fatalf("Failed to create wallet: %v", err)
	}
	if !wallet.Exists("appUser") {
	    err = populateWallet(wallet)
	    if err != nil {
	        log.Fatalf("Failed to populate wallet contents: %v", err)
	    }
	}

	gw, err := gateway.Connect(
		gateway.WithConfig(gateway.Config{
			NetworkProfile: "./connection-org1.yaml",
		})
	)
}
func getTopicData() {

}

func saveToContract() {

}

func main() {
	initBlockchain()

	getTopicData()

	saveToContract()
}
