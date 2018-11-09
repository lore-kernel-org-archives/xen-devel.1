From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Problems building and running Xen on Hikey960
Date: Fri, 9 Nov 2018 22:25:29 +0530
Message-ID: <CAC4nxbsUMBT0NPuPKBdX+KtOnW7FqG2mBQdmqk+NGmhxY-5y-w@mail.gmail.com>
References: <CAD3CancOq7wwLGEoL6HcCc8iO2rYtGr8n68GA=e6iiqtUVGZyQ@mail.gmail.com>
 <31b037ae-0f4e-0494-7460-b0d78422e01b@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1879868233443743681=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <31b037ae-0f4e-0494-7460-b0d78422e01b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: mattd@bugfuzz.com, sstabellini@kernel.org, konrad.wilk@oracle.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============1879868233443743681==
Content-Type: multipart/alternative; boundary="000000000000b3e3f6057a3e38a6"

--000000000000b3e3f6057a3e38a6
Content-Type: text/plain; charset="UTF-8"

HI Mathues,

I checked your log and crashes in xen and linux. Do following things to fix
or move further.

On Fri, Nov 9, 2018 at 4:52 PM Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 08/11/2018 07:07, Matthew Daley wrote:
> > Hi all,
>
> Hi Matthew,
>
> >
> > I'm trying to build and run Linux (Debian) on top of Xen on a Hikey960
> > ARM board but am having trouble.
> >
> > I've been following Konrad's guide on the Wiki (at
> > https://wiki.xenproject.org/wiki/HiKey960), namely:
> > * I have upgraded the board's base firmware to support UEFI
> > * I am building the hikey960-upstream-rebase branch of
> > https://github.com/96boards-hikey/linux.git (with a patch from Linus's
> > tree to fix a Hynix UFS bug)
> > * I am building the master branch of Xen unstable
> > * I am building the master branch of GRUB (with a patch to fix a DTB
> > padding bug)
> >
> > However, I see two problems when booting.
> >
> > Firstly, Xen fails to bring up any other CPUs but the one it is booting
> on:
> >
> > (XEN) Bringing up CPU1
> > (XEN) Failed to bring up CPU1
> > (XEN) Failed to bring up CPU 1 (error -9)
> > (XEN) Bringing up CPU2
> > (XEN) Failed to bring up CPU2
> > (XEN) Failed to bring up CPU 2 (error -9)
> > (XEN) Bringing up CPU3
> > (XEN) Failed to bring up CPU3
> > (XEN) Failed to bring up CPU 3 (error -9)
> > (XEN) Bringing up CPU4
> > (XEN) Failed to bring up CPU4
> > (XEN) Failed to bring up CPU 4 (error -9)
> > (XEN) Bringing up CPU5
> > (XEN) Failed to bring up CPU5
> > (XEN) Failed to bring up CPU 5 (error -9)
> > (XEN) Bringing up CPU6
> > (XEN) Failed to bring up CPU6
> > (XEN) Failed to bring up CPU 6 (error -9)
> > (XEN) Bringing up CPU7
> > (XEN) Failed to bring up CPU7
> > (XEN) Failed to bring up CPU 7 (error -9)
> > (XEN) Brought up 1 CPUs
> >
> > I have traced this error code -9 being returned by call_psci_cpu_on.
>
> A similar error was reported a couple of months on the mailing list. From
> the
> report, a regression was introduced between Xen 4.8 and unstable.
>
> Unfortunately, I don't have an hikey board to bisect it. May I ask if you
> can
> bisect it? If you can point the offending commit, I should be able to
> provide
> ideas why it breaks.
>
> As Julien said,
For your CPUs problem in Hikey960, use 4.8 of xen source, Then all CPUs
will be enabled and worked properly.


