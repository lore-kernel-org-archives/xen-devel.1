From: Rian Quinn <rianquinn@gmail.com>
Subject: Re: PVH and ACPI discussion
Date: Fri, 4 Jan 2019 18:54:03 -0700
Message-ID: <CANmpu8XghQa6BB0nB5jc=fsfLMxaTQeOLRCHchOuuzAj6tUUwg@mail.gmail.com>
References: <20190103174523.ofkxt6vfteilw4zr@mac>
 <5C2F5B45020000780020A36F@prv1-mh.provo.novell.com>
 <20190104140936.hgfg5gjxqne6eb5m@mac.bytemobile.com>
 <5C2F7EEC020000780020A48A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8740527293576812089=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wCux=PN=gmail.com=rianquinn@srs-us1.protection.inumbo.net>)
 id 1gfbAH-0002dJ-Ji
 for xen-devel@lists.xenproject.org; Sat, 05 Jan 2019 01:54:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id f9so33220532eds.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jan 2019 17:54:15 -0800 (PST)
In-Reply-To: <5C2F7EEC020000780020A48A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8740527293576812089==
Content-Type: multipart/alternative; boundary="000000000000d5b223057eac4547"

--000000000000d5b223057eac4547
Content-Type: text/plain; charset="UTF-8"

With the research we are doing using Bareflank, we set both of these flags
and also tell Linux that almost all (but a small part) of the lower 1MB is
free RAM to use as we don't emulate any of the legacy devices. From what we
can tell so far, Linux seems to handle this fine without any complaints.

- Rian

On Fri, Jan 4, 2019 at 8:44 AM Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 04.01.19 at 15:09, <roger.pau@citrix.com> wrote:
> > Do you agree however that PVH DomU could maybe use reduced hardware
> > ACPI while Dom0 using whatever mode (reduced or not) is set by the
> > native ACPI tables?
>
> Yes, it's certainly worth exploring.
>
> Jan
>
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000d5b223057eac4547
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With the research we are doing using Bareflank, we set bot=
h of these flags and also tell Linux that almost all (but a small part) of =
the lower 1MB is free RAM to use as we don&#39;t emulate any of the legacy =
devices. From what we can tell so far, Linux seems to handle this fine with=
out any complaints.=C2=A0<div><br></div><div>- Rian</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jan 4, 2019 at 8:44 AM Jan Beul=
ich &lt;<a href=3D"mailto:JBeulich@suse.com">JBeulich@suse.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt; =
On 04.01.19 at 15:09, &lt;<a href=3D"mailto:roger.pau@citrix.com" target=3D=
"_blank">roger.pau@citrix.com</a>&gt; wrote:<br>
&gt; Do you agree however that PVH DomU could maybe use reduced hardware<br=
>
&gt; ACPI while Dom0 using whatever mode (reduced or not) is set by the<br>
&gt; native ACPI tables?<br>
<br>
Yes, it&#39;s certainly worth exploring.<br>
<br>
Jan<br>
<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--000000000000d5b223057eac4547--


--===============8740527293576812089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8740527293576812089==--
