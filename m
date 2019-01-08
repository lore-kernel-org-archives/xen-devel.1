From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v4 2/2] xen: use SYMBOL when required
Date: Tue, 8 Jan 2019 13:43:39 -0500
Message-ID: <CAF3u54Cnu5-dLdSgA3o_sjK8m05OfBvM_T9JuRvEGQ64CkDfxg@mail.gmail.com>
References: <alpine.DEB.2.10.1811121500550.8259@sstabellini-ThinkPad-X260>
 <1542063977-24906-2-git-send-email-sstabellini@kernel.org>
 <5BEAC9F402000078001FB74F@prv1-mh.provo.novell.com>
 <63844310-6f92-8ee8-e40d-8029c8ff4d72@arm.com>
 <5BEAD13A02000078001FB7AC@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1811131355390.8259@sstabellini-ThinkPad-X260>
 <5BEBD25B02000078001FBCA4@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901021006200.800@sstabellini-ThinkPad-X260>
 <5C2F1DC9020000780020A1D8@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901040853520.800@sstabellini-ThinkPad-X260>
 <5C33022D020000780020A9D1@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901071023280.800@sstabellini-ThinkPad-X260>
 <5C345963020000780020B227@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901080936030.800@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1901080953330.800@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0019874750575328574=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cKC2=PQ=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ggwM0-0007dO-3T
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 18:43:56 +0000
Received: by mail-vk1-xa41.google.com with SMTP id b18so1105273vke.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jan 2019 10:43:54 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1901080953330.800@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

--===============0019874750575328574==
Content-Type: multipart/alternative; boundary="0000000000002aefd7057ef6ba78"

--0000000000002aefd7057ef6ba78
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Tue, 8 Jan 2019, 13:09 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Tue, 8 Jan 2019, Stefano Stabellini wrote:
> > On Tue, 8 Jan 2019, Jan Beulich wrote:
> > > >>> On 07.01.19 at 19:29, <sstabellini@kernel.org> wrote:
> > > > On Mon, 7 Jan 2019, Jan Beulich wrote:
> > > >> >>> On 04.01.19 at 18:05, <sstabellini@kernel.org> wrote:
> > > >> > I realize that you are not convinced by these arguments, but
> let's find
> > > >> > a way forward. My preference would be to have SYMBOL returning
> unsigned
> > > >> > long and do unsigned long comparisons when pointers pointing to
> > > >> > different objects are involved.
> > > >>
> > > >> I continue to fail to see how suitable hiding of the connection to
> the
> > > >> original symbol from the compiler makes code less standard compliant
> > > >> when comparing pointers: The compiler simply can't know whether
> > > >> the underlying object ills (in the extreme case) an array spanning
> the
> > > >> entire address space.
> > > >
> > > > That is because the requirement I am trying to address is MISRA-C
> > > > compliance, which in turns requires C language compliance for C
> language
> > > > (I think it allows mixing C with assembly code). I don't particularly
> > > > care whether the compiler can or cannot find the connection to the
> > > > original symbol.
> > > >
> > > > The important thing for me is to avoid comparisons (and subtractions)
> > > > between pointers pointing to different objects. If we compare
> unsigned
> > > > longs, it is easier to prove that the comparison is not between
> pointers
> > > > pointing to different objects, even if somehow the numeric values
> > > > indirectly come from pointers. If we compare pointers, even if they
> went
> > > > through some sort of assembly conversions, we are still comparing
> > > > pointers pointing to different objects. The compiler might not be
> able
> > > > to figure it out, but a MISRA-C compliance scanning tool, or a human,
> > > > might.
> > >
> > > This is absurd: We are similarly still comparing pointers to different
> > > objects when comparing their values casted to unsigned long. The
> > > cast is as much of a hiding technique as any other one. If you want
> > > to be C language compliant without any compromises, you'll have to
> > > do away with all *_end symbols.
> >
> > Basically, this is a matter of interpretation of the spec: it seems to
> > me that coming back from asm-land with pointers and comparing pointers
> > would be a worse offense than a (almost) harmless unsigned long
> > comparison of values returned from asm-land.
> >
> > But I am not particularly knowledgeable about MISRA-C compliance and
> > their interpretation of the rules.
> >
> > So, this is what I am going to do: I'll send a series update according
> > to your suggestion, with SYMBOL returning the native pointer type. As I
> > wrote earlier, although weaker, it is still an improvement from my point
> > of view.
>
> There is a problem with this though I didn't foresee :-(
>
> The native type of _start is not char* -- it is char[]. So I cannot
> actually return the native type from SYMBOL because I cannot cast to
> (char[]). I didn't notice it until I actually tried it.
>
> See the implementation of RELOC_HIDE:
>
>   #define RELOC_HIDE(ptr, off)                    \
>     ({ unsigned long __ptr;                       \
>       __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
>       (typeof(ptr)) (__ptr + (off)); })
>
> It casts to the type at the end, the error is:
>
>   error: cast specifies array type
>        (typeof(ptr)) (__ptr + (off)); })
>
> We have a few options:
>
> 1) use unsigned long as in this version of the series (the Linux kernel
> also uses this technique)
> Sorry if I insist, it is still the best I think :-)
>
> 2) casts the parameters of SYMBOL to the corresponding pointer type
> For instance:
>   SYMBOL((char *)_start)
>   SYMBOL((struct alt_instr *)__alt_instructions_end)
> This works, but it is ugly, I would say it makes the code worse than
> option 1)
>
> 2) always return void* from SYMBOL
> I don't think it is a good idea to use void* as a workaround here
>
> 3) pass the desired return type to SYMBOL
> For instance:
>   SYMBOL(_start, char *)
>   SYMBOL(__alt_instructions_end, struct alt_instr *)
> Then SYMBOL would automatically cast the return type to char * and
> struct alt_instr * according to the second parameter.
>
> Do you have any other suggestions?
>

