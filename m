From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 0/7] xen/arm: CPU hotplug fixes
Date: Wed, 11 Apr 2018 18:37:52 +0200
Message-ID: <CAKPH-Ng+4QM+06msM1cxJpQ5uRvsRWc6Y1mhotPXRdF4nvh0aA@mail.gmail.com>
References: <20180411131927.27083-1-mirela.simonovic@aggios.com>
 <d43d06af-a981-3156-bf3b-0d79d219dae1@arm.com>
 <61809e61-d4be-9000-2d5c-2e8b7770d525@aggios.com>
 <ac3d0857-0313-7f83-fa6e-c926636ec7d5@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8754947827285500206=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ac3d0857-0313-7f83-fa6e-c926636ec7d5@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============8754947827285500206==
Content-Type: multipart/alternative; boundary="001a114abe80b0253f056995422a"

--001a114abe80b0253f056995422a
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Wed, Apr 11, 2018 at 6:02 PM, Julien Grall <julien.grall@arm.com> wrote:

> Hi,
>
> On 11/04/18 16:58, Mirela Simonovic wrote:
>
>> On 04/11/2018 05:07 PM, Julien Grall wrote:
>>
>>> On 11/04/18 14:19, Mirela Simonovic wrote:
>>>
>> Migrating interrupts when turning off a CPU already works. However, when
>> a CPU is turned back on there is no interrupt migration back to the
>> hotplugged CPU - all interrupts will remain routed to the CPU#0.
>> Patch 7/7 fixes this
>>
>
> What do you mean by all interrupts? Interrupts routed to guest will always
> follow the vCPU. So are you sure they are going to be migrated when that
> vCPU is paused/off?
>
>
Just to make sure we're on the same page - this is about hotplugging
physical CPUs. Hotplugging vCPUs using virtual PSCI CPU_OFF interface is
already implemented and unrelated to this series.

Assuming that system has 2 pCPUs by 'all interrupts' I mean interrupts that
were targeted to the pCPU#0 and pCPU#1 prior to doing any hotplug.

For example, if a guest is pinned to pCPU#1 an interrupt of a device it
owns will be targeted to pCPU#1.
When pCPU#1 is turned off that interrupt will be migrated to pCPU#0. pCPU#0
finalizes the suspend and receives wake-up interrupts. However, when CPU#1
is turned back on that interrupt will remain targeted to the CPU#0, which I
assumed is wrong.
The scenario described here is also how I tested this.



> Can you give the path in Xen doing that?
>
>
Sure, here is a backtrace (dumped on the CPU being turned off):

    0  0x2603dc arch_move_irqs(): vgic.c, line 309
    1  0x22ee58 sched_move_irqs()+20: schedule.c, line 303
    2  0x2318e8 cpu_disable_scheduler()+1000: schedule.c, line 586
    3  0x2318e8 cpu_disable_scheduler()+1000: schedule.c, line 586
    4  0x25aff8 __cpu_disable()+96: smpboot.c, line 386
    5  0x201608 take_cpu_down()+52: cpu.c, line 75
    6  0x23426c stopmachine_action()+188: stop_machine.c, line 159
    7  0x235858 do_tasklet_work()+176: tasklet.c, line 94
    8  0x235c80 do_tasklet()+104: tasklet.c, line 126
    9  0x24daec idle_loop()+144: domain.c, line 72
   10  0x25b1f8 start_secondary()+404: smpboot.c, line 368



>
>>
>>>> Calls to enable/disable_nonboot_cpus() functions currently don't exist
>>>> in
>>>> Xen ARM code. This will be added with the suspend to RAM support for
>>>> ARM.
>>>>
>>>
>>> What would be the way to test that series?
>>>
>>>
>> I tested/developed the series on Xilinx Zynq UltraScale+ MPSoC (ZCU102
>> board), but how would others test that - I don't know. We will have to ask
>> Xilinx for detailed answer to this question.
>>
>
> I am not sure to understand your answer. What I asked, is how did you did
> turned off the CPU? Did you hack Xen or do you rely on another series?
>
>
I rely on the suspend to RAM series that will be submitted after this one
is done. Not complete suspend to RAM support is needed in order to do the
testing.
Essentially, I have triggered suspend to RAM from Dom0 and the minimum in
Xen is to have the suspend support for secondary CPUs (calls to
disable/enable_nonboot_cpus).


> If the former, it would be nice to get the code you used. If the latter,
> then having a hack patch to test that code would be nice. Ideally, you want
> to plug that in the SYSCTL interface for out-of-box testing.
>
>
Ok, I have never used that but I'll try to figure it out. I may come up
with additional questions.

Thanks,
Mirela



> Cheers,
>
> --
> Julien Grall
>

