From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 00/16] xen: sched: implement
 core-scheduling
Date: Thu, 18 Oct 2018 10:16:17 +0200
Message-ID: <f4d1194798bf33106ec76ac6ef85b0d648f839c7.camel@suse.com>
References: <153515305655.8598.6054293649487840735.stgit@Istar.fritz.box>
 <CABfawh=OO14x9=_Cu=7Pk6v1+esuQav6Y-V9uOxonsmRBBovbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8634238218087152883=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzov=m6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gD3Ts-0004CU-PS
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 08:16:32 +0000
In-Reply-To: <CABfawh=OO14x9=_Cu=7Pk6v1+esuQav6Y-V9uOxonsmRBBovbw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, bhavesh.davda@oracle.com, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============8634238218087152883==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RLAuTVaacAabGO1H+WWU"


--=-RLAuTVaacAabGO1H+WWU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-10-17 at 15:36 -0600, Tamas K Lengyel wrote:
> On Fri, Aug 24, 2018 at 5:36 PM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> >=20
> > They give me a system that boots, where I can do basic stuff (like
> > playing with dom0, creating guests, etc), and where the constraint
> > of
> > only scheduling vcpus from one domain at a time on pcpus that are
> > part
> > of the same core is, as far as I've seen, respected.
> >=20
> > There are still cases where the behavior is unideal, e.g., we could
> > make a better use of some of the cores which are, some of the
> > times,
> > left idle.
> >=20
> > There are git branches here:
> >  https://gitlab.com/dfaggioli/xen.git rel/sched/core-scheduling-
> > RFCv1
> >  https://github.com/fdario/xen.git rel/sched/core-scheduling-RFCv1
> >=20
> > Any comment is more than welcome.
>=20
> Hi Dario,
>
Hi,

> thanks for the series, we are in the process of evaluating it in
> terms
> of performance. Our test is to setup 2 VMs each being assigned enough
> vCPUs to completely saturate all hyperthreads and then we fire up CPU
> benchmarking inside the VMs to spin each vCPU 100% (using swet). The
> idea is to force the scheduler to move vCPUs in-and-out constantly to
> see how much performance hit there would be with core-scheduling vs
> plain credit1 vs disabling hyperthreading. After running the test on
> a
> handful of machines it looks like we get the best performance with
> hyperthreading completely disabled, which is a bit unexpected. Have
> you or anyone else encountered this?
>
Do you mean that no-hyperthreading is better than core-scheduling, as
per this series goes?

Or do you mean that no-hyperthreading is better than plain Credit1,
with SMT enabled and *without* this series?

If the former, well, this series is not at a stage where it makes sense
to run performance benchmarks. Not even close, I would say.

If the latter, it's a bit weird, as I've often seen hyperthreading
causing seemingly weird performance figures, but it does not happen
very often that it actually slows down things (although, I wouldn't
rule it out! :-P).

Of course, this could also be a problem in the scheduler. Something I'd
do is (leaving this series aside):
- try to run the benchmark with half the number of vCPUs wrt the total
number of CPUs (i.e., with only 1 vCPU per core);
- try to run the benchmark as above, but explicitly pinning 1 vCPU on
each core;
- go back to nr vCPUs =3D=3D nr pCPUs, but explicitly pin each vCPU to one
pCPU (i.e., to one thread, in this case).

You can do all the above with Credit, and results should already tell
us whether we may be dealing with some scheduling anomaly. If you want,
since you don't seem to have oversubscription, you can also try the
null scheduler, to have even more data points (in fact, one of the
purposes of having it was exactly this, i.e., making it possible to
have a reference for other schedulers to compare against).

BTW, when you say "2 VMs with enough vCPUs to saturate all
hyperthreads", does that include dom0 vCPUs?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-RLAuTVaacAabGO1H+WWU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvIQVgACgkQFkJ4iaW4
c+7T4g/+MOqVgP8fIziy/PY+lpV8fhCaDswO8HUWAm0g++Jr9PyGIqGtLkxBw41y
sioM1h2LPMEYlQRwof9+Llu6OVyOyvrfZBXvQo2hKDDYhkTo/qnFSv7IZP4XNj5w
0J5JRQzSOP3lO1RAuv9I+eEgMI68Z/65FQ1rvg8GPYM8PQocuv7D8yAgpRhbjueD
OaNTe07YUsRkcXQBsdiK8Uec+zMDqwB8hQTd2KK+GQmt3zsvq6LkPtumOJKjnvXv
1P6XFm6HchPrEl7u4C6ml2qg25UKumBRLKLet3xtZgBDkZeL5rUwnreiEkjXZXp2
5M3PIXyJMYk3HmyOhbBcyoHaa+Z331+G60tWuxZWU88tLQsPPkq4bljdygukfvD0
Jdjs6vzHnRsDuE8iIflmZ51QaLrCEWNDOyQvLEWlr2+Ia0M21FJEyUich/foSil7
i28r/GfgT9caBeCdIepfDuEoSPHxIBvmHJRsr6l8le2thu4L1PrUMHkUGUvaur0i
P3rPMhi+LsPoKMF8H4tSD3vVj1AX8nN/Yc3CHm6s+xwsCvLPmHN8hWJlXR3plkSC
0wZ6sqj3jiKXRk4aRq1kgmusLTkRe6JEhl6fYvqn+ye6AFG0z3QV3M0EriJKN2rE
2O6OvIN+Vnt116hM5CfdZ0QSsCxeMT+rzrJNlNAN97uOkpXk/lQ=
=zea0
-----END PGP SIGNATURE-----

--=-RLAuTVaacAabGO1H+WWU--



--===============8634238218087152883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8634238218087152883==--
