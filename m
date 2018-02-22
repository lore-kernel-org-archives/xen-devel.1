From: bharat gohil <ghl.bhrt@gmail.com>
Subject: Re: ARM64:Porting xen to new hardware
Date: Thu, 22 Feb 2018 16:08:30 +0530
Message-ID: <CABdg74fq+ghUfuNV890jgwmh0XXi8uhE+Tpi+e8DOL=6hC3yaQ@mail.gmail.com>
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
 <CABdg74dpB=KhCuH3xrSaT3o-v7xwaO7zzbBNPOOYLQ2BUHir6w@mail.gmail.com>
 <CABdg74eAf8T6QzyvsjcSTmxRS+A5B6Oa6805zeYfmxVYfc+Wtg@mail.gmail.com>
 <CABdg74erh-caFsWC-H7=GD3qaFpNxbk34F2Rzxd73sr1450VWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7491241672983812762=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABdg74erh-caFsWC-H7=GD3qaFpNxbk34F2Rzxd73sr1450VWw@mail.gmail.com>
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

--===============7491241672983812762==
Content-Type: multipart/alternative; boundary="001a1149308c19f6aa0565caa529"

--001a1149308c19f6aa0565caa529
Content-Type: text/plain; charset="UTF-8"

typo

On Thu, Feb 22, 2018 at 4:03 PM, bharat gohil <ghl.bhrt@gmail.com> wrote:

