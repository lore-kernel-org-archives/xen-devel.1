From: Spencer Michaels <spmichaels.work@gmail.com>
Subject: Re: Mapping HVM guest memory from Dom0
Date: Thu, 11 Oct 2018 16:43:35 -0400
Message-ID: <CAAd-cWOH5ouLJ+oUMwxUxp5mp1gPT0aD_eMtQbqViBqjLug3Nw@mail.gmail.com>
References: <CAAd-cWOSqZN9LYCRxEYjgCyHq24PFsZqOFE1T_PPnq3HjDGpaA@mail.gmail.com>
 <857c04f2-345f-b9ea-44ce-6e9d0aeb8248@citrix.com>
 <CAAd-cWMrRUrS7VzGN=3B9ekm9Gqx5aYZgayWdemV=-do1F8O9w@mail.gmail.com>
 <CABfawhkmNaNesdxcOOH=58f8GH1sn8ZyJ0TU8h+=9WhK0DCFtg@mail.gmail.com>
 <CAAd-cWPjq6fBs0iuar+oznaphSCa2LUyD=8MJfjyPjCTL=OVrQ@mail.gmail.com>
 <e1112b31-5259-83c7-8f5a-47d6b6fe6b36@citrix.com>
 <CABfawhn4jPfMsAtAcmCkhTvNE9gyvUuAQ82Nmxy8Ozi1qXqoBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5029267269304393352=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=put7=mx=gmail.com=spmichaels.work@srs-us1.protection.inumbo.net>)
 id 1gAhoD-0004Hu-Bm
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 20:43:49 +0000
Received: by mail-it1-x12d.google.com with SMTP id w200-v6so15234349itc.4
 for <xen-devel@lists.xenproject.org>; Thu, 11 Oct 2018 13:43:47 -0700 (PDT)
In-Reply-To: <CABfawhn4jPfMsAtAcmCkhTvNE9gyvUuAQ82Nmxy8Ozi1qXqoBg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas Lengyel <tamas.k.lengyel@gmail.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5029267269304393352==
Content-Type: multipart/alternative; boundary="000000000000062f180577fa07b5"

--000000000000062f180577fa07b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks very much to both of you for the info! After Andrew's post today I
was able to write some code myself to walk the page tables and get it to
work correctly, and xc_translate_foreign_address is exactly what I want as
well. I had been digging through the Xen codebase for a while looking for
just such a function but hadn't found it =E2=80=A6 the docs situation for t=
hese
APIs could definitely be better! I will definitely update the wiki with all
this information once I'm sure I understand it properly.

On Thu, Oct 11, 2018 at 3:05 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com>
wrote:

> On Wed, Oct 10, 2018 at 5:10 PM Andrew Cooper <andrew.cooper3@citrix.com>
> wrote:
> >
> > On 10/10/18 23:08, Spencer Michaels wrote:
> > > Interesting =E2=80=A6 sorry, I had read the docs a while ago and my
> > > interpretation at the time was that it didn't. I can try to get libvm=
i
> > > working, but nonetheless I do want to figure out how to this with the
> > > Xen API itself if at all possible, so I'd appreciate any help in doin=
g
> > > so.
> > >
> > > I've looked through libvmi's implementation some more; it looks like
> > > it does this via vmi_pagetable_lookup_cache, which in my case ends up
> > > calling v2p_pae (intel.c:327). As I understand it, in that function,
> > > the `dtb` parameter holds the pagetable base address, and you use tha=
t
> > > to walk the page table and get the physical address corresponding to
> > > the virtual addr. Based on the end of vmi_translate_kv2p
> > > (accessors.c:703), it looks like the value of dtb is `vmi->kpgd`,
> > > which at some point earlier is set to the value of the `cr3` register=
.
> > > Is my understanding, roughly speaking, correct?
>
> Correct, this works because the kernel is mapped into all process'
> address space on both Windows and Linux. So you can just take the
> value of CR3 at any given time and you will find the kernel memory
> range mapped in. The recent KPTI mitigations might effect this though,
> haven't investigated it yet.
>
> > > I tried to replicate a simpler version of libvmi's page table walking
> > > code just now, and in doing so noticed that the value of CR0, as
> > > reported by Xen, has its 31st bit set to zero =E2=80=A6 i.e. virtual
> > > addressing is disabled entirely? (For reference, I'm using a 64-bit
> > > Ubuntu image set up initially by virt-manager but now just run via `x=
l
> > > create`. I don't know if I should expect it to have paging enabled or
> > > not.) On the other hand, if I understand correctly, what I mentioned
> > > earlier with regards to some HVM guests assuming (addr >>
> > > XC_PAGE_SHIFT) =3D MFN *is* assuming that guest page frame number =3D
> > > machine frame number, which sounds like it is what would be applicabl=
e
> > > in this case.
> > >
> > > Honestly, I'm not so sure what's happening here, and I'm not even sur=
e
> > > my description is sensible at this point =E2=80=94 I need to look int=
o
> > > libvmi's implementation more and also figure out exactly what paging
> > > mode (or lack thereof) my HVM guest is running in. If, on the other
> > > hand, any of the above sounds familiar, suggestions/hints would be
> > > very helpful.
>
> If you want to look at another very compact implementation then libxc
> has one too:
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libxc/xc_p=
agetab.c;h=3Ddb25c20247573a3c638d7725c976433221a40141;hb=3DHEAD#l29
>
> > Here are some observations/points which may help.
> >
> > x86 is a bit more complicated than other architectures, and as a result=
,
> > there is a lot of subtly incorrect terminology (including in Libvmi -
> > sorry Tamas).
>
> Well aware of it =3D)
>
> >
> > A virtual address (also called an effective address) is a segment:offse=
t
> > pair.  The segment is almost always implicit (%cs for instruction
> > fetches, %ss for stack accesses, %ds for normal data accesses).  The
> > segmentation part of address translation adds the segment base to the
> > offset to produce a linear address.
> >
> > A "flat memory model" (used by almost all 32bit OSes and is
> > unconditional in AMD64) is one where the segment base is 0, at which
> > point offset =3D=3D linear address.  This is where most confusion over =
the
> > term "virtual address" arises.
> >
> > The paging part of address translation takes a linear address, follows
> > the pagetable structure (rooted in %cr3), to produce a physical address
> > as an output.  This may be guest physical or host physical depending on
> > the VM configuration.
> >
> >
> > Next, please read
> >
> http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/xen/m=
m.h;h=3D054d02e6c0e68b411afba42424dc5fe7e7d69855;hb=3Drefs/heads/staging#l8
> > which describes the terminology Xen uses for various address spaces.  I=
n
> > particular, the difference between MFN and GFN.
> >
> > The relevant difference PV and HVM guests as far as you are concerned i=
s
> > that for PV guests, GFN =3D=3D MFN because the pagetables written by th=
e
> > guest are walked directly by hardware.
> >
> > An HVM guest has GFN !=3D MFN, because the guest physical to host physi=
cal
> > translation is provided by HAP/EPT/NPT/SLAT (whichever term you chose t=
o
> > use for hardware acceleration), or by the shadow pagetables (maintained
> > and operated by Xen, for hardware lacking HAP support).
> >
> > The foreign map API uses a GFN, even if the underlying API describes th=
e
> > parameter name as MFN.  This is a consequence of PV guests having been
> > developed long before hardware virt extensions came along, and noone
> > having gone through and retroactively updated the terminology.
> >
> > Therefore, for both PV and HVM guests, you can take the guest cr3,
> > extract the frame part of it, and ask the foreign map API to map that
> > guest frame.  The underlying implementation in Xen is trivial for a PV
> > guest (GFN =3D=3D MFN), but slightly more complicated for HVM guests (G=
FN
> > has to be translated into an MFN by Xen walking the HAP/shadow
> > pagetables before dom0's mapping request can be completed).
> >
> > I hope this clears up some of the confusion.
> >
>
> Thanks for the in-depth write-up! We might even want to record this on
> a wiki page ;)
>
> Tamas
>