> >
> > Secondly, Linux fails when it tries to initialise AMBA devices:
> >
> > [    0.941352] Synchronous External Abort: synchronous external abort
> > (0x96000210) at 0xffff0000093fdfe
> > 0
> > [    0.950601] Internal error: : 96000210 [#1] PREEMPT SMP
> > [    0.955866] Modules linked in:
> > [    0.958990] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> > 4.14.0-rc7-linaro-hikey960+ #8
> > [    0.966791] Hardware name: HiKey960 (DT)
> > [    0.970777] task: ffff80001d900000 task.stack: ffff000008058000
> > [    0.976778] PC is at amba_device_try_add+0x108/0x260
> > [    0.981791] LR is at amba_device_try_add+0xf0/0x260
> > [    0.986735] pc : [<ffff0000084eada8>] lr : [<ffff0000084ead90>]
> > pstate: 60000045
> > [    0.994192] sp : ffff00000805bbf0
> > [    0.997572] x29: ffff00000805bbf0 x28: 0000000000000000
> > [    1.002953] x27: ffff0000090203a8 x26: 0000000000000000
> > [    1.008326] x25: ffff80001dbf9810 x24: 0000000000000000
> > [    1.013702] x23: ffff0000093fd000 x22: 0000000000001000
> > [    1.019079] x21: ffff80001cc1b6f8 x20: 0000000000000000
> > [    1.024455] x19: ffff80001cc1b400 x18: 0000000000000010
> > [    1.029832] x17: 0000000000000001 x16: 00000000deadbeef
> > [    1.035209] x15: 0000000000000006 x14: ffffffffffffffff
> > [    1.040585] x13: 0000000000000020 x12: 0101010101010101
> > [    1.045962] x11: 0000000000000020 x10: 0101010101010101
> > [    1.051338] x9 : 0000000000000000 x8 : ffff80001cc0cf00
> > [    1.056717] x7 : 0000000000000000 x6 : 000000000000003f
> > [    1.062092] x5 : 0000000000000000 x4 : 0000000000000000
> > [    1.067468] x3 : 0000000000000000 x2 : 0000000000000000
> > [    1.072845] x1 : ffff80001d900000 x0 : ffff0000093fdfe0
> > [    1.078223] Process swapper/0 (pid: 1, stack limit =
> 0xffff000008058000)
> > [    1.084989] Call trace:
> > [    1.087504] Exception stack(0xffff00000805bab0 to 0xffff00000805bbf0)
> > [    1.094008] baa0:
> > ffff0000093fdfe0 ffff80001d900000
> > [    1.101902] bac0: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [    1.109790] bae0: 000000000000003f 0000000000000000
> > ffff80001cc0cf00 0000000000000000
> > [    1.117684] bb00: 0101010101010101 0000000000000020
> > 0101010101010101 0000000000000020
> > [    1.125576] bb20: ffffffffffffffff 0000000000000006
> > 00000000deadbeef 0000000000000001
> > [    1.133468] bb40: 0000000000000010 ffff80001cc1b400
> > 0000000000000000 ffff80001cc1b6f8
> > [    1.141356] bb60: 0000000000001000 ffff0000093fd000
> > 0000000000000000 ffff80001dbf9810
> > [    1.149248] bb80: 0000000000000000 ffff0000090203a8
> > 0000000000000000 ffff00000805bbf0
> > [    1.157139] bba0: ffff0000084ead90 ffff00000805bbf0
> > ffff0000084eada8 0000000060000045
> > [    1.165034] bbc0: ffff00000805bbf0 ffff0000084ead90
> > ffffffffffffffff 00000000fffffffe
> > [    1.172921] bbe0: ffff00000805bbf0 ffff0000084eada8
> > [    1.177865] [<ffff0000084eada8>] amba_device_try_add+0x108/0x260
> > [    1.183935] [<ffff0000084eafec>] amba_device_add+0x1c/0xd8
> > [    1.189493] [<ffff00000890fbbc>] of_platform_bus_create+0x26c/0x300
> > [    1.195814] [<ffff00000890fa74>] of_platform_bus_create+0x124/0x300
> > [    1.202145] [<ffff00000890fd7c>] of_platform_populate+0x4c/0xb0
> > [    1.208135] [<ffff000008f6e2ac>]
> of_platform_default_populate_init+0x64/0x78
> > [    1.215247] [<ffff000008083978>] do_one_initcall+0x38/0x120
> > [    1.220882] [<ffff000008f20d18>] kernel_init_freeable+0x184/0x224
> > [    1.227038] [<ffff000008a6a360>] kernel_init+0x10/0x100
> > [    1.232323] [<ffff000008084b60>] ret_from_fork+0x10/0x18
> > [    1.237703] Code: d10082c0 52800002 8b0002e0 52800018 (b9400001)
> > [    1.243880] ---[ end trace dcbf70aa30c979a8 ]---
> > [    1.248573] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x0000000b
> >
> > This does not occur when booting the same Linux kernel without Xen.
> >
> > I have traced this to amba_device_try_add trying to access the pid and
> > cid through ioremap'd addresses of this node in the device tree (in
> > arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi):
>
> Thank you for confirming it works on Linux baremetal and tracked down the
> problem.
>
> It is not entirely clear why you receive an external abort here. This may
> be due
> to misconfiguration of the stage-2 page-tables.
>
> Could you try Xen with this small changes? The patch should print a
> message is
> the virtual abort was received by Xen but forwarded to the guest.
>
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 51d2e42c77..f95135d030 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -660,6 +660,8 @@ static void inject_vabt_exception(struct cpu_user_regs
> *regs)
>   {
>       const union hsr hsr = { .bits = regs->hsr };
>
> +    printk("%pv: Inject Virtual Abort\n", current);
> +    dump_execution_state();
> +
>       /*
>        * SVC/HVC/SMC already have an adjusted PC (See ARM ARM DDI 0487A.j
>        * D1.10.1 for more details), which we need to correct in order to
>
> >
> > /* A73 cluster internal coresight */
> > etm@4,ed440000 {
> >          compatible = "arm,coresight-etm4x","arm,primecell";
> >          reg = <0 0xed440000 0 0x1000>;
> >          clocks = <&pclk>;
> >          clock-names = "apb_pclk";
> >          cpu = <&cpu4>;
> >          port {
> >                  etm4_out_port: endpoint {
> >                  remote-endpoint = <&funnel1_in_port0>;
> >                  };
> >          };
> > };
> >
> > ARM is still relatively new to me and I'm stuck what I should be
> > attempting next. I would simply not compile Linux AMBA support (by not
> > setting CONFIG_AMBA) but it appears that this is selected as a reverse
> > dependency by CONFIG_ARM on Linux, so am unsure if this is wise or
> > even possible.
>
> I would just drop the node you copied above from the Device-Tree and see
> if you
> can go further in the boot.
>
>
As Julien said,
Disable all 'etm' nodes in device-tree for all CPUs. This will fix all amba
CPU devices linux crashes.

Cheers,
>
> --
> Julien Grall
>


Thanks,
Omkar B

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

--000000000000b3e3f6057a3e38a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"col=
or:rgb(11,83,148)">HI Mathues,</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)"><br></div><div class=3D"gmail_default" style=3D"color:=
rgb(11,83,148)">I checked your log and crashes in xen and linux. Do followi=
ng things to fix or move further.=C2=A0</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(11,83,148)"><br></div><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Fri, Nov 9, 2018 at 4:52 PM Julien Grall &lt;<=
a href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 08/11/2018 07:07, Matthew Daley wrote:<br>
&gt; Hi all,<br>
<br>
Hi Matthew,<br>
<br>
&gt; <br>
&gt; I&#39;m trying to build and run Linux (Debian) on top of Xen on a Hike=
y960<br>
&gt; ARM board but am having trouble.<br>
&gt; <br>
&gt; I&#39;ve been following Konrad&#39;s guide on the Wiki (at<br>
&gt; <a href=3D"https://wiki.xenproject.org/wiki/HiKey960" rel=3D"noreferre=
r" target=3D"_blank">https://wiki.xenproject.org/wiki/HiKey960</a>), namely=
:<br>
&gt; * I have upgraded the board&#39;s base firmware to support UEFI<br>
&gt; * I am building the hikey960-upstream-rebase branch of<br>
&gt; <a href=3D"https://github.com/96boards-hikey/linux.git" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/96boards-hikey/linux.git</a> (wit=
h a patch from Linus&#39;s<br>
&gt; tree to fix a Hynix UFS bug)<br>
&gt; * I am building the master branch of Xen unstable<br>
&gt; * I am building the master branch of GRUB (with a patch to fix a DTB<b=
r>
&gt; padding bug)<br>
&gt; <br>
&gt; However, I see two problems when booting.<br>
&gt; <br>
&gt; Firstly, Xen fails to bring up any other CPUs but the one it is bootin=
g on:<br>
&gt; <br>
&gt; (XEN) Bringing up CPU1<br>
&gt; (XEN) Failed to bring up CPU1<br>
&gt; (XEN) Failed to bring up CPU 1 (error -9)<br>
&gt; (XEN) Bringing up CPU2<br>
&gt; (XEN) Failed to bring up CPU2<br>
&gt; (XEN) Failed to bring up CPU 2 (error -9)<br>
&gt; (XEN) Bringing up CPU3<br>
&gt; (XEN) Failed to bring up CPU3<br>
&gt; (XEN) Failed to bring up CPU 3 (error -9)<br>
&gt; (XEN) Bringing up CPU4<br>
&gt; (XEN) Failed to bring up CPU4<br>
&gt; (XEN) Failed to bring up CPU 4 (error -9)<br>
&gt; (XEN) Bringing up CPU5<br>
&gt; (XEN) Failed to bring up CPU5<br>
&gt; (XEN) Failed to bring up CPU 5 (error -9)<br>
&gt; (XEN) Bringing up CPU6<br>
&gt; (XEN) Failed to bring up CPU6<br>
&gt; (XEN) Failed to bring up CPU 6 (error -9)<br>
&gt; (XEN) Bringing up CPU7<br>
&gt; (XEN) Failed to bring up CPU7<br>
&gt; (XEN) Failed to bring up CPU 7 (error -9)<br>
&gt; (XEN) Brought up 1 CPUs<br>
&gt; <br>
&gt; I have traced this error code -9 being returned by call_psci_cpu_on.<b=
r>
<br>
A similar error was reported a couple of months on the mailing list. From t=
he <br>
report, a regression was introduced between Xen 4.8 and unstable.<br>
<br>
Unfortunately, I don&#39;t have an hikey board to bisect it. May I ask if y=
ou can <br>
bisect it? If you can point the offending commit, I should be able to provi=
de <br>
ideas why it breaks.<br>
<br></blockquote><div><span class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">As Julien said,</span>=C2=A0</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">For your CPUs problem in Hikey960, use 4.8 of xe=
n source, Then all CPUs will be enabled and worked properly.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Secondly, Linux fails when it tries to initialise AMBA devices:<br>
&gt; <br>
&gt; [=C2=A0 =C2=A0 0.941352] Synchronous External Abort: synchronous exter=
nal abort<br>
&gt; (0x96000210) at 0xffff0000093fdfe<br>
&gt; 0<br>
&gt; [=C2=A0 =C2=A0 0.950601] Internal error: : 96000210 [#1] PREEMPT SMP<b=
r>
&gt; [=C2=A0 =C2=A0 0.955866] Modules linked in:<br>
&gt; [=C2=A0 =C2=A0 0.958990] CPU: 0 PID: 1 Comm: swapper/0 Not tainted<br>
&gt; 4.14.0-rc7-linaro-hikey960+ #8<br>
&gt; [=C2=A0 =C2=A0 0.966791] Hardware name: HiKey960 (DT)<br>
&gt; [=C2=A0 =C2=A0 0.970777] task: ffff80001d900000 task.stack: ffff000008=
058000<br>
&gt; [=C2=A0 =C2=A0 0.976778] PC is at amba_device_try_add+0x108/0x260<br>
&gt; [=C2=A0 =C2=A0 0.981791] LR is at amba_device_try_add+0xf0/0x260<br>
&gt; [=C2=A0 =C2=A0 0.986735] pc : [&lt;ffff0000084eada8&gt;] lr : [&lt;fff=
f0000084ead90&gt;]<br>
&gt; pstate: 60000045<br>
&gt; [=C2=A0 =C2=A0 0.994192] sp : ffff00000805bbf0<br>
&gt; [=C2=A0 =C2=A0 0.997572] x29: ffff00000805bbf0 x28: 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 1.002953] x27: ffff0000090203a8 x26: 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 1.008326] x25: ffff80001dbf9810 x24: 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 1.013702] x23: ffff0000093fd000 x22: 0000000000001000<b=
r>
&gt; [=C2=A0 =C2=A0 1.019079] x21: ffff80001cc1b6f8 x20: 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 1.024455] x19: ffff80001cc1b400 x18: 0000000000000010<b=
r>
&gt; [=C2=A0 =C2=A0 1.029832] x17: 0000000000000001 x16: 00000000deadbeef<b=
r>
&gt; [=C2=A0 =C2=A0 1.035209] x15: 0000000000000006 x14: ffffffffffffffff<b=
r>
&gt; [=C2=A0 =C2=A0 1.040585] x13: 0000000000000020 x12: 0101010101010101<b=
r>
&gt; [=C2=A0 =C2=A0 1.045962] x11: 0000000000000020 x10: 0101010101010101<b=
r>
&gt; [=C2=A0 =C2=A0 1.051338] x9 : 0000000000000000 x8 : ffff80001cc0cf00<b=
r>
&gt; [=C2=A0 =C2=A0 1.056717] x7 : 0000000000000000 x6 : 000000000000003f<b=
r>
&gt; [=C2=A0 =C2=A0 1.062092] x5 : 0000000000000000 x4 : 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 1.067468] x3 : 0000000000000000 x2 : 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 1.072845] x1 : ffff80001d900000 x0 : ffff0000093fdfe0<b=
r>
&gt; [=C2=A0 =C2=A0 1.078223] Process swapper/0 (pid: 1, stack limit =3D 0x=
ffff000008058000)<br>
&gt; [=C2=A0 =C2=A0 1.084989] Call trace:<br>
&gt; [=C2=A0 =C2=A0 1.087504] Exception stack(0xffff00000805bab0 to 0xffff0=
0000805bbf0)<br>
&gt; [=C2=A0 =C2=A0 1.094008] baa0:<br>
&gt; ffff0000093fdfe0 ffff80001d900000<br>
&gt; [=C2=A0 =C2=A0 1.101902] bac0: 0000000000000000 0000000000000000<br>
&gt; 0000000000000000 0000000000000000<br>
&gt; [=C2=A0 =C2=A0 1.109790] bae0: 000000000000003f 0000000000000000<br>
&gt; ffff80001cc0cf00 0000000000000000<br>
&gt; [=C2=A0 =C2=A0 1.117684] bb00: 0101010101010101 0000000000000020<br>
&gt; 0101010101010101 0000000000000020<br>
&gt; [=C2=A0 =C2=A0 1.125576] bb20: ffffffffffffffff 0000000000000006<br>
&gt; 00000000deadbeef 0000000000000001<br>
&gt; [=C2=A0 =C2=A0 1.133468] bb40: 0000000000000010 ffff80001cc1b400<br>
&gt; 0000000000000000 ffff80001cc1b6f8<br>
&gt; [=C2=A0 =C2=A0 1.141356] bb60: 0000000000001000 ffff0000093fd000<br>
&gt; 0000000000000000 ffff80001dbf9810<br>
&gt; [=C2=A0 =C2=A0 1.149248] bb80: 0000000000000000 ffff0000090203a8<br>
&gt; 0000000000000000 ffff00000805bbf0<br>
&gt; [=C2=A0 =C2=A0 1.157139] bba0: ffff0000084ead90 ffff00000805bbf0<br>
&gt; ffff0000084eada8 0000000060000045<br>
&gt; [=C2=A0 =C2=A0 1.165034] bbc0: ffff00000805bbf0 ffff0000084ead90<br>
&gt; ffffffffffffffff 00000000fffffffe<br>
&gt; [=C2=A0 =C2=A0 1.172921] bbe0: ffff00000805bbf0 ffff0000084eada8<br>
&gt; [=C2=A0 =C2=A0 1.177865] [&lt;ffff0000084eada8&gt;] amba_device_try_ad=
d+0x108/0x260<br>
&gt; [=C2=A0 =C2=A0 1.183935] [&lt;ffff0000084eafec&gt;] amba_device_add+0x=
1c/0xd8<br>
&gt; [=C2=A0 =C2=A0 1.189493] [&lt;ffff00000890fbbc&gt;] of_platform_bus_cr=
eate+0x26c/0x300<br>
&gt; [=C2=A0 =C2=A0 1.195814] [&lt;ffff00000890fa74&gt;] of_platform_bus_cr=
eate+0x124/0x300<br>
&gt; [=C2=A0 =C2=A0 1.202145] [&lt;ffff00000890fd7c&gt;] of_platform_popula=
te+0x4c/0xb0<br>
&gt; [=C2=A0 =C2=A0 1.208135] [&lt;ffff000008f6e2ac&gt;] of_platform_defaul=
t_populate_init+0x64/0x78<br>
&gt; [=C2=A0 =C2=A0 1.215247] [&lt;ffff000008083978&gt;] do_one_initcall+0x=
38/0x120<br>
&gt; [=C2=A0 =C2=A0 1.220882] [&lt;ffff000008f20d18&gt;] kernel_init_freeab=
le+0x184/0x224<br>
&gt; [=C2=A0 =C2=A0 1.227038] [&lt;ffff000008a6a360&gt;] kernel_init+0x10/0=
x100<br>
&gt; [=C2=A0 =C2=A0 1.232323] [&lt;ffff000008084b60&gt;] ret_from_fork+0x10=
/0x18<br>
&gt; [=C2=A0 =C2=A0 1.237703] Code: d10082c0 52800002 8b0002e0 52800018 (b9=
400001)<br>
&gt; [=C2=A0 =C2=A0 1.243880] ---[ end trace dcbf70aa30c979a8 ]---<br>
&gt; [=C2=A0 =C2=A0 1.248573] Kernel panic - not syncing: Attempted to kill=
 init!<br>
