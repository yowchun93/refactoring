require_relative "../program_ver2.rb"

describe "Refactored MovieRentalCalculator" do
  it "works" do
    program = RefactoredProgram.new
    statement = program.print_customer_statement
    puts statement
    "   Rental Records for YC
       	Superman	6.5
       	Superman New Release	15"
    expect(statement).to eq("hello")
  end

end