--000000000000062f180577fa07b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks very much to both of you for the i=
nfo! After Andrew&#39;s post today I was able to write some code myself to =
walk the page tables and get it to work correctly, and xc_translate_foreign=
_address is exactly what I want as well. I had been digging through the Xen=
 codebase for a while looking for just such a function but hadn&#39;t found=
 it =E2=80=A6 the docs situation for these APIs could definitely be better!=
 I will definitely update the wiki with all this information once I&#39;m s=
ure I understand it properly.</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Thu, Oct 11, 2018 at 3:05 PM Tamas K Lengyel &lt;<a href=
=3D"mailto:tamas.k.lengyel@gmail.com">tamas.k.lengyel@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Wed, Oct 10, 2018 at 5:10 PM=
 Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_=
blank">andrew.cooper3@citrix.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/10/18 23:08, Spencer Michaels wrote:<br>
&gt; &gt; Interesting =E2=80=A6 sorry, I had read the docs a while ago and =
my<br>
&gt; &gt; interpretation at the time was that it didn&#39;t. I can try to g=
et libvmi<br>
&gt; &gt; working, but nonetheless I do want to figure out how to this with=
 the<br>
&gt; &gt; Xen API itself if at all possible, so I&#39;d appreciate any help=
 in doing<br>
&gt; &gt; so.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve looked through libvmi&#39;s implementation some more; it=
 looks like<br>
&gt; &gt; it does this via vmi_pagetable_lookup_cache, which in my case end=
s up<br>
&gt; &gt; calling v2p_pae (intel.c:327). As I understand it, in that functi=
on,<br>
&gt; &gt; the `dtb` parameter holds the pagetable base address, and you use=
 that<br>
&gt; &gt; to walk the page table and get the physical address corresponding=
 to<br>
&gt; &gt; the virtual addr. Based on the end of vmi_translate_kv2p<br>
&gt; &gt; (accessors.c:703), it looks like the value of dtb is `vmi-&gt;kpg=
d`,<br>
&gt; &gt; which at some point earlier is set to the value of the `cr3` regi=
ster.<br>
&gt; &gt; Is my understanding, roughly speaking, correct?<br>
<br>
Correct, this works because the kernel is mapped into all process&#39;<br>
address space on both Windows and Linux. So you can just take the<br>
value of CR3 at any given time and you will find the kernel memory<br>
range mapped in. The recent KPTI mitigations might effect this though,<br>
haven&#39;t investigated it yet.<br>
<br>
&gt; &gt; I tried to replicate a simpler version of libvmi&#39;s page table=
 walking<br>
&gt; &gt; code just now, and in doing so noticed that the value of CR0, as<=
br>
&gt; &gt; reported by Xen, has its 31st bit set to zero =E2=80=A6 i.e. virt=
ual<br>
&gt; &gt; addressing is disabled entirely? (For reference, I&#39;m using a =
64-bit<br>
&gt; &gt; Ubuntu image set up initially by virt-manager but now just run vi=
a `xl<br>
&gt; &gt; create`. I don&#39;t know if I should expect it to have paging en=
abled or<br>
&gt; &gt; not.) On the other hand, if I understand correctly, what I mentio=
ned<br>
&gt; &gt; earlier with regards to some HVM guests assuming (addr &gt;&gt;<b=
r>
&gt; &gt; XC_PAGE_SHIFT) =3D MFN *is* assuming that guest page frame number=
 =3D<br>
&gt; &gt; machine frame number, which sounds like it is what would be appli=
cable<br>
&gt; &gt; in this case.<br>
&gt; &gt;<br>
&gt; &gt; Honestly, I&#39;m not so sure what&#39;s happening here, and I&#3=
9;m not even sure<br>
&gt; &gt; my description is sensible at this point =E2=80=94 I need to look=
 into<br>
&gt; &gt; libvmi&#39;s implementation more and also figure out exactly what=
 paging<br>
