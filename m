From: bharat gohil <ghl.bhrt@gmail.com>
Subject: Re: ARM64:Porting xen to new hardware
Date: Mon, 26 Feb 2018 13:01:16 +0530
Message-ID: <CABdg74cT2kAcfUO7Y3CX34EUsdCWszVzEmouq5M=k8_3OBKKxQ@mail.gmail.com>
References: <CABdg74cia0v3p5R+xRW2wBpgfRDaJ6HrBt0omEQVmdq=wQ6YvQ@mail.gmail.com>
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
 <ce1b842d-feb7-e7d7-965b-634b9f0108da@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5055950631459255167=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ce1b842d-feb7-e7d7-965b-634b9f0108da@arm.com>
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

--===============5055950631459255167==
Content-Type: multipart/alternative; boundary="000000000000d2d7a60566187e45"

--000000000000d2d7a60566187e45
Content-Type: text/plain; charset="UTF-8"

Regards,
Bharat Gohil


On Thu, Feb 22, 2018 at 4:57 PM, Julien Grall <julien.grall@arm.com> wrote:

> Hi,
>
> Please configure your e-mail client to quote with '>'. It is incredibly
> difficult to read e-mail when space is used for quoting (see below).
>
>
> On 22/02/18 10:33, bharat gohil wrote:
>
>>         I have tried your suggestion, I got following crash. It unable
>>         find interrupt controller but this kernel working fine without
>> Xen.
>>         Do you have any suggestion?
>>
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] OF:
>>         of_irq_init: children remain, but no parents
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Kernel panic -
>>         not syncing: No interrupt controller found.
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] CPU: 0 PID: 0
>>         Comm: swapper/0 Not tainted 4.9.44+ #15
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Hardware name:
>>         XXXXX board (DT)
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Call trace:
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000]
>>         [<ffffff8008089f88>] dump_backtrace+0x0/0x1d8
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000]
>>         [<ffffff800808a184>] show_stack+0x24/0x30
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000]
>>         [<ffffff800838a0e4>] dump_stack+0x94/0xb8
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000]
>>         [<ffffff8008196da0>] panic+0x124/0x270
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000]
>>         [<ffffff8008c92c08>] init_IRQ+0x24/0x2c
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000]
>>         [<ffffff8008c909f8>] start_kernel+0x230/0x388
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000]
>>         [<ffffff8008c901e0>] __primary_switched+0x5c/0x64
>>         [2018-02-22 14:04:15] (XEN) DOM0: [    0.000000] Rebooting in 1
>>         seconds..
>>
>>
>>     SoC has different interrupt parent than GIC so I make GIC as
>>     interrupt parent and I am able to move ahead. update you once Dom0
>>     boot completely.
>>
>
> This looks quite wrong to me. By modifying the interrupt parent property,
> you also modify which interrupt controller will be used for routing the
> interrupt. This is probably the reason of the hang you mention below.
>
> What are the interrupts controller you have on your platform?
>
> >It has interrupt controller which change the polarity of SPI IRQ before
redirect to GIC-400.
>In DTB debug, I got following trace,
>(XEN) irq 0 not connected to primary controller. Connected to
/intpol-controller@10220a80.
>I think Xen skip interrupt controller(if other than GIC) while domain
creation.
>Do you have suggestion to solve this?
>Do I need to support custom IRQ controller in Xen or hard code the custom
controller register in Xen and modified DTB with GIC as primary controller?

