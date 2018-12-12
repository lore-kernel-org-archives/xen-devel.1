From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 18:10:10 +0100
Message-ID: <a2365222cf2beec45fc64a0da90f4249b58cc6fe.camel@suse.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2236752124387123297=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SVFL=OV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gX815-0007AT-5h
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 17:09:47 +0000
In-Reply-To: <4dcdf98b-aed4-8b5a-ced8-9c982b5ee7dd@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Julien Grall <julien.grall@arm.com>, Julien Grall <julien.grall@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>, Milan Boberic <milanboberic94@gmail.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org


--===============2236752124387123297==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iEi05gP7Mc3lLpFjZyu2"


--=-iEi05gP7Mc3lLpFjZyu2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-12-12 at 11:39 +0200, Andrii Anisov wrote:
> Hello Dario,
>=20
Hi,

> On 11.12.18 18:56, Dario Faggioli wrote:
> > Also, what about Xen numbers, sched=3Dnull.
> Didn't check, will put on the list.
>=20
:-)

> > I don't expect much improvement, considering pinning is in-place
> > already.
> Actually, I faced a strange issue with explicit pinning of Dom0.
> Didn't sort out the cause yet. And Julien says it is not reproducible
> on his desk.
>
Ah, yes... I've seen the thread. I haven't commented, as it is really,
really weird, and I don't know what to think/say.

I think only bisection could shed some light on this. And it would be
wonderful if you could do that, but I understand that it takes time. :-
/

> But yes, with VCPU number less than PCPUs - there is no migration of
> Dom0 VCPUs.
>=20
Are you absolutely sure about that? That is, are you "just" assuming
the scheduler won't move stuff, or have you put some debugging or
printing in place to verify that to be the case?=20

I'm asking because, yet, in theory that is what one would expect. But,
as I think you know very well, although in theory there is no
difference between theory and practice, in practice, there is. :-)

Regards,
Dario

> [1]https://lists.xenproject.org/archives/html/xen-devel/2018-12/msg00435.=
html
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-iEi05gP7Mc3lLpFjZyu2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlwRQPIACgkQFkJ4iaW4
c+7Xnw/+LQTHE6wQRDwD6vtP2TQk7PtJ0kDf4kO3QAkisDJ3w0IdI27G+ArioeUG
6VwRuJzYA0aY3QDV0jAbxc1OfF2mg4wBkQoRXFfi5To5Bdcv6RyJXCQhmMFwJ6SX
tvKOAT33dZfVfZisUfao+FDnUovjmqlwjngiEBaP5t5HXRqQMA8D7W6jAOJv5xf7
D51Tq30emZYOVc3CxJBj6Jv7zlIzzwisqrl5nqmx9N8o+EX+V37ISpyl7t2qJllS
hMICl51yqNOhu++DSn6x4Vw5q8l4/xBwd8GcpHbMPgvNeT3D6vQ/IXUaYaTMFWC6
aJE0+qlXcUDg71n1mxyYgxgN9h5yAkVSwN2m4VYebesoIjMBZCSXTP3utvffV25g
JsPlaj3uavv/VBkf5MgTnxh/QocdTzWML8fxP4VJue/qTKh4E2pQDF7JrSI/j2fj
NQjVaqp4zeH9m/xW2nI7lKSOtKrjapjhU7HzAfvARRny3JujID6vLDwcObS+Itmd
4nhUt+c3PSogzfLPz1+MYqROSuEK5vozT3S3m//stjsofd1havettW2S5retAdUw
CyGVk61gQyQwIUN83g3sdpMLvY9xHs73QS8+K5HHmC1epcoRU+iXrCcWsqW8eshf
k7AUDg9lTP41h9RyA1qO8wEyxjcnuaWvp3fFGfjL9Tzk1TqrzYA=
=zahY
-----END PGP SIGNATURE-----

--=-iEi05gP7Mc3lLpFjZyu2--



--===============2236752124387123297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2236752124387123297==--
