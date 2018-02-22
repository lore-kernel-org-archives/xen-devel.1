From: bharat gohil <ghl.bhrt@gmail.com>
Subject: Re: ARM64:Porting xen to new hardware
Date: Thu, 22 Feb 2018 14:13:11 +0530
Message-ID: <CABdg74dpB=KhCuH3xrSaT3o-v7xwaO7zzbBNPOOYLQ2BUHir6w@mail.gmail.com>
References: <CABdg74cia0v3p5R+xRW2wBpgfRDaJ6HrBt0omEQVmdq=wQ6YvQ@mail.gmail.com>
 <CABdg74f62ADwVSikqeUyj2eSV5YZw6cr10u6nJ7PNquPiaqpsg@mail.gmail.com>
 <CAPD2p-mBxPD33URxy5r9fOokyKX-Ldq-eZB_OK+C=h9Anh802A@mail.gmail.com>
 <20170918144419.GA892@localhost.localdomain>
 <CABdg74dtvuQpyhBJvYUY_MHU1YDgvZ5ho8X_FV4knJrRBCzT=g@mail.gmail.com>
 <20170922134312.GF26248@char.us.oracle.com>
 <CABdg74f4Zsm46d-rYW7emwAep-NKuROuqXYjU0X9Phwj6-e_eA@mail.gmail.com>
 <24ba9a54-c166-b1f4-f120-b0b1a57762f8@epam.com>
 <CABdg74f5L=tcYdPqR_yg2CJRENpYtVXNh+DCY2Qtf2GWPgOexw@mail.gmail.com>
 <fb622a96-fee7-943c-0d29-803811c2e9f0@arm.com>
 <CABdg74cvBxXSS1UyGoHE8+f95Gn-V46gxqkwZRUiR5LxVa=AfQ@mail.gmail.com>
 <CAPD2p-=fU0SCAuuZvnMy3t5RyPGrk30moGPrStLp46a=9CG=fQ@mail.gmail.com>
 <CABdg74e6zQRAovFWTKOY0CDc7XgqVCXv75Wm_n8heBZKMwPrHA@mail.gmail.com>
 <7125b13d-aaea-0578-8a85-8e75e2abbe45@arm.com>
 <CABdg74cugG=EyNOWKZ1SJrHcstOFTV5nnyRmqtz2bC08xtFXvw@mail.gmail.com>
 <d65d42e5-33a4-04a2-2dab-211f9d444573@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6133058394306648970=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d65d42e5-33a4-04a2-2dab-211f9d444573@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============6133058394306648970==
Content-Type: multipart/alternative; boundary="000000000000aaee010565c9087c"

--000000000000aaee010565c9087c
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 6, 2017 at 6:59 PM, Julien Grall <julien.grall@arm.com> wrote:

> Hello,
>
> On 03/10/17 08:05, bharat gohil wrote:
>
>>
>>
>> On Fri, Sep 29, 2017 at 11:12 PM, Julien Grall <julien.grall@arm.com
>> <mailto:julien.grall@arm.com>> wrote:
>>
>>
>>
>>     On 09/29/2017 09:15 AM, bharat gohil wrote:
>>
>>         Hello
>>
>>
>>     Hi,
>>
>>     Please avoid top-posting.
>>
>>         The patch didn't work in my case.
>>
>>
>>     The patch will be useful only if the compatible string in the DT of
>>     your UART is "snps,dw-apb-uart". What is the compatible string for it?
>>
>> In my case, compatible string is "ns16550a".
>> Thanks,
>>
>
> Hmmm, looking back at the conversation your dom0 command line is:
>
> console=hvc0,921600n8 earlyprintk=xen debug ignore_loglevel rw
> root=/dev/mmcblk0p7
>
> earlyprintk=xen will do nothing as there are no Xen specific earlyprintk
> for Arm. For Dom0, I would recommend to use same same earlyprintk options
> as you would use on baremetal.
>
> This would allow you to get some early input if the kernel get stuck
> before the console has been setup.
>
I have tried your suggestion, I got following crash. It unable find
interrupt controller but this kernel working fine without Xen.
Do you have any suggestion?

