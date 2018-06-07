From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 7 Jun 2018 23:05:37 +0200
Message-ID: <20180607210537.GA18894@aepfle.de>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <5B1933AE02000078001C91DA@prv1-mh.provo.novell.com>
 <20180607154743.0c8a808e.olaf@aepfle.de>
 <5B1944D902000078001C9279@prv1-mh.provo.novell.com>
 <20180607164949.7d9b3890.olaf@aepfle.de>
 <5B19477002000078001C9295@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4040399772731887317=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B19477002000078001C9295@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org


--===============4040399772731887317==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 07, Jan Beulich wrote:

> >>> On 07.06.18 at 16:49, <olaf@aepfle.de> wrote:
> > Am Thu, 07 Jun 2018 08:44:41 -0600
> > schrieb "Jan Beulich" <JBeulich@suse.com>:
> >> The re-use of the field is acceptable only if all existing senders reliably
> >> fill zero in there.
> > How do we know all senders? I just know about write_tsc_info from xen-4.6+.
> I don't think we care about senders other than ones using libxc, so
> by knowing whether all libxc versions conform to the requirement,
> we could declare we're fine.

Yes, I think we are fine. And if migration from pre-4.6 is supported
anyway is another question. Most likely the answer is no.

Olaf

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWxmeHQAKCRBdQqD6ppg2
fmNmAKCg9/j9CQrzkAuw8KGzxQ9bVTQQmgCfampF1DqW1rTjH+iZPgWsN5tB6d4=
=MImf
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--


--===============4040399772731887317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4040399772731887317==--
