From: Rishi <2rushikeshj@gmail.com>
Subject: Re: Dom0 kernel 4.14 with SMP randomly crashing
Date: Tue, 6 Nov 2018 15:31:31 +0530
Message-ID: <CAO9XypWzkV_cpCy+WygT5JWt6FujBMm47B_ydNjF-qoX-koKSA@mail.gmail.com>
References: <CAO9XypUsz-e3vmX-n5eSMz7rG2aZpDG1h03CMRAAT2X=TpZNNw@mail.gmail.com>
 <20181105101938.mj2c6l4nx5sbsk2n@zion.uk.xensource.com>
 <CAO9XypWZ=Qr4Bo9Km_MUeod3cCHOnA=SonXXRF95zeeu0+RNHQ@mail.gmail.com>
 <20181105105852.ae4sjkkcm6eumpwr@zion.uk.xensource.com>
 <CAO9XypUXJkhGEiH14HuMW8zOha9mRQh0+kpMa_0b2doHhjJUCQ@mail.gmail.com>
 <20181105114127.s57z7n7p4pmix5b5@zion.uk.xensource.com>
 <CAO9XypV42TO8c=26dRJSNnFukXDfWp_0rM3McRBKZs1crT1qEA@mail.gmail.com>
 <20181105115850.f677uvjmm7vqfikc@zion.uk.xensource.com>
 <CAO9XypVrwzvC4iNP9HR63kjj_n-Ju30mvptd89GtK6TYO0yUTQ@mail.gmail.com>
 <20181105124916.da2kqcczcomnxepv@zion.uk.xensource.com>
 <CAO9XypU_sRsxe5J7SAaoVPOK-zCF68-LLd8v-2m+nyyqae3P4A@mail.gmail.com>
 <CAO9XypXCio51Dbt6chxufyH_6M73HfXufQQS751gmNK5R3Uo5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1789520248056733152=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAO9XypXCio51Dbt6chxufyH_6M73HfXufQQS751gmNK5R3Uo5A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1789520248056733152==
Content-Type: multipart/alternative; boundary="000000000000b44a110579fc16ef"

--000000000000b44a110579fc16ef
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 5, 2018 at 6:32 PM Rishi <2rushikeshj@gmail.com> wrote:

>
>
> On Mon, Nov 5, 2018 at 6:29 PM Rishi <2rushikeshj@gmail.com> wrote:
>
>> Yes, I'm taking out patches from 4.4 and actually do have a working 4.9
>> kernel along with blktap. Tested networking and disk IO in it.
>>
>> There are roughly 415 patches to 4.4 out of which some ~210+ are already
>> applied in 4.9 and ~220+ are already applied in 4.14. I dont have numbers
>> for 4.19 yet.
>>
>> Essentially I'm down to single digit number of patches atm to have a
>> working setup for kernel 4.9. I know there would be mishaps since I'm not
>> applying all patches but my experiment is to see how close can we stay near
>> mainline kernel + what can be the patches that kernel.org can accept.
>>
>>
>>
>> On Mon, Nov 5, 2018 at 6:19 PM Wei Liu <wei.liu2@citrix.com> wrote:
>>
>>> I forgot to say: please don't top-post.
>>>
>>> On Mon, Nov 05, 2018 at 06:00:10PM +0530, Rishi wrote:
>>> > I'm using a XenServer Host and XCP-NG on it as HVM. I used xencons=tty
>>> > console=ttyS0 on XCP-NG dom0 kernel line, to obtain serial console.
>>> > I'm working on to build a more recent dom0 kernel for improved support
>>> of
>>> > Ceph in XenServer/XCP-NG.
>>>
>>> This is an interesting setup. I don't think you can expect to just drop
>>> in a new kernel to XenServer/XCP-NG and then it works flawlessly. What
>>> did you do to the patch queue XenServer carries for 4.4?
>>>
>>> Also, have you got a working baseline? I.e. did the stock 4.4 kernel
>>> work?
>>>
>>> Wei.
>>>
>>> >
>>> >
>>> >
>>> > On Mon, Nov 5, 2018 at 5:28 PM Wei Liu <wei.liu2@citrix.com> wrote:
>>> >
>>> > > On Mon, Nov 05, 2018 at 05:18:43PM +0530, Rishi wrote:
>>> > > > Yes, I'm running it in a HVM domU for development purpose.
>>> > >
>>> > > What is your exact setup?
>>> > >
>>> > > Wei.
>>> > >
>>> > > >
>>> > > > On Mon, Nov 5, 2018 at 5:11 PM Wei Liu <wei.liu2@citrix.com>
>>> wrote:
>>> > > >
>>> > > > > On Mon, Nov 05, 2018 at 04:58:35PM +0530, Rishi wrote:
>>> > > > > > Alright, I got the serial console and following is the crash
>>> log.
>>> > > Thank
>>> > > > > you
>>> > > > > > for pointing that out.
>>> > > > > >
>>> > > > > > [  133.594852] watchdog: BUG: soft lockup - CPU#2 stuck for
>>> 22s!
>>> > > > > > [ksoftirqd/2:22]
>>> > > > > >
>>> > > > > > [  133.599232] Kernel panic - not syncing: softlockup: hung
>>> tasks
>>> > > > > >
>>> > > > > > [  133.602275] CPU: 2 PID: 22 Comm: ksoftirqd/2 Tainted: G
>>> > > > > > L    4.19.1
>>> > > > > > #1
>>> > > > > >
>>> > > > > > [  133.606620] Hardware name: Xen HVM domU, BIOS 4.4.1-xs132257
>>> > > > > 12/12/2016
>>> > > > >
>>> > > > > Is this serial log from the host? It says it is running as a HVM
>>> DomU.
>>> > > > > Maybe you have mistaken guest serial log with host serial log?
>>> > > > >
>>> > > > > This indicates your machine runs XenServer, which has its own
>>> patch
>>> > > > > queues on top of upstream Xen. You may also want to report to
>>> xs-devel
>>> > > > > mailing list.
>>> > > > >
>>> > > > > Wei.
>>> > > > >
>>> > >
>>>
>>
>
> Sorry, I'll take care of top post from onwards.
>

