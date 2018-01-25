From: "Bitweasil ." <bitweasil@cryptohaze.com>
Subject: Re: Xen Introspection, KPTI,
 and CR3 bit 63 leads to guest VMENTRY failures during introspection
Date: Thu, 25 Jan 2018 15:17:47 -0700
Message-ID: <CALn24pBf1UGbrqsSD_=abdM1U7X+vMuPd0q4KgYYH_tmd7mkAw@mail.gmail.com>
References: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
 <0052b33d-f0fe-ee91-892d-a63c8001c567@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8010251006764128500=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0052b33d-f0fe-ee91-892d-a63c8001c567@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: andrew.cooper3@citrix.com, tamas@tklengyel.com, jbeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============8010251006764128500==
Content-Type: multipart/alternative; boundary="001a1139dada6122460563a12633"

--001a1139dada6122460563a12633
Content-Type: text/plain; charset="UTF-8"

Razvan -

Yes, that patch resolves the issues.  Performance is abysmal (as expected
with a CR3 switch on every syscall), but things behave properly.

Jan -

It turns out that unrelated code in my livepatch was causing the crashing
when I filtered the high bit - I was not properly gating some other CR3
processing code in the livepatch, and that was causing the invalid opcode
errors, not the filtered CR3 value.  You are correct that masking the bit
should not cause any correctness issues, only performance issues.

Will one of you take up submitting this patch into the proper places?  I'm
afraid I'm not very familiar with the Xen patch submission process.

Thank you!

-Bit



On Thu, Jan 25, 2018 at 8:07 AM, Razvan Cojocaru <rcojocaru@bitdefender.com>
wrote:

