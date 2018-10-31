From: 'Marek =?utf-8?Q?Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libvchan: create xenstore entries in one
 transaction
Date: Wed, 31 Oct 2018 11:43:13 +0100
Message-ID: <20181031104313.GB32486@mail-itl>
References: <20181030234905.26142-1-marmarek@invisiblethingslab.com>
 <e8b0cc9d963d4afca2c9cd140cfe8567@AMSPEX02CL03.citrite.net>
 <20181031101703.emdlgaazvxsyq6jg@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2426532845325980101=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zqf5=nl=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gHny3-0003a8-1J
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 10:43:19 +0000
In-Reply-To: <20181031101703.emdlgaazvxsyq6jg@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2426532845325980101==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2018 at 10:17:03AM +0000, Wei Liu wrote:
> On Wed, Oct 31, 2018 at 10:08:26AM +0000, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Xen-devel [mailto:xen-devel-bounces@lists.xenproject.org] On Be=
half
> > > Of Marek Marczykowski-G=C3=B3recki
> > > Sent: 30 October 2018 23:49
> > > To: xen-devel@lists.xenproject.org
> > > Cc: Wei Liu <wei.liu2@citrix.com>; Ian Jackson <Ian.Jackson@citrix.co=
m>;
> > > Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > > Subject: [Xen-devel] [PATCH] libvchan: create xenstore entries in one
> > > transaction
> > >=20
> > > This will prevent race when client waits for server with xs_watch - a=
ll
> > > entries should appear at once.
> >=20
> > Watches should be put on the "state" key to avoid this kind of thing. T=
hat key should always be the last thing modified and hence there should nev=
er really be the need for xenstore transactions at all.
>=20
> AIUI libxenvchan doesn't have a "state" key. We can introduce one now
> but we still need to handle old code which doesn't know about the new
> key.

Wei is right, there is no "state" key in libxenvchan.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvZh0EACgkQ24/THMrX
1yxbRwf9EqyrNjc4THZLMiOfEuN723bhpnPghFdwoHeQua1bOex841uPSneMzpgt
Xyf51DDW2Y8WVeDGMQfW8k6L0jLa7FBLGvi0HqGswH/cOs/RDas6y0zoh/KACLx9
fXqeke/Kr8wmZeYHJcKpUrqT4RgLhOLffcq3ci9yUSGyLOSBmHNxDNm/b3ijTk4E
BYbGPeLptkOwx22ynXxuaz39vjalFn0z5Cl2T6hoswEAGEir51y6sAkPhDLq1ucL
7h3+MS+n4EWniCvQqCj/7c4bpIQan4khPZfNc5zJStvobNkh/+agIZGRTK2zeRQ4
CKQ4HQ5emrgcNM+Ix8zcENIWG6dKQw==
=BcSr
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--


--===============2426532845325980101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2426532845325980101==--
