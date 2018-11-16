From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 04/18] xen/arm: While a domain is suspended
 put its watchdogs on pause
Date: Fri, 16 Nov 2018 23:40:20 +0100
Message-ID: <63d7f87653a37dcbf71823f8123e3b00239662d4.camel@suse.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-5-git-send-email-mirela.simonovic@aggios.com>
 <5BE9684802000078001FADC0@prv1-mh.provo.novell.com>
 <CAKPH-NgJ=YFcdQtL4iN3RbFTLyiV7VgHWo1YVZw4qA5Sh5MtHw@mail.gmail.com>
 <5BE99AD802000078001FB100@prv1-mh.provo.novell.com>
 <CAKPH-Nhnvc4VMtD5OL1KZwfm5VbVMaHwb7fX5zf45oNvaps7Sg@mail.gmail.com>
 <b535914c-2085-c5d5-137b-bc728bfcf4e9@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4096656859514387272=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nXWO=N3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gNmmh-0004Az-Sh
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 22:40:19 +0000
In-Reply-To: <b535914c-2085-c5d5-137b-bc728bfcf4e9@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Dario Faggioli <dfaggioli@suse.com>, Xen Devel <xen-devel@lists.xen.org>, MirelaSimonovic <mirela.simonovic@aggios.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4096656859514387272==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7R/CGdkQfehhvdBbTKF2"


--=-7R/CGdkQfehhvdBbTKF2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-11-12 at 15:33 +0000, Andrew Cooper wrote:
> On 12/11/18 15:31, Mirela Simonovic wrote:
> >=20
> > Thanks, now it's clear. We need to change the type for
> > watchdog_timer
> > to be the derived structure of timer that additionally contains
> > 'suspended' variable. That makes sense, we'll do so.
>=20
> Why do you need a suspended variable?  Stash the frequency the guest
> requested on the last hypercall, and fully kill/re-create the timer
> on
> suspend/resume.
>=20
I *think* what they want is something like: when, at time t1, a domain
is suspended, it has a (watchdog) timer armed, which was going to
expire and fire in 13.2 ms (i.e., at t1 + 13.2ms); when, at time t2 >>
t1, the domain is resumed, that (watchdog) timer should fire in 13.2
ms, i.e. at t2 + 13.2ms.

This being said, I don't see a behavior like this terribly useful for a
whatchdog either (but I may be missing something).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-7R/CGdkQfehhvdBbTKF2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvvR1QACgkQFkJ4iaW4
c+5+QhAAsWBIVnmYvcFhZZeNwBufmxcjBSfSVc/stqh2ZKQFqJU1Jtfo8LUKIGTK
ArCDSC4e7hNkvKIiPgnZ9LO8fMuKUA9p8Z+aIg3DwUuGOji0eSC5xnu/6I6eabcl
Zue7gYr2PZWDh9e4j3J0p1de2gIRXDw5K+uMjV3zcGbHdXx5zGq5MZ5045lR9DpU
Ulbjt/61qPvn30OM3CTU7vWSj1gzb2KUXwwB968ZDC42DwW6DOJF4XNHheX5oBQy
n3WBCUpeIAOwm/kkzfQ0yVgnC6feV2v1DWqJB/8xIIKNABdxnBNgvYjdQuEYOC63
9uWV0b5XeNR2nGcvzLAUjPkvwjReHs6Ij2+b+cbVClOEfsdST5a14S0IE27tNTjM
3UNUckPIdhEFA7zqE36Nj/vM8RB8iT0r6WaTxdyY0vMdvgD5CyNi+qyn08HulUcd
bkZbAitCx8zRDxxqw9zWnxz84tZqgxJ4/WP+glCzBbEh01NobeCvnfMQ/VCfqzjx
wSCKsNYf2bfTznOxwk1p+phDlDJQjkzjNIy8/ROLbRD3iIjfzYIIuXH2Bw/xKJEv
BQvcZqptRMc2oax72UwkDLRzEKGTVtmfngt7NMK0lIyN79A3zamiAaGtbmyyItdl
/pZ4vECX36AskZUuoicYN85p1mkjCprC++5zP3tNHCNCbcwtGzk=
=8UcS
-----END PGP SIGNATURE-----

--=-7R/CGdkQfehhvdBbTKF2--



--===============4096656859514387272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4096656859514387272==--