So after knowing the stack trace, it appears that the CPU was getting stuck
for xen_hypercall_xen_version

watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:0]


[30569.582740] watchdog: BUG: soft lockup - CPU#0 stuck for 23s!
[swapper/0:0]

[30569.588186] Kernel panic - not syncing: softlockup: hung tasks

[30569.591307] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G             L    4.19.1
#1

[30569.595110] Hardware name: Xen HVM domU, BIOS 4.4.1-xs132257 12/12/2016

[30569.598356] Call Trace:

[30569.599597]  <IRQ>

[30569.600920]  dump_stack+0x5a/0x73

[30569.602998]  panic+0xe8/0x249

[30569.604806]  watchdog_timer_fn+0x200/0x230

[30569.607029]  ? softlockup_fn+0x40/0x40

[30569.609246]  __hrtimer_run_queues+0x133/0x270

[30569.611712]  hrtimer_interrupt+0xfb/0x260

[30569.613800]  xen_timer_interrupt+0x1b/0x30

[30569.616972]  __handle_irq_event_percpu+0x69/0x1a0

[30569.619831]  handle_irq_event_percpu+0x30/0x70

[30569.622382]  handle_percpu_irq+0x34/0x50

[30569.625048]  generic_handle_irq+0x1e/0x30

[30569.627216]  __evtchn_fifo_handle_events+0x163/0x1a0

[30569.629955]  __xen_evtchn_do_upcall+0x41/0x70

[30569.632612]  xen_evtchn_do_upcall+0x27/0x50

[30569.635136]  xen_do_hypervisor_callback+0x29/0x40

[30569.638181] RIP: e030:xen_hypercall_xen_version+0xa/0x20

[30569.641302] Code: 51 41 53 b8 10 00 00 00 0f 05 41 5b 59 c3 cc cc cc cc
cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 11 00 00 00 0f 05
<41> 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc

[30569.651998] RSP: e02b:ffff8800b6203e10 EFLAGS: 00000246

[30569.655077] RAX: 0000000000040007 RBX: ffff8800ae41a898 RCX:
ffffffff8100122a

[30569.659226] RDX: ffffc900400080ff RSI: 0000000000000000 RDI:
0000000000000000

[30569.663480] RBP: ffff8800ae41a890 R08: 0000000000000000 R09:
0000000000000000

[30569.667943] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000080000600

[30569.672057] R13: 000000000000001d R14: 00000000000001d0 R15:
000000000000001d

[30569.675911]  ? xen_hypercall_xen_version+0xa/0x20

[30569.678470]  ? xen_force_evtchn_callback+0x9/0x10

