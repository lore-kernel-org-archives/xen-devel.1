From: "Bitweasil ." <bitweasil@cryptohaze.com>
Subject: Re: Xen Introspection, KPTI,
 and CR3 bit 63 leads to guest VMENTRY failures during introspection
Date: Fri, 26 Jan 2018 16:17:20 +0000
Message-ID: <CALn24pC=62oFKNOasbu7n-qMj4B6r5EoBYAHG1Tg-Y+WWyEDwg@mail.gmail.com>
References: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
 <0052b33d-f0fe-ee91-892d-a63c8001c567@bitdefender.com>
 <CALn24pBf1UGbrqsSD_=abdM1U7X+vMuPd0q4KgYYH_tmd7mkAw@mail.gmail.com>
 <cf9bfa43-6ca5-e260-c509-040b927390fa@bitdefender.com>
 <CALn24pDDFmh9+SkE-gyyK2xzhemX7=JBYzt2SQjFGnp4gy-yyQ@mail.gmail.com>
 <a188f71a-7e0b-47b4-3e07-dee9e87aea83@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8736297296700859446=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a188f71a-7e0b-47b4-3e07-dee9e87aea83@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: andrew.cooper3@citrix.com, tamas@tklengyel.com, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============8736297296700859446==
Content-Type: multipart/alternative; boundary="001a114cb0d2b1ca970563b03b9a"

--001a114cb0d2b1ca970563b03b9a
Content-Type: text/plain; charset="UTF-8"

Razvan -

The proposed changes would only have an impact if CR3 exiting is enabled,
which implies a pair of world switches and other code execution in a
different region of memory and with different page tables anyway.

Under normal operation, CR3 exiting is not turned on, so this will have no
impact on operation.

Are there any non-introspection cases in which CR3 exiting will be enabled
for hardware virtualized guests?  Given the time cost of a pair of world
switches and handling the associated code, I question if one could even
measure the difference of the TLB flush or not.  The CR3 reporting
performance hit under KPTI is quite catastrophic anyway, though I expect
one could mitigate that somewhat with CR3-targets, if one wanted to.

On Fri, Jan 26, 2018 at 12:39 AM Razvan Cojocaru <rcojocaru@bitdefender.com>
wrote:

> On 01/26/2018 02:02 AM, Bitweasil . wrote:
> > This also impacts the "on change only" control setting code.
> >
> > From some debugging code: hvm_event_cr, value: 800000001aad0000, old:
> > 1aad0000
> >
> > This should not count as a changed CR3 value for reporting purposes.
> >
> > The following patch resolves this reasonably, for a sane value of
> > "change only" reporting.  Apologies for the old Xen version, but I
> > assume this is still an issue if the other issue was not resolved in
> > staging.
> >
> >
> >
> > --- xenserver-4.7.1-clean/xen/arch/x86/hvm/event.c    2017-05-10
> > 11:29:14.135332964 -0600
> > +++ xenserver-4.7.1/xen/arch/x86/hvm/event.c    2018-01-25
> > 16:52:05.938251000 -0700
> > @@ -33,6 +33,11 @@
> >      struct arch_domain *ad = &curr->domain->arch;
> >      unsigned int ctrlreg_bitmask = monitor_ctrlreg_bitmask(index);
> >
> > +
> > +    // Patch in work from Razvan
> > +    if ( hvm_pcid_enabled(curr) )
> > +        value &= ((1ull << 63) - 1);
> > +
> >      if ( (ad->monitor.write_ctrlreg_enabled & ctrlreg_bitmask) &&
> >           (!(ad->monitor.write_ctrlreg_onchangeonly & ctrlreg_bitmask) ||
> >            value != old) )
>
> Thanks, that's right. But I keep thinking that the proposed changes
> would now incur the flush even on non-introspection paths (which for
> some reason seem to work fine with the noflush bit set).
>
> So I think this patch will affect all CR3 writes, since the only
> difference between introspection and no introspection is that
> hvm_set_cr3() is called with may_defer == true in the first case, and
> false in the second, and both cases eventually end up clearing noflush.
>
> I this acceptable to everyone, or do we make this smarter?
>
>
> Thanks,
> Razvan
>

