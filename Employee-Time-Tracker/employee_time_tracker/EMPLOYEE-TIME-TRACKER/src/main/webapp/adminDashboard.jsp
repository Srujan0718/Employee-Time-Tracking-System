<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script>
        function calculateTimeDuration() {
            var startTime = document.forms["taskForm"]["startTime"].value;
            var endTime = document.forms["taskForm"]["endTime"].value;

            if (startTime && endTime) {
                // Convert start and end time to Date objects
                var start = new Date("2000-01-01T" + startTime + ":00");
                var end = new Date("2000-01-01T" + endTime + ":00");

                // Calculate duration in minutes
                var durationInMinutes = (end.getTime() - start.getTime()) / (1000 * 60);

                // Check if duration exceeds 8 hours (480 minutes)
                if (durationInMinutes > 480) {
                    alert("Error: Task duration cannot exceed 8 hours (480 minutes).");
                    return false;
                }

                var timeDurationInput = document.forms["taskForm"]["timeDuration"];
                var durationInHours = durationInMinutes / 60;
                timeDurationInput.value = durationInHours.toFixed(2); // Display duration in hours with two decimal places
            }
        }

        function validateForm() {
            var startTime = document.forms["taskForm"]["startTime"].value;
            var endTime = document.forms["taskForm"]["endTime"].value;

            // Convert start and end time to Date objects
            var start = new Date("2000-01-01T" + startTime + ":00");
            var end = new Date("2000-01-01T" + endTime + ":00");

            // Calculate duration in minutes
            var durationInMinutes = (end.getTime() - start.getTime()) / (1000 * 60);

            // Check if duration exceeds 8 hours (480 minutes)
            if (durationInMinutes > 480) {
                alert("Error: Task duration cannot exceed 8 hours (480 minutes).");
                return false;
            }

            var timeDurationInput = document.forms["taskForm"]["timeDuration"];
            var durationInHours = durationInMinutes / 60;
            timeDurationInput.value = durationInHours.toFixed(2); // Display duration in hours with two decimal places
            return true;
        }
    </script>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <form name="taskForm" action="assignTask" method="post" onsubmit="return validateForm()">
        <label>Employee Username: </label><input type="text" name="employeeUsername" required><br>
        <label>Project: </label><input type="text" name="project" required><br>
        <label>Date: </label><input type="date" name="date" required><br>
        <label>Start Time: </label><input type="time" name="startTime" required onchange="calculateTimeDuration()"><br>
        <label>End Time: </label><input type="time" name="endTime" required onchange="calculateTimeDuration()"><br>
        <label>Time Duration (hours): </label><input type="text" name="timeDuration" readonly><br>
        <label>Task Category: </label><input type="text" name="taskCategory" required><br>
        <label>Description: </label><textarea name="description" required></textarea><br>
        <input type="submit" value="Assign Task">
    </form>
</body>
</html>
