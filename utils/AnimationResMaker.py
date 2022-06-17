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

myanimations_name = []

for dir in directions:
    for anim in animations:
        name = dir+anim
        myanimations_name += {name}

# print (myanimations_name)



myanimations_size = [4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4,4,8,8,8,4]

# print(myanimations_size)

# print(len(myanimations_size))


frame_count = 0
anim_count = 0
anim_SubResource=0
aux_str = ""
mysubres = []

for i in range(len(myanimations_size)):
    for j in range(myanimations_size[i]):
        frame_count += 1
        aux_str += "SubResource( %i ), " % frame_count
    mysubres.insert(i, aux_str) 
    # print("Para myanimations_name %s, tengo mysubres:" % myanimations_name[i] , mysubres[i] )   
    aux_str = ""


# for i in range(len(myanimations_name)):
#     print(myanimations_name[i], mysubres[i])
# print("frame_count",frame_count)
# print("anim_count",anim_count)

# print("SALIDA DEL PROGRAMA")

myanimations_string = []
for i in range(len(myanimations_name)):
    myanimations_string.insert(i, "{ \"frames\": ["+ mysubres[i] +"], \"loop\": true, \"name\": \""+ myanimations_name[i] +"\", \"speed\": 5.0},")


for i in range(40):
    print(myanimations_string[i])