>
>
> On Thu, Feb 22, 2018 at 3:15 PM, bharat gohil <ghl.bhrt@gmail.com> wrote:
>
>>
>>
>> On Thu, Feb 22, 2018 at 2:13 PM, bharat gohil <ghl.bhrt@gmail.com> wrote:
>>
>>>
>>>
>>> On Fri, Oct 6, 2017 at 6:59 PM, Julien Grall <julien.grall@arm.com>
>>> wrote:
>>>
>>>> Hello,
>>>>
>>>> On 03/10/17 08:05, bharat gohil wrote:
>>>>
>>>>>
>>>>>
>>>>> On Fri, Sep 29, 2017 at 11:12 PM, Julien Grall <julien.grall@arm.com
>>>>> <mailto:julien.grall@arm.com>> wrote:
>>>>>
>>>>>
>>>>>
>>>>>     On 09/29/2017 09:15 AM, bharat gohil wrote:
>>>>>
>>>>>         Hello
>>>>>
>>>>>
>>>>>     Hi,
>>>>>
>>>>>     Please avoid top-posting.
>>>>>
>>>>>         The patch didn't work in my case.
>>>>>
>>>>>
>>>>>     The patch will be useful only if the compatible string in the DT of
>>>>>     your UART is "snps,dw-apb-uart". What is the compatible string for
>>>>> it?
>>>>>
>>>>> In my case, compatible string is "ns16550a".
>>>>> Thanks,
>>>>>
>>>>
>>>> Hmmm, looking back at the conversation your dom0 command line is:
>>>>
>>>> console=hvc0,921600n8 earlyprintk=xen debug ignore_loglevel rw
>>>> root=/dev/mmcblk0p7
>>>>
>>>> earlyprintk=xen will do nothing as there are no Xen specific
>>>> earlyprintk for Arm. For Dom0, I would recommend to use same same
>>>> earlyprintk options as you would use on baremetal.
>>>>
>>>> This would allow you to get some early input if the kernel get stuck
>>>> before the console has been setup.
>>>>
>>> I have tried your suggestion, I got following crash. It unable find
>>> interrupt controller but this kernel working fine without Xen.
>>> Do you have any suggestion?
>>>
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] OF: of_irq_init:
>>> children remain, but no parents
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Kernel panic - not
>>> syncing: No interrupt controller found.
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] CPU: 0 PID: 0 Comm:
>>> swapper/0 Not tainted 4.9.44+ #15
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Hardware name: XXXXX
>>> board (DT)
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Call trace:
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008089f88>]
>>> dump_backtrace+0x0/0x1d8
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff800808a184>]
>>> show_stack+0x24/0x30
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff800838a0e4>]
>>> dump_stack+0x94/0xb8
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008196da0>]
>>> panic+0x124/0x270
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008c92c08>]
>>> init_IRQ+0x24/0x2c
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008c909f8>]
>>> start_kernel+0x230/0x388
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] [<ffffff8008c901e0>]
>>> __primary_switched+0x5c/0x64
>>> [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Rebooting in 1 seconds..
>>>
>>>
>>
>> SoC has different interrupt parent than GIC so I make GIC as interrupt
>> parent and I am able to move ahead. update you once Dom0 boot completely.
>>
>
> System got hang and I got following traces related to energy aware
> scheduler. Is Xen affected with guest scheduling mechanism? I have SoC
> which has 4-Cortex A35 and 2-Cortex A72.
>
System got hang and I got following traces related to energy aware
scheduler. Is Xen affected with guest scheduling mechanism? I have SoC
which has 4-Cortex A35 and 2-Cortex A72.

>
> [    0.202545] Xen: initializing cpu4
> [    0.202562] Invalid sched_group_energy for CPU4
> [    0.202564] CPU4: update cpu_capacity 1024
> [    0.202566] CPU4: Booted secondary processor [410fd041]
> [    0.230197] Detected PIPT I-cache on CPU5
> [    0.230202] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_AA64MMFR0_EL1. Boot CPU: 0x00000000101122, CPU5: 0x00000000001124
> [    0.230250] Xen: initializing cpu5
> [    0.230264] Invalid sched_group_energy for CPU5
> [    0.230265] CPU5: update cpu_capacity 1024
> [    0.230267] CPU5: Booted secondary processor [410fd041]
> [    0.230373] Brought up 6 CPUs
> [    0.234084] SMP: Total of 6 processors activated.
> [    0.234108] CPU features: detected feature: 32-bit EL0 Support
> [    0.234382] CPU: All CPU(s) started at EL1
> [    0.234627] Invalid sched_group_energy for CPU5
> [    0.234662] CPU5: update max cpu_capacity 1024
> [    0.234680] Invalid sched_group_energy for Cluster5
> [    0.234698] Invalid sched_group_energy for CPU4
> [    0.234715] Invalid sched_group_energy for Cluster4
> [    0.234733] Invalid sched_group_energy for CPU3
> [    0.234750] Invalid sched_group_energy for Cluster3
> [    0.234767] Invalid sched_group_energy for CPU2
> [    0.234784] Invalid sched_group_energy for Cluster2
> [    0.234801] Invalid sched_group_energy for CPU1
> [    0.234819] Invalid sched_group_energy for Cluster1
> [    0.234836] Invalid sched_group_energy for CPU0
> [    0.234853] Invalid
>
> I have SoC with 4 Cortex A35 and 2 Cortex A72.
>
>>
>>>> Furthermore, on a previous e-mail it has been mentioned that your
>>>> problem might be because Linux will disable what it thinks unused clock. A
>>>> way to prevent that (at least for debugging) is using add
>>>> 'clk_ignore_unused' on the Linux command line.
>>>>
>>>> If the 2 suggestions above does not work, then you would have to
>>>> instrument the kernel. When the hypervisor is build with debug enabled,
>>>> there are is set a debug hvc provided. A useful one is hvc 0xfffd. For all
>>>> of them, you can look at do_debug_trap in arch/arm/traps.c.
>>>>
>>>> I hope this will help.
>>>>
>>>> Cheers,
>>>>
>>>> --
>>>> Julien Grall
>>>>
>>>
>>>
>>>
>>> --
>>> Regards,
>>> Bharat Gohil
>>> Sr.Software Engineer
>>> bharat.gohil@harman.com
>>> +919427054633 <+91%2094270%2054633>
>>>
>>
>>
>>
>> --
>> Regards,
>> Bharat Gohil
>> Sr.Software Engineer
>> bharat.gohil@harman.com
>> +919427054633 <+91%2094270%2054633>
>>
>
>
>
> --
> Regards,
> Bharat Gohil
> Sr.Software Engineer
> bharat.gohil@harman.com
> +919427054633 <+91%2094270%2054633>
>



-- 
Regards,
Bharat Gohil
Sr.Software Engineer
bharat.gohil@harman.com
+919427054633

--001a1149308c19f6aa0565caa529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">typo<br><div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Thu, Feb 22, 2018 at 4:03 PM, bharat gohil <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ghl.bhrt@gmail.com" target=3D"_blank">ghl.bhrt@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div=
 class=3D"h5">On Thu, Feb 22, 2018 at 3:15 PM, bharat gohil <span dir=3D"lt=
r">&lt;<a href=3D"mailto:ghl.bhrt@gmail.com" target=3D"_blank">ghl.bhrt@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote"><div><div class=3D"m_-978322464267352930gmail-h5">On Thu, Feb 22=
, 2018 at 2:13 PM, bharat gohil <span dir=3D"ltr">&lt;<a href=3D"mailto:ghl=
.bhrt@gmail.com" target=3D"_blank">ghl.bhrt@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span>On Fri, Oct=
 6, 2017 at 6:59 PM, Julien Grall <span dir=3D"ltr">&lt;<a href=3D"mailto:j=
ulien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 03/10/17 08:05, bharat gohil wrote:<span class=3D"m_-978322464267352930g=
mail-m_-6208332324496072503m_8822112840846502679gmail-"><br>
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
s=3D"m_-978322464267352930gmail-m_-6208332324496072503m_8822112840846502679=
gmail-"><br>
<br>
console=3Dhvc0,921600n8 earlyprintk=3Dxen debug ignore_loglevel rw root=3D/=
dev/mmcblk0p7<br>
<br></span>
earlyprintk=3Dxen will do nothing as there are no Xen specific earlyprintk =
for Arm. For Dom0, I would recommend to use same same earlyprintk options a=
s you would use on baremetal.<br>
<br>
This would allow you to get some early input if the kernel get stuck before=
 the console has been setup.<br></blockquote></span><div>I have tried your =
suggestion, I got following crash. It unable find interrupt controller but =
this kernel working fine without Xen.<br></div><div>Do you have any suggest=
ion?<br></div><div><br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=
=A0 0.000000] OF: of_irq_init: children remain, but no parents<br>[2018-02-=
22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] Kernel panic - not s=
yncing: No interrupt controller found.<br>[2018-02-22 14:04:15] (XEN) DOM0:=
 [=C2=A0=C2=A0=C2=A0 0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.=
9.44+ #15<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000=
] Hardware name: XXXXX board (DT)<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=
=A0=C2=A0=C2=A0 0.000000] Call trace:<br>[2018-02-22 14:04:15] (XEN) DOM0: =
[=C2=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff8008089f88&gt;] dump_backtrace+0x0=
/0x1d8<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] [=
&lt;ffffff800808a184&gt;] show_stack+0x24/0x30<br>[2018-02-22 14:04:15] (XE=
N) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff800838a0e4&gt;] dump_stac=
k+0x94/0xb8<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.0000=
00] [&lt;ffffff8008196da0&gt;] panic+0x124/0x270<br>[2018-02-22 14:04:15] (=
XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff8008c92c08&gt;] init_IR=
Q+0x24/0x2c<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.0000=
00] [&lt;ffffff8008c909f8&gt;] start_kernel+0x230/0x388<br>[2018-02-22 14:0=
4:15] (XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] [&lt;ffffff8008c901e0&gt;] =
__primary_switched+0x5c/0x64<br>[2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=
=C2=A0=C2=A0 0.000000] Rebooting in 1 seconds..<br>=C2=A0</div></div></div>=
</div></blockquote><div><br></div></div></div><div>SoC has different interr=
upt parent than GIC so I make GIC as interrupt parent and I am able to move=
 ahead. update you once Dom0 boot completely. <br></div></div></div></div><=