&gt; exitcode=3D0x0000000b<br>
&gt; <br>
&gt; This does not occur when booting the same Linux kernel without Xen.<br=
>
&gt; <br>
&gt; I have traced this to amba_device_try_add trying to access the pid and=
<br>
&gt; cid through ioremap&#39;d addresses of this node in the device tree (i=
n<br>
&gt; arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi):<br>
<br>
Thank you for confirming it works on Linux baremetal and tracked down the p=
roblem.<br>
<br>
It is not entirely clear why you receive an external abort here. This may b=
e due <br>
to misconfiguration of the stage-2 page-tables.<br>
<br>
Could you try Xen with this small changes? The patch should print a message=
 is <br>
the virtual abort was received by Xen but forwarded to the guest.<br>
<br>
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c<br>
index 51d2e42c77..f95135d030 100644<br>
--- a/xen/arch/arm/traps.c<br>
+++ b/xen/arch/arm/traps.c<br>
@@ -660,6 +660,8 @@ static void inject_vabt_exception(struct cpu_user_regs =
*regs)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 const union hsr hsr =3D { .bits =3D regs-&gt;hsr };<br=
>
<br>
+=C2=A0 =C2=A0 printk(&quot;%pv: Inject Virtual Abort\n&quot;, current);<br=
>
+=C2=A0 =C2=A0 dump_execution_state();<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* SVC/HVC/SMC already have an adjusted PC (See A=
RM ARM DDI 0487A.j<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* D1.10.1 for more details), which we need to co=
rrect in order to<br>
<br>
&gt; <br>
&gt; /* A73 cluster internal coresight */<br>
&gt; <span class=3D"gmail_default" style=3D"color:rgb(11,83,148)"></span><s=
pan class=3D"gmail_default" style=3D"color:rgb(11,83,148)"></span>etm@4,ed4=
40000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,coresight-e=
tm4x&quot;,&quot;arm,primecell&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 0xed440000 0 0x1000&gt=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;pclk&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &quot;apb_pclk&quot;=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu =3D &lt;&amp;cpu4&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 etm4_out=
_port: endpoint {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote-e=
ndpoint =3D &lt;&amp;funnel1_in_port0&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; };<br>
&gt; <br>
&gt; ARM is still relatively new to me and I&#39;m stuck what I should be<b=
r>
&gt; attempting next. I would simply not compile Linux AMBA support (by not=
<br>
&gt; setting CONFIG_AMBA) but it appears that this is selected as a reverse=
<br>
&gt; dependency by CONFIG_ARM on Linux, so am unsure if this is wise or<br>
&gt; even possible.<br>
<br>
I would just drop the node you copied above from the Device-Tree and see if=
 you <br>
can go further in the boot.<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"color=
:rgb(11,83,148)">As Julien said,</div><div class=3D"gmail_default" style=3D=
"color:rgb(11,83,148)"><font color=3D"#0b5394">Disable=C2=A0</font><span cl=
ass=3D"gmail_default" style=3D"color:rgb(34,34,34)"><font color=3D"#0b5394"=
>all=C2=A0&#39;</font></span><font color=3D"#0b5394"><span class=3D"gmail_d=
efault"></span>etm&#39; nodes in device-tree for all CPUs. This will fix al=
l amba CPU devices linux crashes.</font></div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Cheers,<br>
<br>
-- <br>
Julien Grall<br></blockquote><div><br></div><div><br></div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">Thanks,</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">Omkar B</div></div></div></div></=
div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--000000000000b3e3f6057a3e38a6--


--===============1879868233443743681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1879868233443743681==--
