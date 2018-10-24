# Project 1
This project is a part of Distributed Operating Systems class of Fall 2018 (_COP5615_)
It implements actor model to achieve parallelism for calculation of sequences of k length, starting from 1 to n, whose sum of squares is a perfect square. 

### Group Members
- Rishabh Garg (_UFID_: **6649 9619**)
- Suhani Mehta (_UFID_: **4798 6909**)

### Execution Instructions
Traditional [mix](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html) structure is maintained. Execution script can be found at lib\proj1.exs

To execute, traverse to the directory containing _mix.exs_ file and execute `mix run proj1.exs n k`.
Ouput will be a list of all possible sequences of k consecutive integers that start from 1 to n, for which the sum of squares is a perfect square.

Sample run: `mix run proj1.exs 40 24`

### Remarks
- We were able to use approximately 5.177 cores effectively (for n = 1000000 and k = 4)
    > Real Time: 0.863 s<br />
    > User Time: 3.484 s<br />
    > System Time: 0.984 s<br />
- For the biggest input, maximum of 26200 processes were created.
- The approximate size of the work unit would be around 38 for input size of n = 1000000 and k = 4, that was decided after few trials and errors.
- Biggest problem solved was for n = 100000000 and k = 4