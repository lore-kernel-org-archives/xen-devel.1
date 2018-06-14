From: Julien Grall <julien.grall@gmail.com>
Subject: Re: How to deal with hypercalls returning -EFAULT
Date: Thu, 14 Jun 2018 09:17:54 +0100
Message-ID: <CAF3u54AyNyrfiAGN4zMq1BeX8ojjZX7FbSiJP53+6EC3ayJ61Q@mail.gmail.com>
References: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
 <10af8cc2-43cb-8b9e-e700-56b467c26a7d@citrix.com>
 <7922636b-e78e-6da6-0467-5c0831f75abd@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6936428847878510897=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bohh=ja=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fTNSL-0002ph-93
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 08:18:09 +0000
Received: by mail-oi0-x244.google.com with SMTP id h79-v6so4861928oig.13
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jun 2018 01:18:08 -0700 (PDT)
In-Reply-To: <7922636b-e78e-6da6-0467-5c0831f75abd@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6936428847878510897==
Content-Type: multipart/alternative; boundary="0000000000003a4fca056e95bde1"

--0000000000003a4fca056e95bde1
Content-Type: text/plain; charset="UTF-8"

Hi Juergen,

Sorry for the formatting.

On Thu, 14 Jun 2018, 07:40 Juergen Gross, <jgross@suse.com> wrote:

> On 13/06/18 18:25, Andrew Cooper wrote:
> > On 13/06/18 16:27, Juergen Gross wrote:
>
> Looking more into the privcmd driver I'm rather sure now I can solve
> this via mmap() plus an ioctl(). So the kernel would allocate the
> bounce buffers and map them into user space. This will require changes
> only in libxencall without having to modify its external interface.
>

It looks like David Vrabel sent in 2016 a patch implementing that solution
[1]. It seems it has not been merged. Do you have any insight why it was
not merged?

Cheers,

[1]
https://lists.xenproject.org/archives/html/xen-devel/2016-08/msg00743.html

--0000000000003a4fca056e95bde1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Juergen,<div><br></div><div>Sorry for the formatting.<br><div dir=3D"aut=
o"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 14 Jun 2018, 07:=
40 Juergen Gross, &lt;<a href=3D"mailto:jgross@suse.com">jgross@suse.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 13/06/18 18:25, And=
rew Cooper wrote:<br>
&gt; On 13/06/18 16:27, Juergen Gross wrote:<br>
<br>
Looking more into the privcmd driver I&#39;m rather sure now I can solve<br=
>
this via mmap() plus an ioctl(). So the kernel would allocate the<br>
bounce buffers and map them into user space. This will require changes<br>
only in libxencall without having to modify its external interface.<br></bl=
ockquote></div></div></div><div><br></div><div>It looks like David Vrabel s=
ent in 2016 a patch implementing that solution [1]. It seems it has not bee=
n merged. Do you have any insight why it was not merged?</div><div><br></di=
v><div>Cheers,</div><div><br></div><div>[1]=C2=A0<a href=3D"https://lists.x=
enproject.org/archives/html/xen-devel/2016-08/msg00743.html">https://lists.=
xenproject.org/archives/html/xen-devel/2016-08/msg00743.html</a></div>

--0000000000003a4fca056e95bde1--


--===============6936428847878510897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6936428847878510897==--
