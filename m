From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v1 00/15] arm64: Mediate access to GICv3
 sysregs at EL2
Date: Fri, 23 Mar 2018 06:58:00 +0000
Message-ID: <CAEC2CxohC5AiMYAnoDu+=LLs-+QA-HrgpmE9w-fNH8G6qa9AYw@mail.gmail.com>
References: <cover.1521200294.git.manish.jaggi@cavium.com>
 <c678e388-6d66-a744-d4f6-7cfdc62ff374@arm.com>
 <fa9fcde0-ac40-a950-920e-455815b924c7@caviumnetworks.com>
 <99bcf77a-7603-119b-0711-900f38f8ca55@arm.com>
 <3744eb81-1c57-e87b-d1ff-0d47a70cfa38@caviumnetworks.com>
 <ca515ba7-c53f-62e9-a495-8c330c36c089@arm.com>
 <48b5110b-1a07-a4fb-309c-b0fc4a334e09@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2081160583555120483=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eqpt=gn=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ezGeK-0007Pu-19
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 06:58:04 +0000
Received: by mail-qk0-x229.google.com with SMTP id h14so11886710qkj.11
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 23:58:01 -0700 (PDT)
In-Reply-To: <48b5110b-1a07-a4fb-309c-b0fc4a334e09@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>
Cc: sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com, "Jaggi, Manish" <Manish.Jaggi@cavium.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2081160583555120483==
Content-Type: multipart/alternative; boundary="94eb2c062c4cebc23305680ef118"

--94eb2c062c4cebc23305680ef118
Content-Type: text/plain; charset="UTF-8"

(Sorry for the formatting)

On 23 Mar 2018 14:46, "Manish Jaggi" <mjaggi@caviumnetworks.com> wrote:



On 03/21/2018 03:26 PM, Julien Grall wrote:

> Hi Manish,
>
> On 03/21/2018 09:38 AM, Manish Jaggi wrote:
>
>>
>>
>> On 03/21/2018 02:15 PM, Julien Grall wrote:
>>
>>>
>>>
>>> On 03/21/2018 04:58 AM, Manish Jaggi wrote:
>>>
>>>>
>>>> Hi Julien,
>>>>
>>>> On 03/20/2018 01:16 PM, Julien Grall wrote:
>>>>
>>>>>
>>>>>
>>>>> On 03/16/2018 11:58 AM, Manish Jaggi wrote:
>>>>>
>>>>>> This patchset is a Xen port of Marc's patchset.
>>>>>> arm64: KVM: Mediate access to GICv3 sysregs at EL2 [1]
>>>>>>
>>>>>> The current RFC patchset is a subset of [1], as it handleing only
>>>>>> Group1 traps
>>>>>> as a PoC. Most of the trap code is added in vsysreg.c. Trap handler
>>>>>> function is kept
>>>>>> independent of the usual guest trap handling code.
>>>>>> Looking for feedback on this approach.
>>>>>>
>>>>>
>>>>> This cover letter does not seem to match the series. Please update it
>>>>> on every time you send a series.
>>>>>
>>>> %s/vsysreg.c/vgic-v3-sr..
>>>>
>>>> Could you please review the other patches in the series, so that I can
>>>> send v2.
>>>>
>>>
>>> Here the major comments for the series (included patch not reviewed):
>>>     1) You seem to miss some patches from Linux. I would like to
>>> understand why they are not there.
>>>
>> if code is ported to xen, it is perfectly fine to take only relevant
>> patches.
>>
>
> It is usually expected from the contributor to have some sort of
> explanation in the cover letter. In particular when you are based on a
> series from Linux.
>
> Where I am more worried is there are patch on top in Linux, that you
> didn't backport. So it would be really nice to understand why those patches
> are not in Xen.
>
> A non-exhaustive list:
>     - KVM: arm64: Log an error if trapping a write-to-read-only GICv3
> access
>         - KVM: arm64: Log an error if trapping a read-from-write-only
> GICv3 access
>
>
> For instance we are not providing any command line option to individually
>> enable group1 grou0 traps.
>>
>
> I think the command line option could be useful for testing. Developer
> don't necessarily have a Thunder-X in hand.
>
>     2) Strangely some commits does not match the Linux one either in order
>>> and content (I am not speaking about the changes required by Xen). For
>>> instance this is the case of patch #14 "arm64: vgic-v3: Add
>>> ICV_AP(0/1)Rn_EL1 handler". If you port commit from Linux, then you should
>>> follow the same. This help a lot for review.
>>>
>> Since we are not doing individually enable of group0/1, it doesnt make
>> sense to have two set of patches for ICV_AP0 / ICV_AP1. So I merged it.
>>
>
> Sorry, but it does not make sense. Looking at the series you pointed. I
> don't see a patch just for ICV_AP0. Instead it is part of " KVM: arm64:
> vgic-v3: Enable trapping of Group-0 system registers". You ported that
> patch in Xen.
>
> If you see this patch, you will find this one specifically for ICV_AP1
https://lists.cs.columbia.edu/pipermail/kvmarm/2017-June/026040.html


