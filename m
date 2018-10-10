From: Spencer Michaels <spmichaels.work@gmail.com>
Subject: Re: Mapping HVM guest memory from Dom0
Date: Wed, 10 Oct 2018 18:08:36 -0400
Message-ID: <CAAd-cWPjq6fBs0iuar+oznaphSCa2LUyD=8MJfjyPjCTL=OVrQ@mail.gmail.com>
References: <CAAd-cWOSqZN9LYCRxEYjgCyHq24PFsZqOFE1T_PPnq3HjDGpaA@mail.gmail.com>
 <857c04f2-345f-b9ea-44ce-6e9d0aeb8248@citrix.com>
 <CAAd-cWMrRUrS7VzGN=3B9ekm9Gqx5aYZgayWdemV=-do1F8O9w@mail.gmail.com>
 <CABfawhkmNaNesdxcOOH=58f8GH1sn8ZyJ0TU8h+=9WhK0DCFtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5613943635229677503=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oawu=mw=gmail.com=spmichaels.work@srs-us1.protection.inumbo.net>)
 id 1gAMew-0008NP-MI
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 22:08:50 +0000
Received: by mail-io1-xd2b.google.com with SMTP id z16-v6so5120530iol.6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Oct 2018 15:08:48 -0700 (PDT)
In-Reply-To: <CABfawhkmNaNesdxcOOH=58f8GH1sn8ZyJ0TU8h+=9WhK0DCFtg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: tamas.k.lengyel@gmail.com
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5613943635229677503==
Content-Type: multipart/alternative; boundary="0000000000003ba7050577e7194c"

--0000000000003ba7050577e7194c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Interesting =E2=80=A6 sorry, I had read the docs a while ago and my interpr=
etation
at the time was that it didn't. I can try to get libvmi working, but
nonetheless I do want to figure out how to this with the Xen API itself if
at all possible, so I'd appreciate any help in doing so.

I've looked through libvmi's implementation some more; it looks like it
does this via vmi_pagetable_lookup_cache, which in my case ends up calling
v2p_pae (intel.c:327). As I understand it, in that function, the `dtb`
parameter holds the pagetable base address, and you use that to walk the
page table and get the physical address corresponding to the virtual addr.
Based on the end of vmi_translate_kv2p (accessors.c:703), it looks like the
value of dtb is `vmi->kpgd`, which at some point earlier is set to the
value of the `cr3` register. Is my understanding, roughly speaking, correct=
?

I tried to replicate a simpler version of libvmi's page table walking code
just now, and in doing so noticed that the value of CR0, as reported by
Xen, has its 31st bit set to zero =E2=80=A6 i.e. virtual addressing is disa=
bled
entirely? (For reference, I'm using a 64-bit Ubuntu image set up initially
by virt-manager but now just run via `xl create`. I don't know if I should
expect it to have paging enabled or not.) On the other hand, if I
understand correctly, what I mentioned earlier with regards to some HVM
guests assuming (addr >> XC_PAGE_SHIFT) =3D MFN *is* assuming that guest pa=
ge
frame number =3D machine frame number, which sounds like it is what would b=
e
applicable in this case.

Honestly, I'm not so sure what's happening here, and I'm not even sure my
description is sensible at this point =E2=80=94 I need to look into libvmi'=
s
implementation more and also figure out exactly what paging mode (or lack
thereof) my HVM guest is running in. If, on the other hand, any of the
above sounds familiar, suggestions/hints would be very helpful.

On Wed, Oct 10, 2018 at 11:25 AM Tamas K Lengyel <tamas.k.lengyel@gmail.com=
>
wrote:

> On Wed, Oct 10, 2018 at 8:47 AM Spencer Michaels
> <spmichaels.work@gmail.com> wrote:
> >
> > I have, but libvmi doesn't fit my use case =E2=80=94 it only works with=
 Windows
> and Linux HVM guests. I will need my application to work with PV and HVM
> guests that are neither Windows nor Linux.
>
> LibVMI works with PV guests and you can initialize it without the OS
> specific features. If you use vmi_init followed by vmi_init_paging you
> can do v2p translation, reading/writing memory regardless of what OS
> is running in the guest.
>
> Tamas
>

--0000000000003ba7050577e7194c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Interesting =E2=80=A6 sorry, I had read the docs a while a=
go and my interpretation at the time was that it didn&#39;t. I can try to g=
et libvmi working, but nonetheless I do want to figure out how to this with=
 the Xen API itself if at all possible, so I&#39;d appreciate any help in d=
oing so.<div><br></div><div>I&#39;ve looked through libvmi&#39;s implementa=
tion some more; it looks like it does this via vmi_pagetable_lookup_cache, =
which in my case ends up calling v2p_pae (intel.c:327). As I understand it,=
 in that function, the `dtb` parameter holds the pagetable base address, an=
d you use that to walk the page table and get the physical address correspo=
nding to the virtual addr. Based on the end of vmi_translate_kv2p (accessor=
s.c:703), it looks like the value of dtb is `vmi-&gt;kpgd`, which at some p=
oint earlier is set to the value of the `cr3` register. Is my understanding=
, roughly speaking, correct?</div><div><br></div><div>I tried to replicate =
a simpler version of libvmi&#39;s page table walking code just now, and in =
doing so noticed that the value of CR0, as reported by Xen, has its 31st bi=
t set to zero =E2=80=A6 i.e. virtual addressing is disabled entirely? (For =
reference, I&#39;m using a 64-bit Ubuntu image set up initially by virt-man=
ager but now just run via `xl create`. I don&#39;t know if I should expect =
it to have paging enabled or not.) On the other hand, if I understand corre=
ctly, what I mentioned earlier with regards to some HVM guests assuming (ad=
dr &gt;&gt; XC_PAGE_SHIFT) =3D MFN *is* assuming that guest page frame numb=
er =3D machine frame number, which sounds like it is what would be applicab=
le in this case.=C2=A0</div><div><br></div><div>Honestly, I&#39;m not so su=
re what&#39;s happening here, and I&#39;m not even sure my description is s=
ensible at this point =E2=80=94 I need to look into libvmi&#39;s implementa=
tion more and also figure out exactly what paging mode (or lack thereof) my=
 HVM guest is running in. If, on the other hand, any of the above sounds fa=
miliar, suggestions/hints would be very helpful.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 10, 2018 at 11:25 AM Tamas K =
Lengyel &lt;<a href=3D"mailto:tamas.k.lengyel@gmail.com">tamas.k.lengyel@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Oct =
10, 2018 at 8:47 AM Spencer Michaels<br>
&lt;<a href=3D"mailto:spmichaels.work@gmail.com" target=3D"_blank">spmichae=
ls.work@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I have, but libvmi doesn&#39;t fit my use case =E2=80=94 it only works=
 with Windows and Linux HVM guests. I will need my application to work with=
 PV and HVM guests that are neither Windows nor Linux.<br>
<br>
LibVMI works with PV guests and you can initialize it without the OS<br>
specific features. If you use vmi_init followed by vmi_init_paging you<br>
can do v2p translation, reading/writing memory regardless of what OS<br>
is running in the guest.<br>
<br>
Tamas<br>
</blockquote></div>

--0000000000003ba7050577e7194c--


--===============5613943635229677503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5613943635229677503==--
