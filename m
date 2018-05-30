From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH v4 01/10] xen/arm64: Added handling of the
 trapped access to OSLSR register
Date: Wed, 30 May 2018 11:53:11 +0200
Message-ID: <CAKPH-NgEnbpQFjvrKzayt8RzHYvbF2zykoHf+S9U+9NKKpoCUw@mail.gmail.com>
References: <20180515114419.7296-1-mirela.simonovic@aggios.com>
 <20180515114419.7296-2-mirela.simonovic@aggios.com>
 <4d7e72a3-5b40-f073-4aa4-d8143f1ba71c@arm.com>
 <CAKPH-NhSXE8=hAqROOC84J2WKBDYjmUQqziLNWkEbvoZyKZGYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6713787760164805338=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NhSXE8=hAqROOC84J2WKBDYjmUQqziLNWkEbvoZyKZGYg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============6713787760164805338==
Content-Type: multipart/alternative; boundary="000000000000a76871056d69516e"

--000000000000a76871056d69516e
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 11:48 AM, Mirela Simonovic <
mirela.simonovic@aggios.com> wrote:

> Hi Julien,
>
> Thanks for the feedback.
>
> On Tue, May 29, 2018 at 3:19 PM, Julien Grall <julien.grall@arm.com>
> wrote:
>
>> Hi,
>>
>>
>> On 15/05/18 12:44, Mirela Simonovic wrote:
>>
>>> Linux/dom0 accesses OSLSR register when saving CPU context during the
>>> suspend procedure. Xen traps access to this register, but has no handling
>>> for it. Consequently, Xen injects undef exception to linux, causing it to
>>> crash. This patch adds handling of the trapped access to OSLSR as ro/raz.
>>>
>>> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Acked-by: Julien Grall <julien.grall@arm.com>
>>>
>>> ---
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien.grall@arm.com>
>>> ---
>>> Changes in v2:
>>> - Commit message fix (arm64 related change instead of arm)
>>> - Add Stefano's reviewed-by
>>>
>>> Changes in v3:
>>> - Added Julien's acked-by
>>> ---
>>>   xen/arch/arm/arm64/vsysreg.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>>> index c57ac12503..8f80e1735e 100644
>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>> @@ -57,13 +57,14 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>        * ARMv8 (DDI 0487A.d): D1-1509 Table D1-58
>>>        *
>>>        * Unhandled:
>>> -     *    OSLSR_EL1
>>>        *    DBGPRCR_EL1
>>>        */
>>>       case HSR_SYSREG_OSLAR_EL1:
>>>           return handle_wo_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>       case HSR_SYSREG_OSDLR_EL1:
>>>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>> +    case HSR_SYSREG_OSLSR_EL1:
>>> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>
>>
>> Looking at this patch again, OSLM (bit[3] and bit[1]) should be 10 as all
>> other values are reserved. So you want to set bit 3 when the guest read it.
>>
>>
> Could you please let me know is my proposal/understanding correct? Instead
> of handle_ro_raz, I assume we need this:
>
>         if ( psr_mode_is_user(regs) )
>             return inject_undef_exception(regs, hsr);
>         if ( hsr.sysreg.read )
>             set_user_reg(regs, regidx, 0x8);
>         break;
>
>

Please note - I'm not sure how should write to this register be treated. In
the original patch (handle_ro_raz implementation) undef exception will be
raised. I realized in what I proposed that wouldn't be the case, it's a
write-ignore.


> Thanks,
> Mirela
>
> Cheers,
>>
>> --
>> Julien Grall
>>
>
>

--000000000000a76871056d69516e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 30, 2018 at 11:48 AM, Mirela Simonovic <span dir=3D"ltr">&l=
t;<a href=3D"mailto:mirela.simonovic@aggios.com" target=3D"_blank">mirela.s=
imonovic@aggios.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr">Hi Julien,<div><br></div><div>Thanks for the feedback.</d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div clas=
s=3D"h5">On Tue, May 29, 2018 at 3:19 PM, Julien Grall <span dir=3D"ltr">&l=
t;<a href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@ar=
m.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi,<div><div class=3D"m_4232402387095898538gmail-h5"><br>
<br>
On 15/05/18 12:44, Mirela Simonovic wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Linux/dom0 accesses OSLSR register when saving CPU context during the<br>
suspend procedure. Xen traps access to this register, but has no handling<b=
r>
for it. Consequently, Xen injects undef exception to linux, causing it to<b=
r>
crash. This patch adds handling of the trapped access to OSLSR as ro/raz.<b=
r>
<br>
Signed-off-by: Mirela Simonovic &lt;<a href=3D"mailto:mirela.simonovic@aggi=
os.com" target=3D"_blank">mirela.simonovic@aggios.com</a>&gt;<br>
Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
Acked-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" target=
=3D"_blank">julien.grall@arm.com</a>&gt;<br>
<br>
---<br>
CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
CC: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" target=3D"_bla=
nk">julien.grall@arm.com</a>&gt;<br>
---<br>
Changes in v2:<br>
- Commit message fix (arm64 related change instead of arm)<br>
- Add Stefano&#39;s reviewed-by<br>
<br>
Changes in v3:<br>
- Added Julien&#39;s acked-by<br>
---<br>
=C2=A0 xen/arch/arm/arm64/vsysreg.c | 3 ++-<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c<br=
>
index c57ac12503..8f80e1735e 100644<br>
--- a/xen/arch/arm/arm64/vsysreg.c<br>
+++ b/xen/arch/arm/arm64/vsysreg.c<br>
@@ -57,13 +57,14 @@ void do_sysreg(struct cpu_user_regs *regs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* ARMv8 (DDI 0487A.d): D1-1509 Table D1-58<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Unhandled:<br>
-=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 OSLSR_EL1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 DBGPRCR_EL1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 case HSR_SYSREG_OSLAR_EL1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return handle_wo_wi(regs, regidx, hsr.sy=
sreg.read, hsr, 1);<br>
=C2=A0 =C2=A0 =C2=A0 case HSR_SYSREG_OSDLR_EL1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return handle_raz_wi(regs, regidx, hsr.s=
ysreg.read, hsr, 1);<br>
+=C2=A0 =C2=A0 case HSR_SYSREG_OSLSR_EL1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return handle_ro_raz(regs, regidx, hsr.sysreg.=
read, hsr, 1);<br>
</blockquote>
<br></div></div>
Looking at this patch again, OSLM (bit[3] and bit[1]) should be 10 as all o=
ther values are reserved. So you want to set bit 3 when the guest read it.<=
br>
<br></blockquote><div><br></div></div></div><div>Could you please let me kn=
ow is my proposal/understanding correct? Instead of=C2=A0<span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">handle_ro_raz, I assume we need this:</span></div><div><br></div><d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( psr_mode_is_user(regs) )</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return inject_undef_exception(re=
gs, hsr);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( hsr.sysreg.read )</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_user_reg(regs, regidx, =
0x8);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;</div></div><div>=C2=A0</=
div></div></div></div></blockquote><div><br></div><div>Please note - I&#39;=
m not sure how should write to this register be treated. In the original pa=
tch (<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">handle_ro_raz implementation</span>) undef e=
xception will be raised. I realized in what I proposed that wouldn&#39;t be=
 the case, it&#39;s a write-ignore.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><div>Thanks,</div><div>Mirela</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Cheers,<span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m_4232=
402387095898538gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></font></span></blockquote></div><br></div></div>
</blockquote></div><br></div></div>

--000000000000a76871056d69516e--


--===============6713787760164805338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6713787760164805338==--
