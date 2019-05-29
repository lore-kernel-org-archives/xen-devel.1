From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Intel Atom CPU model (C2750) Woes & Debian
Date: Wed, 29 May 2019 14:36:24 -0700
Message-ID: <15101486-c6a3-536d-eddb-52a9cc3731b8@gmail.com>
Reply-To: jlpoole56@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3657926831312295125=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============3657926831312295125==
Content-Type: multipart/alternative;
 boundary="------------E25D7229DC95FA77AE2C4BF2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E25D7229DC95FA77AE2C4BF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Referencing the expanding the thread I started several months ago entitled
"Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#", I installed a fresh hard
drive on my Supermicro Atom server class unit and did the following:

per: 
https://wiki.xen.org/wiki/Xen_Project_Beginners_Guide#Download_and_Burn_the_Debian_Installer_CD

downloaded: 
http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.9.0-amd64-netinst.iso
burned CD

on boot had to select UEFI ASUS install, the regular ASUS did not work.
console was blank,
screen attached has graphical image light blue, selected graphical install
proceeded with install.
Reboot.
did NOT perform the suggested: apt-get install firmware-linux-nonfree

performed:
     apt-get install xen-system-amd64
restart.
startup hangs.

So, I had in November of 2016 installed Debian on this then-new server
using:

      debian-8.6.0-amd64-netinst.iso

and then installed Xen using the above instructions.

What I propose to do now is duplicate my steps of November 2016.

If I succeed in launching DOM0 as I did in November/December 2016,
then we'll know this is a software issue.  If I fail, then I'd conclude
there is a hardware problem.  Recall, though I can install a standard
build of Debian 9.9 and Gentoo and the kernels load, it's only when
I have a Xen modified kernel that the boot-up hangs.

I'm not familiar with Debian other than I have easily installed it
before.  What would help me are some pointers to make sure
the Debian 8.6.0 does not go into auto-update mode and to identify and 
select
the Xen packages which were the high watermark in November 2016.

John



--------------E25D7229DC95FA77AE2C4BF2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Referencing the expanding the thread I started several months ago
      entitled<br>
      "Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#", I installed a
      fresh hard<br>
      drive on my Supermicro Atom server class unit and did the
      following:</p>
    <p>per:
<a class="moz-txt-link-freetext" href="https://wiki.xen.org/wiki/Xen_Project_Beginners_Guide#Download_and_Burn_the_Debian_Installer_CD">https://wiki.xen.org/wiki/Xen_Project_Beginners_Guide#Download_and_Burn_the_Debian_Installer_CD</a><br>
      <br>
      downloaded:
<a class="moz-txt-link-freetext" href="http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.9.0-amd64-netinst.iso">http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.9.0-amd64-netinst.iso</a><br>
      burned CD<br>
      <br>
      on boot had to select UEFI ASUS install, the regular ASUS did not
      work.<br>
      console was blank,<br>
      screen attached has graphical image light blue, selected graphical
      install<br>
      proceeded with install.<br>
      Reboot.<br>
      did NOT perform the suggested: apt-get install
      firmware-linux-nonfree<br>
      <br>
      performed:<br>
          apt-get install xen-system-amd64<br>
      restart.<br>
      startup hangs.</p>
    <p>So, I had in November of 2016 installed Debian on this then-new
      server<br>
      using:<br>
    </p>
    <p>     debian-8.6.0-amd64-netinst.iso</p>
    <p>and then installed Xen using the above instructions.</p>
    <p>What I propose to do now is duplicate my steps of November 2016.</p>
    <p>If I succeed in launching DOM0 as I did in November/December
      2016,<br>
      then we'll know this is a software issue.  If I fail, then I'd
      conclude<br>
      there is a hardware problem.  Recall, though I can install a
      standard<br>
      build of Debian 9.9 and Gentoo and the kernels load, it's only
      when<br>
      I have a Xen modified kernel that the boot-up hangs.</p>
    <p>I'm not familiar with Debian other than I have easily installed
      it<br>
      before.  What would help me are some pointers to make sure<br>
      the Debian 8.6.0 does not go into auto-update mode and to identify
      and select<br>
      the Xen packages which were the high watermark in November 2016.<br>
    </p>
    <div class="moz-signature"><font size="2"><font face="Verdana">John</font></font><br>
      <p><font size="2" face="Verdana">
          <br>
        </font></p>
    </div>
  </body>
</html>

--------------E25D7229DC95FA77AE2C4BF2--


--===============3657926831312295125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3657926831312295125==--
