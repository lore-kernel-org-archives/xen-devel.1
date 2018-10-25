From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Thu, 25 Oct 2018 18:01:50 +0200
Message-ID: <9270f77c23dad0855a00030cc53ce4b2b9366d22.camel@suse.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <CABfawh=GYUi2nvx5Nc1xfu7McVSqCwYOMyA6fyCKgYJCGCRkXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5966364206043520393=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawh=GYUi2nvx5Nc1xfu7McVSqCwYOMyA6fyCKgYJCGCRkXA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: mpohlack@amazon.de, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, joao.m.martins@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, aliguori@amazon.com, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, ross.philipson@oracle.com, msw@amazon.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JGross@suse.com, sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, mdontu <mdontu@bitdefender.com>, dwmw@amazon.co.uk, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5966364206043520393==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-DbOK/DQj/k0YRyyevtwk"


--=-DbOK/DQj/k0YRyyevtwk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-10-24 at 09:24 -0600, Tamas K Lengyel wrote:
> > A solution to this issue was proposed, whereby Xen synchronises
> > siblings
> > on vmexit/entry, so we are never executing code in two different
> > privilege levels.  Getting this working would make it safe to
> > continue
> > using hyperthreading even in the presence of L1TF.  Obviously, its
> > going
> > to come in perf hit, but compared to disabling hyperthreading, all
> > its
> > got to do is beat a 60% perf hit to make it the preferable option
> > for
> > making your system L1TF-proof.
>=20
> Could you shed some light what tests were done where that 60%
> performance hit was observed?=20
>
I don't have any data handy right now, but I have certainly seen
hyperthreading being beneficial for performance in more than a few
benchmarks and workloads. How much so, this indeed varies *a lot* both
with the platform and with the workload itself.

That being said, I agree it would be good to have as much data as
possible. I'll try to do something about that.

> We have performed intensive stress-tests
> to confirm this but according to our findings turning off
> hyper-threading is actually improving performance on all machines we
> tested thus far.
>=20
Which is indeed very interesting. But, as we're discussing in the other
thread, I would, in your case, do some more measurements, varying the
configuration of the system, in order to be absolutely sure you are not
hitting some bug or anomaly.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-DbOK/DQj/k0YRyyevtwk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvR6O4ACgkQFkJ4iaW4
c+7i4BAA4HGVyL5pGKLidHXuhsFxT6QhiufXdrNjyhc7BtxTMz5gm8nXjf3r4rgu
SYC8rnCnzbom8wE0DBoe5KTxSoXFBlzIFVMbTdU1asShXGwxTyw5kMoR0pIKXE0q
pRVMV1MOiWM+nVAxl5mbWqF5LZ+ALhk0+JhozehfztmJOcZHqbRldYvzi7q+nzp1
0MEiry4FE8RooSAl8cyH0l82KhwwCPkOhUr4zf8PZ492ofCVwKKQ4akM5dvr4RX5
KA64pEk1fuKuwJocSggN2kJmW7vfqK3lwNedG7CA4Rd8NvOUpn830+LGkDAJmPHe
v+97I7XXMSjc/dLa15UXnK8xnwwShuOLwbGIfu/5Ol+CEqY2JTg5em2I2Cfs+X0B
Llsp8w48vTSA5EkR3FlOfr5OilIyCvpDtmtUMdZfDMtxrLd5VuryF2M14I1+hI5J
XWeqX2dGXR60mZfQUAo3XBGT3IIwvqQsv8UhlbCZqDmVbJ7m0xiOxk52wr0gVFmw
R+BwkFtmtDzduuLdFqBDZFmlnu50I2Ox5PuqpNCwZSay8bEBI6MqBibq/LZPURzV
RpsJuFECMSxUIoo33iikjcktqPZoUenOMlmKhh0d7WXYL23JJncxlOjaMJc5If/S
Ge+KuOWI8tlbQ4Ro+UqYAnDEnB35vc+dFIQnsl7fbihn+6Qnqw0=
=VU0T
-----END PGP SIGNATURE-----

--=-DbOK/DQj/k0YRyyevtwk--



--===============5966364206043520393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5966364206043520393==--