--001a114cb0d2b1ca970563b03b9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Razvan -<div><br></div><div>The proposed changes would onl=
y have an impact if CR3 exiting is enabled, which implies a pair of world s=
witches and other code execution in a different region of memory and with d=
ifferent page tables anyway.<br><br>Under normal operation, CR3 exiting is =
not turned on, so this will have no impact on operation.</div><div><br></di=
v><div>Are there any non-introspection cases in which CR3 exiting will be e=
nabled for hardware virtualized guests?=C2=A0 Given the time cost of a pair=
 of world switches and handling the associated code, I question if one coul=
d even measure the difference of the TLB flush or not.=C2=A0 The CR3 report=
ing performance hit under KPTI is quite catastrophic anyway, though I expec=
t one could mitigate that somewhat with CR3-targets, if one wanted to.</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jan 26, 2018=
 at 12:39 AM Razvan Cojocaru &lt;<a href=3D"mailto:rcojocaru@bitdefender.co=
m">rcojocaru@bitdefender.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On 01/26/2018 02:02 AM, Bitweasil . wrote:<br>
&gt; This also impacts the &quot;on change only&quot; control setting code.=
<br>
&gt;<br>
&gt; From some debugging code: hvm_event_cr, value: 800000001aad0000, old:<=
br>
&gt; 1aad0000<br>
&gt;<br>
&gt; This should not count as a changed CR3 value for reporting purposes.<b=
r>
&gt;<br>
&gt; The following patch resolves this reasonably, for a sane value of<br>
&gt; &quot;change only&quot; reporting.=C2=A0 Apologies for the old Xen ver=
sion, but I<br>
&gt; assume this is still an issue if the other issue was not resolved in<b=
r>
&gt; staging.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --- xenserver-4.7.1-clean/xen/arch/x86/hvm/event.c=C2=A0=C2=A0=C2=A0 2=
017-05-10<br>
&gt; 11:29:14.135332964 -0600<br>
&gt; +++ xenserver-4.7.1/xen/arch/x86/hvm/event.c=C2=A0=C2=A0=C2=A0 2018-01=
-25<br>
&gt; 16:52:05.938251000 -0700<br>
&gt; @@ -33,6 +33,11 @@<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 struct arch_domain *ad =3D &amp;curr-&gt;doma=
in-&gt;arch;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int ctrlreg_bitmask =3D monitor_ctrl=
reg_bitmask(index);<br>
&gt; =C2=A0<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 // Patch in work from Razvan<br>
&gt; +=C2=A0=C2=A0=C2=A0 if ( hvm_pcid_enabled(curr) )<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &amp;=3D ((1ull &lt;=
&lt; 63) - 1);<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 if ( (ad-&gt;monitor.write_ctrlreg_enabled &a=
mp; ctrlreg_bitmask) &amp;&amp;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!(ad-&gt;monit=
or.write_ctrlreg_onchangeonly &amp; ctrlreg_bitmask) ||<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value !=
=3D old) )<br>
<br>
Thanks, that&#39;s right. But I keep thinking that the proposed changes<br>
would now incur the flush even on non-introspection paths (which for<br>
some reason seem to work fine with the noflush bit set).<br>
<br>
So I think this patch will affect all CR3 writes, since the only<br>
difference between introspection and no introspection is that<br>
hvm_set_cr3() is called with may_defer =3D=3D true in the first case, and<b=
r>
false in the second, and both cases eventually end up clearing noflush.<br>
<br>
I this acceptable to everyone, or do we make this smarter?<br>
<br>
<br>
Thanks,<br>
Razvan<br>
</blockquote></div>

--001a114cb0d2b1ca970563b03b9a--


--===============8736297296700859446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8736297296700859446==--
