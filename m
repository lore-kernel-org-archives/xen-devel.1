From: Rishi <2rushikeshj@gmail.com>
Subject: Re: Dom0 kernel 4.14 with SMP randomly crashing
Date: Mon, 5 Nov 2018 16:58:35 +0530
Message-ID: <CAO9XypUXJkhGEiH14HuMW8zOha9mRQh0+kpMa_0b2doHhjJUCQ@mail.gmail.com>
References: <CAO9XypUsz-e3vmX-n5eSMz7rG2aZpDG1h03CMRAAT2X=TpZNNw@mail.gmail.com>
 <20181105101938.mj2c6l4nx5sbsk2n@zion.uk.xensource.com>
 <CAO9XypWZ=Qr4Bo9Km_MUeod3cCHOnA=SonXXRF95zeeu0+RNHQ@mail.gmail.com>
 <20181105105852.ae4sjkkcm6eumpwr@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1633537603557354621=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181105105852.ae4sjkkcm6eumpwr@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============1633537603557354621==
Content-Type: multipart/alternative; boundary="0000000000003d473c0579e930ae"

--0000000000003d473c0579e930ae
Content-Type: text/plain; charset="UTF-8"

Alright, I got the serial console and following is the crash log. Thank you
for pointing that out.

[  133.594852] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
[ksoftirqd/2:22]

[  133.599232] Kernel panic - not syncing: softlockup: hung tasks

[  133.602275] CPU: 2 PID: 22 Comm: ksoftirqd/2 Tainted: G
L    4.19.1
#1

[  133.606620] Hardware name: Xen HVM domU, BIOS 4.4.1-xs132257 12/12/2016

[  133.610376] Call Trace:

[  133.611827]  <IRQ>

[  133.612942]  dump_stack+0x5a/0x73

[  133.614676]  panic+0xe8/0x249

[  133.616183]  watchdog_timer_fn+0x200/0x230

[  133.618366]  ? softlockup_fn+0x40/0x40

[  133.620561]  __hrtimer_run_queues+0x133/0x270

[  133.623056]  hrtimer_interrupt+0xfb/0x260

[  133.625580]  xen_timer_interrupt+0x1b/0x30

[  133.628011]  __handle_irq_event_percpu+0x69/0x1a0

[  133.630642]  handle_irq_event_percpu+0x30/0x70

[  133.633826]  handle_percpu_irq+0x34/0x50

[  133.636012]  generic_handle_irq+0x1e/0x30

[  133.638573]  __evtchn_fifo_handle_events+0x163/0x1a0

[  133.641444]  __xen_evtchn_do_upcall+0x41/0x70

[  133.643772]  xen_evtchn_do_upcall+0x27/0x50

[  133.645868]  xen_do_hypervisor_callback+0x29/0x40

[  133.648231]  </IRQ>

[  133.649279] RIP: e030:xen_hypercall_xen_version+0xa/0x20

[  133.652259] Code: 51 41 53 b8 10 00 00 00 0f 05 41 5b 59 c3 cc cc cc cc
cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 11 00 00 00 0f 05
<41> 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc

[  133.662574] RSP: e02b:ffffc900400dbd18 EFLAGS: 00000246

[  133.665557] RAX: 0000000000040007 RBX: ffff88003315a898 RCX:
ffffffff8100122a

[  133.670005] RDX: ffffc900400080ff RSI: 0000000000000000 RDI:
0000000000000000

[  133.674606] RBP: ffff88003315a890 R08: 0000000000000000 R09:
0000000000000000

[  133.678567] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000080000600

[  133.682552] R13: 000000000000002a R14: 00000000000002a0 R15:
000000000000002a

[  133.686851]  ? xen_hypercall_xen_version+0xa/0x20

[  133.689681]  ? xen_force_evtchn_callback+0x9/0x10

[  133.692189]  ? check_events+0x12/0x20

[  133.694227]  ? xen_restore_fl_direct+0x1f/0x20

[  133.696878]  ? _raw_spin_unlock_irqrestore+0x14/0x20

[  133.699894]  ? cp_rx_poll+0x427/0x4d0 [8139cp]

[  133.702421]  ? net_rx_action+0x171/0x3a0

[  133.704693]  ? __do_softirq+0x11e/0x295

[  133.706672]  ? run_ksoftirqd+0x1e/0x40

[  133.708867]  ? smpboot_thread_fn+0x13c/0x160

[  133.711320]  ? kthread+0x115/0x120

[  133.713350]  ? sort_range+0x20/0x20

[  133.715421]  ? __kthread_cancel_work+0x80/0x80

[  133.717969]  ? ret_from_fork+0x35/0x40

[  133.720238] Kernel Offset: disabled



I'll try to solve it ahead.



On Mon, Nov 5, 2018 at 4:28 PM Wei Liu <wei.liu2@citrix.com> wrote:

> On Mon, Nov 05, 2018 at 04:26:03PM +0530, Rishi wrote:
> > Nothing is getting logged. I suspect its because the kernel just goes in
> > halt state.
> >
> > /var/log/kern.log /var/log/messages /var/log/xen/hypervisor.log
> >
> > All of these files have nothing appended.
> >
> > I can fetch info from kernel debugfs, if you point me to required area,
> >
> >
> > The dom0 kernel works fine without spilt of SMP code or with "nosmp"
> option
> > at xen command line.
>
> I think you will need to set up a serial console. I wouldn't expect to
> see anything in /var/log if the system has crashed.
>
> Without serial log there is nothing we can do to help.
>
> Wei.
>

