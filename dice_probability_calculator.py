from itertools import product
from collections import Counter

blue = [1,1,2,2,3,3]
yellow = [4,4,5,5,6,6]
red = [7,7,8,8,9,9]

dice_types = {
    "blue": blue,
    "yellow": yellow,
    "red": red
}

# All legal combos: 0–2 of each, total dice = 1–6
def generate_legal_combos():
    combos = []
    for blue in range(0, 3):
        for yellow in range(0, 3):
            for red in range(0, 3):
                total = blue + yellow + red
                if 1 <= total <= 6:
                    combo = (["blue"] * blue +
                             ["yellow"] * yellow +
                             ["red"] * red)
                    combos.append(tuple(combo))
    return combos


def sum_distribution(combo):
    dist = Counter()
    sides = [dice_types[c] for c in combo]

    for outcome in product(*sides):
        dist[sum(outcome)] += 1

    total = sum(dist.values())
    for key in dist:
        dist[key] /= total

    return dist


def best_for_target(target):
    results = []
    for combo in generate_legal_combos():
        dist = sum_distribution(combo)
        prob = dist.get(target, 0)
        if prob > 0:
            results.append((prob, len(combo), combo))
    if not results:
        return None
    results.sort(key=lambda x: (-x[0], x[1]))
    return results[0]  # best only


def describe(combo):
    return f"{combo.count('blue')} blue, {combo.count('yellow')} yellow, {combo.count('red')} red"

# MAIN LOOP
i = 1
while i <= 20:

    desired = i
    best = best_for_target(desired)
    
    i += 1
    
    if best is None:
        print("\nNo possible way to hit that number with your dice.")
    else:
        prob, count, combo = best
        print("\n========================================")
        print(f"Best combination for {desired}:")
        print(f"Dice: {describe(combo)}")
        print(f"Raw dice: {combo}")
        print(f"Probability: {prob:.6f} ({prob*100:.2f}%)")
        print(f"Dice count: {count}")
        print("========================================")
