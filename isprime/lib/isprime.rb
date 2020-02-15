class Prime
    def self.runcheck(num)
        ans = "Not a Prime"
        if num <= 2
            ans = "Not a Prime"
        elsif (num > 2 && num % 2 ==0)
            ans = "Not a Prime"
        else
            loopnum = Math.sqrt(num).ceil
            puts "LoopNum: #{loopnum}"
            for i in 3..loopnum
                if(num % i == 0)
                    ans = "Not a Prime"
                    break
                else
                    ans = "It's a Prime!!!"
                end
            end
        end
        return ans
    end
end # End Module 