[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] OF: of_irq_init: children
remain, but no parents
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Kernel panic - not
syncing: No interrupt controller found.
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] CPU: 0 PID: 0 Comm:
swapper/0 Not tainted 4.9.44+ #15
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Hardware name: XXXXX board
(DT)
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Call trace:
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008089f88>]
dump_backtrace+0x0/0x1d8
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff800808a184>]
show_stack+0x24/0x30
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff800838a0e4>]
dump_stack+0x94/0xb8
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008196da0>]
panic+0x124/0x270
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008c92c08>]
init_IRQ+0x24/0x2c
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008c909f8>]
start_kernel+0x230/0x388
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008c901e0>]
__primary_switched+0x5c/0x64
[2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Rebooting in 1 seconds..


>
> Furthermore, on a previous e-mail it has been mentioned that your problem
> might be because Linux will disable what it thinks unused clock. A way to
> prevent that (at least for debugging) is using add 'clk_ignore_unused' on
> the Linux command line.
>
> If the 2 suggestions above does not work, then you would have to
> instrument the kernel. When the hypervisor is build with debug enabled,
> there are is set a debug hvc provided. A useful one is hvc 0xfffd. For all
> of them, you can look at do_debug_trap in arch/arm/traps.c.
>
> I hope this will help.
>
> Cheers,
>
> --
> Julien Grall
>



-- 
Regards,
Bharat Gohil
Sr.Software Engineer
bharat.gohil@harman.com
+919427054633

--000000000000aaee010565c9087c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Oct 6, 2017 at 6:59 PM, Julien Grall <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hello,<br>
<br>
On 03/10/17 08:05, bharat gohil wrote:<span class=3D"gmail-"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
On Fri, Sep 29, 2017 at 11:12 PM, Julien Grall &lt;<a href=3D"mailto:julien=
.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a> &lt;mailto:<a hr=
ef=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</=
a>&gt;&gt; wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 On 09/29/2017 09:15 AM, bharat gohil wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hello<br>
<br>
<br>
=C2=A0 =C2=A0 Hi,<br>
<br>
=C2=A0 =C2=A0 Please avoid top-posting.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The patch didn&#39;t work in my case.<br>
<br>
<br>
=C2=A0 =C2=A0 The patch will be useful only if the compatible string in the=
 DT of<br>
=C2=A0 =C2=A0 your UART is &quot;snps,dw-apb-uart&quot;. What is the compat=
ible string for it?<br>
<br>
In my case, compatible string is &quot;ns16550a&quot;.<br>
Thanks,<br>
</blockquote>
<br></span>
Hmmm, looking back at the conversation your dom0 command line is:<span clas=
s=3D"gmail-"><br>
<br>
console=3Dhvc0,921600n8 earlyprintk=3Dxen debug ignore_loglevel rw root=3D/=
dev/mmcblk0p7<br>
<br></span>
earlyprintk=3Dxen will do nothing as there are no Xen specific earlyprintk =
for Arm. For Dom0, I would recommend to use same same earlyprintk options a=
s you would use on baremetal.<br>
<br>
This would allow you to get some early input if the kernel get stuck before=
 the console has been setup.<br></blockquote><div>I have tried your suggest=
ion, I got following crash. It unable find interrupt controller but this ke=
rnel working fine without Xen.<br></div><div>Do you have any suggestion?<br=
></div><div><br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000=
000] OF: of_irq_init: children remain, but no parents<br>[2018-02-22 14:04:=
15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] Kernel panic - not syncing: N=
o interrupt controller found.<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=
=C2=A0=C2=A0 0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.9.44+ #1=
5<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] Hardwa=
re name: XXXXX board (DT)<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=
=A0=C2=A0 0.000000] Call trace:<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=
=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff8008089f88&gt;] dump_backtrace+0x0/0x1=
d8<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] [&lt;=
ffffff800808a184&gt;] show_stack+0x24/0x30<br>[2018-02-22 14:04:15] (XEN) D=
OM0: [=C2=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff800838a0e4&gt;] dump_stack+0x=
94/0xb8<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] =
[&lt;ffffff8008196da0&gt;] panic+0x124/0x270<br>[2018-02-22 14:04:15] (XEN)=
 DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff8008c92c08&gt;] init_IRQ+0x=
24/0x2c<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] =
[&lt;ffffff8008c909f8&gt;] start_kernel+0x230/0x388<br>[2018-02-22 14:04:15=
] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff8008c901e0&gt;] __pr=
imary_switched+0x5c/0x64<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000] Rebooting in 1 seconds..<br>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Furthermore, on a previous e-mail it has been mentioned that your problem m=
ight be because Linux will disable what it thinks unused clock. A way to pr=
event that (at least for debugging) is using add &#39;clk_ignore_unused&#39=
; on the Linux command line.<br>
<br>
If the 2 suggestions above does not work, then you would have to instrument=
 the kernel. When the hypervisor is build with debug enabled, there are is =
set a debug hvc provided. A useful one is hvc 0xfffd. For all of them, you =
can look at do_debug_trap in arch/arm/traps.c.<br>
<br>
I hope this will help.<br>
<br>
Cheers,<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div>Regards,</div><div>Bharat =
Gohil</div><div>Sr.Software Engineer<br></div><div><a href=3D"mailto:bharat=
.gohil@harman.com" target=3D"_blank">bharat.gohil@harman.com</a><br></div><=
div>+919427054633</div></div></div></div>
</div></div>

--000000000000aaee010565c9087c--


--===============6133058394306648970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6133058394306648970==--