Reading [1], I think casting back to the initial type is pointless and not
going to help the static analyzer or compiler. After all, you still
compare/substract 2 pointers...

So, I think the only solution is 1).

Cheers,

[1]
https://kristerw.blogspot.com/2016/12/pointer-comparison-invalid-optimization.html?m=1


> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000002aefd7057ef6ba78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>Hi,</span><div><br></div><div>Sorry for the formatting.</div><div><di=
v dir=3D"auto"><div dir=3D"auto"><br><div class=3D"gmail_quote"><div dir=3D=
"ltr">On Tue, 8 Jan 2019, 13:09 Stefano Stabellini, &lt;<a href=3D"mailto:s=
stabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Tue, 8 Jan 2019, Stefano Stabellini wrote:<br>
&gt; On Tue, 8 Jan 2019, Jan Beulich wrote:<br>
&gt; &gt; &gt;&gt;&gt; On 07.01.19 at 19:29, &lt;<a href=3D"mailto:sstabell=
ini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br>
&gt; &gt; &gt; On Mon, 7 Jan 2019, Jan Beulich wrote:<br>
&gt; &gt; &gt;&gt; &gt;&gt;&gt; On 04.01.19 at 18:05, &lt;<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt;&gt; &gt; I realize that you are not convinced by these argum=
ents, but let&#39;s find<br>
&gt; &gt; &gt;&gt; &gt; a way forward. My preference would be to have SYMBO=
L returning unsigned<br>
&gt; &gt; &gt;&gt; &gt; long and do unsigned long comparisons when pointers=
 pointing to<br>
&gt; &gt; &gt;&gt; &gt; different objects are involved.<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; I continue to fail to see how suitable hiding of the con=
nection to the<br>
&gt; &gt; &gt;&gt; original symbol from the compiler makes code less standa=
rd compliant<br>
&gt; &gt; &gt;&gt; when comparing pointers: The compiler simply can&#39;t k=
now whether<br>
&gt; &gt; &gt;&gt; the underlying object ills (in the extreme case) an arra=
y spanning the<br>
&gt; &gt; &gt;&gt; entire address space.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; That is because the requirement I am trying to address is MI=
SRA-C<br>
&gt; &gt; &gt; compliance, which in turns requires C language compliance fo=
r C language<br>
&gt; &gt; &gt; (I think it allows mixing C with assembly code). I don&#39;t=
 particularly<br>
&gt; &gt; &gt; care whether the compiler can or cannot find the connection =
to the<br>
&gt; &gt; &gt; original symbol. <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The important thing for me is to avoid comparisons (and subt=
ractions)<br>
&gt; &gt; &gt; between pointers pointing to different objects. If we compar=
e unsigned<br>
&gt; &gt; &gt; longs, it is easier to prove that the comparison is not betw=
een pointers<br>
&gt; &gt; &gt; pointing to different objects, even if somehow the numeric v=
alues<br>
&gt; &gt; &gt; indirectly come from pointers. If we compare pointers, even =
if they went<br>
&gt; &gt; &gt; through some sort of assembly conversions, we are still comp=
aring<br>
&gt; &gt; &gt; pointers pointing to different objects. The compiler might n=
ot be able<br>
&gt; &gt; &gt; to figure it out, but a MISRA-C compliance scanning tool, or=
 a human,<br>
