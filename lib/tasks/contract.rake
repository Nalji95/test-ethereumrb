namespace :contract do

    desc "Compile and deploy contract"
    task :deploy do
      path = "#{Dir.pwd}/truffle/contracts/Greeting.sol" 

      key = Eth::Key.new priv: "#{ENV['PRIVATEKEY']}"


      puts "Deploing contract #{path}"  
      client = Ethereum::HttpClient.new("https://rpc-mumbai.maticvigil.com/v1/#{ENV['IDMATICVIGI']}")
      puts "the client: #{client}"
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

      address = '0x6ACfFa359A0360392A94233F05B8936BCE9C4bfa'
      contract = Ethereum::Contract.create(name: "Greeting", client: client, address: address, abi: abi)
      puts 'contract reconnu'

      contract.key = key
      #puts "greeter.greet: #{contract.call.greet}"
      #contract.transact_and_wait.greeter("Alex greet the World")
      puts "greeter.greet: #{contract.call.greet}"

    end
  
  end