&gt; &gt; mode (or lack thereof) my HVM guest is running in. If, on the oth=
er<br>
&gt; &gt; hand, any of the above sounds familiar, suggestions/hints would b=
e<br>
&gt; &gt; very helpful.<br>
<br>
If you want to look at another very compact implementation then libxc<br>
has one too: <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblo=
b;f=3Dtools/libxc/xc_pagetab.c;h=3Ddb25c20247573a3c638d7725c976433221a40141=
;hb=3DHEAD#l29" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libxc/xc_pagetab.c;h=3Ddb25c202475=
73a3c638d7725c976433221a40141;hb=3DHEAD#l29</a><br>
<br>
&gt; Here are some observations/points which may help.<br>
&gt;<br>
&gt; x86 is a bit more complicated than other architectures, and as a resul=
t,<br>
&gt; there is a lot of subtly incorrect terminology (including in Libvmi -<=
br>
&gt; sorry Tamas).<br>
<br>
Well aware of it =3D)<br>
<br>
&gt;<br>
&gt; A virtual address (also called an effective address) is a segment:offs=
et<br>
&gt; pair.=C2=A0 The segment is almost always implicit (%cs for instruction=
<br>
&gt; fetches, %ss for stack accesses, %ds for normal data accesses).=C2=A0 =
The<br>
&gt; segmentation part of address translation adds the segment base to the<=
br>
&gt; offset to produce a linear address.<br>
&gt;<br>
&gt; A &quot;flat memory model&quot; (used by almost all 32bit OSes and is<=
br>
&gt; unconditional in AMD64) is one where the segment base is 0, at which<b=
r>
&gt; point offset =3D=3D linear address.=C2=A0 This is where most confusion=
 over the<br>
&gt; term &quot;virtual address&quot; arises.<br>
&gt;<br>
&gt; The paging part of address translation takes a linear address, follows=
<br>
&gt; the pagetable structure (rooted in %cr3), to produce a physical addres=
s<br>
&gt; as an output.=C2=A0 This may be guest physical or host physical depend=
ing on<br>
&gt; the VM configuration.<br>
&gt;<br>
&gt;<br>
&gt; Next, please read<br>
&gt; <a href=3D"http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen=
/include/xen/mm.h;h=3D054d02e6c0e68b411afba42424dc5fe7e7d69855;hb=3Drefs/he=
ads/staging#l8" rel=3D"noreferrer" target=3D"_blank">http://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/xen/mm.h;h=3D054d02e6c0e68b41=
1afba42424dc5fe7e7d69855;hb=3Drefs/heads/staging#l8</a><br>
&gt; which describes the terminology Xen uses for various address spaces.=
=C2=A0 In<br>
&gt; particular, the difference between MFN and GFN.<br>
&gt;<br>
&gt; The relevant difference PV and HVM guests as far as you are concerned =
is<br>
&gt; that for PV guests, GFN =3D=3D MFN because the pagetables written by t=
he<br>
&gt; guest are walked directly by hardware.<br>
&gt;<br>
&gt; An HVM guest has GFN !=3D MFN, because the guest physical to host phys=
ical<br>
&gt; translation is provided by HAP/EPT/NPT/SLAT (whichever term you chose =
to<br>
&gt; use for hardware acceleration), or by the shadow pagetables (maintaine=
d<br>
&gt; and operated by Xen, for hardware lacking HAP support).<br>
&gt;<br>
&gt; The foreign map API uses a GFN, even if the underlying API describes t=
he<br>
&gt; parameter name as MFN.=C2=A0 This is a consequence of PV guests having=
 been<br>
&gt; developed long before hardware virt extensions came along, and noone<b=
r>
&gt; having gone through and retroactively updated the terminology.<br>
&gt;<br>
&gt; Therefore, for both PV and HVM guests, you can take the guest cr3,<br>
&gt; extract the frame part of it, and ask the foreign map API to map that<=
br>
&gt; guest frame.=C2=A0 The underlying implementation in Xen is trivial for=
 a PV<br>
&gt; guest (GFN =3D=3D MFN), but slightly more complicated for HVM guests (=
GFN<br>
&gt; has to be translated into an MFN by Xen walking the HAP/shadow<br>
&gt; pagetables before dom0&#39;s mapping request can be completed).<br>
&gt;<br>
&gt; I hope this clears up some of the confusion.<br>
&gt;<br>
<br>
Thanks for the in-depth write-up! We might even want to record this on<br>
a wiki page ;)<br>
<br>
Tamas<br>
</blockquote></div>

--000000000000062f180577fa07b5--


--===============5029267269304393352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5029267269304393352==--
