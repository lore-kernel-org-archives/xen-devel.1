From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v4] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Wed, 14 Mar 2018 12:07:19 +0100
Message-ID: <20180314120719.2f6964df.olaf@aepfle.de>
References: <20180309141039.31691-1-olaf@aepfle.de>
 <20180313170425.wnnpojcogqz24jih@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2926159786634959849=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180313170425.wnnpojcogqz24jih@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

--===============2926159786634959849==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/x1Q7G3i_JkCeCiPCc34tFVt"; protocol="application/pgp-signature"

--Sig_/x1Q7G3i_JkCeCiPCc34tFVt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 13 Mar 2018 17:04:25 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> There were questions on previous patches as to why this approach is
> better than what we already have. Are those comments addressed?

Which questions? I do not see any.
What we have is tsc_mode=3Dnative, which avoids emulation on the same class
of hardware, like this patch does. But it also avoids emulation on a
different class of hardware, which this patch fixes.

Olaf

--Sig_/x1Q7G3i_JkCeCiPCc34tFVt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWqkCZwAKCRBdQqD6ppg2
fgSaAJ0fCFt0fojLhdW5MWe+bwBBF0MjgACg8ZVEMd1z+4O9VTFghq0nFxZXYJk=
=/mw9
-----END PGP SIGNATURE-----

--Sig_/x1Q7G3i_JkCeCiPCc34tFVt--


--===============2926159786634959849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2926159786634959849==--
