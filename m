From: Rich Persaud <persaur@gmail.com>
Subject: Re: Xen 4.12 Development Update
Date: Tue, 31 Jul 2018 14:19:16 -0400
Message-ID: <D2461106-1CBC-4BCE-8411-EABD7593C73B@gmail.com>
References: <20180727161938.20059-1-jgross@suse.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============0307365839039119120=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=edyh=kp=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1fkZEw-0005Qb-9O
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 18:19:22 +0000
Received: by mail-it0-x22f.google.com with SMTP id e14-v6so5890247itf.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jul 2018 11:19:20 -0700 (PDT)
In-Reply-To: <20180727161938.20059-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============0307365839039119120==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-6F7075C1-4250-4051-A49B-389F1481B29E
Content-Transfer-Encoding: 7bit


--Apple-Mail-6F7075C1-4250-4051-A49B-389F1481B29E
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Jul 27, 2018, at 12:19, Juergen Gross <jgross@suse.com> wrote:
>=20
> This email only tracks big items for xen.git tree. Please reply for items y=
ou
> would like to see in 4.12 so that people have an idea what is going on and=

> prioritise accordingly.

Two additional items:

1.  Linux stub domains, series posted by the Qubes team.  A variant of this a=
pproach has been used by OpenXT for several years.
https://lists.xen.org/archives/html/xen-devel/2018-07/msg02616.html

2.  "Argo" inter-VM communication mechanism, discussed at Xen Summit 2018 de=
sign session, design doc forthcoming.  Variants of this technology have been=
 used in OpenXT and uXen/Bromium for several years.

> We recently introduced a jira instance to track all the tasks (not only bi=
g)
> for the project. See: https://xenproject.atlassian.net/projects/XEN/issues=
.
>=20
> Most of the tasks tracked by this e-mail also have a corresponding jira ta=
sk
> referred by XEN-N.

Could we start using the "Affects Version" and "Fix Version" of JIRA, with v=
alues for currently supported releases, plus the next two releases (4.12 and=
 4.13)?  This will enable the use of filters and issue tracking for prior re=
leases.

I can create JIRA tickets for the two tasks listed above, if there are no ob=
jections.

Rich=

--Apple-Mail-6F7075C1-4250-4051-A49B-389F1481B29E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><div></div><div>On Jul 27, 2018, at 12:19, Juergen Gross &lt;<a h=
ref=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; wrote:</div><div><br>=
</div><blockquote type=3D"cite"><div><span>This email only tracks big items f=
or xen.git tree. Please reply for items you</span><br><span>would like to se=
e in 4.12 so that people have an idea what is going on and</span><br><span>p=
rioritise accordingly.</span><br></div></blockquote><div><br></div><div>Two a=
dditional items:</div><div><br></div><div>1. &nbsp;Linux stub domains, serie=
s posted by the Qubes team. &nbsp;A variant of this approach has been used b=
y OpenXT for several years.</div><div><a href=3D"https://lists.xen.org/archi=
ves/html/xen-devel/2018-07/msg02616.html">https://lists.xen.org/archives/htm=
l/xen-devel/2018-07/msg02616.html</a></div><div><br></div><div>2. &nbsp;"Arg=
o" inter-VM communication mechanism, discussed at Xen Summit 2018 design ses=
sion, design doc forthcoming. &nbsp;Variants of this technology have been us=
ed in OpenXT and uXen/Bromium for several years.</div><br><blockquote type=3D=
"cite"><div><span></span><span>We recently introduced a jira instance to tra=
ck all the tasks (not only big)</span><br><span>for the project. See: <a hre=
f=3D"https://xenproject.atlassian.net/projects/XEN/issues">https://xenprojec=
t.atlassian.net/projects/XEN/issues</a>.</span><br><span></span><br><span>Mo=
st of the tasks tracked by this e-mail also have a corresponding jira task</=
span><br><span>referred by XEN-N.</span><br></div></blockquote><div><br></di=
v><div>Could we start using the "Affects Version" and "Fix Version" of JIRA,=
 with values for currently supported releases, plus the next two releases (4=
.12 and 4.13)? &nbsp;This will enable the use of filters and issue tracking f=
or prior releases.</div><div><br></div><div>I can create JIRA tickets for th=
e two tasks listed above, if there are no objections.</div><div><br></div><d=
iv>Rich</div></div></div></body></html>=

--Apple-Mail-6F7075C1-4250-4051-A49B-389F1481B29E--


--===============0307365839039119120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0307365839039119120==--