[30569.681495]  ? check_events+0x12/0x20

[30569.683738]  ? xen_restore_fl_direct+0x1f/0x20

[30569.686632]  ? _raw_spin_unlock_irqrestore+0x14/0x20

[30569.689166]  ? cp_rx_poll+0x427/0x4d0 [8139cp]

[30569.691519]  ? net_rx_action+0x171/0x3a0

[30569.694219]  ? __do_softirq+0x11e/0x295

[30569.696442]  ? irq_exit+0x62/0xb0

[30569.698251]  ? xen_evtchn_do_upcall+0x2c/0x50

[30569.701037]  ? xen_do_hypervisor_callback+0x29/0x40

[30569.704439]  </IRQ>

[30569.705731]  ? xen_hypercall_sched_op+0xa/0x20

[30569.708766]  ? xen_hypercall_sched_op+0xa/0x20

[30569.711344]  ? xen_safe_halt+0xc/0x20

[30569.713353]  ? default_idle+0x80/0x140

[30569.715345]  ? do_idle+0x13a/0x250

[30569.717216]  ? cpu_startup_entry+0x6f/0x80

[30569.719511]  ? start_kernel+0x4f6/0x516

[30569.721681]  ? set_init_arg+0x57/0x57

[30569.723985]  ? xen_start_kernel+0x575/0x57f

[30569.726453] Kernel Offset: disabled



So I wrote a kernel module to try to call the function
xen_hypercall_xen_version through it, it could successfully run and return
the version.


What else should I be checking for?

--000000000000b44a110579fc16ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Nov 5, 2018 at 6:32 PM Rishi &lt;<a href=3D"mailto:2rushikeshj@gmail.com"=
>2rushikeshj@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Mon, Nov 5, 2018 at 6:29 PM Rishi &lt;<a href=3D"mailto:2rushikeshj@gmail.c=
om" target=3D"_blank">2rushikeshj@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr">Yes, I&#39;m taking out patches fr=
om 4.4 and actually do have a working 4.9 kernel along with blktap. Tested =
networking and disk IO in it.<div><br></div><div>There are roughly 415 patc=
hes to 4.4 out of which some ~210+ are already applied in 4.9 and ~220+ are=
 already applied in 4.14. I dont have numbers for 4.19 yet.<br><br>Essentia=
lly I&#39;m down to single digit number of patches atm to have a working se=
tup for kernel 4.9. I know there would be mishaps since I&#39;m not applyin=
g all patches but my experiment is to see how close can we stay near mainli=
ne kernel=C2=A0+ what can be the patches that <a href=3D"http://kernel.org"=
 target=3D"_blank">kernel.org</a> can accept.<br><br><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Nov 5, 2018 at 6:19 PM We=
i Liu &lt;<a href=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2=
@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I forgot=
 to say: please don&#39;t top-post.<br>
<br>
On Mon, Nov 05, 2018 at 06:00:10PM +0530, Rishi wrote:<br>
&gt; I&#39;m using a XenServer Host and XCP-NG on it as HVM. I used xencons=
=3Dtty<br>
&gt; console=3DttyS0 on XCP-NG dom0 kernel line, to obtain serial console.<=
br>
&gt; I&#39;m working on to build a more recent dom0 kernel for improved sup=
port of<br>
&gt; Ceph in XenServer/XCP-NG.<br>
<br>
This is an interesting setup. I don&#39;t think you can expect to just drop=
<br>
in a new kernel to XenServer/XCP-NG and then it works flawlessly. What<br>
did you do to the patch queue XenServer carries for 4.4?<br>
<br>
Also, have you got a working baseline? I.e. did the stock 4.4 kernel<br>
work?<br>
<br>
Wei.<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Nov 5, 2018 at 5:28 PM Wei Liu &lt;<a href=3D"mailto:wei.liu2@=
citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, Nov 05, 2018 at 05:18:43PM +0530, Rishi wrote:<br>
&gt; &gt; &gt; Yes, I&#39;m running it in a HVM domU for development purpos=
e.<br>
&gt; &gt;<br>
&gt; &gt; What is your exact setup?<br>
&gt; &gt;<br>
&gt; &gt; Wei.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Nov 5, 2018 at 5:11 PM Wei Liu &lt;<a href=3D"mailto=
:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&gt; wrote:<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Nov 05, 2018 at 04:58:35PM +0530, Rishi wrote:<=
br>
&gt; &gt; &gt; &gt; &gt; Alright, I got the serial console and following is=
 the crash log.<br>
