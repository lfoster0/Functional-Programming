data Tree a = Leaf a | Branch (Tree a) (Tree a)

-- Tail recursive function to count the leafs in a tree using an accumulator
count1 t = let
  count1' (Leaf a) acc = acc + 1
  count1' (Branch left right) acc = count1' right (count1' left acc)
  in count1' t 0

-- Tail recursive function to count the leafs in a tree using continuations
count2 t = let
  count2' (Leaf a) f = f 1
  count2' (Branch left right) f = count2' right cont where
    cont a = count2' left cont2 where
      cont2 b = f(a + b)
  in count2' t id

-- Tail recursive function to make an in-order list of the leaves of a tree
-- using an accumulator
inOrder1 t = let
  inOrder1' (Leaf a) xs  = a : xs
  inOrder1' (Branch left right) xs = inOrder1' left (inOrder1' right xs)
  in inOrder1' t []

-- Tail recursive function to make an in-order list of the leaves of a tree
-- using continuations
inOrder2 t = let
  inOrder2' (Leaf a) f = f (a:[])
  inOrder2' (Branch left right) f = inOrder2' left cont where
    cont a = inOrder2' right cont2 where
      cont2 b = f (a ++ b)
  in inOrder2' t id

-- Function to return a list of non-negative integers corresponding to the depth
-- of the leaves in-order
depth1 t = let
  depth1' (Leaf a) depth = (depth : [])
  depth1' (Branch left right) depth = (depth1' left (depth+1)) ++ (depth1' right (depth+1))
  in depth1' t 0

  -- Tail recursive function to return a list of non-negative integers corresponding to the depth
  -- of the leaves in-order
depth2 t = let
  depth2' (Leaf a) depth acc = (depth : acc)
  depth2' (Branch left right) depth acc = depth2' left (depth+1) (depth2' right (depth+1) acc)
  in depth2' t 0 []
