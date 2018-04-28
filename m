From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [cubieboard2] Bringing up dom0
Date: Sat, 28 Apr 2018 18:36:47 +0100
Message-ID: <23a0e88b-95c6-9d55-32e1-0c7834999f98@citrix.com>
References: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
 <7c64b5a9-d11e-414b-52df-4db92d992526@citrix.com>
 <CAHP4M8WzCwcmr8rL459B0LjkdC0Eb2C+hQM8nzKF=A7PEpx=ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5401180874201853914=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=plwu=hr=citrix.com=prvs=649490be4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fCTmE-0007lu-9S
 for xen-devel@lists.xenproject.org; Sat, 28 Apr 2018 17:36:50 +0000
In-Reply-To: <CAHP4M8WzCwcmr8rL459B0LjkdC0Eb2C+hQM8nzKF=A7PEpx=ZQ@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ajay Garg <ajaygargnsit@gmail.com>
Cc: xen-devel@lists.xenproject.org, Xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5401180874201853914==
Content-Type: multipart/alternative;
	boundary="------------BAC947FB3509B85E5E7E7DC6"
Content-Language: en-GB

--------------BAC947FB3509B85E5E7E7DC6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 28/04/18 18:34, Ajay Garg wrote:
> Hi Andrew.
>
> Thanks for the reply.
>
> On Sat, Apr 28, 2018 at 10:57 PM, Andrew Cooper
> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     On 28/04/18 18:12, Ajay Garg wrote:
>>     Hi All.
>>
>>     We have brought up the cubieboard2 from almost scratch, following
>>     are the steps done :
>>
>>     <snip>
>>
>>     == getting xen ready ==
>>
>>     i)
>>     Compiled xen on cubieboard itself, via :
>>
>>        * git clone git://xenbits.xen.org/xen.git
>>     <http://xenbits.xen.org/xen.git>
>>        * cd xen
>>     .  * ./configure --libdir=/usr/lib
>>        * make debball CONFIG_EARLY_PRINTK=sun7i -j4
>>        * sudo dpkg -i dist/xen-upstream-4.11-unstable.deb
>>        * sudo reboot
>>
>>     ii)
>>     Upon reboot, "sudo xl list" gives following :
>>
>>     ##################################################################
>>     debian@debian-armhf:~$ sudo  xl list
>>     [sudo] password for debian:
>>     xencall: error: Could not obtain handle on privileged command
>>     interface: No such file or directory
>>     libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc
>>     handle: No such file or directory
>>     cannot init xl context
>>     ##################################################################
>
>     This means that /dev/xen/privcmd (or the legacy /proc/xen/privcmd)
>     device isn't available.
>
>     First check that you have actually booted Xen with Linux as dom0. 
>     You don't show any logs in this final section, and simply
>     installing the debball and rebooting won't typically cause Xen to
>     be the head of the boot list.
>
>
> Yes, I haven't been able to setup xen bootup.
>
> That's why, requested help regarding the changes that are required in
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts,
> that would cause dom0 to boot up.
>
>
> Sorry for the confusion.

Ah - sorry.  I misunderstood.  I'm afraid you're going to have to wait
for some people more knowledge about ARM to answer.

~Andrew

--------------BAC947FB3509B85E5E7E7DC6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 28/04/18 18:34, Ajay Garg wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHP4M8WzCwcmr8rL459B0LjkdC0Eb2C+hQM8nzKF=A7PEpx=ZQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div>Hi Andrew.<br>
          <br>
        </div>
        Thanks for the reply.<br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Sat, Apr 28, 2018 at 10:57 PM,
            Andrew Cooper <span dir="ltr">&lt;<a
                href="mailto:andrew.cooper3@citrix.com" target="_blank"
                moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF"><span class="gmail-">
                  <div
                    class="gmail-m_-4521707927368275737moz-cite-prefix">On
                    28/04/18 18:12, Ajay Garg wrote:<br>
                  </div>
                </span>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div><span class="gmail-">Hi All.<br>
                        <br>
                        We have brought up the cubieboard2 from almost
                        scratch, following are the steps done :<br>
                        <br>
                      </span> &lt;snip&gt;</div>
                    <span class="gmail-">
                      <div><br>
                        == getting xen ready ==<br>
                        <br>
                      </div>
                      <div>i)<br>
                      </div>
                      <div>Compiled xen on cubieboard itself, via :<br>
                        <br>
                           * git clone git://<a
                          href="http://xenbits.xen.org/xen.git"
                          target="_blank" moz-do-not-send="true">xenbits.xen.org/xen.git</a><br>
                           * cd xen<br>
                        .  * ./configure --libdir=/usr/lib<br>
                           * make debball CONFIG_EARLY_PRINTK=sun7i -j4<br>
                      </div>
                      <div>   * sudo dpkg -i dist/xen-upstream-4.11-<wbr>unstable.deb<br>
                      </div>
                      <div>   * sudo reboot<br>
                        <br>
                      </div>
                      <div>ii)<br>
                      </div>
                      <div>Upon reboot, "sudo xl list" gives following :<br>
                        <br>
                        ##############################<wbr>##############################<wbr>######<br>
                        debian@debian-armhf:~$ sudo  xl list<br>
                        [sudo] password for debian:<br>
                        xencall: error: Could not obtain handle on
                        privileged command interface: No such file or
                        directory<br>
                        libxl: error: libxl.c:102:libxl_ctx_alloc:
                        cannot open libxc handle: No such file or
                        directory<br>
                        cannot init xl context<br>
                        ##############################<wbr>##############################<wbr>######<br>
                      </div>
                    </span></div>
                </blockquote>
                <br>
                This means that /dev/xen/privcmd (or the legacy
                /proc/xen/privcmd) device isn't available.<br>
                <br>
                First check that you have actually booted Xen with Linux
                as dom0.  You don't show any logs in this final section,
                and simply installing the debball and rebooting won't
                typically cause Xen to be the head of the boot list.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Yes, I haven't been able to setup xen bootup.<br>
              <br>
            </div>
            <div>That's why, requested help regarding the changes that
              are required in <a
href="https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts"
                moz-do-not-send="true">https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts</a>,
              that would cause dom0 to boot up.<br>
              <br>
              <br>
            </div>
            <div>Sorry for the confusion.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Ah - sorry.  I misunderstood.  I'm afraid you're going to have to
    wait for some people more knowledge about ARM to answer.<br>
    <br>
    ~Andrew
  </body>
</html>

--------------BAC947FB3509B85E5E7E7DC6--


--===============5401180874201853914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5401180874201853914==--
