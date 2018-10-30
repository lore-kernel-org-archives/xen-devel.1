From: Vladimir Botka <vbotka@gmail.com>
Subject: Re: [Xen-users] [XEN][ARM] WiFi bridge creation
Date: Tue, 30 Oct 2018 08:09:29 +0100
Message-ID: <20181030080929.6d04a875@planb.netng.org>
References: <CAFsJcmYQRttza046T09sCBZzEs7pm31uxawQJHxsQySpyELkBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8450081223926142232=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m0b/=nk=gmail.com=vbotka@srs-us1.protection.inumbo.net>)
 id 1gHO9i-0003rY-Eg
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 07:09:38 +0000
In-Reply-To: <CAFsJcmYQRttza046T09sCBZzEs7pm31uxawQJHxsQySpyELkBQ@mail.gmail.com>
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

--===============8450081223926142232==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mo1YzncGbE9eW+xTZ9C8CrK"; protocol="application/pgp-signature"

--Sig_/mo1YzncGbE9eW+xTZ9C8CrK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Oct 2018 10:03:22 +0530
Vikram K <vikram.k@pathpartnertech.com> wrote:

> Hello,
> We are using Hikey960 with Debian as Dom0 and DomU. This board has only
> WiFi interface. We want to create bridge between Dom0 and DomU so that Do=
mU
> has internet access. We tried to create bridge using brtcl command, but it
> is not working. Please provide pointers.

AFAIK, it's not working
https://marc.info/?l=3Dlinux-wireless&m=3D136743495526905&w=3D2
"There is a proposed fix that is included in OpenWrt"
https://marc.info/?l=3Dlinux-wireless&m=3D145591129008322&w=3D2
More details are avilable in OpenWrt WiKi
https://wiki.openwrt.org/doc/recipes/relayclient

HTH,

-vlado

--Sig_/mo1YzncGbE9eW+xTZ9C8CrK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbaThuYKQgbbmDrVkkNGZEo7UTwEFAlvYA6oACgkQkNGZEo7U
TwFZhwf/dOcd+IDxdddp9Ybi5WFR6jJ/VtxuUCM/TIGeco9LsZUmj6B7QifkXg+Z
2Nr2QnlZNAEtR29UBjMUZ1UOo3QVNGJ58ekfzZaAYSr+131fb2Czv+reDj0/gPAB
RbTWJBxlY3gFqB9guuCECVbzQCVlCz4arxQYcoyz8Z9DUWjhCUUmmGRrfTlmMD6T
22viM6KouvZp8f8me34uVlKiXaUNgft52VVbWV64vn8oL8/HDNr1hr+GtQgHrj/h
oAvjSnFB2EzULZDRXitZ4wlDjaKjWPmJRxR5x3AVgYGJl3uIODH8Z/d0V2FdsNOV
dqZqyeDpm+I2lf0U+zfgeSiUngVKYg==
=heeM
-----END PGP SIGNATURE-----

--Sig_/mo1YzncGbE9eW+xTZ9C8CrK--


--===============8450081223926142232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8450081223926142232==--
