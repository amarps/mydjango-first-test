alist = ['a', 'b', 'c']
blist = ['c', 'd', 'e']

asets = {'a', 'b', 'c'}
bsets = {'c', 'd', 'e'}

# sets

s_in_a_not_in_b = asets - bsets
s_in_a_or_in_b = asets | bsets
s_in_a_and_in_b = asets & bsets
s_in_a_or_b_not_both = asets ^ bsets

print(s_in_a_not_in_b)
print(s_in_a_or_in_b)
print(s_in_a_and_in_b)
print(s_in_a_or_b_not_both, end="\n===========\n")

# list
l_in_a_not_in_b =	 [ x for x in alist if x not in blist]

l_in_a_or_in_b  = 	 [ x for x in alist]
l_in_a_or_in_b.extend([x for x in blist if x not in alist])

l_in_a_and_in_b =	 [ x for x in alist if x in blist]

l_in_a_or_b_not_both = [ x for x in alist if x not in blist]
l_in_a_or_b_not_both.extend([x for x in blist if x not in alist])

print(l_in_a_not_in_b)
print(l_in_a_or_in_b)
print(l_in_a_and_in_b)
print(l_in_a_or_b_not_both, end="\n===========\n")