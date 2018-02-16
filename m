From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RTDS with extra time issue
Date: Fri, 16 Feb 2018 19:37:12 +0100
Message-ID: <1518806232.3813.36.camel@suse.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
 <1518182334.5019.15.camel@suse.com>
 <39c08b88-c951-2779-34f6-31e4b6c0dd0f@epam.com>
 <1518189527.5019.28.camel@suse.com>
 <20c19a44-f782-d25d-7005-fce286f92f43@epam.com>
 <f4fdc887-3a67-386a-501a-c1f3b28aa980@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1609429854854692017=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7zwx=fk=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1emksx-0002mL-Oe
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 18:37:27 +0000
In-Reply-To: <f4fdc887-3a67-386a-501a-c1f3b28aa980@epam.com>
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


--===============1609429854854692017==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QoOjgP782uks0LlR18fv"


--=-QoOjgP782uks0LlR18fv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-02-12 at 20:44 +0200, Andrii Anisov wrote:
> Dario,
>=20
Hi,

> On 12.02.18 12:20, Andrii Anisov wrote:
> > Actually as per Meng's explanation and calculations the problem was
> > on=20
> > my side - wrong DomR task/VCPU parameters.
> > I was running the system with dummy loads and values received from=20
> > CARTS and all seems to be ok (no deadline misses occured).
>=20
> Well, what I expressed as dummy loads was all domains are generic
> armv8=20
> kernels with minimal fs'es running `dd if=3D/dev/zero of=3D/dev/null`,=
=20
> except DomR. In this case no DL misses occurred with parameters given
> by=20
> CARTS.
>=20
> Now I have real driver domain, Android with GPU sharing. Loads are
> like=20
> youtube playback in DomA, dd from mmc through ssh in DomD. And I see=20
> unexpected DL misses for the same RT configurations.
>=20
And what is it that is running in DomR, the same thing as before, when
the load was synthetic? And in any case, is it, in its turn (I mean the
workload running in DomR) a synthetic real-time load, or is it a real
real-time application?

If the latter, are you sure the misses are not due to the fact that,
for instance, the rt app does not always behave as measured/expected,
when computing the parameters?

> Well this provides some ground for another my concern about XEN=20
> scheduling approach. My doubt is that scheduling is done within
> softirq,=20
> so all time spent with pcpu for exception itself and possible timer=20
> actions is accounted for the vcpu which context was interrupted.=20
>
I am not sure I fully understand this.

If you're worried about some kind of overhead may be consuming some of
your real-time reservation, try to increase the reservation itself a
bit, and see if the misses disappear.

Scheduling always as a consequence of some task/vcpu blocking, some
task/vcpu waking up, or of timer events, in all the OSes I have ever
seen, so I don't think Xen is really special wrt this.

One difference could be that Linux can be configured to be fully
preemptible --even the kernel-- while Xen is not. But I don't think
this is what you're hinting at, is it?

> This=20
> seems to be not really fair and might be disruptive for RT
> scheduling.
>=20
Well, if you're saying that accounting can be improved, I do agree. It
always can (again, in all the OSes! :-D)

Note that it is not always evident how to do that, and I'm not talking
about the actual implementation. I think it would not be too hard to
track the time we spend inside the hypervisor. But then, what do we
do?=20

Because if DomX was running, and we entered Xen because an interrupt
arrived to deal with a timer or whatever from DomY, then I agree it's
not fair to charge DomX for that. But, OTOH, if we are in Xen because
DomX itself called an hypercall, then it is indeed ok to charge DomX.

And note that this does not have much to do with how schedule() gets
called. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-QoOjgP782uks0LlR18fv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqHJNgACgkQFkJ4iaW4
c+71ow/+J7q4z9Y+fqKIVXzgdCawQuLi0teMFVskKz0hZGnQ4lx0w0KCFm7xsADx
eLE30+8c9K0xh+wiG7tDV4EfzmdI4cVnNzwHBMsDNM8sVJGQvMbRgA/DVv+n/ZiQ
x31hjmsI+F+SakKQMmZXfiPaIlm4mEOnBXH/5P+3kzi840dKXTbzqDAllB1MuRoe
AJdiDtKaTQfG6zAhO6XCCZaaeNxdyX+jFNfWMEN9PJRb/qiz+/65hTNM8sVNCVuH
35jlENxaoAG7G4ibkoog5iI6jZuR01T/UEV9dTrQN2UX/vWY3/Ea0jvnQ3prS8wJ
KnLZccwKehJ8M5NyzPKrnS7alV8pR8XGi8grYxfbjD5SyeQIBPDcDXB33dTpppqT
u/Hb5w04XMjkbfDXtQj3QoRWleP/IEIVZSrOm+P2mrq5Oe5DqfZbE2Agh4UZ5lzI
QG5pdmYcjxaCoaqR6aTJXwsAS1kKEHfPtodjQfuWoj4OxDw+7sB2MXXtOgrsQDsU
rpL4cFSPRz8Xgp2Y2wIOrI29qCeLp43ggND08QO+F2tppmnzr9+cg7ggntLOxLXQ
4euwvddfaSY0VSuVZ2XsoPK58qglTxLV3FlJZvsW6CY4jfOEVk5xyXll+93CJvHX
6lVnJA/a9lsCiFX7NbIfIJcU0wQbYVL+rinJvqYY1JONLEoSD3w=
=UGoP
-----END PGP SIGNATURE-----

--=-QoOjgP782uks0LlR18fv--



--===============1609429854854692017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1609429854854692017==--