&gt; &gt; Thank<br>
&gt; &gt; &gt; &gt; you<br>
&gt; &gt; &gt; &gt; &gt; for pointing that out.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; [=C2=A0 133.594852] watchdog: BUG: soft lockup - C=
PU#2 stuck for 22s!<br>
&gt; &gt; &gt; &gt; &gt; [ksoftirqd/2:22]<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; [=C2=A0 133.599232] Kernel panic - not syncing: so=
ftlockup: hung tasks<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; [=C2=A0 133.602275] CPU: 2 PID: 22 Comm: ksoftirqd=
/2 Tainted: G<br>
&gt; &gt; &gt; &gt; &gt; L=C2=A0 =C2=A0 4.19.1<br>
&gt; &gt; &gt; &gt; &gt; #1<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; [=C2=A0 133.606620] Hardware name: Xen HVM domU, B=
IOS 4.4.1-xs132257<br>
&gt; &gt; &gt; &gt; 12/12/2016<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Is this serial log from the host? It says it is running=
 as a HVM DomU.<br>
&gt; &gt; &gt; &gt; Maybe you have mistaken guest serial log with host seri=
al log?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This indicates your machine runs XenServer, which has i=
ts own patch<br>
&gt; &gt; &gt; &gt; queues on top of upstream Xen. You may also want to rep=
ort to xs-devel<br>
&gt; &gt; &gt; &gt; mailing list.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Wei.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br></blockquote></div></blockquote><div><br><br>Sorry, I&#39;ll t=
ake care of top post from onwards.=C2=A0</div></div></div></blockquote><div=
><br>So after knowing the stack trace, it appears that the CPU was getting =
stuck for=C2=A0<span style=3D"color:rgb(0,0,0);font-family:Menlo;font-size:=
11px;font-variant-ligatures:no-common-ligatures">xen_hypercall_xen_version<=
/span></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-kerning:none;font-variant-ligatures:no-common-ligatures">





</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-stretch:normal;font-size:11px;lin=
e-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1=
" style=3D"font-variant-ligatures:no-common-ligatures">watchdog: BUG: soft =
lockup - CPU#0 stuck for 23s! [swapper/0:0]</span></p><p class=3D"gmail-p1"=
 style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Menl=
o;color:rgb(0,0,0)"><br>





</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">[30569.582740] watchdog: BU=
G: soft lockup - CPU#0 stuck for 23s! [swapper/0:0]</span></p><p class=3D"g=
mail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-fam=
ily:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-=
ligatures:no-common-ligatures">[30569.588186] Kernel panic - not syncing: s=
oftlockup: hung tasks</span></p><p class=3D"gmail-p1" style=3D"margin:0px;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:norm=
al;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[30569.591307] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G <span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
L<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>4.19.1 #1=
</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-stretch:normal;font-size:11px;lin=
e-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1=
" style=3D"font-variant-ligatures:no-common-ligatures">[30569.595110] Hardw=
are name: Xen HVM domU, BIOS 4.4.1-xs132257 12/12/2016</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;fon=
t-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-var=
iant-ligatures:no-common-ligatures">[30569.598356] Call Trace:</span></p><p=
 class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">[30569.599597]<span class=3D"gmai=
l-Apple-converted-space">=C2=A0 </span>&lt;IRQ&gt;</span></p><p class=3D"gm=
ail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-fami=
ly:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures">[30569.600920]<span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span>dump_stack+0x5a/0x73</span></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:=
Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-liga=
tures:no-common-ligatures">[30569.602998]<span class=3D"gmail-Apple-convert=
ed-space">=C2=A0 </span>panic+0xe8/0x249</span></p><p class=3D"gmail-p1" st=
yle=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-stretch:normal;font-size:11px;line-height:normal;font-family:Menlo;c=
olor:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:n=
o-common-ligatures">[30569.604806]<span class=3D"gmail-Apple-converted-spac=
e">=C2=A0 </span>watchdog_timer_fn+0x200/0x230</span></p><p class=3D"gmail-=
p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:M=
enlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligat=
ures:no-common-ligatures">[30569.607029]<span class=3D"gmail-Apple-converte=
d-space">=C2=A0 </span>? softlockup_fn+0x40/0x40</span></p><p class=3D"gmai=
l-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-stretch:normal;font-size:11px;line-height:normal;font-family=
:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">[30569.609246]<span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 </span>__hrtimer_run_queues+0x133/0x270</span></p><p clas=
s=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;fo=
nt-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-va=
riant-ligatures:no-common-ligatures">[30569.611712]<span class=3D"gmail-App=
le-converted-space">=C2=A0 </span>hrtimer_interrupt+0xfb/0x260</span></p><p=
 class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">[30569.613800]<span class=3D"gmai=
