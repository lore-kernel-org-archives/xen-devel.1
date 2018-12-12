From: Olaf Hering <olaf@aepfle.de>
Subject: Re: xen_disk qdevification (was: [PATCH 0/3]
 Performance improvements for xen_disk v2)
Date: Wed, 12 Dec 2018 09:59:51 +0100
Message-ID: <20181212085951.GA7604__26250.2542617314$1544605141$gmane$org@aepfle.de>
References: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
 <20181102110412.GD7521@dhcp-200-186.str.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0551161872194564193=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dC9x=OV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gX0N6-0002i5-2P
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 09:00:00 +0000
In-Reply-To: <20181102110412.GD7521@dhcp-200-186.str.redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, Tim Smith <tim.smith@citrix.com>, armbru@redhat.com, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============0551161872194564193==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 02, Kevin Wolf wrote:

> A while ago, a downstream patch review found out that there are some QMP
> commands that would immediately crash if a xen_disk device were present
> because of the lacking qdevification. This is not the code quality
> standard I envision for QEMU. It's time for non-qdev devices to go.

Do you have that backwards by any chance? IMO the presence of assert()
contributes to bad code quality, not the drivers that trigger those
asserts. It is bad enough that two QEMU releases went out while being in
bad shape.

Anyway, hopefully Paul or whoever will find the time and energy to
convert the code at some point.

Olaf

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXBDOBAAKCRBdQqD6ppg2
flgGAJ9WXSO2VhOaGfhsfJ9KkXKAyXmKPACeK/AMD6NcJF0i7xTcABZXPyfNRaI=
=eLgW
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--


--===============0551161872194564193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0551161872194564193==--
