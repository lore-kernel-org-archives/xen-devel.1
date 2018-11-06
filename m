From: Rishi <2rushikeshj@gmail.com>
Subject: Re: Dom0 kernel 4.14 with SMP randomly crashing
Date: Wed, 7 Nov 2018 00:16:39 +0530
Message-ID: <CAO9XypUBUvw2g1Q2YBvFT8kCoNzboTchqKGDqXi4WQ82D+MU9A@mail.gmail.com>
References: <20181105105852.ae4sjkkcm6eumpwr@zion.uk.xensource.com>
 <CAO9XypUXJkhGEiH14HuMW8zOha9mRQh0+kpMa_0b2doHhjJUCQ@mail.gmail.com>
 <20181105114127.s57z7n7p4pmix5b5@zion.uk.xensource.com>
 <CAO9XypV42TO8c=26dRJSNnFukXDfWp_0rM3McRBKZs1crT1qEA@mail.gmail.com>
 <20181105115850.f677uvjmm7vqfikc@zion.uk.xensource.com>
 <CAO9XypVrwzvC4iNP9HR63kjj_n-Ju30mvptd89GtK6TYO0yUTQ@mail.gmail.com>
 <20181105124916.da2kqcczcomnxepv@zion.uk.xensource.com>
 <CAO9XypU_sRsxe5J7SAaoVPOK-zCF68-LLd8v-2m+nyyqae3P4A@mail.gmail.com>
 <CAO9XypXCio51Dbt6chxufyH_6M73HfXufQQS751gmNK5R3Uo5A@mail.gmail.com>
 <CAO9XypWzkV_cpCy+WygT5JWt6FujBMm47B_ydNjF-qoX-koKSA@mail.gmail.com>
 <20181106121742.gae3zp2aeqojfmcj@zion.uk.xensource.com>
 <CAO9XypUtBpsCJXoaAWiJQnjjfxQJ=uE1utf67EdkG92QHbtMnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4728029614919780203=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAO9XypUtBpsCJXoaAWiJQnjjfxQJ=uE1utf67EdkG92QHbtMnA@mail.gmail.com>
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

--===============4728029614919780203==
Content-Type: multipart/alternative; boundary="000000000000bc286d057a036cc5"

--000000000000bc286d057a036cc5
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 6, 2018 at 10:41 PM Rishi <2rushikeshj@gmail.com> wrote:

>
>
> On Tue, Nov 6, 2018 at 5:47 PM Wei Liu <wei.liu2@citrix.com> wrote:
>
>> On Tue, Nov 06, 2018 at 03:31:31PM +0530, Rishi wrote:
>> >
>> > So after knowing the stack trace, it appears that the CPU was getting
>> stuck
>> > for xen_hypercall_xen_version
>>
>> That hypercall is used when a PV kernel (re-)enables interrupts. See
>> xen_irq_enable. The purpose is to force the kernel to switch to
>> hypervisor.
>>
>> >
>> > watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:0]
>> >
>> >
>> > [30569.582740] watchdog: BUG: soft lockup - CPU#0 stuck for 23s!
>> > [swapper/0:0]
>> >
>> > [30569.588186] Kernel panic - not syncing: softlockup: hung tasks
>> >
>> > [30569.591307] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G             L
>>   4.19.1
>> > #1
>> >
>> > [30569.595110] Hardware name: Xen HVM domU, BIOS 4.4.1-xs132257
>> 12/12/2016
>> >
>> > [30569.598356] Call Trace:
>> >
>> > [30569.599597]  <IRQ>
>> >
>> > [30569.600920]  dump_stack+0x5a/0x73
>> >
>> > [30569.602998]  panic+0xe8/0x249
>> >
>> > [30569.604806]  watchdog_timer_fn+0x200/0x230
>> >
>> > [30569.607029]  ? softlockup_fn+0x40/0x40
>> >
>> > [30569.609246]  __hrtimer_run_queues+0x133/0x270
>> >
>> > [30569.611712]  hrtimer_interrupt+0xfb/0x260
>> >
>> > [30569.613800]  xen_timer_interrupt+0x1b/0x30
>> >
>> > [30569.616972]  __handle_irq_event_percpu+0x69/0x1a0
>> >
>> > [30569.619831]  handle_irq_event_percpu+0x30/0x70
>> >
>> > [30569.622382]  handle_percpu_irq+0x34/0x50
>> >
>> > [30569.625048]  generic_handle_irq+0x1e/0x30
>> >
>> > [30569.627216]  __evtchn_fifo_handle_events+0x163/0x1a0
>> >
>> > [30569.629955]  __xen_evtchn_do_upcall+0x41/0x70
>> >
>> > [30569.632612]  xen_evtchn_do_upcall+0x27/0x50
>> >
>> > [30569.635136]  xen_do_hypervisor_callback+0x29/0x40
>> >
>> > [30569.638181] RIP: e030:xen_hypercall_xen_version+0xa/0x20
>>
>> What is the asm code for this RIP?
>>
>>
>> Wei.
>>
>
> The issue of crash is getting resolved with appending "noirqbalance" at
> xen command line. This way all dom0 cpus are available but not irq balanced
> at xen.
>
> Even though I'm running irqbalance service in dom0 the irqs seems to be
> not moving. <- this is dom0 perspective, I do not know yet, if it follows
> Xen irq.
>
> I tried objdump, while I have  have the function in out but there is no
> asm code of it. Its just "..."
>
> ffffffff81001220 <xen_hypercall_xen_version>:
>
>         ...
>
>
> ffffffff81001240 <xen_hypercall_console_io>:
>
>         ...
>
> All "hypercalls" appear similarly.
>