l-Apple-converted-space">=C2=A0 </span>xen_timer_interrupt+0x1b/0x30</span>=
</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">[30569.616972]<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>__handle_irq_event_percpu+0x=
69/0x1a0</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:=
11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"=
gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[30569.61983=
1]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>handle_irq_even=
t_percpu+0x30/0x70</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span=
 class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[3=
0569.622382]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>handl=
e_percpu_irq+0x34/0x50</span></p><p class=3D"gmail-p1" style=3D"margin:0px;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:nor=
mal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><=
span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures=
">[30569.625048]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>g=
eneric_handle_irq+0x1e/0x30</span></p><p class=3D"gmail-p1" style=3D"margin=
:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretc=
h:normal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,=
0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-liga=
tures">[30569.627216]<span class=3D"gmail-Apple-converted-space">=C2=A0 </s=
pan>__evtchn_fifo_handle_events+0x163/0x1a0</span></p><p class=3D"gmail-p1"=
 style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Menl=
o;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligature=
s:no-common-ligatures">[30569.629955]<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 </span>__xen_evtchn_do_upcall+0x41/0x70</span></p><p class=3D"=
gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-fa=
mily:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant=
-ligatures:no-common-ligatures">[30569.632612]<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0 </span>xen_evtchn_do_upcall+0x27/0x50</span></p><p cl=
ass=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;=
font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-=
variant-ligatures:no-common-ligatures">[30569.635136]<span class=3D"gmail-A=
pple-converted-space">=C2=A0 </span>xen_do_hypervisor_callback+0x29/0x40</s=
pan></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-h=
eight:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" s=
tyle=3D"font-variant-ligatures:no-common-ligatures">[30569.638181] RIP: e03=
0:xen_hypercall_xen_version+0xa/0x20</span></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;font-size:11px;line-height:normal;font-family:Menlo;colo=
r:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-c=
ommon-ligatures">[30569.641302] Code: 51 41 53 b8 10 00 00 00 0f 05 41 5b 5=
9 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 11 0=
0 00 00 0f 05 &lt;41&gt; 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc=
 cc cc cc cc</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-s=
ize:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=
=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[30569.6=
51998] RSP: e02b:ffff8800b6203e10 EFLAGS: 00000246</span></p><p class=3D"gm=
ail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-fami=
ly:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures">[30569.655077] RAX: 0000000000040007 RBX: fff=
f8800ae41a898 RCX: ffffffff8100122a</span></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;font-size:11px;line-height:normal;font-family:Menlo;colo=
r:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-c=
ommon-ligatures">[30569.659226] RDX: ffffc900400080ff RSI: 0000000000000000=
 RDI: 0000000000000000</span></p><p class=3D"gmail-p1" style=3D"margin:0px;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:nor=
mal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><=
span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures=
">[30569.663480] RBP: ffff8800ae41a890 R08: 0000000000000000 R09: 000000000=
0000000</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:1=
1px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"g=
mail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[30569.667943=
] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000080000600</span><=
/p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">[30569.672057] R13: 0000000=
00000001d R14: 00000000000001d0 R15: 000000000000001d</span></p><p class=3D=
"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-f=
amily:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-varian=
t-ligatures:no-common-ligatures">[30569.675911]<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 </span>? xen_hypercall_xen_version+0xa/0x20</span></=
p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:=
normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">[30569.678470]<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>? xen_force_evtchn_callback+=
0x9/0x10</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:=
11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"=
gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[30569.68149=
5]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? check_events+=
0x12/0x20</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size=
:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D=
"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[30569.6837=
38]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? xen_restore_=
fl_direct+0x1f/0x20</span></p><p class=3D"gmail-p1" style=3D"margin:0px;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal=
;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><spa=
n class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[=
30569.686632]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? _r=
aw_spin_unlock_irqrestore+0x14/0x20</span></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;font-size:11px;line-height:normal;font-family:Menlo;colo=
r:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-c=
ommon-ligatures">[30569.689166]<span class=3D"gmail-Apple-converted-space">=
=C2=A0 </span>? cp_rx_poll+0x427/0x4d0 [8139cp]</span></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:=
Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-liga=
tures:no-common-ligatures">[30569.691519]<span class=3D"gmail-Apple-convert=
ed-space">=C2=A0 </span>? net_rx_action+0x171/0x3a0</span></p><p class=3D"g=
mail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-fam=
ily:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-=
ligatures:no-common-ligatures">[30569.694219]<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>? __do_softirq+0x11e/0x295</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;fon=
t-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-var=
iant-ligatures:no-common-ligatures">[30569.696442]<span class=3D"gmail-Appl=
e-converted-space">=C2=A0 </span>? irq_exit+0x62/0xb0</span></p><p class=3D=
"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-f=
amily:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-varian=
t-ligatures:no-common-ligatures">[30569.698251]<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 </span>? xen_evtchn_do_upcall+0x2c/0x50</span></p><p=
 class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">[30569.701037]<span class=3D"gmai=
