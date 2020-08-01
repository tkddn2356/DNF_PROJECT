console.log("DNF Module.....");
var DNFService = (function () {

    function getServerCode(server){
        if(server === '안톤'){
            return 'anton';
        }else if(server === '바칼'){
            return 'bakal';
        }
        else if(server === '카인'){
            return 'cain';
        }
        else if(server === '카시야스'){
            return 'casillas';
        }
        else if(server === '디레지에'){
            return 'diregie';
        }
        else if(server === '힐더'){
            return 'hilder';
        }
        else if(server === '프레이'){
            return 'prey';
        }
        else if(server === '시로코'){
            return 'siroco';
        }
    }

    function searchCharacter(server, characterName, callback, error) {
        $.ajax({
            type: 'get',
            url: '/searchCharacter/'+ server +"/" + characterName,
            dataType: 'text', // 리턴해주는 타입을 지정해줘야함
            async: false,
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        })
    }

    function getCharacterStatus(serverId, characterId, callback, error) {
        $.ajax({
            type: 'get',
            url: '/getCharacterStatus/'+ serverId +"/" + characterId,
            dataType: 'text', // 리턴해주는 타입을 지정해줘야함
            async: false,
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        })
    }

    function getCharacterEquipment(serverId, characterId, callback, error) {
        $.ajax({
            type: 'get',
            url: '/getCharacterEquipment/'+ serverId +"/" + characterId,
            dataType: 'text',
            async: false,
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er)
                };
            }
        })
    }





    return {
        getServerCode:getServerCode,
        searchCharacter:searchCharacter,
        getCharacterStatus:getCharacterStatus,
        getCharacterEquipment: getCharacterEquipment
    };

})();