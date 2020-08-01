<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<body>

<div class="container" style="margin-top:50px">
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-3">
            <div class="card">
                <div class="character-img">
                </div>
                <div class="card-body text-center">
                    <p class="card-text character-name"></p>
                    <p class="card-text job-grow-name"></p>
                </div>
            </div>
        </div>
        <div class="col-sm-7">
            <div class="card">
<%--                <div class="card-body">--%>
<%--                    <h4 class="card-title">데이터가져오기 테스트</h4>--%>
<%--                    <p class="card-text" id="serverId"></p>--%>
<%--                    <p class="card-text" id="characterId"></p>--%>
<%--                    <p class="card-text" id="characterName"></p>--%>
<%--                    <p class="card-text" id="level"></p>--%>
<%--                    <p class="card-text" id="jobId"></p>--%>
<%--                    <p class="card-text" id="jobName"></p>--%>
<%--                    <p class="card-text" id="jobGrowName"></p>--%>
<%--                </div>--%>
                <table class="table table-hover text-center">
                    <tbody>
                    <tr>
                        <th>무기</th>
                        <td>데우스 이미저리</td>
                        <td></td>
                        <td>암속강 + 15</td>
                        <td>+12강화(0)</td>
                    </tr>
                    <tr>
                        <th>무기</th>
                        <td>데우스 이미저리</td>
                        <td></td>
                        <td>암속강 + 15</td>
                        <td>+12강화(0)</td>
                    </tr>
                    <tr>
                        <th>무기</th>
                        <td>데우스 이미저리</td>
                        <td></td>
                        <td>암속강 + 15</td>
                        <td>+12강화(0)</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-sm-1"></div>
    </div>
</div>


</body>
</html>

<script type="text/javascript" src="/resources/js/DNF.js"></script>
<script>
    $(document).ready(function () {
        var serverId = '${server}';
        var characterName = '${characterName}';
        var characterId = "";
        var level = "";
        var jobId = "";
        var jobName = "";
        var jobGrowName = "";
        getCharacterBasicInfo();
        getCharacterStatus();
        getCharacterEquipment();
        function getCharacterBasicInfo() {
            DNFService.searchCharacter(serverId, characterName, function (result) {
                var BasicInfo = result.rows;
                characterId = BasicInfo[0].characterId;
                level = BasicInfo[0].level;
                jobId = BasicInfo[0].jobId;
                jobName = BasicInfo[0].jobName;
                jobGrowName = BasicInfo[0].jobGrowName;
                var characterImgSrc = "https://img-api.neople.co.kr/df/servers/" + serverId + "/characters/" + characterId + "?zoom=1";
                var backgroundImgSrc = "https://cdn.df.nexon.com/img/web/char/bg_char.jpg";
                var characterImg = "<img class='card-img-top' style='background-image: url(" + backgroundImgSrc + ")' src='" + characterImgSrc + "'>";
                $(".character-img").html(characterImg);
                $(".character-name").html(characterName);
                $(".job-grow-name").html(jobGrowName);
            });
        }

        function getCharacterStatus() {
            console.log(characterId);
            DNFService.getCharacterStatus(serverId, characterId, function (result) {
                console.log(result.status);
            });
        }

        function getCharacterEquipment() {
            DNFService.getCharacterEquipment(serverId, characterId, function (result) {
                console.log(result.equipment);
            });
        }

    });


</script>