How frequent can be that hypercall/xen_irq_enable()? Like n/s or once a
while?
During my tests, the system runs stable unless I'm downloading a large
file. Files around a GB size are getting downloaded without crash, but
system crash comes when its above it. I'm using a 2.1GB file & wget to
download.

Is there a way I can simulate PV kernel (re-)enable of interrupt using a
kernel module with a controlled fashion?

--000000000000bc286d057a036cc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Nov 6, 2018 at 10:41 PM Rishi &lt;<a href=3D"mailto:2rushikeshj@gmail.com=
">2rushikeshj@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Tue, Nov 6, 2018 at 5:47 PM Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix.=
com" target=3D"_blank">wei.liu2@citrix.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Tue, Nov 06, 2018 at 03:31:31PM +0530, Rishi wrot=
e:<br>
&gt; <br>
&gt; So after knowing the stack trace, it appears that the CPU was getting =
stuck<br>
&gt; for xen_hypercall_xen_version<br>
<br>
That hypercall is used when a PV kernel (re-)enables interrupts. See<br>
xen_irq_enable. The purpose is to force the kernel to switch to<br>
hypervisor.<br>
<br>
&gt; <br>
&gt; watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:0]<br>
&gt; <br>
&gt; <br>
&gt; [30569.582740] watchdog: BUG: soft lockup - CPU#0 stuck for 23s!<br>
&gt; [swapper/0:0]<br>
&gt; <br>
&gt; [30569.588186] Kernel panic - not syncing: softlockup: hung tasks<br>
&gt; <br>
&gt; [30569.591307] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0L=C2=A0 =C2=A0 4.19.1<br>
&gt; #1<br>
&gt; <br>
&gt; [30569.595110] Hardware name: Xen HVM domU, BIOS 4.4.1-xs132257 12/12/=
2016<br>
&gt; <br>
&gt; [30569.598356] Call Trace:<br>
&gt; <br>
&gt; [30569.599597]=C2=A0 &lt;IRQ&gt;<br>
&gt; <br>
&gt; [30569.600920]=C2=A0 dump_stack+0x5a/0x73<br>
&gt; <br>
&gt; [30569.602998]=C2=A0 panic+0xe8/0x249<br>
&gt; <br>
&gt; [30569.604806]=C2=A0 watchdog_timer_fn+0x200/0x230<br>
&gt; <br>
&gt; [30569.607029]=C2=A0 ? softlockup_fn+0x40/0x40<br>
&gt; <br>
&gt; [30569.609246]=C2=A0 __hrtimer_run_queues+0x133/0x270<br>
&gt; <br>
&gt; [30569.611712]=C2=A0 hrtimer_interrupt+0xfb/0x260<br>
&gt; <br>
&gt; [30569.613800]=C2=A0 xen_timer_interrupt+0x1b/0x30<br>
&gt; <br>
&gt; [30569.616972]=C2=A0 __handle_irq_event_percpu+0x69/0x1a0<br>
&gt; <br>
&gt; [30569.619831]=C2=A0 handle_irq_event_percpu+0x30/0x70<br>
&gt; <br>
&gt; [30569.622382]=C2=A0 handle_percpu_irq+0x34/0x50<br>
&gt; <br>
&gt; [30569.625048]=C2=A0 generic_handle_irq+0x1e/0x30<br>
&gt; <br>
&gt; [30569.627216]=C2=A0 __evtchn_fifo_handle_events+0x163/0x1a0<br>
&gt; <br>
&gt; [30569.629955]=C2=A0 __xen_evtchn_do_upcall+0x41/0x70<br>
&gt; <br>
&gt; [30569.632612]=C2=A0 xen_evtchn_do_upcall+0x27/0x50<br>
&gt; <br>
&gt; [30569.635136]=C2=A0 xen_do_hypervisor_callback+0x29/0x40<br>
&gt; <br>
&gt; [30569.638181] RIP: e030:xen_hypercall_xen_version+0xa/0x20<br>
<br>
What is the asm code for this RIP?<br>
<br>
<br>
Wei.<br></blockquote><div><br></div><div>The issue of crash is getting reso=
lved with appending &quot;noirqbalance&quot; at xen command line. This way =
all dom0 cpus are available but not irq balanced at xen.<br><br>Even though=
 I&#39;m running irqbalance service in dom0 the irqs seems to be not moving=
