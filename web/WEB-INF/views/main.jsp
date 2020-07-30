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

<div class="container" style="margin-top:100px">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">데이터가져오기 테스트</h4>
                    <div class="form-group" id="searchForm">
                        <div class="form-group">
                            <label>서버</label>
                            <select class="form-control" name="server">
                                <option>안톤</option>
                                <option>바칼</option>
                                <option>카인</option>
                                <option>카시야스</option>
                                <option>디레지에</option>
                                <option>힐더</option>
                                <option>프레이</option>
                                <option>시로코</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" name="characterName" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <div class="text-right">
                                <button class="btn btn-primary get-btn">가져오기 테스트</button>
                            </div>
                        </div>
                    </div>
                    <p class="card-text" id="serverId"></p>
                    <p class="card-text" id="characterId"></p>
                    <p class="card-text" id="characterName"></p>
                    <p class="card-text" id="level"></p>
                    <p class="card-text" id="jobId"></p>
                    <p class="card-text" id="jobName"></p>
                    <p class="card-text" id="jobGrowName"></p>
                </div>
            </div>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>


</body>
</html>

<script type="text/javascript" src="/resources/js/DNF.js"></script>
<script>
    $(document).ready(function () {

        var serverId = "";
        var characterName = "";
        var characterId = "";
        var level = "";
        var jobId = "";
        var jobName = "";
        var jobGrowName = "";

        $(".get-btn").on("click", function (e) {
            e.preventDefault();
            serverId = DNFService.getServerCode($("#searchForm").find("select[name='server']").val());
            characterName = $("#searchForm").find("input[name='characterName']").val();
            console.log(serverId);
            console.log(characterName);
            DNFService.searchCharacter(serverId, characterName, function (result) {
                alert(result);
                var resultArray = JSON.parse(result);
                var resultArrayRows = resultArray.rows;
                characterId = resultArrayRows[0].characterId;
                level = resultArrayRows[0].level;
                jobId = resultArrayRows[0].jobId;
                jobName = resultArrayRows[0].jobName;
                jobGrowName = resultArrayRows[0].jobGrowName;

                $("#serverId").html(serverId);
                $("#characterId").html(characterId);
                $("#characterName").html(characterName);
                $("#level").html(level);
                $("#jobId").html(jobId);
                $("#jobName").html(jobName);
                $("#jobGrowName").html(jobGrowName);

            });
        });
    });


</script>
