From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 18:59:53 +0100
Message-ID: <ecf2c1ac2bff1292836ad6fc9675316e20b60525.camel@suse.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
 <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
 <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
 <bb88ca15-381c-014c-2f6c-e5de33b4b15a@gmail.com>
 <CAF3u54BcT=-wnGKaDY1c3AvaDrV7eiiiedjaqbsavsQ4YaDWug@mail.gmail.com>
 <b5315a79-26a9-7542-2c73-740883280275@gmail.com>
 <1ca5735f-638a-6949-6a15-2fe4aa665114@arm.com>
 <a53d1bd000d3c6af44ed02997d0484405875aab2.camel@suse.com>
 <4dcdf98b-aed4-8b5a-ced8-9c982b5ee7dd@gmail.com>
 <a2365222cf2beec45fc64a0da90f4249b58cc6fe.camel@suse.com>
 <0131d16f-2ffd-b363-eb25-3289fed1e3ec@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8077341586709427791=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SVFL=OV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gX8nU-0004iA-TF
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 17:59:48 +0000
In-Reply-To: <0131d16f-2ffd-b363-eb25-3289fed1e3ec@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org


--===============8077341586709427791==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4ro4X9h1+G9Kp3kLojpN"


--=-4ro4X9h1+G9Kp3kLojpN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-12-12 at 19:32 +0200, Andrii Anisov wrote:
> On 12.12.18 19:10, Dario Faggioli wrote:
> > I think only bisection could shed some light on this. And it would
> > be
> > wonderful if you could do that, but I understand that it takes
> > time. :-
> > /
> Well, bisect might help. But I'm really confused why MemTotal may be
> reduced.
>=20
Yeah, and although difficult to admit/see the reason why, I think this
looks like it is coming from something we do in Xen. And since you say
you have an old Xen version that works, I really see bisection as the
way to go...

> > Are you absolutely sure about that? That is, are you "just"
> > assuming
> > the scheduler won't move stuff, or have you put some debugging or
> > printing in place to verify that to be the case?
> Being honest, I did not check for exactly this setup. I verified it
> for 4.10.
>
Not sure I'm getting. Are you saying that you somehow verified that on
4.10 vcpus don't move? But on 4.10 you have pinning that works, don't
you?

Or are you saying you've verified that vcpus don't move, on 4.10, even
without doing the pinning? If yes, can I ask how?

As for staging, I really can't tell, as indeed there would be no need
for them to move, but they actually could, for a number of reasons.

So, unless you, like, put printk()-s (if you can) or ASSERTS() when v-
>processor changes, I wouldn't take that for granted. :-(

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-4ro4X9h1+G9Kp3kLojpN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlwRTJoACgkQFkJ4iaW4
c+5Xpg/+NoAIRs8l872B25wNBlvyP7r8pxN2I4AC97k21E1bs0rieaTKJcSnJwvL
fPW5iBl2CGmEj1xmq+Wu4RIzSJUBa/nLr3lRngyumLahqKYtQL9UYOsEHbw0IdJf
/QhUfanMnYYIVNPfVC3e7GMCP82/s/YdsnEdeU0lVqVHApaFGzxBDOWRXLCf8Y6Y
LECT8jLo1CEwJcx1baIqFbRpYaya8DdnCaqUi6CjUfPLto3BSSkw6dLqsbPBZYax
hIw9CheZMlnEmB2+AVHo5XBV55Ew7O/UOphU8nLzI+YFta/t+AOie4Aq/kw9/G0W
7dLWvXNuI0AuM7TvYLKcMlV/3AWsT41MqbkvcJCjvP5GATS8Txavd/X+jB+sp6ma
3zJQkV2PyKXXk/25+iXNt9uWfhOw6Up6+xXIOgW4rvrjGlBv3wnB62n88Ec0++nO
rzlX8lbvUpT9uz/0uHAVqLFSwAIetQDYRknLdJ6gV6lkES3sfZvlRKzwF+Fvzad0
a3vf/KuZ2Hh1CvR95SCG20amc9ECFJlspCFLPmL4EUVd5nLdqY3IUViccGxnXcvV
sXkPKO8jGveQDIkUxW1h6/I7D/MgjRVDVZcsadd/FkfD46E/GIulzS9E3fVRKL9v
ef1RDGm/RAt10a5WzLFM0SQigjSQdI4UcqgdfsgTh5akfAQ+aXA=
=5tc/
-----END PGP SIGNATURE-----

--=-4ro4X9h1+G9Kp3kLojpN--



--===============8077341586709427791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8077341586709427791==--
