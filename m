From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Fri, 13 Apr 2018 12:38:13 +0200
Message-ID: <20180413103813.GB14363@aepfle.de>
References: <20180411204359.GP7177@aepfle.de>
 <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
 <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
 <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
 <20180412144553.74da01bc.olaf@aepfle.de>
 <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
 <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
 <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
 <070DC511-31E1-4C0C-BFD0-C49590FDE54B@citrix.com>
 <4533b7d93e3249dad4f830cea2c27d3e3088e9b6.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8123373442005772739=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4533b7d93e3249dad4f830cea2c27d3e3088e9b6.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============8123373442005772739==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 13, Dario Faggioli wrote:

> Yes. In fact, Olaf, I still think that doing a run with George's RFC
> applied, would be useful, if only as a data point.

First tests indicate that this series fixes the bug.

Olaf

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtCIkgAKCRBdQqD6ppg2
fqoWAJwJCiNzn1WMqXlaFxhSqb6hRx7nUQCdHCCAHLXfBPlwuFFrXO2HIOTTJI8=
=5nyT
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--


--===============8123373442005772739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8123373442005772739==--