--001a114abe80b0253f056995422a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Wed, Apr 11, 2018 at 6:02 PM, Julien Grall <span dir=3D"ltr">&=
lt;<a href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@a=
rm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi,<span class=3D"gmail-"><br>
<br>
On 11/04/18 16:58, Mirela Simonovic wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gma=
il-">
On 04/11/2018 05:07 PM, Julien Grall wrote:<br>
</span><span class=3D"gmail-"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
On 11/04/18 14:19, Mirela Simonovic wrote:<br>
</blockquote></span><span class=3D"gmail-">
Migrating interrupts when turning off a CPU already works. However, when a =
CPU is turned back on there is no interrupt migration back to the hotplugge=
d CPU - all interrupts will remain routed to the CPU#0.<br>
Patch 7/7 fixes this<br>
</span></blockquote>
<br>
What do you mean by all interrupts? Interrupts routed to guest will always =
follow the vCPU. So are you sure they are going to be migrated when that vC=
PU is paused/off?<br>
<br></blockquote><div><br></div><div>Just to make sure we&#39;re on the sam=
e page - this is about hotplugging physical CPUs. Hotplugging vCPUs using v=
irtual PSCI CPU_OFF interface is already implemented and unrelated to this =
series.</div><div><br></div><div>Assuming that system has 2 pCPUs by &#39;a=
ll interrupts&#39; I mean interrupts that were targeted to the pCPU#0 and p=
CPU#1 prior to doing any hotplug.</div><div><br></div><div>For example, if =
a guest is pinned to pCPU#1 an interrupt of a device it owns will be target=
ed to pCPU#1.</div><div>When pCPU#1 is turned off that interrupt will be mi=
grated to pCPU#0. pCPU#0 finalizes the suspend and receives wake-up interru=
pts. However, when CPU#1 is turned back on that interrupt will remain targe=
ted to the CPU#0, which I assumed is wrong.</div><div>The scenario describe=
d here is also how I tested this.</div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Can you give the path in Xen doing that?<span class=3D"gmail-"><br>
<br></span></blockquote><div><br></div><div>Sure, here is a backtrace (dump=
ed on the CPU being turned off):</div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 0=C2=A0 0x2603dc arch_move_irqs(): vg=
ic.c, line 309</div><div>=C2=A0 =C2=A0 1=C2=A0 0x22ee58 sched_move_irqs()+2=
0: schedule.c, line 303</div><div>=C2=A0 =C2=A0 2=C2=A0 0x2318e8 cpu_disabl=
e_scheduler()+1000: schedule.c, line 586</div><div>=C2=A0 =C2=A0 3=C2=A0 0x=
2318e8 cpu_disable_scheduler()+1000: schedule.c, line 586</div><div>=C2=A0 =
=C2=A0 4=C2=A0 0x25aff8 __cpu_disable()+96: smpboot.c, line 386</div><div>=
=C2=A0 =C2=A0 5=C2=A0 0x201608 take_cpu_down()+52: cpu.c, line 75</div><div=
>=C2=A0 =C2=A0 6=C2=A0 0x23426c stopmachine_action()+188: stop_machine.c, l=
ine 159</div><div>=C2=A0 =C2=A0 7=C2=A0 0x235858 do_tasklet_work()+176: tas=
klet.c, line 94</div><div>=C2=A0 =C2=A0 8=C2=A0 0x235c80 do_tasklet()+104: =
tasklet.c, line 126</div><div>=C2=A0 =C2=A0 9=C2=A0 0x24daec idle_loop()+14=
4: domain.c, line 72</div><div>=C2=A0 =C2=A010=C2=A0 0x25b1f8 start_seconda=
ry()+404: smpboot.c, line 368</div></div><div><br></div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Calls to enable/disable_nonboot_cpus() functions currently don&#39;t exist =
in<br>
Xen ARM code. This will be added with the suspend to RAM support for ARM.<b=
r>
</blockquote>
<br>
What would be the way to test that series?<br>
<br>
</blockquote>
<br>
I tested/developed the series on Xilinx Zynq UltraScale+ MPSoC (ZCU102 boar=
d), but how would others test that - I don&#39;t know. We will have to ask =
Xilinx for detailed answer to this question.<br>
</blockquote>
<br></span>
I am not sure to understand your answer. What I asked, is how did you did t=
urned off the CPU? Did you hack Xen or do you rely on another series?<br>
<br></blockquote><div><br></div><div>I rely on the suspend to RAM series th=
at will be submitted after this one is done. Not complete suspend to RAM su=
pport is needed in order to do the testing.</div><div>Essentially, I have t=
riggered suspend to RAM from Dom0 and the minimum in Xen is to have the sus=
pend support for secondary CPUs (calls to disable/enable_nonboot_cpus).</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If the former, it would be nice to get the code you used. If the latter, th=
en having a hack patch to test that code would be nice. Ideally, you want t=
o plug that in the SYSCTL interface for out-of-box testing.<br>
<br></blockquote><div><br></div><div>Ok, I have never used that but I&#39;l=
l try to figure it out. I may come up with additional questions.</div><div>=
<br></div><div>Thanks,</div><div>Mirela</div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></div><br></div></div>

--001a114abe80b0253f056995422a--


--===============8754947827285500206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8754947827285500206==--
