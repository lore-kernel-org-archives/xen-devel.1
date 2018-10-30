From: Vladimir Botka <vbotka@gmail.com>
Subject: Re: [Xen-users] [XEN][ARM] WiFi bridge creation
Date: Tue, 30 Oct 2018 16:05:40 +0100
Message-ID: <20181030160540.01ef6a3b@planb.netng.org>
References: <CAFsJcmYQRttza046T09sCBZzEs7pm31uxawQJHxsQySpyELkBQ@mail.gmail.com>
 <20181030080929.6d04a875@planb.netng.org>
 <CAFsJcmZFrpmattTzwkijF7Wz4cgXErg0090QBx1S-zJCRNnScg@mail.gmail.com>
 <20181030113408.74525d80@planb.netng.org>
 <CAFsJcmbcCrpJkXqGs3mu=nMZA=2DNcOgf+s-jnNbWMAi1+Ri6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2765477536205730466=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m0b/=nk=gmail.com=vbotka@srs-us1.protection.inumbo.net>)
 id 1gHVaU-0000l7-Ib
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 15:05:46 +0000
In-Reply-To: <CAFsJcmbcCrpJkXqGs3mu=nMZA=2DNcOgf+s-jnNbWMAi1+Ri6A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vikram K <vikram.k@pathpartnertech.com>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2765477536205730466==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/joo9MJVwU596C0dnwmCS3I8"; protocol="application/pgp-signature"

--Sig_/joo9MJVwU596C0dnwmCS3I8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

> > > > > Hello,
> > > > > We are using Hikey960 with Debian as Dom0 and DomU. This board has
> > > > > only WiFi interface. We want to create bridge between Dom0 and Do=
mU
> > > > > so that DomU has internet access. We tried to create bridge using=
 brtcl
> > > > > command, but it is not working. Please provide pointers. =20

> > > > AFAIK, it's not working
> > > > https://marc.info/?l=3Dlinux-wireless&m=3D136743495526905&w=3D2
> > > > "There is a proposed fix that is included in OpenWrt"
> > > > https://marc.info/?l=3Dlinux-wireless&m=3D145591129008322&w=3D2
> > > > More details are avilable in OpenWrt WiKi
> > > > https://wiki.openwrt.org/doc/recipes/relayclient
> > > > -vlado =20

> > > Hi,
> > > As per below link, it is possible to share Internet via WiFi between
> > > Dom0 and DomU,.
> > > https://wiki.xenproject.org/wiki/Xen_in_WiFi_networks
> > > Tried the suggested solution using ebtables, but it did not work.
> > > * ebtables -t nat -A POSTROUTING -s 00:60:00:00:00:01 \
> > >               -j snat --to-source 00:60:aa:bb:cc:dd*
> > > In the configurations file we have added below configuration in DomU
> > > config file.
> > > * vif =3D ['mac=3D00:16:3e:64:b8:40']*
> > > Apart from that do we need to add any addition configuration? =20

> > NAT is a different story. Worked for me with Armbian(no XEN) and Atheros
> > 9280
> > couple of years ago. I used Ansible to configure it.
> > https://github.com/vbotka/ansible-linux-postinstall/blob/master/templat=
es/router1-iptables.j2

Vikram K <vikram.k@pathpartnertech.com> wrote:
> Thanks Vladimir.
> Can some one provide pointer/reference on how to use NAT to share WiFi
> between Dom0 and DomU.
> Followed the instruction provided in the below link, but no success.
> https://wiki.debian.org/BridgeNetworkConnections#Bridging_with_a_wireless=
_NIC

NAT is feasible. Follow the links and come back with specific questions in
an appropriate list, if needed. Wifi bridge is NO-GO at the moment.

A: Because we read from top to bottom.
Q: Why should I start my reply below the quoted text?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?  =20
A: The lost context.
Q: What makes top-posted replies harder to read than bottom-posted?
A: Yes.
Q: Should I trim down the quoted part of an email to which I'm replying?

-vlado

--Sig_/joo9MJVwU596C0dnwmCS3I8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbaThuYKQgbbmDrVkkNGZEo7UTwEFAlvYc0QACgkQkNGZEo7U
TwE3GggAkmkxB7z2C3HTTLZltUqMbjJwYg8dRmba/DRJjbmb0tipEniB4G3pZxgb
9hVrOzR56stt4ObOIAOOCVjLmAxOJUc7Hh7nrLmei7XQShAN8OJz+TJz3P2dvUah
WjbEzWv480g5r51vAMLdLFJ2+AXoFWOErZ+BLQSb1nW15si+kwgYok5HUjRb5Gdf
AEwNL8v9uEbgMlfLchQppkzvsFhiW55NQ4J4Yfkp3Oedl0cMnV7Oqn9KV7JpRPdE
E20xa2L4+cq7bMbdfX+CqVjFZOsL00jxo2xTykWKv/VrsXbjAZXhfA93ElqdokWP
uQce3YmKGfhf0rSe/HC9Ja3y1VaAiw==
=lAhS
-----END PGP SIGNATURE-----

--Sig_/joo9MJVwU596C0dnwmCS3I8--


--===============2765477536205730466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2765477536205730466==--
