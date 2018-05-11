From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Fri, 11 May 2018 15:12:53 +0200
Message-ID: <51bc496593c99d77909dd5193dd2c9c0c969667e.camel@suse.com>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <20180427171258.28852-11-mirela.simonovic@aggios.com>
 <ffc6351e-350c-b1c9-ea3e-fd4936701eb1@arm.com>
 <CAKPH-NiTLoOdYgpcWiM1qXHXaC=znAvMp0HHGQo-9mfegz2LcA@mail.gmail.com>
 <c713cc00-ace2-f528-563f-175657dccb12@arm.com>
 <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
 <CAKPH-NhZhcvAdnZ_PyCUe3oSEokZnoBi8aPwfYbpPHioGgU9KA@mail.gmail.com>
 <4dec77ef3b2a940453e1bc112e6dae21cb99af18.camel@suse.com>
 <CAKPH-NicJOBS7mLYSvo-Z62yxNuFbMZfZR7BdfUfJvEcoGoZOA@mail.gmail.com>
 <300e3466-8214-764a-6c33-ce8aaea31ed9@arm.com>
 <CAKPH-NgvzykBMx1jouMV-fBbLN8=oHmb3zFhy+pPQTwcQdf2Vg@mail.gmail.com>
 <6c0ba4fadcdb650e3a8651f13781da9caaae251e.camel@suse.com>
 <CAKPH-NiZtBwioY1hfzx2PSgzKB6eQxjw0hXUzLg94+u+OVpL+Q@mail.gmail.com>
 <51febc3c-c55a-6512-1d32-0d2bb0a64df7@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7217915065452110562=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <51febc3c-c55a-6512-1d32-0d2bb0a64df7@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7217915065452110562==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7DbFC+TKS65lAy+Vwdgl"


--=-7DbFC+TKS65lAy+Vwdgl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-05-11 at 11:54 +0100, Julien Grall wrote:
> On 11/05/18 11:41, Mirela Simonovic wrote:
> "We should really avoid to use panic(...) if this is something the=20
> system can survive. In that specific case, it would only affect the=20
> current CPU. So it would be better to return an error and let the
> caller=20
> decide what to do."
>=20
> To summarize:
> 	1) Notifiers should only report an error and let the upper
> caller (here=20
> notify_cpu_starting()) deciding what to do.
> 	2) I am OK with the BUG_ON in notify_cpu_starting() for now.
>=20
And, in general, I agree with all this.

However (and I think I'm repeating this concept for, what, the 10th
time now?!?! :-P), in this specific case, the reason why none of the
existing CPU_STARTING callbacks report an error, is that the CPU
bringup process is, AFAICT, built around the assumption that once we
reached CPU_STARTING, things can't fail.

For this very reason, whatever new CPU_STARTING callback is introduced,
in this series or everywhere else, _can't_ fail, and _can't_ return any
error.

If we need to have a CPU_STARTING callback that can fail, we need to
change the CPU bringup process accordingly.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-7DbFC+TKS65lAy+Vwdgl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr1ltYACgkQFkJ4iaW4
c+5kqhAAo6gcntUmxFxigsGxlf74cDxJ/sTfNJyBCGsdaDfp3PCOJP4sUbMM8oaC
m31Pm+2lJJDlo0XI1mCyxqOOsRM9RHflvYaan/nb+JK2xw9EFvffS9smE3C1JGZ9
wjpDbxqpUgf0ZjHyoGSHTPSsXV3iw4AutXpl2Zh4jCQPFdebUWDo16c+3xZx2K41
sgZv7YheFTTzWB4vFubeW1LE56zg5V2UAiaF7QiOWZNfVeyIpnlF+hoc1OBzC3VE
3DsSPye6g2QYcf3Xyhk1G0YiZDigWI0x/M0vD46DOAwy440fzwgqmfEkf4mb6EC9
ZLEy2oYFVUqetislmiadlefWh6LKsgCjxNjjCZ3y7esxGuKIM0w362GumtJmZqpu
UymOgVwz6bJcrEjCB5BbRuT6/iv5XgRUgwiBMXw9bAQYNS5vSSLd2FaKboefgPtw
Pnxs6lj2k9u+6ADq/06BYW1hNaYffdMmFlSGOohgZZS1xCDnY7lifOYtBVcBdRla
qkmVau1b5VT1D7Ddq26j4GNnPUXqhIupJzP/fA0X1C5NI+59L8hwbyLZmmOA4HZk
Ijz3R6JHtsTgAsN5elINRcFLZfYs4KotsLKxjXkwxN0ZXJ6gbaZK8pFehNxPAMv1
qFaN9JL0L6iNo6ME0HK2cd+0X82Lch2TP1WeD2YIwlqVVNM2qus=
=H6MJ
-----END PGP SIGNATURE-----

--=-7DbFC+TKS65lAy+Vwdgl--



--===============7217915065452110562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7217915065452110562==--