--0000000000003d473c0579e930ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alright, I got the serial console and following is the cra=
sh log. Thank you for pointing that out.<div><br>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.594852] watchdog: BUG: soft lockup - CPU#2 =
stuck for 22s! [ksoftirqd/2:22]</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.599232] Kernel panic - not syncing: softloc=
kup: hung tasks</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.602275] CPU: 2 PID: 22 Comm: ksoftirqd/2 Ta=
inted: G <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>L<span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 </span>4.19.1 #1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.606620] Hardware name: Xen HVM domU, BIOS 4=
.4.1-xs132257 12/12/2016</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.610376] Call Trace:</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.611827]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>&lt;IRQ&gt;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.612942]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>dump_stack+0x5a/0x73</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.614676]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>panic+0xe8/0x249</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.616183]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>watchdog_timer_fn+0x200/0x230</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.618366]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? softlockup_fn+0x40/0x40</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.620561]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>__hrtimer_run_queues+0x133/0x270</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.623056]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>hrtimer_interrupt+0xfb/0x260</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.625580]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>xen_timer_interrupt+0x1b/0x30</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.628011]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>__handle_irq_event_percpu+0x69/0x1a0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.630642]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>handle_irq_event_percpu+0x30/0x70</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.633826]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>handle_percpu_irq+0x34/0x50</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.636012]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>generic_handle_irq+0x1e/0x30</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.638573]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>__evtchn_fifo_handle_events+0x163/0x1a0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.641444]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>__xen_evtchn_do_upcall+0x41/0x70</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.643772]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>xen_evtchn_do_upcall+0x27/0x50</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.645868]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>xen_do_hypervisor_callback+0x29/0x40</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.648231]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>&lt;/IRQ&gt;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.649279] RIP: e030:xen_hypercall_xen_version=
+0xa/0x20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.652259] Code: 51 41 53 b8 10 00 00 00 0f 05=
 41 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53=
 b8 11 00 00 00 0f 05 &lt;41&gt; 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc =
cc cc cc cc cc cc cc</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.662574] RSP: e02b:ffffc900400dbd18 EFLAGS: =
00000246</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.665557] RAX: 0000000000040007 RBX: ffff8800=
3315a898 RCX: ffffffff8100122a</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.670005] RDX: ffffc900400080ff RSI: 00000000=
00000000 RDI: 0000000000000000</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.674606] RBP: ffff88003315a890 R08: 00000000=
00000000 R09: 0000000000000000</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.678567] R10: 0000000000000000 R11: 00000000=
00000246 R12: 0000000080000600</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.682552] R13: 000000000000002a R14: 00000000=
000002a0 R15: 000000000000002a</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.686851]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? xen_hypercall_xen_version+0xa/0x20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.689681]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? xen_force_evtchn_callback+0x9/0x10</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.692189]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? check_events+0x12/0x20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.694227]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? xen_restore_fl_direct+0x1f/0x20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.696878]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? _raw_spin_unlock_irqrestore+0x14/0x20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.699894]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? cp_rx_poll+0x427/0x4d0 [8139cp]</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.702421]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? net_rx_action+0x171/0x3a0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.704693]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? __do_softirq+0x11e/0x295</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.706672]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? run_ksoftirqd+0x1e/0x40</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.708867]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? smpboot_thread_fn+0x13c/0x160</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.711320]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? kthread+0x115/0x120</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.713350]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? sort_range+0x20/0x20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.715421]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? __kthread_cancel_work+0x80/0x80</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.717969]<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>? ret_from_fork+0x35/0x40</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>133.720238] Kernel Offset: disabled</span></p><=
p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:nor=
mal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"f=
ont-variant-ligatures:no-common-ligatures"><br></span></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:=
Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-liga=
tures:no-common-ligatures"><br></span></p><p class=3D"gmail-p1" style=3D"ma=
rgin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-st=
retch:normal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(=
0,0,0)"><span style=3D"font-variant-ligatures:no-common-ligatures">I&#39;ll=
 try to solve it ahead.</span></p><p class=3D"gmail-p1" style=3D"margin:0px=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:no=
rmal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)">=
<span style=3D"font-variant-ligatures:no-common-ligatures"><br></span></p><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Nov 5, 2=
018 at 4:28 PM Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix.com">wei.liu2@=
citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, =
Nov 05, 2018 at 04:26:03PM +0530, Rishi wrote:<br>
&gt; Nothing is getting logged. I suspect its because the kernel just goes =
in<br>
&gt; halt state.<br>
&gt; <br>
&gt; /var/log/kern.log /var/log/messages /var/log/xen/hypervisor.log<br>
&gt; <br>
&gt; All of these files have nothing appended.<br>
&gt; <br>
&gt; I can fetch info from kernel debugfs, if you point me to required area=
,<br>
&gt; <br>
&gt; <br>
&gt; The dom0 kernel works fine without spilt of SMP code or with &quot;nos=
mp&quot; option<br>
&gt; at xen command line.<br>
<br>
I think you will need to set up a serial console. I wouldn&#39;t expect to<=
br>
see anything in /var/log if the system has crashed.<br>
<br>
Without serial log there is nothing we can do to help.<br>
<br>
Wei.<br>
</blockquote></div>

--0000000000003d473c0579e930ae--


--===============1633537603557354621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1633537603557354621==--