>
>
>>
>> System got hand and I got following traces related to energy aware
>> scheduler. Is Xen affected with guest scheduling mechanism? I have SoC
>> which has 4-Cortex A35 and 2-Cortex A72.
>>
>> [    0.202545] Xen: initializing cpu4
>> [    0.202562] Invalid sched_group_energy for CPU4
>> [    0.202564] CPU4: update cpu_capacity 1024
>> [    0.202566] CPU4: Booted secondary processor [410fd041]
>> [    0.230197] Detected PIPT I-cache on CPU5
>> [    0.230202] CPU features: SANITY CHECK: Unexpected variation in
>> SYS_ID_AA64MMFR0_EL1. Boot CPU: 0x00000000101122, CPU5: 0x00000000001124
>> [    0.230250] Xen: initializing cpu5
>> [    0.230264] Invalid sched_group_energy for CPU5
>> [    0.230265] CPU5: update cpu_capacity 1024
>> [    0.230267] CPU5: Booted secondary processor [410fd041]
>> [    0.230373] Brought up 6 CPUs
>> [    0.234084] SMP: Total of 6 processors activated.
>> [    0.234108] CPU features: detected feature: 32-bit EL0 Support
>> [    0.234382] CPU: All CPU(s) started at EL1
>> [    0.234627] Invalid sched_group_energy for CPU5
>> [    0.234662] CPU5: update max cpu_capacity 1024
>> [    0.234680] Invalid sched_group_energy for Cluster5
>> [    0.234698] Invalid sched_group_energy for CPU4
>> [    0.234715] Invalid sched_group_energy for Cluster4
>> [    0.234733] Invalid sched_group_energy for CPU3
>> [    0.234750] Invalid sched_group_energy for Cluster3
>> [    0.234767] Invalid sched_group_energy for CPU2
>> [    0.234784] Invalid sched_group_energy for Cluster2
>> [    0.234801] Invalid sched_group_energy for CPU1
>> [    0.234819] Invalid sched_group_energy for Cluster1
>> [    0.234836] Invalid sched_group_energy for CPU0
>> [    0.234853] Invalid
>>
>
> Cheers,
>
> --
> Julien Grall
>

--000000000000d2d7a60566187e45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br clear=3D"all"><div><div=
 class=3D"gmail-m_5899173041137022782gmail_signature"><div dir=3D"ltr"><div=
><div dir=3D"ltr"><div><div>Regards,</div><div>Bharat Gohil</div><br></div>=
</div></div></div></div></div>
<br><div class=3D"gmail_quote">On Thu, Feb 22, 2018 at 4:57 PM, Julien Gral=
l <span dir=3D"ltr">&lt;<a href=3D"mailto:julien.grall@arm.com" target=3D"_=
blank">julien.grall@arm.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi,<br>
<br>
Please configure your e-mail client to quote with &#39;&gt;&#39;. It is inc=
redibly difficult to read e-mail when space is used for quoting (see below)=
.<div><div class=3D"gmail-m_5899173041137022782h5"><br>
<br>
On 22/02/18 10:33, bharat gohil wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I have tried your suggestion, I got following c=
rash. It unable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 find interrupt controller but this kernel worki=
ng fine without Xen.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Do you have any suggestion?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000] OF:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_irq_init: children remain, but no parents<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000] Kernel panic -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 not syncing: No interrupt controller found.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000] CPU: 0 PID: 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Comm: swapper/0 Not tainted 4.9.44+ #15<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000] Hardware name:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 XXXXX board (DT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000] Call trace:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&lt;ffffff8008089f88&gt;] dump_backtrace+0x0/0=
x1d8<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&lt;ffffff800808a184&gt;] show_stack+0x24/0x30=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&lt;ffffff800838a0e4&gt;] dump_stack+0x94/0xb8=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&lt;ffffff8008196da0&gt;] panic+0x124/0x270<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&lt;ffffff8008c92c08&gt;] init_IRQ+0x24/0x2c<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&lt;ffffff8008c909f8&gt;] start_kernel+0x230/0=
x388<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&lt;ffffff8008c901e0&gt;] __primary_switched+0=
x5c/0x64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2018-02-22 14:04:15] (XEN) DOM0: [=C2=A0=C2=A0=
=C2=A0 0.000000] Rebooting in 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 seconds..<br>
<br>
<br>
=C2=A0 =C2=A0 SoC has different interrupt parent than GIC so I make GIC as<=
br>
=C2=A0 =C2=A0 interrupt parent and I am able to move ahead. update you once=
 Dom0<br>
