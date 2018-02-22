From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RTDS with extra time issue
Date: Thu, 22 Feb 2018 18:53:43 +0100
Message-ID: <1519322023.5547.87.camel@suse.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
 <1518182334.5019.15.camel@suse.com>
 <39c08b88-c951-2779-34f6-31e4b6c0dd0f@epam.com>
 <1518189527.5019.28.camel@suse.com>
 <20c19a44-f782-d25d-7005-fce286f92f43@epam.com>
 <f4fdc887-3a67-386a-501a-c1f3b28aa980@epam.com>
 <1518806232.3813.36.camel@suse.com>
 <02bf847b-4160-1963-cdca-dd7d74f1da43@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1598619160956769483=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dhkj=fq=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eov4X-0007gO-FT
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 17:54:21 +0000
In-Reply-To: <02bf847b-4160-1963-cdca-dd7d74f1da43@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Meng Xu <xumengpanda@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============1598619160956769483==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cFNQeuPQcIPFv9ddGYxG"


--=-cFNQeuPQcIPFv9ddGYxG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-02-20 at 13:34 +0200, Andrii Anisov wrote:
> Hello Dario,
>=20
Hi,

> On 16.02.18 20:37, Dario Faggioli wrote:
> > And in any case, is it, in its turn (I mean the
> > workload running in DomR) a synthetic real-time load, or is it a
> > real
> > real-time application?
>=20
> Real-time domain is synthetic, though. I'm using LITMUS-RT system
> for=20
> the DomR. In particular with amount of work based configuration [1]=20
> introduced recently.
>=20
Ah, nice! :-)

> Even for the synthetic rt workload some deviations in execution time
> are=20
> noticed (~0.5%). But with no IRQ extensive load in application
> domains,=20
> no DL misses are noticed in RT domain.
>=20
Ok, I see.

> > > Well this provides some ground for another my concern about XEN
> > > scheduling approach. My doubt is that scheduling is done within
> > > softirq,
> > > so all time spent with pcpu for exception itself and possible
> > > timer
> > > actions is accounted for the vcpu which context was interrupted.
> >=20
> > I am not sure I fully understand this.
>=20
> My idea is to charge time spent in hypervisor from current vcpu
> budget,=20
> except serving that vcpu hypercalls and handling interrupts targeted=20
> current vcpu. Same as you expressed:
>=20
As I said already, improving the accounting would be more than welcome.
If you're planning on doing something like this already, I'll be happy
to look at the patches. :-)

> > If you're worried about some kind of overhead may be consuming some
> > of
> > your real-time reservation, try to increase the reservation itself
> > a
> > bit, and see if the misses disappear.
>=20
> Its not about overhead but unfair time accounting. And this
> unfairness=20
> is pretty arbitrary, depends on other domains activity.
>=20
Sure, I agree it's pretty bad. It's indeed particularly bad for RTDS,
where it messes with guarantees, but it's rather bad for other
schedulers as well, as it messed with fairness.

> > One difference could be that Linux can be configured to be fully
> > preemptible --even the kernel-- while Xen is not. But I don't think
> > this is what you're hinting at, is it?
>=20
> No, it is not.
>
Ok, I was just double checking.

> If we are speaking about Linux, it much closer to=20
> CONFIG_IRQ_TIME_ACCOUNTING [1].
>=20
Yes, I'm familiar with that. That exact same model can't be applied to
Xen, but at least tracking time spent in IRQ handling, and discounting
that from vCPU execution time, should not be too hard.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-cFNQeuPQcIPFv9ddGYxG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqPA6cACgkQFkJ4iaW4
c+5eMQ/9GIQtNFWUHgWifV5ownVHsrmC3ZmnMFnyiyoBiBzgu8n2HhzbB/OxOkGN
46VLlH/mK2uA4E1lVOC0r6SCzom4zSHOGMjwGgnNcUh+VQPBlJJlidlM2of1zQIh
VdWpnS9TgQxGJ+IPadcTTCG/RUlAy9NvWOOqu3s9L2YNUv6f8evIusw8+YeQhmQF
3B+Sle4L/cTKPQHqYfSDSr2osgyBfKVAxuiNoeYfXQyc7QpguRFucezcuYzJkEIO
K3PkNQspkpD9ItS1CMgEHzqZhVCUk+PG5pgYvPImnW4wcQTaHXCEduTh5oQa3c0a
gyvgJ2Z5c2hgWX7xAOxAnPSfhwHFYnn0MshveYvxyGW3e37hwWE/7fedY4qBeXMW
5fOSh+HPEivDEQNM5m1d9pWTAyqIZJ0HCwlpz1a3K86b/hQNavk76vLEIPukI4M+
V3cT1PQl5z5slG9NasL/mEImxCQi+0Lic4Ww34eai9z7l5azxGPdZY1OBDyjQ8gp
wD3DAbxfAsULMj2/b3H0Clq2XypjgP+T9IN7gDG7jnZPm3MsoRHdXxIyaJYsBu2h
kQjckjzTX8EtJjGxPQ8Z3A67RjbY5lXo3YhpfKYRQMwG8552qf07j2L5G5areKAX
Lz0UcQgbMbfADGcQcVrdBtS/4fEmB09DjLFySzJIiJSHLpsMJDM=
=RIa+
-----END PGP SIGNATURE-----

--=-cFNQeuPQcIPFv9ddGYxG--



--===============1598619160956769483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1598619160956769483==--
