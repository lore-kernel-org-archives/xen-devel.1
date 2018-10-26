From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: Re: [PATCH] x86/efi: Do not insert timestamps in efi
 files
Date: Fri, 26 Oct 2018 13:11:28 +0200
Message-ID: <12e17c52-f1cf-10e9-7d00-e34fb54e6cd5@suse.de>
References: <7a88f5cb-8f0a-9974-8e84-990045cb8726@suse.de>
 <20181024134522.3295-1-bwiedemann@suse.de>
 <108D0A7C020000E4CA4B4E14@prv1-mh.provo.novell.com>
 <74F2501302000079CA4B4E14@prv1-mh.provo.novell.com>
 <5BD1B8AA02000078001F4A44@prv1-mh.provo.novell.com>
 <d9db83e2-3f03-78ff-b92c-85ca680b7924@citrix.com>
 <5BD1CE4802000078001F4AF7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2097616512558394129=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BD1CE4802000078001F4AF7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2097616512558394129==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Wts8Y2ay3BGkkKTjA76GUZzHMjSCw2bJC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Wts8Y2ay3BGkkKTjA76GUZzHMjSCw2bJC
Content-Type: multipart/mixed; boundary="XLKlgajG0r87E4bhRxBQjc0lz0OcrJMme";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
Message-ID: <12e17c52-f1cf-10e9-7d00-e34fb54e6cd5@suse.de>
Subject: Re: [PATCH] x86/efi: Do not insert timestamps in efi files
References: <7a88f5cb-8f0a-9974-8e84-990045cb8726@suse.de>
 <20181024134522.3295-1-bwiedemann@suse.de>
 <108D0A7C020000E4CA4B4E14@prv1-mh.provo.novell.com>
 <74F2501302000079CA4B4E14@prv1-mh.provo.novell.com>
 <5BD1B8AA02000078001F4A44@prv1-mh.provo.novell.com>
 <d9db83e2-3f03-78ff-b92c-85ca680b7924@citrix.com>
 <5BD1CE4802000078001F4AF7@prv1-mh.provo.novell.com>
In-Reply-To: <5BD1CE4802000078001F4AF7@prv1-mh.provo.novell.com>

--XLKlgajG0r87E4bhRxBQjc0lz0OcrJMme
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 25/10/2018 16.08, Jan Beulich wrote:
>>>> On 25.10.18 at 16:00, <andrew.cooper3@citrix.com> wrote:
>> For shipped binaries to customers, exactly when it was built is
>> irrelevant, whereas peoples ability to independently verify the
>> integrity of the binary is important.
>=20
> Correct, which is why I appreciate the _option_ of zapping the
> timestamp.

Adding an option for this, would make the (already somewhat ugly) patch
even more ugly, so I thought, that fixing it in binutils might be the
better way, because other projects will also want to create reproducible
PE binaries and we do not want to add such ugly patches to all of them.
=3D> https://sourceware.org/ml/binutils/2018-10/msg00279.html


Let's see what they say.

Ciao
Bernhard M.


--XLKlgajG0r87E4bhRxBQjc0lz0OcrJMme--

--Wts8Y2ay3BGkkKTjA76GUZzHMjSCw2bJC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iF0EARECAB0WIQRk4KvQEtfG32NHprVJNgs7HfuhZAUCW9L2ZAAKCRBJNgs7Hfuh
ZD2kAKC6FtzOUhQlJfCRcO4HWnfxlwgc9wCdF3sN/CIJS46Pg854ILEnAWEqGd0=
=4V6p
-----END PGP SIGNATURE-----

--Wts8Y2ay3BGkkKTjA76GUZzHMjSCw2bJC--


--===============2097616512558394129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2097616512558394129==--