> On 01/25/2018 12:31 AM, Bitweasil . wrote:
> > I've recently discovered that if you attempt to use introspection to
> > capture CR3 changes with the new KPTI enabled kernels, the guest dies
> > shortly after the start of introspection with failed VM entry due to
> > invalid guest state.
> >
> > I believe the invalid state here is the high bit being set in CR3 -
> > while this is how one indicates that PCID should not invalidate the
> > various page table caches, introspection leads to this being set in the
> > VMCS, which appears to be wrong.
> >
> > With the XenServer 4.7.1 code base (which is my working code base at the
> > moment), I have not found a way around this, as the
> > vm_event_set_registers function (xen/arch/x86/vm_event.c) does not set
> > the CR3 value, and vm_event_register_write_resume only allows inhibiting
> > the write, not writing a modified value.
> >
> > I've attempted several ways to work around this with a livepatch, and
> > have not (yet) been successful.
> >
> > Masking at the top of hvm_set_cr3 allows the guest to continue, but
> > appears to do the wrong thing with regards to the guest (tasks begin
> > dying quickly from invalid opcode errors).
> >
> > In any case, Andrew mentions that this appears to still be an issue in
> > staging, so this likely needs addressing.  At this point in time, I
> > believe guests with KPTI enabled cannot be introspected if that
> > introspection involves capturing CR3 changes.
> >
> > Please let me know if you need any more details on this issue!
>
> I've managed to reproduce the problem and this patch has fixed it for me
> with Xen staging:
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index db282b5..7be962e 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2320,6 +2320,9 @@ int hvm_set_cr3(unsigned long value, bool_t
> may_defer)
>          }
>      }
>
> +    if ( hvm_pcid_enabled(v) )
> +        value &= ((1ull << 63) - 1);
> +
>      if ( hvm_paging_enabled(v) && !paging_mode_hap(v->domain) &&
>           (value != v->arch.hvm_vcpu.guest_cr[3]) )
>      {
>
> Would you mind giving this a spin and confirm it also solves your problems?
>
>
> Thanks,
> Razvan
>

--001a1139dada6122460563a12633
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Razvan -<br><br></div>Yes, that p=
atch resolves the issues.=C2=A0 Performance is abysmal (as expected with a =
CR3 switch on every syscall), but things behave properly.<br></div><div><br=
></div><div>Jan - <br></div><div><br></div>It turns out that unrelated code=
 in my livepatch was causing the crashing when I filtered the high bit - I =
was not properly gating some other CR3 processing code in the livepatch, an=
d that was causing the invalid opcode errors, not the filtered CR3 value.=
=C2=A0 You are correct that masking the bit should not cause any correctnes=
s issues, only performance issues.<br><br></div>Will one of you take up sub=
mitting this patch into the proper places?=C2=A0 I&#39;m afraid I&#39;m not=
 very familiar with the Xen patch submission process.<br><br></div>Thank yo=
u!<br><br></div>-Bit<br><div><div><div><div><br><br></div></div></div></div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Ja=
n 25, 2018 at 8:07 AM, Razvan Cojocaru <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:rcojocaru@bitdefender.com" target=3D"_blank">rcojocaru@bitdefender.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 01/25/2018 12:31 AM, Bitweasil . wrote:<br>
</span><span class=3D"">&gt; I&#39;ve recently discovered that if you attem=
pt to use introspection to<br>
&gt; capture CR3 changes with the new KPTI enabled kernels, the guest dies<=
br>
&gt; shortly after the start of introspection with failed VM entry due to<b=
r>
&gt; invalid guest state.<br>
&gt;<br>
&gt; I believe the invalid state here is the high bit being set in CR3 -<br=
>
&gt; while this is how one indicates that PCID should not invalidate the<br=
>
&gt; various page table caches, introspection leads to this being set in th=
e<br>
&gt; VMCS, which appears to be wrong.<br>
&gt;<br>
&gt; With the XenServer 4.7.1 code base (which is my working code base at t=
he<br>
&gt; moment), I have not found a way around this, as the<br>
&gt; vm_event_set_registers function (xen/arch/x86/vm_event.c) does not set=
<br>
&gt; the CR3 value, and vm_event_register_write_resume only allows inhibiti=
ng<br>
&gt; the write, not writing a modified value.<br>
&gt;<br>
&gt; I&#39;ve attempted several ways to work around this with a livepatch, =
and<br>
&gt; have not (yet) been successful.<br>
&gt;<br>
&gt; Masking at the top of hvm_set_cr3 allows the guest to continue, but<br=
>
&gt; appears to do the wrong thing with regards to the guest (tasks begin<b=
r>
&gt; dying quickly from invalid opcode errors).<br>
&gt;<br>
&gt; In any case, Andrew mentions that this appears to still be an issue in=
<br>
&gt; staging, so this likely needs addressing.=C2=A0 At this point in time,=
 I<br>
&gt; believe guests with KPTI enabled cannot be introspected if that<br>
&gt; introspection involves capturing CR3 changes.<br>
&gt;<br>
&gt; Please let me know if you need any more details on this issue!<br>
<br>
</span>I&#39;ve managed to reproduce the problem and this patch has fixed i=
t for me<br>
with Xen staging:<br>
<br>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c<br>
index db282b5..7be962e 100644<br>
--- a/xen/arch/x86/hvm/hvm.c<br>
+++ b/xen/arch/x86/hvm/hvm.c<br>
@@ -2320,6 +2320,9 @@ int hvm_set_cr3(unsigned long value, bool_t may_defer=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if ( hvm_pcid_enabled(v) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D ((1ull &lt;&lt; 63) - 1);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if ( hvm_paging_enabled(v) &amp;&amp; !paging_mode_hap(=
v-&gt;domain) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (value !=3D v-&gt;arch.hvm_vcpu.guest_cr=
[3]) )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
<br>
Would you mind giving this a spin and confirm it also solves your problems?=
<br>
<br>
<br>
Thanks,<br>
Razvan<br>
</blockquote></div><br></div>

--001a1139dada6122460563a12633--


--===============8010251006764128500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8010251006764128500==--
