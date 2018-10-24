defmodule Proj1 do
  @moduledoc """
  Part of Distributed Operating Systems, class of Fall 2018.
  Developed by Rishabh Garg and Suhani Mehta
  """

  @doc ""
  Spawns actors. Calls loop1 function

  def lir(n,k) do
    pid = spawn(fn()->count_listen(0,n) end) 
    if n<9 do
     spawn(fn()-> loop1(1,k,n,pid) end)
    end
    if n<26200 do
       
      
     spawn(fn()-> loop1(1,k,round(n/8),pid) end)
     spawn(fn()-> loop1(round((n/8)+1),k,round(2*n/8),pid) end)
     spawn(fn()-> loop1(round((2*n/8)+1),k,round(3*n/8),pid) end)
     spawn(fn()-> loop1(round((3*n/8)+1),k,round(4*n/8),pid) end)
     spawn(fn()-> loop1(round((4*n/8)+1),k,round(5*n/8),pid) end)
     spawn(fn()-> loop1(round((5*n/8)+1),k,round(6*n/8),pid) end)
     spawn(fn()-> loop1(round((6*n/8)+1),k,round(7*n/8),pid) end)
     spawn(fn()-> loop1(round((7*n/8)+1),k,n,pid) end)
    end
    if n>=26200 do
      x = round(n/26200)
      for temp <- 0..26198 do
       spawn(fn()-> loop1(temp*x,k,((temp+1)*x)-1,pid) end)
      end
       spawn(fn()-> loop1(26199*x,k,n,pid) end)
     end
  end
 

  def loop1(num,k,n,pid1) when num == n do
    sum = :math.sqrt(sum_square(num..(num+k-1)))
    if trunc(sum)-sum == 0 do
        send(pid1,{:st,num})
    else 
        send(pid1,{:st2,num})
    end
  end

  def loop1(num,k,n,pid1) do
    sum = :math.sqrt(sum_square(num..(num+k-1)))
     if trunc(sum)-sum == 0 do
        send(pid1,{:st,num})
      else 
        send(pid1,{:st2,num})
    end
    loop1(num+1,k,n,pid1)    
  end

  def sum_square(nums) do
    nums
    |> Enum.map(&square/1)
    |> Enum.sum
  end
  
  def count_listen(counter,n) do
    receive do
      {:st,result} -> 
      IO.puts result
      counter = counter + 1
      if counter == n do
      System.halt(0)
      end
      count_listen(counter,n)
      {:st2,num} ->
      counter= counter + 1
      if counter == n do
      System.halt(0)
      end
      count_listen(counter,n)
    end
  end
 

  defp square(num), do: num*num

end

[n, k] = System.argv()
Proj1.lir(String.to_integer(n),String.to_integer(k))
Proj1.count_listen(0,String.to_integer(n))