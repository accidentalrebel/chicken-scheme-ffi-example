enum Keys {
	UP = 0,
	RIGHT = 1,
	DOWN = 2,
	LEFT = 3
};

typedef struct Vec3 {
	float x;
	float y;
	float z;
} Vec3;

Vec3* Vec3Create(float x, float y, float z);
void Vec3Print(Vec3 v);
void KeyPrint(enum Keys k);
