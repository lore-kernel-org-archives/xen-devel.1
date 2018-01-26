From: "Bitweasil ." <bitweasil@cryptohaze.com>
Subject: Re: Xen Introspection, KPTI,
 and CR3 bit 63 leads to guest VMENTRY failures during introspection
Date: Thu, 25 Jan 2018 17:02:02 -0700
Message-ID: <CALn24pDDFmh9+SkE-gyyK2xzhemX7=JBYzt2SQjFGnp4gy-yyQ@mail.gmail.com>
References: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
 <0052b33d-f0fe-ee91-892d-a63c8001c567@bitdefender.com>
 <CALn24pBf1UGbrqsSD_=abdM1U7X+vMuPd0q4KgYYH_tmd7mkAw@mail.gmail.com>
 <cf9bfa43-6ca5-e260-c509-040b927390fa@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9153929156494084728=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cf9bfa43-6ca5-e260-c509-040b927390fa@bitdefender.com>
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

--===============9153929156494084728==
Content-Type: multipart/alternative; boundary="f403045f8b303339fb0563a29bb8"

--f403045f8b303339fb0563a29bb8
Content-Type: text/plain; charset="UTF-8"

This also impacts the "on change only" control setting code.

>From some debugging code: hvm_event_cr, value: 800000001aad0000, old:
1aad0000

This should not count as a changed CR3 value for reporting purposes.

The following patch resolves this reasonably, for a sane value of "change
only" reporting.  Apologies for the old Xen version, but I assume this is
still an issue if the other issue was not resolved in staging.



--- xenserver-4.7.1-clean/xen/arch/x86/hvm/event.c    2017-05-10
11:29:14.135332964 -0600
+++ xenserver-4.7.1/xen/arch/x86/hvm/event.c    2018-01-25
16:52:05.938251000 -0700
@@ -33,6 +33,11 @@
     struct arch_domain *ad = &curr->domain->arch;
     unsigned int ctrlreg_bitmask = monitor_ctrlreg_bitmask(index);

+
+    // Patch in work from Razvan
+    if ( hvm_pcid_enabled(curr) )
+        value &= ((1ull << 63) - 1);
+
     if ( (ad->monitor.write_ctrlreg_enabled & ctrlreg_bitmask) &&
          (!(ad->monitor.write_ctrlreg_onchangeonly & ctrlreg_bitmask) ||
           value != old) )


On Thu, Jan 25, 2018 at 4:03 PM, Razvan Cojocaru <rcojocaru@bitdefender.com>
wrote:

> On 01/26/2018 12:17 AM, Bitweasil . wrote:
> > Razvan -
> >
> > Yes, that patch resolves the issues.  Performance is abysmal (as
> > expected with a CR3 switch on every syscall), but things behave
> properly.>
> > Jan -
> >
> > It turns out that unrelated code in my livepatch was causing the
> > crashing when I filtered the high bit - I was not properly gating some
> > other CR3 processing code in the livepatch, and that was causing the
> > invalid opcode errors, not the filtered CR3 value.  You are correct that
> > masking the bit should not cause any correctness issues, only
> > performance issues.
> >
> > Will one of you take up submitting this patch into the proper places?
> > I'm afraid I'm not very familiar with the Xen patch submission process.
>
> Yes, I'll send a proper patch.
>
>
> Thanks for pointing the issue out,
> Razvan
>

--f403045f8b303339fb0563a29bb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>This also impacts the &quot;on change only&quot;=
 control setting code.<br><br>From some debugging code: hvm_event_cr, value=
: 800000001aad0000, old: 1aad0000<br><br></div>This should not count as a c=
hanged CR3 value for reporting purposes.<br><br></div>The following patch r=
esolves this reasonably, for a sane value of &quot;change only&quot; report=
ing.=C2=A0 Apologies for the old Xen version, but I assume this is still an=
 issue if the other issue was not resolved in staging.<br><div><br></div><d=
iv><br></div><div><br>--- xenserver-4.7.1-clean/xen/arch/x86/hvm/event.c=C2=
=A0=C2=A0=C2=A0 2017-05-10 11:29:14.135332964 -0600<br>+++ xenserver-4.7.1/=
xen/arch/x86/hvm/event.c=C2=A0=C2=A0=C2=A0 2018-01-25 16:52:05.938251000 -0=
700<br>@@ -33,6 +33,11 @@<br>=C2=A0=C2=A0=C2=A0=C2=A0 struct arch_domain *a=
d =3D &amp;curr-&gt;domain-&gt;arch;<br>=C2=A0=C2=A0=C2=A0=C2=A0 unsigned i=
nt ctrlreg_bitmask =3D monitor_ctrlreg_bitmask(index);<br>=C2=A0<br>+<br>+=
=C2=A0=C2=A0=C2=A0 // Patch in work from Razvan<br>+=C2=A0=C2=A0=C2=A0 if (=
 hvm_pcid_enabled(curr) )<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 va=
lue &amp;=3D ((1ull &lt;&lt; 63) - 1);<br>+<br>=C2=A0=C2=A0=C2=A0=C2=A0 if =
( (ad-&gt;monitor.write_ctrlreg_enabled &amp; ctrlreg_bitmask) &amp;&amp;<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!(ad-&gt;monitor.=
write_ctrlreg_onchangeonly &amp; ctrlreg_bitmask) ||<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value !=3D old) )<br><br></div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jan =
25, 2018 at 4:03 PM, Razvan Cojocaru <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rcojocaru@bitdefender.com" target=3D"_blank">rcojocaru@bitdefender.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 0=
1/26/2018 12:17 AM, Bitweasil . wrote:<br>
&gt; Razvan -<br>
&gt;<br>
&gt; Yes, that patch resolves the issues.=C2=A0 Performance is abysmal (as<=
br>
&gt; expected with a CR3 switch on every syscall), but things behave proper=
ly.&gt;<br>
&gt; Jan -<br>
&gt;<br>
&gt; It turns out that unrelated code in my livepatch was causing the<br>
&gt; crashing when I filtered the high bit - I was not properly gating some=
<br>
&gt; other CR3 processing code in the livepatch, and that was causing the<b=
r>
&gt; invalid opcode errors, not the filtered CR3 value.=C2=A0 You are corre=
ct that<br>
&gt; masking the bit should not cause any correctness issues, only<br>
&gt; performance issues.<br>
&gt;<br>
&gt; Will one of you take up submitting this patch into the proper places?=
=C2=A0<br>
&gt; I&#39;m afraid I&#39;m not very familiar with the Xen patch submission=
 process.<br>
<br>
</span>Yes, I&#39;ll send a proper patch.<br>
<br>
<br>
Thanks for pointing the issue out,<br>
Razvan<br>
</blockquote></div><br></div>

--f403045f8b303339fb0563a29bb8--


--===============9153929156494084728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9153929156494084728==--
