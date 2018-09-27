From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Thu, 27 Sep 2018 10:39:36 +0100
Message-ID: <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============4853633143287771523=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Cc: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xensource.com, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org


--===============4853633143287771523==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FE3EE81C-D827-4BA6-BE98-08E666AA027A"


--Apple-Mail=_FE3EE81C-D827-4BA6-BE98-08E666AA027A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Adding a few people who have recently been working on PV drivers, as =
well as Julien
Lars

> On 27 Sep 2018, at 06:44, Omkar Bolla =
<omkar.bolla@pathpartnertech.com> wrote:
>=20
> Hi,
>=20
> I am using Debian as Domain-0 and Debian as Domain-U on Hikey960 =
platform(ARMv8) and using Xen-4.8 stable release. Here I want to create =
a PV frontend and backend to share memory between Domain-0 and Domain-U.=20=

>=20
>=20
>=20
> I used below link to create frontend and backend,
> https://fnordig.de/2016/12/02/xen-a-backend-frontend-driver-example/ =
<https://fnordig.de/2016/12/02/xen-a-backend-frontend-driver-example/>
>=20
> But I am facing below errors while adding device vdevb to xenstore.=20
> Below errors I am getting from xenbus_switch_state().
> vdevb vdevb-0: failed to write error node for device/vdevb/0 (13 =
writing new state)
>=20
> Please suggest me, How to create PV drivers.
>=20
> Thanks,
> Omkar B
>=20
> This message contains confidential information and is intended only =
for the individual(s) named. If you are not the intended recipient, you =
are notified that disclosing, copying, distributing or taking any action =
in reliance on the contents of this mail and attached file/s is strictly =
prohibited. Please notify the sender immediately and delete this e-mail =
from your system. E-mail transmission cannot be guaranteed to be secured =
or error-free as information could be intercepted, corrupted, lost, =
destroyed, arrive late or incomplete, or contain viruses. The sender =
therefore does not accept liability for any errors or omissions in the =
contents of this message, which arise as a result of e-mail =
transmission.
>=20
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel


--Apple-Mail=_FE3EE81C-D827-4BA6-BE98-08E666AA027A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Adding a few people who have recently been working on PV =
drivers, as well as Julien<br class=3D""><div>Lars</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 27 =
Sep 2018, at 06:44, Omkar Bolla &lt;<a =
href=3D"mailto:omkar.bolla@pathpartnertech.com" =
class=3D"">omkar.bolla@pathpartnertech.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)">Hi,</div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)"><br class=3D""></div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">I am using Debian =
as Domain-0 and Debian as Domain-U on Hikey960 platform(ARMv8) and using =
Xen-4.8 stable release. Here I want to create a PV frontend and backend =
to share memory between Domain-0 and Domain-U.&nbsp;</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br =
class=3D""></div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)"><br class=3D""></div><div =
class=3D"gmail_default"><br class=3D""></div><div =
class=3D"gmail_default"><span style=3D"color:rgb(11,83,148)" class=3D"">I =
used below link to create frontend and backend,</span><font =
color=3D"#0b5394" class=3D""><br class=3D""></font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394" class=3D""><a =
href=3D"https://fnordig.de/2016/12/02/xen-a-backend-frontend-driver-exampl=
e/" =
class=3D"">https://fnordig.de/2016/12/02/xen-a-backend-frontend-driver-exa=
mple/</a></font><br class=3D""></div><div class=3D"gmail_default"><br =
class=3D""></div><div class=3D"gmail_default"><font color=3D"#0b5394" =
class=3D"">But I am facing below errors while adding device vdevb to =
xenstore.&nbsp;</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394" class=3D"">Below errors I am getting =
from&nbsp;xenbus_switch_state().</font></div><div =
class=3D"gmail_default"><span style=3D"color:rgb(11,83,148)" =
class=3D"">vdevb vdevb-0: failed to write error node for device/vdevb/0 =
(13 writing new state)</span><br class=3D""></div><div =
class=3D"gmail_default"><span style=3D"color:rgb(11,83,148)" =
class=3D""><br class=3D""></span></div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)">Please suggest me, How to create PV =
drivers.</div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)"><br class=3D""></div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Thanks,</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Omkar =
B</div></div></div></div></div>

<br class=3D""><p class=3D""><span lang=3D"EN-IN" class=3D"">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN" class=3D""> </span>If =
you are not the intended
recipient, you are notified that disclosing, copying, distributing or =
taking any
action in reliance on the contents of this mail and attached file/s is =
strictly
prohibited<span lang=3D"EN-IN" class=3D"">. Please notify the
sender immediately and delete this e-mail from your system. E-mail =
transmission
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or =
contain
viruses. The sender therefore does not accept liability for any errors =
or
omissions in the contents of this message, which arise as a result of =
e-mail
=
transmission.</span></p>_______________________________________________<br=
 class=3D"">Xen-devel mailing list<br class=3D""><a =
href=3D"mailto:Xen-devel@lists.xenproject.org" =
class=3D"">Xen-devel@lists.xenproject.org</a><br =
class=3D"">https://lists.xenproject.org/mailman/listinfo/xen-devel</div></=
blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_FE3EE81C-D827-4BA6-BE98-08E666AA027A--


--===============4853633143287771523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4853633143287771523==--
