From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Thu, 10 May 2018 16:25:09 +0200
Message-ID: <4dec77ef3b2a940453e1bc112e6dae21cb99af18.camel@suse.com>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <20180427171258.28852-11-mirela.simonovic@aggios.com>
 <ffc6351e-350c-b1c9-ea3e-fd4936701eb1@arm.com>
 <CAKPH-NiTLoOdYgpcWiM1qXHXaC=znAvMp0HHGQo-9mfegz2LcA@mail.gmail.com>
 <c713cc00-ace2-f528-563f-175657dccb12@arm.com>
 <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
 <CAKPH-NhZhcvAdnZ_PyCUe3oSEokZnoBi8aPwfYbpPHioGgU9KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5257592832078044333=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NhZhcvAdnZ_PyCUe3oSEokZnoBi8aPwfYbpPHioGgU9KA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5257592832078044333==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QirEb62BX+B4qmc50gil"


--=-QirEb62BX+B4qmc50gil
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-05-10 at 15:24 +0200, Mirela Simonovic wrote:
> On Thu, May 10, 2018 at 1:57 PM, Mirela Simonovic
>=20
> > Please take a look at function cpu_schedule_callback in schedule.c.
> > Within switch, case CPU_DEAD doesn't have a break, causing the
> > bellow
> > CPU_UP_CANCELED to execute as well when the CPU goes down. This
> > looks
> > wrong to me.
> > Dario, could you please confirm that this is a bug? Otherwise could
> > you please confirm the reasoning beyond?
> >=20
>=20
> Dario sorry, this looked wrong in my scenario but actually it is
> correct. I understand the purpose of the missing break now.
>=20
No problem.

> For the curious ones (if any) here is detailed description: errata
> notifier added in this patch had the same priority as scheduler
> notifier. I though priority doesn't matter, but I was wrong. In this
> particular scenario where a CPU fails to enable capabilities
> (triggered by errata notifier added in this patch), scheduler
> callback
> executed before the errata callback for CPU_STARTING event.=20
>
So, you're adding your errata callback to the CPU_STARTING notifier,
right? (Sorry for having to ask, I don't have the patch handy right
now.)

> In other
> words, scheduler already called init_pdata before the errata callback
> fired (and stopped the CPU).
> Later on when errata callback fired, enabling of capabilities has
> failed, so the erroneous non-boot CPU stopped itself and never
> declared to be online.
> Then CPU#0 fired new notification with CPU_UP_CANCELED event in order
> to clean up for the job done on CPU_STARTING. However, this broke the
> assumption (which is good) made in cpu_schedule_callback. The
> assumption is that the sequence of steps should be
> alloc_pdata-->init_pdata-->deinit_pdata-->free_pdata. In this
> particular case deinit_pdata was not done because this would be done
> only upon CPU_DEAD event which makes no sense in this scenario.
> In order to avoid running into the invalid scenario described above,
> the errata callback should fire before the scheduler callback. If
> enabling capabilities fails, the scheduler callback for CPU_STARTING
> will never execute afterwards, so the following CPU_UP_CANCELED event
> triggered by the CPU#0 will do free_pdata, which is ok because
> init_pdata was not executed and alloc_pdata-->free_pdata flow is also
> valid. Congratulations to the reader who reached this point :)
>=20
Ok, but the flow is, AFAICR, CPU_UP_PREPARE->CPU_STARTING->CPU_ONLINE.

If you add your callback to CPU_UP_PREPARE, instead than to
CPU_STARTING, SCHED_OP(init_pdata) wouldn't be called, without having
to fiddle with priorities.

Is there any reason why you can't do it that way? It would look more
natural to me, and it's definitely going to be easier debug and
maintain (e.g., look at how many callbacks CPU_UP_PREPARE has, as
compared to CPU_STARTING ;-P).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-QirEb62BX+B4qmc50gil
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr0VkUACgkQFkJ4iaW4
c+7YuhAAkU6d3w3c2pLFGduifCmbZnmp3wvm028rApCrHkvXnpDiXgz6OqCYDnPR
VC1Dksl4epx3I0sZrPayMnnCrQisQV5vuG60c7gyl/UhMtVkOJEwNFJy0lpqQTe9
ba9hMmACT7Grgz4PhC6O14PstBTp0R0UsvSCiZuqqfsLap4TTo2Wuo6BoNwwOAWy
xdEpuoMySITs0Kf7nRrEbXeYse3O+qF2nu4TzEfY+EazNhzb8JEWeIYkFEX8JsWD
0xuM2dtH8B+2bm6ULlHujBPOavCAyMRu+6OEWwMlYvKVPMWqdOBK3DZ7u7y3hRrJ
lVjIfnBEZbTygBdfBOwUVUmKbzqx9sf9dkvOjvDdw6FxNmlD997w6/Uc+ITwuU2J
pl9zGlNfBjQgkgfqzN3B6A/pCLa8SLaG/vkxy8ae/yZJ9AXp1zYXhnuvNGcBgpmQ
IcrenH6Snhp8irJRifG27ij6mVTdh6ijE+MlOwG0/VhiNpF4NGz9ztp9LDkdhkH6
THr2Dt53E+oxyKuYbqVHeDr9fnG6y2g2R06jRkxph+PRR8EdxlcNPvlyE2vDsNwA
PCJK9ubIOOU1ecozdrnPhGUyRoWv4r/Neohq8nTqJ7Uv6WpHI12MBi5mXCZB0Zry
bmF7fIBgqmkQCT4NjAkgCG+EqzgsHuZK/0KSK/l/OAxKuhikXhI=
=zdF2
-----END PGP SIGNATURE-----

--=-QirEb62BX+B4qmc50gil--



--===============5257592832078044333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5257592832078044333==--
