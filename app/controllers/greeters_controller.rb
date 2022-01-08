class GreetersController < ApplicationController

  def index
    client = Ethereum::HttpClient.new("https://rpc-mumbai.maticvigil.com/v1/#{ENV['IDMATICVIGI']}")
    address = '0x6ACfFa359A0360392A94233F05B8936BCE9C4bfa'
    abi = [
      {
        "inputs": [],
        "name": "greet",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function",
        "constant": true
      },
      {
        "inputs": [
          {
            "internalType": "string",
            "name": "_message",
            "type": "string"
          }
        ],
        "name": "greeter",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      }
    ]
    key = Eth::Key.new priv: "#{ENV['PRIVATEKEY']}"
    @contract = Ethereum::Contract.create(name: "Greeting", client: client, address: address, abi: abi)
  end

  def create
    #byebug
    #render plain: params[:message]
    client = Ethereum::HttpClient.new("https://rpc-mumbai.maticvigil.com/v1/#{ENV['IDMATICVIGI']}")
    address = '0x6ACfFa359A0360392A94233F05B8936BCE9C4bfa'
    abi = [
      {
        "inputs": [],
        "name": "greet",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function",
        "constant": true
      },
      {
        "inputs": [
          {
            "internalType": "string",
            "name": "_message",
            "type": "string"
          }
        ],
        "name": "greeter",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      }
    ]
    key = Eth::Key.new priv: "#{ENV['PRIVATEKEY']}"
    @contract = Ethereum::Contract.create(name: "Greeting", client: client, address: address, abi: abi)
    @contract.key = key # set address for calling the fonction
    @contract.transact_and_wait.greeter(params[:message])
    redirect_to greeters_path, alert: "Cool you just greet the World with: #{params[:message]}"
  end 

  def new
  end

#  def greeter_params
#   params.permit(:greeting)
#  end



end
