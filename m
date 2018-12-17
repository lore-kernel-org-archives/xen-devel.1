From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Race condition on device add hanling in xl devd
Date: Mon, 17 Dec 2018 14:23:41 +0100
Message-ID: <20181217132341.GB5040@mail-itl>
References: <20181216014743.GA5040@mail-itl>
 <20181217094059.rvoptuzp6im52jyp@mac>
 <20181217120001.GB23474@mail-itl>
 <20181217121855.zsrn6fvliz4f5yul@mac>
 <20181217122315.GC23474@mail-itl>
 <20181217130534.6sdlcywutzcwzw2d@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7611970391719932543=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gYss8-0003oV-AO
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 13:23:48 +0000
In-Reply-To: <20181217130534.6sdlcywutzcwzw2d@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7611970391719932543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2018 at 02:05:34PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Dec 17, 2018 at 01:23:15PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Dec 17, 2018 at 01:18:55PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, Dec 17, 2018 at 01:00:01PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Mon, Dec 17, 2018 at 10:40:59AM +0100, Roger Pau Monn=C3=A9 wrot=
e:
> > > > > On Sun, Dec 16, 2018 at 02:47:43AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > A workaround could be implemented in hotplug script itself - wa=
it for
> > > > > > the device there. I'm not sure how proper solution could look l=
ike. Some
> > > > > > synchronization between xl devd and the kernel (like xl devd mo=
nitoring
> > > > > > uevents)?
> > > > >=20
> > > > > There's already a synchronization mechanism, libxl waits for the
> > > > > backend to switch to state 2 (XenbusStateInitWait) before running=
 the
> > > > > hotplug scripts [0].
> > > > >=20
> > > > > Maybe netback sets state 2 before creating the backend device?
> > > > >=20
> > > > > It looks to me like the backend needs to be sure everything neede=
d by
> > > > > the hotplug script is in place before switching to state 2.
> > > >=20
> > > > I've done some more tests and I think that's something else. I've a=
dded
> > > > a loop waiting for /sys/class/net/$vif to a hotplug script, but it =
timed
> > > > out (5s). I don't see _any_ kernel messages related to the device.
> > > >=20
> > > > It may be some bug in nested virtualization in KVM...
> > >=20
> > > In your message you said you have also observed this behavior when
> > > running on bare metal, so it's likely not related to nested
> > > virtualization?
> >=20
> > Yes, but on bare metal is so hard to reproduce (like 0.1% or even less
> > startups), I'm not really sure if that was the same problem, as the
> > problem doesn't leave that much logs...
>=20
> I'm not very familiar with netback, but I think it's indeed possible
> for netback to switch to state 2 without having created the vif.
> Netback switching from state 1 -> 2 seems to be solely controlled by
> the frontend state (see frontend_changed).

Isn't frontend_changed guaranteed to be called after netback_probe?

> I think the patch below could solve this issue, but I haven't even
> compile tested it, could you give it a spin?
>=20
> I would also like to hear the opinion of netback maintainers, since I
> might be completely wrong.
>=20
> Thanks, Roger.
> ---8<---
> diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/x=
enbus.c
> index cd51492ae6c2..791c2c0b788f 100644
> --- a/drivers/net/xen-netback/xenbus.c
> +++ b/drivers/net/xen-netback/xenbus.c
> @@ -427,6 +427,10 @@ static int netback_probe(struct xenbus_device *dev,
>  	if (err)
>  		goto fail;
> =20
> +	err =3D xenbus_switch_state(dev, XenbusStateInitWait);
> +	if (err)
> +		goto fail;
> +
>  	return 0;
> =20
>  abort_transaction:
> @@ -650,7 +654,10 @@ static void frontend_changed(struct xenbus_device *d=
ev,
> =20
>  	switch (frontend_state) {
>  	case XenbusStateInitialising:
> -		set_backend_state(be, XenbusStateInitWait);
> +		if (dev->state =3D=3D XenbusStateClosed) {
> +			pr_info("%s: prepare for reconnect\n", dev->nodename);
> +			set_backend_state(be, XenbusStateInitWait);
> +		}
>  		break;
> =20
>  	case XenbusStateInitialised:
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlwXo14ACgkQ24/THMrX
1yw/sAf/bkTGQkI79oaKD56PqYhuhWuwP+wv9FQXlB0v3iN7Z+vXp1okcl7y4570
2DrwvWdwOG1hG+lLbHP6r8wLxitH+cihPCo9Xb2GrUhzozY22Gj0XgzHSqy/DDCQ
ye7GwZK8QakYfsF3OZVz4N14gP3oTnMLGyUBn56FUuim5KXKqNkpn5lU8xpBg8PZ
2U+BmgSR9ihtyMzC69952JwCS6npwM7GSY3gRWzUavodzTuccuofJVg/WvIfTfTr
oWJjPkVZPpDkaGQt/IPz4WVyzPJCyYOVTYDhWqpcSG3EBHWifB9YLJnIhNLhzrxY
05h15fntsIT9+ZxQ0imOT5wM5I6k6w==
=xDAg
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--


--===============7611970391719932543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7611970391719932543==--
