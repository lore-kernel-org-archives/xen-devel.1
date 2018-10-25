From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Thu, 25 Oct 2018 14:11:54 +0000
Message-ID: <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1328300745440899058=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============1328300745440899058==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_77f72cc96548afd9376623326b3551d9epamcom_"

--_000_77f72cc96548afd9376623326b3551d9epamcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello  Julien,


On 24.10.18 17:41, Julien Grall wrote:
> vGIC is not only about GICv2. It also covers GICv3 that is accessible
> via system registers.
Yes, I know. But, as you state below, for GICv2 based systems those
barriers are not needed.

>>>    rely on a context synchronising
>>> operation on the CPU to ensure that the updated status register is
>>> visible to the CPU when handling the interrupt. This usually happens as
>>> a result of taking the IRQ exception in the first place, but there are
>>> two race scenarios where this isn't the case.
>>>
>>> For example, let's say we have two peripherals (X and Y), where Y
>>> uses a
>>> system register for its interrupt status.
>>>
>>> Case 1:
>>> 1. CPU takes an IRQ exception as a result of X raising an interrupt
>>> 2. Y then raises its interrupt line, but the update to its system
>>>      register is not yet visible to the CPU
>>> 3. The GIC decides to expose Y's interrupt number first in the Ack
>>>      register
>>> 4. The CPU runs the IRQ handler for Y, but the status register is stale
>> But this scenario somehow explains a strange thing I saw during IRQ
>> latency investigation (optimization attempts) during last weeks.
>> The strange sequence is as following:
>>       1. CPU takes an IRQ exception from the guest context
>>       2. In `enter_hypervisor_head()` function (i.e. in
>> `gic_clear_lrs()`
>> as for mainline) from some LR registers interrupt statuses are read as
>> PENDING
>>       3. Performing further code, without returning to the guest (i.e.
>> inside vgic_vcpu_inject_irq()), it happens that we read status INVALID
>> from the LR we read PENDING before, in step 2. >
>> Please note that we are tailoring xen based on RELEASE-4.10.0.
>
> As you tailor Xen, I need more details on your modification to be able
> to provide feedback on the oddness you encounter.
I guess I should make a dedicated patch applicable to mainline to reveal
the issue. I hope I'll do this nearest days.

> But you are using GICv2, right? If so, you are not using system
> registers for the vGIC. This is not covered by this patch.
Yep, our SoC has GICv2.

>>> Case 2:
>>> 1. CPU takes an IRQ exception as a result of X raising an interrupt
>>> 2. CPU reads the interrupt number for X from the Ack register and runs
>>>      its IRQ handler
>>> 3. Y raises its interrupt line and the Ack register is updated, but
>>>      again, the update to its system register is not yet visible to the
>>>      CPU.
>>> 4. Since the GIC drivers poll the Ack register, we read Y's interrupt
>>>      number and run its handler without a context synchronisation
>>>      operation, therefore seeing the stale register value.
>>>
>>> In either case, we run the risk of missing an IRQ. This patch solves
>>> the
>>> problem by ensuring that we execute an ISB in the GIC drivers prior
>>> to invoking the interrupt handler.
>>>
>>> Based on Linux commit 39a06b67c2c1256bcf2361a1f67d2529f70ab206
>>> "irqchip/gic: Ensure we have an ISB between ack and ->handle_irq".
>>>
>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>>
>>> ---
>>>       This patch is a candidate for backporting up to Xen 4.9.
>>> ---
>>>    xen/arch/arm/gic.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index 8d7e491060..305fbd66dd 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -388,12 +388,14 @@ void gic_interrupt(struct cpu_user_regs *regs,
>>> int is_fiq)
>>>            if ( likely(irq >=3D 16 && irq < 1020) )
>>>            {
>>>                local_irq_enable();
>>> +            isb();
>> Taking in account that the first GICH accesses are from
>> `gic_clear_lrs()`, called from `enter_hypervisor_head`, I would suggest
>> moving isb() there.
Any comments here?

>>
>>>                do_IRQ(regs, irq, is_fiq);
>>>                local_irq_disable();
>>>            }
>>>            else if ( is_lpi(irq) )
>>>            {
>>>                local_irq_enable();
>>> +            isb();
>>>                gic_hw_ops->do_LPI(irq);
>>>                local_irq_disable();
>>>            }
>>
>
> Cheers,
>

--

*Andrii Anisov*



--_000_77f72cc96548afd9376623326b3551d9epamcom_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <521448F273908144AFD353BDA85E5416@EPAM.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">Hello&nbsp; Julien,<br>
<br>
<br>
On 24.10.18 17:41, Julien Grall wrote:<br>
&gt; vGIC is not only about GICv2. It also covers GICv3 that is accessible =
<br>
&gt; via system registers.<br>
Yes, I know. But, as you state below, for GICv2 based systems those <br>
barriers are not needed.<br>
<br>
&gt;&gt;&gt; &nbsp;&nbsp; rely on a context synchronising<br>
&gt;&gt;&gt; operation on the CPU to ensure that the updated status registe=
r is<br>
&gt;&gt;&gt; visible to the CPU when handling the interrupt. This usually h=
appens as<br>
&gt;&gt;&gt; a result of taking the IRQ exception in the first place, but t=
here are<br>
&gt;&gt;&gt; two race scenarios where this isn't the case.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For example, let's say we have two peripherals (X and Y), wher=
e Y <br>
&gt;&gt;&gt; uses a<br>
&gt;&gt;&gt; system register for its interrupt status.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Case 1:<br>
&gt;&gt;&gt; 1. CPU takes an IRQ exception as a result of X raising an inte=
rrupt<br>
&gt;&gt;&gt; 2. Y then raises its interrupt line, but the update to its sys=
tem<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; register is not yet visible to the CP=
U<br>
&gt;&gt;&gt; 3. The GIC decides to expose Y's interrupt number first in the=
 Ack<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; register<br>
