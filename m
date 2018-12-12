From: Kevin Wolf <kwolf@redhat.com>
Subject: Re: xen_disk qdevification (was: [PATCH 0/3]
 Performance improvements for xen_disk v2)
Date: Wed, 12 Dec 2018 13:03:22 +0100
Message-ID: <20181212120322.GA5415__43585.911152377$1544616129$gmane$org@linux.fritz.box>
References: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
 <20181102110412.GD7521@dhcp-200-186.str.redhat.com>
 <20181212085951.GA7604@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0549453645388623633=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UI0V=OV=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1gX3Ee-0007NF-4K
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:03:28 +0000
In-Reply-To: <20181212085951.GA7604@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, Tim Smith <tim.smith@citrix.com>, armbru@redhat.com, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============0549453645388623633==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 12.12.2018 um 09:59 hat Olaf Hering geschrieben:
> On Fri, Nov 02, Kevin Wolf wrote:
>=20
> > A while ago, a downstream patch review found out that there are some QMP
> > commands that would immediately crash if a xen_disk device were present
> > because of the lacking qdevification. This is not the code quality
> > standard I envision for QEMU. It's time for non-qdev devices to go.
>=20
> Do you have that backwards by any chance? IMO the presence of assert()
> contributes to bad code quality, not the drivers that trigger those
> asserts.

You like shooting the messenger, it seems? Bugs aren't bad, only
catching them is?

But anyway, in this case, I seem to remember it was a plain old
segfault, not a failed assertion.

Kevin

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcEPkKAAoJEH8JsnLIjy/WfOkP/ilV8ovJG80SyTXbBf5iGlTf
92OkHNDm8N+VfVuMFTCXiaIkkwCFbtvDKfI3LYUngh7PgIevZCYJWgjOQRJl7pZi
ki4Fptcei2B7kLgtKBCECQEpPUaycTHpqVlSsPBBJ7q8EMH7by7DEs8oH7AvxJNx
tfdbhESKNQKrj4igZuq6VwpwyqOOyrl//CKkGon8Wsz5NiHmww9e4jxcH3gIjx+U
BFwaB7NP8XjsbDncHzp9Z+p4G3wasbymy9Hq8GM9ujyg/XJwgBGfAEcm6VzGCaO2
ufUumuxkHlu8HCqtaG3Yw2RHzGtzMJ92GUJj2k4apuXQf5sZnE1OYxq0djN7JGrm
Y/ie86jw+jONwFNn1CVC/h9UCFOrkaPNvxstes2UxBb3jESpRnUtEdIEsWRyNPfH
Cw9DC35Qww3o52R6sjoy6HlN3xeu6jEnc+cP8WDVONYwmpePXZQ7Lg0BWArAgkrS
FyWUWnGZKUVeTcI4/SthtN5Jw3UTsF3KFklDPvVm7TQ/3YxVHjtsSdOaVPzCT5pH
xc9TBuso6i827+WRre6hGSgQw5E15wjORT4/xaD8tEy8vz4HwUQ5bKyQDTGXouOt
fKJGQjPwszI1RQddoZdNpJdBLLxTs54vxtGEZXbX6o02HfwqAoQBEhOJlBhNKSuY
BmN8CKru3jSU5bvKKyVX
=795z
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--


--===============0549453645388623633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0549453645388623633==--
