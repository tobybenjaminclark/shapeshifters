// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calc_accuracy(current_pose, target_pose, threshold)
{
    var totalParts = 0;
    var accurateParts = 0;

    // Compare each pose part and calculate accuracy
    if (abs(current_pose.s2h - target_pose.s2h) <= threshold) accurateParts++;
    if (abs(current_pose.s2re - target_pose.s2re) <= threshold) accurateParts++;
    if (abs(current_pose.re2rw - target_pose.re2rw) <= threshold) accurateParts++;
    if (abs(current_pose.s2le - target_pose.s2le) <= threshold) accurateParts++;
    if (abs(current_pose.le2lw - target_pose.le2lw) <= threshold) accurateParts++;
    if (abs(current_pose.h2rk - target_pose.h2rk) <= threshold) accurateParts++;
    if (abs(current_pose.rk2rf - target_pose.rk2rf) <= threshold) accurateParts++;
    if (abs(current_pose.h2lk - target_pose.h2lk) <= threshold) accurateParts++;
    if (abs(current_pose.lk2lf - target_pose.lk2lf) <= threshold) accurateParts++;

    // Calculate accuracy percentage
    totalParts = 9; // Total number of pose parts
    var accuracyPercentage = (accurateParts / totalParts) * 100;

    return accuracyPercentage;
}
