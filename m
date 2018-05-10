From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Thu, 10 May 2018 18:12:18 +0200
Message-ID: <c95c5aad1f25bf1b9a8b6376b4cb94936d52b573.camel@suse.com>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7318977187774846093=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <300e3466-8214-764a-6c33-ce8aaea31ed9@arm.com>
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


--===============7318977187774846093==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-XLO06gC8qR6gFR9Or1Iz"


--=-XLO06gC8qR6gFR9Or1Iz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-05-10 at 16:13 +0100, Julien Grall wrote:
> On 10/05/18 16:00, Mirela Simonovic wrote:
> > > If you add your callback to CPU_UP_PREPARE, instead than to
> > > CPU_STARTING, SCHED_OP(init_pdata) wouldn't be called, without
> > > having
> > > to fiddle with priorities.
>=20
> This function will enable capabilities on a given CPU, most of them
> are=20
> touching system registers. So it is necessary to add the callback to=20
> CPU_STARTING.
>=20
Right, I guess that answers my question.

> I always like to understand what I maintain :). Why do you need to=20
> change the priority if you just return an error in the notifier?
>=20
> At the moment, notify_cpu_starting has a BUG_ON() in it. But ideally
> I=20
> would like to either replace that BUG_ON by cpu_stop or just
> returning=20
> an error to give a chance of the architecture deciding what to do
> (this=20
> does not have to be done today).
>=20
The problem is that, currently, once we've reached CPU_STARTING, we
assume that the CPU bringup has gone ok, and things can't fail.

Therefore, the only place when we undo what CPU_STARTING does is during
CPU_DEAD, i.e., during hotunplug/suspend/teardown.

I understand the point of having to run stuff on the CPU that is coming
up, as well as your more general point.

However, I don't know whether allowing CPU_STARTING to fail is the best
way to achieve what you want to achieve, nor whether the BUG_ON in
notify_cpu_starting() is the only issue you'll face trying to do that.

I'd say that, if CPU_STARTING can fail, we need an appropriate rollback
step, i.e., the flow must become something like (but I'd appreciate the
opinion of x86 and core hypervisor maintainers about this):

CPU_UP_PREPARE --> CPU_STARTING xx> CPU_DIDNT_START --> CPU_UP_CANCEL

At which point, e.g., from the scheduler point of view, we can try to
put a call to SCHED_OP(deinit_pdata) in CPU_DIDNT_START, and that would
avoid the problem Mirela is facing, without having to play with
priorities.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-XLO06gC8qR6gFR9Or1Iz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr0b2IACgkQFkJ4iaW4
c+7+qRAAiZNWO8a1ALHi3K2z7ajGl2Vae3DgBp7Q+XliBzCS5TOlFSFqKVHwMidQ
A18ub7I/2tO7rR3ceF5l6h3oZ8SkNjJ72/+uNsGpVzlBPeZ2eQOdf2I77h/zAy0E
EsHbGd6IEqFTZmXqimM1SfeOndJlxm9EICrENSMuloSyBj6mUmJyvPkM4unj5I8D
BBLxlerMJZw1s1Vqka/4hA7zw5HpEnhwMu8qZH4LVKjK3iDnwhKVzDpszpHy7LKZ
bOkHBenzQr3xBF5B8t7E7EZjPtGDvyG6u6XmATGmH10IFE8hojaCWRRO0BNavSLV
zpUmDMv2yH186RZO7hBfOP6vUcKTY7J4Co4l9qisvdTRpO2pqHojMYJh3dN0jWgB
eoAp0CaB//nRcT70Brh5FY/NeHLWDtLmtvLkxGWbRaQN6T4Ae9fW2qqU4KsTvPRA
aovHS2KORrr+yaS6W6htHzLQr672FCP6KPy6uaTxv3LKstUUW12t+tCLhuMxZJyX
Djm9d3sgeJwqW88EIpRUfq30YAVPQ1I72v7xk+yFvPfT4rb3JYdFazjBGRSNIaoc
JZPI9qvTR3974Tf8QdSrtBXUGvgKrt3kKAe0HOilDfJeogC0bVY8MQiNYauuqFHo
05DPQWXk6QmQv17aQwjPgp2zgzMy6kYyEld+5wIzoY0E303gtMY=
=KMPQ
-----END PGP SIGNATURE-----

--=-XLO06gC8qR6gFR9Or1Iz--



--===============7318977187774846093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7318977187774846093==--