. &lt;- this is dom0 perspective, I do not know yet, if it follows Xen irq.=
<br><br>I tried objdump, while I have=C2=A0 have the function in out but th=
ere is no asm code of it. Its just &quot;...&quot;<br><br>





<p class=3D"m_-1081119484632643339gmail-p1" style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-si=
ze:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=
=3D"m_-1081119484632643339gmail-s1" style=3D"font-variant-ligatures:no-comm=
on-ligatures">ffffffff81001220 &lt;</span><span class=3D"m_-108111948463264=
3339gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;backgroun=
d-color:rgb(135,138,4)">xen_hypercall_xen_version</span><span class=3D"m_-1=
081119484632643339gmail-s1" style=3D"font-variant-ligatures:no-common-ligat=
ures">&gt;:</span></p>
<p class=3D"m_-1081119484632643339gmail-p1" style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-si=
ze:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=
=3D"m_-1081119484632643339gmail-s1" style=3D"font-variant-ligatures:no-comm=
on-ligatures"><span class=3D"m_-1081119484632643339gmail-Apple-converted-sp=
ace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>...</span></p>
<p class=3D"m_-1081119484632643339gmail-p2" style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-si=
ze:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0);min-height:13=
px"><span class=3D"m_-1081119484632643339gmail-s1" style=3D"font-variant-li=
gatures:no-common-ligatures"></span><br></p>
<p class=3D"m_-1081119484632643339gmail-p1" style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-si=
ze:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=
=3D"m_-1081119484632643339gmail-s1" style=3D"font-variant-ligatures:no-comm=
on-ligatures">ffffffff81001240 &lt;xen_hypercall_console_io&gt;:</span></p>
<p class=3D"m_-1081119484632643339gmail-p1" style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-si=
ze:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=
=3D"m_-1081119484632643339gmail-s1" style=3D"font-variant-ligatures:no-comm=
on-ligatures"><span class=3D"m_-1081119484632643339gmail-Apple-converted-sp=
ace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>...<br><br>All &quot;hypercalls&quo=
t; appear similarly.</span></p></div></div></div></blockquote><div><br>How =
frequent can be that hypercall/xen_irq_enable()? Like n/s or once a while?<=
br>During my tests, the system runs stable unless I&#39;m downloading a lar=
ge file. Files around a GB size are getting downloaded without crash, but s=
ystem crash comes when its above it. I&#39;m using a 2.1GB file &amp; wget =
to download.<br><br>Is there a way I can simulate PV kernel (re-)enable of =
interrupt using a kernel module with a controlled fashion?=C2=A0</div></div=
></div>

--000000000000bc286d057a036cc5--


--===============4728029614919780203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4728029614919780203==--
