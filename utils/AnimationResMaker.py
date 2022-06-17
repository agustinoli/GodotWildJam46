directions = ["Left", "LeftUp", "Up", "RightUp","Right", "RightDown", "Down", "LeftDown"]

animations = ["Idle","Run","Attack","Die","Alt"]

anim_size = [4,8,8,8,4]

model_string = "animations = [ { \"frames\": [  ], \"loop\": true, \"name\": \"New Anim\", \"speed\": 5.0},"

result_string =''

num_animations =0

# for i in range(len(directions)): #para cada direccion
#     for j in range(len(animations)): # para cada animacion        
#         for k in range(anim_size[j]): # para cada cuadro
#             valor = 0
#             for l in range(len(anim_size[0:j])):   # para cada animacion que ya pase
#                 valor_anim_anteriores = (anim_size[j])
#                 valor += valor_anim_anteriores
#             frame = 'SubResource( %i ),' % valor
#             print (valor)
#     num_animations +=1

# print('El numero de animaciones es:',num_animations)

my_40_animations_name = []

for dir in directions:
    for anim in animations:
        name = dir+anim
        my_40_animations_name += {name}

# print (my_40_animations_name)



my_40_animations_size = [4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4]

# print(my_40_animations_size)

# print(len(my_40_animations_size))


frame_count = 0
anim_count = 0
anim_SubResource=0
aux_str = ""
my_40_subres = []

for i in range(len(my_40_animations_size)):
    for j in range(my_40_animations_size[i]):
        frame_count += 1
        aux_str += "SubResource( %i ), " % frame_count
    my_40_subres.insert(i, aux_str) 
    # print("Para my_40_animations_name %s, tengo my_40_subres:" % my_40_animations_name[i] , my_40_subres[i] )   
    aux_str = ""


# for i in range(len(my_40_animations_name)):
#     print(my_40_animations_name[i], my_40_subres[i])
# print("frame_count",frame_count)
# print("anim_count",anim_count)

# print("SALIDA DEL PROGRAMA")

my_40_animations_string = []
for i in range(len(my_40_animations_name)):
    my_40_animations_string.insert(i, "{ \"frames\": ["+ my_40_subres[i] +"], \"loop\": true, \"name\": \""+ my_40_animations_name[i] +"\", \"speed\": 5.0},")


for i in range(40):
    print(my_40_animations_string[i])