# hoja-device-fw (Mario Kart 8 Deluxe)

This fork aims to improve the Mario Kart 8 Deluxe experience using the ProGCC by manipulating motion sensor data.

With this firmware installed, only the Z-axis will register shake motion after *disabling* Motion Controls in the Web Configuration App. Now you can *enable* motion steering in Mario Kart, allowing you to input motion controls through the D-Pad, granting easy access to advanced strategies such as the motion glider, *without* losing the ability to perform shake tricks—since the accelerometer's Z-axis values remain registered.

## Known Issues

The current implementation contains a slight bug.  
From personal testing on a ProGCC V3.2, when motion controls are enabled, your vehicle will start steering slightly to the right after approximately 10 controller shakes. Your experience may vary.

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="assets/steer1.gif" alt="No shaking performed" width="300"/><br/>
        <strong>No shaking performed</strong>
      </td>
      <td align="center">
        <img src="assets/steer2.gif" alt="After several shake cycles" width="300"/><br/>
        <strong>After several shake cycles</strong>
      </td>
    </tr>
  </table>
</div>

Based on personal experience, this problem has little effect on gameplay. However, if you experience issues with this bug, it can be temporarily fixed by restarting your ProGCC.

---

**PROGCC V3 AND V3.1 ARE EXPERIMENTAL AND UNTESTED!**  
I do not own these controller versions, so I cannot test this firmware on them. While they should work fine, flash these firmware versions at your own risk!

---

## Contributing

Contributions, issues, and pull requests are welcome. I am fairly unexperienced with firmware development, so if you have suggestions or improvements for this firmware, please feel free to contribute.

## Contact

If you have any questions or discover more optimal solutions for this firmware, contact me on Discord: `@nolanimations`. 
