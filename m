From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: Remove d->is_pinned
Date: Mon, 01 Apr 2019 15:37:20 +0200
Message-ID: <70a9580a3906846ced3412deb298ebcdeecbaad8.camel@suse.com>
References: <1554113345-15068-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1118323511981883338=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554113345-15068-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1118323511981883338==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IXbnRcQCvCF/k86pcknt"


--=-IXbnRcQCvCF/k86pcknt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-01 at 11:09 +0100, Andrew Cooper wrote:
> The is_pinned field is rather odd. =20
>
Indeed. And I'm very, very happy to see it going away.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-IXbnRcQCvCF/k86pcknt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyiFBAACgkQFkJ4iaW4
c+46sRAA7mrCApre55dpxQ7nJ+dykhRtSpWlFS/nWnM6LJ4vBrYQZwRqxwu+End9
jvRjhu18JTbB6zzqIyVIIwzU+L3FOWpny3G9L3EUPauSEDWb9r1PS3YLxKWq4x3L
Ib8n3jgq1hFIJgQA1VLby8O38Zl2mrXgoMii/xkGVl+ztl5jXARcy+NFi1rx7oK7
XC2nuSzJa/XFbTIKxnt4P5BDILmt3zx+m1rxY8qSglp7cZpzMpQeW72hPWBdY5EI
shl88OOOvBOEDQQyg9Hwls2eFvs9oqA2W6/LYUfh5XYS0HrMSIydDTV5glGoCY+E
HPNEtrMiE6SCoNYoUAR6FTiLNUmMtqWFyDLmP+gwenZXhgtT2ZrsUSkFhtfYKvuj
JJshdOXEOJz23f9VTSCDADTMit/X+vPuppaOZjCxehSFrWcbAqEGKM0eXPXvdCAh
zjnGbNuaoprk0UHhINXrv8eMM7GBX2I8Is54slqsH1OkUtqUvggxdl/0SQFBmURs
IBnrp8cdZ5OGOthxkeyVYDCT184kYflfke0shes/erDvlmV1YDEPMPDJcrmQ/J63
lW6CIPbgHE+Y8FrMjQ+zJOZ0EhvfAwgxw8GCdUeSbbyRHbap583FyhhA/+X9HWVi
yKi+N+fUUEasXdg4DGyy+LemRbGWJy9a6oMYDGdkYAc7IS+Hwlg=
=LMMJ
-----END PGP SIGNATURE-----

--=-IXbnRcQCvCF/k86pcknt--



--===============1118323511981883338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1118323511981883338==--