You didn't get my point...  You still don't explain why you move the
ICV_AP0 from "Enable trapping of Group-0 system registers"  to that patch.
If you take commit from Linux then don't move code between commit around
unless there is a good reason.

Please try to make the review a bit easier...

Cheers,

--94eb2c062c4cebc23305680ef118
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>(Sorry for the formatting)<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 23 Mar 2018 14:46, &quot;Manish Jagg=
i&quot; &lt;<a href=3D"mailto:mjaggi@caviumnetworks.com" target=3D"_blank">=
mjaggi@caviumnetworks.com</a>&gt; wrote:<br type=3D"attribution"><blockquot=
e class=3D"m_-8161047757412401661quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"m_-8161047757412401661el=
ided-text"><br>
<br>
On 03/21/2018 03:26 PM, Julien Grall wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Manish,<br>
<br>
On 03/21/2018 09:38 AM, Manish Jaggi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On 03/21/2018 02:15 PM, Julien Grall wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On 03/21/2018 04:58 AM, Manish Jaggi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Hi Julien,<br>
<br>
On 03/20/2018 01:16 PM, Julien Grall wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On 03/16/2018 11:58 AM, Manish Jaggi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This patchset is a Xen port of Marc&#39;s patchset.<br>
arm64: KVM: Mediate access to GICv3 sysregs at EL2 [1]<br>
<br>
The current RFC patchset is a subset of [1], as it handleing only Group1 tr=
aps<br>
as a PoC. Most of the trap code is added in vsysreg.c. Trap handler functio=
n is kept<br>
independent of the usual guest trap handling code.<br>
Looking for feedback on this approach.<br>
</blockquote>
<br>
This cover letter does not seem to match the series. Please update it on ev=
ery time you send a series.<br>
</blockquote>
%s/vsysreg.c/vgic-v3-sr..<br>
<br>
Could you please review the other patches in the series, so that I can send=
 v2.<br>
</blockquote>
<br>
Here the major comments for the series (included patch not reviewed):<br>
=C2=A0=C2=A0=C2=A0=C2=A01) You seem to miss some patches from Linux. I woul=
d like to understand why they are not there.<br>
</blockquote>
if code is ported to xen, it is perfectly fine to take only relevant patche=
s.<br>
</blockquote>
<br>
It is usually expected from the contributor to have some sort of explanatio=
n in the cover letter. In particular when you are based on a series from Li=
nux.<br>
<br>
Where I am more worried is there are patch on top in Linux, that you didn&#=
39;t backport. So it would be really nice to understand why those patches a=
re not in Xen.<br>
<br>
A non-exhaustive list:<br>
=C2=A0=C2=A0=C2=A0=C2=A0- KVM: arm64: Log an error if trapping a write-to-r=
ead-only GICv3 access<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - KVM: arm64: Log an error if tr=
apping a read-from-write-only GICv3 access<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
For instance we are not providing any command line option to individually e=
nable group1 grou0 traps.<br>
</blockquote>
<br>
I think the command line option could be useful for testing. Developer don&=
#39;t necessarily have a Thunder-X in hand.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0=C2=A0=C2=A0=C2=A02) Strangely some commits does not match the Linux =
one either in order and content (I am not speaking about the changes requir=
ed by Xen). For instance this is the case of patch #14 &quot;arm64: vgic-v3=
: Add ICV_AP(0/1)Rn_EL1 handler&quot;. If you port commit from Linux, then =
you should follow the same. This help a lot for review.<br>
</blockquote>
Since we are not doing individually enable of group0/1, it doesnt make sens=
e to have two set of patches for ICV_AP0 / ICV_AP1. So I merged it.<br>
</blockquote>
<br>
Sorry, but it does not make sense. Looking at the series you pointed. I don=
&#39;t see a patch just for ICV_AP0. Instead it is part of &quot; KVM: arm6=
4: vgic-v3: Enable trapping of Group-0 system registers&quot;. You ported t=
hat patch in Xen.<br>
<br>
</blockquote></div>
If you see this patch, you will find this one specifically for ICV_AP1<br>
<a href=3D"https://lists.cs.columbia.edu/pipermail/kvmarm/2017-June/026040.=
html" rel=3D"noreferrer" target=3D"_blank">https://lists.cs.columbia.edu/<w=
br>pipermail/kvmarm/2017-June/026<wbr>040.html</a></blockquote></div></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">You didn&#39;t get my p=
oint...=C2=A0 You still don&#39;t explain why you move the ICV_AP0 from &qu=
ot;Enable trapping of Group-0 system registers&quot;=C2=A0 to that patch. I=
f you take commit from Linux then don&#39;t move code between commit around=
 unless there is a good reason.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Please try to make the review a bit easier...</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div></=
div>

--94eb2c062c4cebc23305680ef118--


--===============2081160583555120483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2081160583555120483==--