&gt; &gt; &gt; might.<br>
&gt; &gt; <br>
&gt; &gt; This is absurd: We are similarly still comparing pointers to diff=
erent<br>
&gt; &gt; objects when comparing their values casted to unsigned long. The<=
br>
&gt; &gt; cast is as much of a hiding technique as any other one. If you wa=
nt<br>
&gt; &gt; to be C language compliant without any compromises, you&#39;ll ha=
ve to<br>
&gt; &gt; do away with all *_end symbols.<br>
&gt; <br>
&gt; Basically, this is a matter of interpretation of the spec: it seems to=
<br>
&gt; me that coming back from asm-land with pointers and comparing pointers=
<br>
&gt; would be a worse offense than a (almost) harmless unsigned long<br>
&gt; comparison of values returned from asm-land.<br>
&gt; <br>
&gt; But I am not particularly knowledgeable about MISRA-C compliance and<b=
r>
&gt; their interpretation of the rules.<br>
&gt; <br>
&gt; So, this is what I am going to do: I&#39;ll send a series update accor=
ding<br>
&gt; to your suggestion, with SYMBOL returning the native pointer type. As =
I<br>
&gt; wrote earlier, although weaker, it is still an improvement from my poi=
nt<br>
&gt; of view.<br>
<br>
There is a problem with this though I didn&#39;t foresee :-(<br>
<br>
The native type of _start is not char* -- it is char[]. So I cannot<br>
actually return the native type from SYMBOL because I cannot cast to<br>
(char[]). I didn&#39;t notice it until I actually tried it.<br>
<br>
See the implementation of RELOC_HIDE:<br>
<br>
=C2=A0 #define RELOC_HIDE(ptr, off)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 ({ unsigned long __ptr;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 __asm__ (&quot;&quot; : &quot;=3Dr&quot;(__ptr) : &quo=
t;0&quot;(ptr));=C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 (typeof(ptr)) (__ptr + (off)); })<br>
<br>
It casts to the type at the end, the error is:<br>
<br>
=C2=A0 error: cast specifies array type<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0(typeof(ptr)) (__ptr + (off)); })<br>
<br>
We have a few options:<br>
<br>
1) use unsigned long as in this version of the series (the Linux kernel<br>
also uses this technique)<br>
Sorry if I insist, it is still the best I think :-)<br>
<br>
2) casts the parameters of SYMBOL to the corresponding pointer type<br>
For instance:<br>
=C2=A0 SYMBOL((char *)_start)<br>
=C2=A0 SYMBOL((struct alt_instr *)__alt_instructions_end)<br>
This works, but it is ugly, I would say it makes the code worse than<br>
option 1)<br>
<br>
2) always return void* from SYMBOL<br>
I don&#39;t think it is a good idea to use void* as a workaround here<br>
<br>
3) pass the desired return type to SYMBOL<br>
For instance:<br>
=C2=A0 SYMBOL(_start, char *)<br>
=C2=A0 SYMBOL(__alt_instructions_end, struct alt_instr *)<br>
Then SYMBOL would automatically cast the return type to char * and<br>
struct alt_instr * according to the second parameter.<br>
<br>
Do you have any other suggestions?<br></blockquote></div></div></div></div>=
<div><br></div><div>Reading [1], I think casting back to the initial type i=
s pointless and not going to help the static analyzer or compiler. After al=
l, you still compare/substract 2 pointers...</div><div><br></div><div>So, I=
 think the only solution is 1).</div><div><br></div><div>Cheers,</div><div>=
<br></div><div>[1]=C2=A0<a href=3D"https://kristerw.blogspot.com/2016/12/po=
inter-comparison-invalid-optimization.html?m=3D1">https://kristerw.blogspot=
.com/2016/12/pointer-comparison-invalid-optimization.html?m=3D1</a></div><d=
iv><br></div><div><div dir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div></div></div>

--0000000000002aefd7057ef6ba78--


--===============0019874750575328574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0019874750575328574==--