/blockquote><div><br></div></div></div><div>System got hang and I got follo=
wing traces related to energy aware scheduler. Is Xen affected with guest s=
cheduling mechanism? I have SoC which has 4-Cortex A35 and 2-Cortex A72.<br=
></div></div></div></div></blockquote><div>System got hang and I got follow=
ing traces related to energy aware=20
scheduler. Is Xen affected with guest scheduling mechanism? I have SoC=20
which has 4-Cortex A35 and 2-Cortex A72.=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><div></div><div></div><div><br>[=C2=A0=C2=A0=C2=A0 0.202545] Xen: initi=
alizing cpu4<br>[=C2=A0=C2=A0=C2=A0 0.202562] Invalid sched_group_energy fo=
r CPU4<br>[=C2=A0=C2=A0=C2=A0 0.202564] CPU4: update cpu_capacity 1024<br>[=
=C2=A0=C2=A0=C2=A0 0.202566] CPU4: Booted secondary processor [410fd041]<br=
>[=C2=A0=C2=A0=C2=A0 0.230197] Detected PIPT I-cache on CPU5<br>[=C2=A0=C2=
=A0=C2=A0 0.230202] CPU features: SANITY CHECK: Unexpected variation in SYS=
_ID_AA64MMFR0_EL1. Boot CPU: 0x00000000101122, CPU5: 0x00000000001124<br>[=
=C2=A0=C2=A0=C2=A0 0.230250] Xen: initializing cpu5<br>[=C2=A0=C2=A0=C2=A0 =
0.230264] Invalid sched_group_energy for CPU5<br>[=C2=A0=C2=A0=C2=A0 0.2302=
65] CPU5: update cpu_capacity 1024<br>[=C2=A0=C2=A0=C2=A0 0.230267] CPU5: B=
ooted secondary processor [410fd041]<br>[=C2=A0=C2=A0=C2=A0 0.230373] Broug=
ht up 6 CPUs<br>[=C2=A0=C2=A0=C2=A0 0.234084] SMP: Total of 6 processors ac=
tivated.<br>[=C2=A0=C2=A0=C2=A0 0.234108] CPU features: detected feature: 3=
2-bit EL0 Support<br>[=C2=A0=C2=A0=C2=A0 0.234382] CPU: All CPU(s) started =
at EL1<br>[=C2=A0=C2=A0=C2=A0 0.234627] Invalid sched_group_energy for CPU5=
<br>[=C2=A0=C2=A0=C2=A0 0.234662] CPU5: update max cpu_capacity 1024<br>[=
=C2=A0=C2=A0=C2=A0 0.234680] Invalid sched_group_energy for Cluster5<br>[=
=C2=A0=C2=A0=C2=A0 0.234698] Invalid sched_group_energy for CPU4<br>[=C2=A0=
=C2=A0=C2=A0 0.234715] Invalid sched_group_energy for Cluster4<br>[=C2=A0=
=C2=A0=C2=A0 0.234733] Invalid sched_group_energy for CPU3<br>[=C2=A0=C2=A0=
=C2=A0 0.234750] Invalid sched_group_energy for Cluster3<br>[=C2=A0=C2=A0=
=C2=A0 0.234767] Invalid sched_group_energy for CPU2<br>[=C2=A0=C2=A0=C2=A0=
 0.234784] Invalid sched_group_energy for Cluster2<br>[=C2=A0=C2=A0=C2=A0 0=
.234801] Invalid sched_group_energy for CPU1<br>[=C2=A0=C2=A0=C2=A0 0.23481=
9] Invalid sched_group_energy for Cluster1<br>[=C2=A0=C2=A0=C2=A0 0.234836]=
 Invalid sched_group_energy for CPU0<br>[=C2=A0=C2=A0=C2=A0 0.234853] Inval=