=C2=A0 =C2=A0 boot completely.<br>
</blockquote>
<br></div></div>
This looks quite wrong to me. By modifying the interrupt parent property, y=
ou also modify which interrupt controller will be used for routing the inte=
rrupt. This is probably the reason of the hang you mention below.<br>
<br>
What are the interrupts controller you have on your platform?<div><div clas=
s=3D"gmail-m_5899173041137022782h5"><br></div></div></blockquote><div>&gt;I=
t has interrupt controller which change the polarity of SPI IRQ before redi=
rect to GIC-400.<br></div><div>&gt;In DTB debug, I got following trace,<br>=
&gt;(XEN) irq 0 not connected to primary controller. Connected to /intpol-c=
ontroller@10220a80.<br></div><div>&gt;I think Xen skip interrupt controller=
(if other than GIC) while domain creation.<br></div><div>&gt;Do you have su=
ggestion to solve this?<br></div><div>&gt;Do I need to support custom IRQ c=
ontroller in Xen or hard code the custom controller register in Xen and mod=
ified DTB with GIC as primary controller?<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div><div class=3D"gmail-m_5899173041137022782h5"=
>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
System got hand and I got following traces related to energy aware schedule=
r. Is Xen affected with guest scheduling mechanism? I have SoC which has 4-=
Cortex A35 and 2-Cortex A72.<br>
<br>
[=C2=A0=C2=A0=C2=A0 0.202545] Xen: initializing cpu4<br>
[=C2=A0=C2=A0=C2=A0 0.202562] Invalid sched_group_energy for CPU4<br>
[=C2=A0=C2=A0=C2=A0 0.202564] CPU4: update cpu_capacity 1024<br>
[=C2=A0=C2=A0=C2=A0 0.202566] CPU4: Booted secondary processor [410fd041]<b=
r>
[=C2=A0=C2=A0=C2=A0 0.230197] Detected PIPT I-cache on CPU5<br>
[=C2=A0=C2=A0=C2=A0 0.230202] CPU features: SANITY CHECK: Unexpected variat=
ion in SYS_ID_AA64MMFR0_EL1. Boot CPU: 0x00000000101122, CPU5: 0x0000000000=
1124<br>
[=C2=A0=C2=A0=C2=A0 0.230250] Xen: initializing cpu5<br>
[=C2=A0=C2=A0=C2=A0 0.230264] Invalid sched_group_energy for CPU5<br>
[=C2=A0=C2=A0=C2=A0 0.230265] CPU5: update cpu_capacity 1024<br>
[=C2=A0=C2=A0=C2=A0 0.230267] CPU5: Booted secondary processor [410fd041]<b=
r>
[=C2=A0=C2=A0=C2=A0 0.230373] Brought up 6 CPUs<br>
[=C2=A0=C2=A0=C2=A0 0.234084] SMP: Total of 6 processors activated.<br>
[=C2=A0=C2=A0=C2=A0 0.234108] CPU features: detected feature: 32-bit EL0 Su=
pport<br>
[=C2=A0=C2=A0=C2=A0 0.234382] CPU: All CPU(s) started at EL1<br>
[=C2=A0=C2=A0=C2=A0 0.234627] Invalid sched_group_energy for CPU5<br>
[=C2=A0=C2=A0=C2=A0 0.234662] CPU5: update max cpu_capacity 1024<br>
[=C2=A0=C2=A0=C2=A0 0.234680] Invalid sched_group_energy for Cluster5<br>
[=C2=A0=C2=A0=C2=A0 0.234698] Invalid sched_group_energy for CPU4<br>
[=C2=A0=C2=A0=C2=A0 0.234715] Invalid sched_group_energy for Cluster4<br>
[=C2=A0=C2=A0=C2=A0 0.234733] Invalid sched_group_energy for CPU3<br>
[=C2=A0=C2=A0=C2=A0 0.234750] Invalid sched_group_energy for Cluster3<br>
[=C2=A0=C2=A0=C2=A0 0.234767] Invalid sched_group_energy for CPU2<br>
[=C2=A0=C2=A0=C2=A0 0.234784] Invalid sched_group_energy for Cluster2<br>
[=C2=A0=C2=A0=C2=A0 0.234801] Invalid sched_group_energy for CPU1<br>
[=C2=A0=C2=A0=C2=A0 0.234819] Invalid sched_group_energy for Cluster1<br>
[=C2=A0=C2=A0=C2=A0 0.234836] Invalid sched_group_energy for CPU0<br>
[=C2=A0=C2=A0=C2=A0 0.234853] Invalid<br>
</blockquote>
<br></div></div>
Cheers,<span class=3D"gmail-m_5899173041137022782HOEnZb"><font color=3D"#88=
8888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></div><br></div></div>

--000000000000d2d7a60566187e45--


--===============5055950631459255167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5055950631459255167==--
