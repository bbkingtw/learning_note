* [nest table in tabulator](https://jsfiddle.net/p069ca2d/)
* [md5 syntax](https://www.markdownguide.org/cheat-sheet/)

[
    {
        "id": "ac1fd3c01be395ea",
        "type": "inject",
        "z": "f6f2187d.f17ca8",
        "name": "append topic",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "batch",
                "v": "100",
                "vt": "num"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "payloadType": "date",
        "x": 110,
        "y": 160,
        "wires": [
            [
                "ef274d28d5894c44",
                "31e58365700efa88",
                "bb3d94c7765d0835"
            ]
        ]
    },
    {
        "id": "ef274d28d5894c44",
        "type": "function",
        "z": "f6f2187d.f17ca8",
        "d": true,
        "name": "single",
        "func": "var ret=[]\n\ncnt=flow.get('cnt', 0)||0;\nvar k\n\nfor (var i=1; i<=msg.batch; i++) {\n    var k=cnt+i;\n    \n    ret.push({\n      expression:'0 * * * * * *',\n      payload:k,\n      command:'add',\n      name:'name'+k\n      //expressionType: \"cron\",\n    })\n}\n\nflow.set('cnt', k)\n\nmsg.payload=ret;\nreturn msg;",
        "outputs": 1,
        "noerr": 0,
        "initialize": "",
        "finalize": "",
        "libs": [],
        "x": 290,
        "y": 140,
        "wires": [
            [
                "e75bf6a8e1cf37ae",
                "c78d95b5bbfda6fd"
            ]
        ]
    },
    {
        "id": "c355697cca8dce52",
        "type": "cronplus",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "outputField": "payload",
        "timeZone": "",
        "persistDynamic": false,
        "commandResponseMsgOutput": "output2",
        "outputs": 2,
        "options": [],
        "x": 380,
        "y": 80,
        "wires": [
            [
                "913a5760b68297f8",
                "e7884b5fce62bd37",
                "6eb8268883f4c13d"
            ],
            [
                "8e4451fa9d165b38"
            ]
        ]
    },
    {
        "id": "4b315a4eb67ed4d5",
        "type": "inject",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "status-all",
        "payloadType": "date",
        "x": 160,
        "y": 80,
        "wires": [
            [
                "c355697cca8dce52"
            ]
        ]
    },
    {
        "id": "8e4451fa9d165b38",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": true,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 750,
        "y": 380,
        "wires": []
    },
    {
        "id": "31e58365700efa88",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 110,
        "y": 220,
        "wires": []
    },
    {
        "id": "e75bf6a8e1cf37ae",
        "type": "split",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "splt": "\\n",
        "spltType": "str",
        "arraySplt": 1,
        "arraySpltType": "len",
        "stream": false,
        "addname": "",
        "x": 490,
        "y": 160,
        "wires": [
            [
                "c355697cca8dce52",
                "4fab2b01c8d48863"
            ]
        ]
    },
    {
        "id": "2f543f61937ff0a1",
        "type": "join",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "mode": "auto",
        "build": "object",
        "property": "payload",
        "propertyType": "msg",
        "key": "topic",
        "joiner": "\\n",
        "joinerType": "str",
        "accumulate": "false",
        "timeout": "",
        "count": "",
        "reduceRight": false,
        "x": 590,
        "y": 380,
        "wires": [
            [
                "84679241a9191ff0"
            ]
        ]
    },
    {
        "id": "84679241a9191ff0",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 710,
        "y": 440,
        "wires": []
    },
    {
        "id": "4fab2b01c8d48863",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 530,
        "y": 220,
        "wires": []
    },
    {
        "id": "913a5760b68297f8",
        "type": "switch",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "property": "parts",
        "propertyType": "msg",
        "rules": [
            {
                "t": "nnull"
            }
        ],
        "checkall": "true",
        "repair": false,
        "outputs": 1,
        "x": 470,
        "y": 320,
        "wires": [
            [
                "2f543f61937ff0a1"
            ]
        ]
    },
    {
        "id": "5a87a20b9a010ef8",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 750,
        "y": 300,
        "wires": []
    },
    {
        "id": "435dce553cfc9d77",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 470,
        "y": 460,
        "wires": []
    },
    {
        "id": "c78d95b5bbfda6fd",
        "type": "change",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "rules": [
            {
                "t": "set",
                "p": "payload",
                "pt": "msg",
                "to": "cnt",
                "tot": "flow"
            }
        ],
        "action": "",
        "property": "",
        "from": "",
        "to": "",
        "reg": false,
        "x": 410,
        "y": 400,
        "wires": [
            [
                "435dce553cfc9d77"
            ]
        ]
    },
    {
        "id": "d1c09107e59da878",
        "type": "inject",
        "z": "f6f2187d.f17ca8",
        "name": "remove-all",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "payloadType": "date",
        "x": 120,
        "y": 420,
        "wires": [
            [
                "28524c60f196c313"
            ]
        ]
    },
    {
        "id": "28524c60f196c313",
        "type": "change",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "rules": [
            {
                "t": "set",
                "p": "cnt",
                "pt": "flow",
                "to": "0",
                "tot": "num"
            },
            {
                "t": "set",
                "p": "topic",
                "pt": "msg",
                "to": "remove-all",
                "tot": "str"
            },
            {
                "t": "delete",
                "p": "chart",
                "pt": "flow"
            }
        ],
        "action": "",
        "property": "",
        "from": "",
        "to": "",
        "reg": false,
        "x": 140,
        "y": 360,
        "wires": [
            [
                "ef274d28d5894c44",
                "c355697cca8dce52"
            ]
        ]
    },
    {
        "id": "e91ef64d4820f7f0",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "topic",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 820,
        "y": 240,
        "wires": []
    },
    {
        "id": "bb3d94c7765d0835",
        "type": "function",
        "z": "f6f2187d.f17ca8",
        "name": "array",
        "func": "var ret=[]\n\ncnt=flow.get('cnt', 0)||0;\nvar k\nvar jobs=[];\n\nfor (var i=1; i<=msg.batch; i++) {\n    var k=cnt+i;\n    jobs.push(k)\n}\n\nret.push({\n  expression:'0 * * * * * *',\n  payload:jobs,\n  command:'add',\n  name:'name'+k,\n  payloadType:'array',\n  //expressionType: \"cron\",\n})\n\nflow.set('cnt', k)\n\nmsg.payload=ret;\nreturn msg;",
        "outputs": 1,
        "noerr": 0,
        "initialize": "",
        "finalize": "",
        "libs": [],
        "x": 290,
        "y": 200,
        "wires": [
            [
                "e75bf6a8e1cf37ae",
                "ad8405d21ffedb60"
            ]
        ]
    },
    {
        "id": "ad8405d21ffedb60",
        "type": "change",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "rules": [
            {
                "t": "set",
                "p": "payload",
                "pt": "msg",
                "to": "payload[msg.payload.length-1]",
                "tot": "msg"
            },
            {
                "t": "set",
                "p": "payload",
                "pt": "msg",
                "to": "payload[0].payload",
                "tot": "msg"
            },
            {
                "t": "set",
                "p": "payload",
                "pt": "msg",
                "to": "payload[msg.payload.length-1]",
                "tot": "msg"
            }
        ],
        "action": "",
        "property": "",
        "from": "",
        "to": "",
        "reg": false,
        "x": 320,
        "y": 520,
        "wires": [
            [
                "465bb31fad6beca4"
            ]
        ]
    },
    {
        "id": "465bb31fad6beca4",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 350,
        "y": 600,
        "wires": []
    },
    {
        "id": "c1af88bf267bc747",
        "type": "change",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "rules": [
            {
                "t": "set",
                "p": "payload",
                "pt": "msg",
                "to": "payload.payload",
                "tot": "msg"
            }
        ],
        "action": "",
        "property": "",
        "from": "",
        "to": "",
        "reg": false,
        "x": 490,
        "y": 720,
        "wires": [
            [
                "8f4c27f7e9ecb580"
            ]
        ]
    },
    {
        "id": "8f4c27f7e9ecb580",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 690,
        "y": 720,
        "wires": []
    },
    {
        "id": "7f0b76f1e5a642a9",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "true",
        "targetType": "full",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 710,
        "y": 200,
        "wires": []
    },
    {
        "id": "6eb8268883f4c13d",
        "type": "split",
        "z": "f6f2187d.f17ca8",
        "name": "split same freq jobs",
        "splt": "\\n",
        "spltType": "str",
        "arraySplt": 1,
        "arraySpltType": "len",
        "stream": false,
        "addname": "",
        "x": 590,
        "y": 20,
        "wires": [
            [
                "388065ff1e74c6c7",
                "5f06b0e7b7d5bb04",
                "83a7f83009bd1169"
            ]
        ]
    },
    {
        "id": "388065ff1e74c6c7",
        "type": "function",
        "z": "f6f2187d.f17ca8",
        "name": "calc payload for different topic (chart series)",
        "func": "msg.topic=msg.payload;\nmsg.payload=Math.round(Math.random()*100);\nreturn msg;",
        "outputs": 1,
        "noerr": 0,
        "initialize": "",
        "finalize": "",
        "libs": [],
        "x": 830,
        "y": 140,
        "wires": [
            [
                "eae2f7b3d5e70cf8",
                "a1339000c7e826fd",
                "886398cc2f56e7a2"
            ]
        ]
    },
    {
        "id": "5f06b0e7b7d5bb04",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "topic",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 940,
        "y": 20,
        "wires": []
    },
    {
        "id": "83a7f83009bd1169",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 950,
        "y": 80,
        "wires": []
    },
    {
        "id": "e7884b5fce62bd37",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "true",
        "targetType": "full",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 590,
        "y": 80,
        "wires": []
    },
    {
        "id": "a1339000c7e826fd",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 1130,
        "y": 160,
        "wires": []
    },
    {
        "id": "eae2f7b3d5e70cf8",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "topic",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 1120,
        "y": 100,
        "wires": []
    },
    {
        "id": "b79832b4c674dd21",
        "type": "inject",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "props": [],
        "repeat": "1",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "x": 90,
        "y": 680,
        "wires": [
            [
                "2f43945042ef33d4"
            ]
        ]
    },
    {
        "id": "fcd40ac0134c7414",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 370,
        "y": 20,
        "wires": []
    },
    {
        "id": "2f43945042ef33d4",
        "type": "function",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "func": "msg.payload=new Date();\nreturn msg;",
        "outputs": 1,
        "noerr": 0,
        "initialize": "",
        "finalize": "",
        "libs": [],
        "x": 270,
        "y": 680,
        "wires": [
            [
                "fcd40ac0134c7414"
            ]
        ]
    },
    {
        "id": "5d1a43b93217158c",
        "type": "ui_numeric",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "label": "start",
        "tooltip": "",
        "group": "3691a331ac9023e0",
        "order": 1,
        "width": 0,
        "height": 0,
        "wrap": false,
        "passthru": true,
        "topic": "topic",
        "topicType": "msg",
        "format": "{{value}}",
        "min": 0,
        "max": "1000",
        "step": 1,
        "className": "",
        "x": 730,
        "y": 520,
        "wires": [
            [
                "15d95dd9ebb61cc7"
            ]
        ]
    },
    {
        "id": "3780c98b0af0860a",
        "type": "ui_numeric",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "label": "end",
        "tooltip": "",
        "group": "3691a331ac9023e0",
        "order": 2,
        "width": 0,
        "height": 0,
        "wrap": false,
        "passthru": true,
        "topic": "topic",
        "topicType": "msg",
        "format": "{{value}}",
        "min": 0,
        "max": "1000",
        "step": 1,
        "className": "",
        "x": 730,
        "y": 600,
        "wires": [
            [
                "1962f2aa84d35200"
            ]
        ]
    },
    {
        "id": "3d0b3b892767e2e5",
        "type": "change",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "rules": [
            {
                "t": "set",
                "p": "start",
                "pt": "flow",
                "to": "payload",
                "tot": "msg"
            }
        ],
        "action": "",
        "property": "",
        "from": "",
        "to": "",
        "reg": false,
        "x": 1080,
        "y": 520,
        "wires": [
            []
        ]
    },
    {
        "id": "ad97583ee7e7b4af",
        "type": "change",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "rules": [
            {
                "t": "set",
                "p": "end",
                "pt": "flow",
                "to": "payload",
                "tot": "msg"
            }
        ],
        "action": "",
        "property": "",
        "from": "",
        "to": "",
        "reg": false,
        "x": 1090,
        "y": 600,
        "wires": [
            []
        ]
    },
    {
        "id": "6f383d3c15491ce8",
        "type": "ui_button",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "group": "3691a331ac9023e0",
        "order": 3,
        "width": 0,
        "height": 0,
        "passthru": false,
        "label": "button",
        "tooltip": "",
        "color": "",
        "bgcolor": "",
        "className": "",
        "icon": "",
        "payload": "",
        "payloadType": "str",
        "topic": "topic",
        "topicType": "msg",
        "x": 970,
        "y": 300,
        "wires": [
            [
                "c9b9e944b3f33e54"
            ]
        ]
    },
    {
        "id": "886398cc2f56e7a2",
        "type": "function",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "func": "chart=flow.get('chart')||{}\nchart[msg.topic]=chart[msg.topic]||[]\nchart[msg.topic].push({topic:msg.topic, x:new Date(), y:msg.payload});\nflow.set('chart', chart)\nmsg.payload=chart\nreturn msg;",
        "outputs": 1,
        "noerr": 0,
        "initialize": "",
        "finalize": "",
        "libs": [],
        "x": 1030,
        "y": 220,
        "wires": [
            [
                "466e5e7a4de09d5d"
            ]
        ]
    },
    {
        "id": "c9b9e944b3f33e54",
        "type": "function",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "func": "msg.payload=flow.get('chart')||{}\nvar ret=[]\nfor (var k in msg.payload) {\n    ret=ret.concat(msg.payload[k])\n}\n\nstart=flow.get('start')\nend=flow.get('end')\n\nmsg.payload=ret.filter(e=>e.topic>=start && e.topic<=end);\nreturn msg;",
        "outputs": 1,
        "noerr": 0,
        "initialize": "",
        "finalize": "",
        "libs": [],
        "x": 1130,
        "y": 300,
        "wires": [
            [
                "e40b4faeaca33b3d",
                "5a51a55427aa5278"
            ]
        ]
    },
    {
        "id": "e40b4faeaca33b3d",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": true,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 1310,
        "y": 300,
        "wires": []
    },
    {
        "id": "5a51a55427aa5278",
        "type": "ui_table",
        "z": "f6f2187d.f17ca8",
        "group": "3691a331ac9023e0",
        "name": "",
        "order": 4,
        "width": 0,
        "height": 0,
        "columns": [
            {
                "field": "x",
                "title": "x",
                "width": "",
                "align": "left",
                "formatter": "plaintext",
                "formatterParams": {
                    "target": "_blank"
                }
            },
            {
                "field": "y",
                "title": "y",
                "width": "",
                "align": "left",
                "formatter": "plaintext",
                "formatterParams": {
                    "target": "_blank"
                }
            },
            {
                "field": "topic",
                "title": "topic",
                "width": "",
                "align": "left",
                "formatter": "plaintext",
                "formatterParams": {
                    "target": "_blank"
                }
            }
        ],
        "outputs": 0,
        "cts": false,
        "x": 1190,
        "y": 380,
        "wires": []
    },
    {
        "id": "466e5e7a4de09d5d",
        "type": "debug",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "active": false,
        "tosidebar": true,
        "console": false,
        "tostatus": true,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "payload",
        "statusType": "auto",
        "x": 1190,
        "y": 220,
        "wires": []
    },
    {
        "id": "eb26dbd8332a6c80",
        "type": "inject",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "payload": "",
        "payloadType": "date",
        "x": 1010,
        "y": 380,
        "wires": [
            [
                "c9b9e944b3f33e54"
            ]
        ]
    },
    {
        "id": "d0d9f0c587f694c2",
        "type": "inject",
        "z": "f6f2187d.f17ca8",
        "name": "append 500",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "batch",
                "v": "500",
                "vt": "num"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "payloadType": "date",
        "x": 130,
        "y": 280,
        "wires": [
            [
                "bb3d94c7765d0835"
            ]
        ]
    },
    {
        "id": "15d95dd9ebb61cc7",
        "type": "ui_text_input",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "label": "",
        "tooltip": "",
        "group": "3691a331ac9023e0",
        "order": 4,
        "width": 0,
        "height": 0,
        "passthru": true,
        "mode": "text",
        "delay": 300,
        "topic": "topic",
        "sendOnBlur": true,
        "className": "",
        "topicType": "msg",
        "x": 880,
        "y": 520,
        "wires": [
            [
                "3d0b3b892767e2e5",
                "5d1a43b93217158c"
            ]
        ]
    },
    {
        "id": "1962f2aa84d35200",
        "type": "ui_text_input",
        "z": "f6f2187d.f17ca8",
        "name": "",
        "label": "",
        "tooltip": "",
        "group": "3691a331ac9023e0",
        "order": 5,
        "width": 0,
        "height": 0,
        "passthru": true,
        "mode": "text",
        "delay": 300,
        "topic": "topic",
        "sendOnBlur": true,
        "className": "",
        "topicType": "msg",
        "x": 880,
        "y": 600,
        "wires": [
            [
                "ad97583ee7e7b4af",
                "3780c98b0af0860a"
            ]
        ]
    },
    {
        "id": "3691a331ac9023e0",
        "type": "ui_group",
        "name": "CHART",
        "tab": "cae7e60c5f52eb20",
        "order": 1,
        "disp": true,
        "width": "19",
        "collapse": false,
        "className": ""
    },
    {
        "id": "cae7e60c5f52eb20",
        "type": "ui_tab",
        "name": "TAB_TEST",
        "icon": "dashboard",
        "disabled": false,
        "hidden": false
    }
]
