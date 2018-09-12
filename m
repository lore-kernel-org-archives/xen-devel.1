From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/5] xentrace_format: print timestamps in
 nanoseconds
Date: Wed, 12 Sep 2018 09:42:18 +0200
Message-ID: <2d70941bee81fbbedd5ffc2194ad40c6bdffd323.camel@suse.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
 <1536597679-8303-2-git-send-email-andrii.anisov@gmail.com>
 <3e079a5d-6437-90a4-f313-e87b57f9b2bd@citrix.com>
 <732445b5-59cf-5416-455d-f994ee2aa47c@epam.com>
 <2fa12bbc-ace0-c75e-96bd-431cb4d49158@citrix.com>
 <c7b5a2df-0b25-845b-0f45-ae9060e2acd3@epam.com>
 <40a3fe50-187a-75de-3c38-1fdff0922d89@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5964963675692344423=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <40a3fe50-187a-75de-3c38-1fdff0922d89@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrii Anisov <andrii_anisov@epam.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5964963675692344423==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-LqTwmQsindVT3x2MQ2f8"


--=-LqTwmQsindVT3x2MQ2f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-11 at 16:54 +0100, George Dunlap wrote:
> On 09/11/2018 04:19 PM, Andrii Anisov wrote:
> >=20
> > On 11.09.18 13:44, George Dunlap wrote:
> > > What I do in xenalyze is to have the timestamps in seconds, but
> > > always
> > > print down to the nanosecond.  (For this I actually break cpu
> > > cycles
> > > into s and ns separately, and then print "%u.%09u".)
> >=20
> > Here, we can have the same. With the 0current formula in
> > xentrace_format, but changing `%(tsc)d` to `%(tsc).9f` in formats.
> >=20
Sorry, I'm not sure I'm getting this properly. When you say "with the
current formula", do you mean before or after this series?

IAC, changing the default format file that we ship so that it prints
time in the format seconds.nanoseconds (if CPU speed is specified),
would be nice IMO.

> FYI, I never use xentrace_format; as far as I'm concerned it's been
> made
> obsolete by xenalyze, and if it were up to me I'd remove it from the
> tree.  Lots of people seem to find it useful, so I review patches.
>
I almost entirely concur. As said already, the one reason why I think
it still could be useful, and we should keep it, is that the way a
trace will look like can be changed or tweaked rather easily, and
without having to recompile anything, via the formats file, which is
rather cool. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-LqTwmQsindVT3x2MQ2f8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluYw1oACgkQFkJ4iaW4
c+5+zhAA7N0aWLPE/zVFwNdUatpNumeEo98iBAc6QuMZy/jOXNQyQwaD8DgELHKj
upGD9G4Q+bpjT4iM71bRDCCdDwiytwqYSh47pUu8h8gib49NH6zJjDdKqX9kB189
VMHe/dsxTDOAMBwRTyeOzpM3R/SvVbO0iGB9fGQR38kjFTxnq2/EdgQev4gRM+cQ
0JOKtBG4/eVylU17zx3mDqiYZaaEOSe5qRplUJkrkncFPQ/rCtD49TyGvqfvRddS
Ely93PySPiW7sbubscm5S3Q0SSRmaIiG/iCeV7y9BdLp24F6f5hD7d6pABwgk7JE
339eYmNPvnLyZJTu9dp3ykxgt1aglFq6x4K1hfeXdRJJIF00iYhmfJyPDFOXqCDb
S0eWDKT2AXUpsQr7nX/gXn9GwGEPve404Qeu7+TCXKIvb58bEXdesznWgkLy9eJy
jBeWZ+SSWV1O+SgVlXDEghei2fHnjQOLfmcs/peb8xGmR+8mxxAJ/AT7rL5aqtu/
Mev3lAu+/5KLwZ8jECd2SpMpBrpUhl505am6bwKLcG6HtsS7AWyOc8NEEvNwbGIN
BW6rUnFmu7NB97/xmodI55UjqQ+1ikqMiReBYYSp7r2rgUNTD6ImqffOqIJ5zJdk
+u3t+8SXm7e5D6KcWFYXNNEaC9SRH0XviXDAUXadOWqQpxUC8M0=
=EsG2
-----END PGP SIGNATURE-----

--=-LqTwmQsindVT3x2MQ2f8--



--===============5964963675692344423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5964963675692344423==--
