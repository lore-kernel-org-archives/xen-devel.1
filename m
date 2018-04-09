From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v8] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Mon, 9 Apr 2018 16:55:12 +0200
Message-ID: <20180409162608.2be5cb80.olaf@aepfle.de>
References: <20180401202958.9173-1-olaf@aepfle.de>
 <5ACB92A902000078001B9A2B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4356475384031282166=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ACB92A902000078001B9A2B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3Jl?= =?UTF-8?B?Y2tp?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============4356475384031282166==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/VKYJbqzmLUnx.0IjYyp.8.f"; protocol="application/pgp-signature"

--Sig_/VKYJbqzmLUnx.0IjYyp.8.f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 09 Apr 2018 08:19:53 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> Is there any guarantee that old hypervisors will send this field as zero
> (rather than some random value)? If so, I think this should be said
> explicitly in the commit message, together with the fact that you
> re-use padding fields.

I have to double check, but I'm sure the whole size of the struct is initia=
lized with zero. The commit message already has "Existing padding fields ar=
e reused to store vtsc_khz_tolerance as u16."

Thanks,

Olaf

--Sig_/VKYJbqzmLUnx.0IjYyp.8.f
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWst+0AAKCRBdQqD6ppg2
fhhMAJ9aenrH61jzs38fuJzg2OofpJRogACgsNvjTjzDauIwApRd+UiRGM+vVvM=
=0K5k
-----END PGP SIGNATURE-----

--Sig_/VKYJbqzmLUnx.0IjYyp.8.f--


--===============4356475384031282166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4356475384031282166==--