&gt;&gt;&gt; 4. The CPU runs the IRQ handler for Y, but the status register=
 is stale<br>
&gt;&gt; But this scenario somehow explains a strange thing I saw during IR=
Q<br>
&gt;&gt; latency investigation (optimization attempts) during last weeks.<b=
r>
&gt;&gt; The strange sequence is as following:<br>
&gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp; 1. CPU takes an IRQ exception from the g=
uest context<br>
&gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp; 2. In `enter_hypervisor_head()` function=
 (i.e. in <br>
&gt;&gt; `gic_clear_lrs()`<br>
&gt;&gt; as for mainline) from some LR registers interrupt statuses are rea=
d as<br>
&gt;&gt; PENDING<br>
&gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp; 3. Performing further code, without retu=
rning to the guest (i.e.<br>
&gt;&gt; inside vgic_vcpu_inject_irq()), it happens that we read status INV=
ALID<br>
&gt;&gt; from the LR we read PENDING before, in step 2. &gt;<br>
&gt;&gt; Please note that we are tailoring xen based on RELEASE-4.10.0.<br>
&gt;<br>
&gt; As you tailor Xen, I need more details on your modification to be able=
 <br>
&gt; to provide feedback on the oddness you encounter.<br>
I guess I should make a dedicated patch applicable to mainline to reveal <b=
r>
the issue. I hope I'll do this nearest days.<br>
<br>
&gt; But you are using GICv2, right? If so, you are not using system <br>
&gt; registers for the vGIC. This is not covered by this patch.<br>
Yep, our SoC has GICv2.<br>
<br>
&gt;&gt;&gt; Case 2:<br>
&gt;&gt;&gt; 1. CPU takes an IRQ exception as a result of X raising an inte=
rrupt<br>
&gt;&gt;&gt; 2. CPU reads the interrupt number for X from the Ack register =
and runs<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; its IRQ handler<br>
&gt;&gt;&gt; 3. Y raises its interrupt line and the Ack register is updated=
, but<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; again, the update to its system regis=
ter is not yet visible to the<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; CPU.<br>
&gt;&gt;&gt; 4. Since the GIC drivers poll the Ack register, we read Y's in=
terrupt<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; number and run its handler without a =
context synchronisation<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; operation, therefore seeing the stale=
 register value.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In either case, we run the risk of missing an IRQ. This patch =
solves <br>
&gt;&gt;&gt; the<br>
&gt;&gt;&gt; problem by ensuring that we execute an ISB in the GIC drivers =
prior<br>
&gt;&gt;&gt; to invoking the interrupt handler.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Based on Linux commit 39a06b67c2c1256bcf2361a1f67d2529f70ab206=
<br>
&gt;&gt;&gt; &quot;irqchip/gic: Ensure we have an ISB between ack and -&gt;=
handle_irq&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Julien Grall &lt;julien.grall@arm.com&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This patch is a candidate for b=
ackporting up to Xen 4.9.<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; &nbsp;&nbsp; xen/arch/arm/gic.c | 2 &#43;&#43;<br>
&gt;&gt;&gt; &nbsp;&nbsp; 1 file changed, 2 insertions(&#43;)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c<br>
&gt;&gt;&gt; index 8d7e491060..305fbd66dd 100644<br>
&gt;&gt;&gt; --- a/xen/arch/arm/gic.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/xen/arch/arm/gic.c<br>
&gt;&gt;&gt; @@ -388,12 &#43;388,14 @@ void gic_interrupt(struct cpu_user_r=
egs *regs, <br>
&gt;&gt;&gt; int is_fiq)<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f ( likely(irq &gt;=3D 16 &amp;&amp; irq &lt; 1020) )<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; local_irq_enable();<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; isb();<br>
&gt;&gt; Taking in account that the first GICH accesses are from<br>
&gt;&gt; `gic_clear_lrs()`, called from `enter_hypervisor_head`, I would su=
ggest<br>
&gt;&gt; moving isb() there.<br>
Any comments here?<br>
<br>
&gt;&gt;<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; do_IRQ(regs, irq, is_fiq);<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; local_irq_disable();<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
lse if ( is_lpi(irq) )<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; local_irq_enable();<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; isb();<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; gic_hw_ops-&gt;do_LPI(irq);<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; local_irq_disable();<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
&gt;&gt;<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
<br>
-- <br>
<br>
*Andrii Anisov*<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_77f72cc96548afd9376623326b3551d9epamcom_--


--===============1328300745440899058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1328300745440899058==--