id <br></div><div><br></div><div>I have SoC with 4 Cortex A35 and 2 Cortex =
A72. <br></div><span class=3D""><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quot=
e"><div></div><span class=3D"m_-978322464267352930gmail-"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><span><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
Cheers,<span class=3D"m_-978322464267352930gmail-m_-6208332324496072503m_88=
22112840846502679gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></span></div><br><br clear=3D"all"><span><br>-- =
<br><div class=3D"m_-978322464267352930gmail-m_-6208332324496072503m_882211=
2840846502679gmail_signature"><div dir=3D"ltr"><div><div>Regards,</div><div=
>Bharat Gohil</div><div>Sr.Software Engineer<br></div><div><a href=3D"mailt=
o:bharat.gohil@harman.com" target=3D"_blank">bharat.gohil@harman.com</a><br=
></div><div><a href=3D"tel:+91%2094270%2054633" value=3D"+919427054633" tar=
get=3D"_blank">+919427054633</a></div></div></div></div>
</span></div></div>
</blockquote></span></div><span class=3D"m_-978322464267352930gmail-"><br><=
br clear=3D"all"><br>-- <br><div class=3D"m_-978322464267352930gmail-m_-620=
8332324496072503gmail_signature"><div dir=3D"ltr"><div><div>Regards,</div><=
div>Bharat Gohil</div><div>Sr.Software Engineer<br></div><div><a href=3D"ma=
ilto:bharat.gohil@harman.com" target=3D"_blank">bharat.gohil@harman.com</a>=
<br></div><div><a href=3D"tel:+91%2094270%2054633" value=3D"+919427054633" =
target=3D"_blank">+919427054633</a></div></div></div></div>
</span></div></div>
</blockquote></span></div><span class=3D""><br><br clear=3D"all"><br>-- <br=
><div class=3D"m_-978322464267352930gmail_signature"><div dir=3D"ltr"><div>=
<div>Regards,</div><div>Bharat Gohil</div><div>Sr.Software Engineer<br></di=
v><div><a href=3D"mailto:bharat.gohil@harman.com" target=3D"_blank">bharat.=
gohil@harman.com</a><br></div><div><a href=3D"tel:+91%2094270%2054633" valu=
e=3D"+919427054633" target=3D"_blank">+919427054633</a></div></div></div></=
div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Regar=
ds,</div><div>Bharat Gohil</div><div>Sr.Software Engineer<br></div><div><a =
href=3D"mailto:bharat.gohil@harman.com" target=3D"_blank">bharat.gohil@harm=
an.com</a><br></div><div>+919427054633</div></div></div></div>
</div></div></div>

--001a1149308c19f6aa0565caa529--


--===============7491241672983812762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7491241672983812762==--