l-Apple-converted-space">=C2=A0 </span>? xen_do_hypervisor_callback+0x29/0x=
40</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:11px;l=
ine-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-=
s1" style=3D"font-variant-ligatures:no-common-ligatures">[30569.704439]<spa=
n class=3D"gmail-Apple-converted-space">=C2=A0 </span>&lt;/IRQ&gt;</span></=
p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:=
normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">[30569.705731]<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>? xen_hypercall_sched_op+0xa=
/0x20</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:11p=
x;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">[30569.708766]<=
span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? xen_hypercall_sc=
hed_op+0xa/0x20</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;fon=
t-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span cl=
ass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[3056=
9.711344]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? xen_sa=
fe_halt+0xc/0x20</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;fo=
nt-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span c=
lass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[305=
69.713353]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? defau=
lt_idle+0x80/0x140</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span=
 class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[3=
0569.715345]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? do_=
idle+0x13a/0x250</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;fo=
nt-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span c=
lass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">[305=
69.717216]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>? cpu_s=
tartup_entry+0x6f/0x80</span></p><p class=3D"gmail-p1" style=3D"margin:0px;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:nor=
mal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><=
span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures=
">[30569.719511]<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>?=
 start_kernel+0x4f6/0x516</span></p><p class=3D"gmail-p1" style=3D"margin:0=
px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:=
normal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">[30569.721681]<span class=3D"gmail-Apple-converted-space">=C2=A0 </spa=
n>? set_init_arg+0x57/0x57</span></p><p class=3D"gmail-p1" style=3D"margin:=
0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch=
:normal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0=
)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligat=
ures">[30569.723985]<span class=3D"gmail-Apple-converted-space">=C2=A0 </sp=
an>? xen_start_kernel+0x575/0x57f</span></p><p class=3D"gmail-p1" style=3D"=
margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
stretch:normal;font-size:11px;line-height:normal;font-family:Menlo;color:rg=
b(0,0,0)">

















































</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">[30569.726453] Kernel Offse=
t: disabled</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-si=
ze:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=
=3D"gmail-s1" style=3D"font-kerning:none;font-variant-ligatures:no-common-l=
igatures"><br></span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font=
-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span cla=
ss=3D"gmail-s1" style=3D"font-kerning:none;font-variant-ligatures:no-common=
-ligatures"><br></span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;li=
ne-height:normal"><span class=3D"gmail-s1" style=3D"font-kerning:none">So I=
 wrote a kernel module to try to call the function=C2=A0</span><span style=
=3D"color:rgb(0,0,0);font-family:Menlo;font-size:11px;font-variant-ligature=
s:no-common-ligatures">xen_hypercall_xen_version=C2=A0</span>through it, it=
 could successfully=C2=A0run and return the version.</p><p class=3D"gmail-p=
1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;line-height:normal"><span class=3D"gmail-s1" sty=
le=3D"font-kerning:none"><br></span></p><p class=3D"gmail-p1" style=3D"marg=
in:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stre=
tch:normal;line-height:normal"><span class=3D"gmail-s1" style=3D"font-kerni=
ng:none">What else should I be checking for?</span></p></div><div>=C2=A0</d=
iv></div></div>

--000000000000b44a110579fc16ef--


--===============1789520248056733152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1789520248056733152==--
