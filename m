From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Fri, 29 Mar 2019 19:16:23 +0100
Message-ID: <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8463378983478191372=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9w3j-0005lm-Cm
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 18:16:55 +0000
In-Reply-To: <20190329150934.17694-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8463378983478191372==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IspaYPQXxJfwXISycGWc"


--=-IspaYPQXxJfwXISycGWc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Even if I've only skimmed through it... cool series! :-D

On Fri, 2019-03-29 at 16:08 +0100, Juergen Gross wrote:
>=20
> I have done some very basic performance testing: on a 4 cpu system
> (2 cores with 2 threads each) I did a "make -j 4" for building the
> Xen
> hypervisor. With This test has been run on dom0, once with no other
> guest active and once with another guest with 4 vcpus running the
> same
> test. The results are (always elapsed time, system time, user time):
>=20
> sched_granularity=3Dthread, no other guest: 116.10 177.65 207.84
> sched_granularity=3Dcore,   no other guest: 114.04 175.47 207.45
> sched_granularity=3Dthread, other guest:    202.30 334.21 384.63
> sched_granularity=3Dcore,   other guest:    207.24 293.04 371.37
>=20
So, just to be sure I'm reading this properly,
"sched_granularity=3Dthread" means no co-scheduling of any sort is in
effect, right? Basically the patch series is applied, but "not used",
correct?

If yes, these are interesting, and promising, numbers. :-)

> All tests have been performed with credit2, the other schedulers are
> untested up to now.
>=20
Just as an heads up for people (as Juergen knows this already :-D), I'm
planning to run some performance evaluation of this patches.

I've got an 8 CPUs system (4 cores, 2 threads each, no-NUMA) and an 16
CPUs system (2 sockets/NUMA nodes, 4 cores each, 2 threads each) on
which I should be able to get some bench suite running relatively easy
and (hopefully) quick.

I'm planning to evaluate:
- vanilla (i.e., without this series), SMT enabled in BIOS
- vanilla (i.e., without this series), SMT disabled in BIOS
- patched (i.e., with this series), granularity=3Dthread
- patched (i.e., with this series), granularity=3Dcore

I'll do start with no overcommitment, and then move to 2x
overcommitment (as you did above).

And I'll also be focusing on Credit2 only.

Everyone else who also want to do some stress and performance testing
and share the results, that's very much appreciated. :-)

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-IspaYPQXxJfwXISycGWc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeYPcACgkQFkJ4iaW4
c+4OTg/+LQmtvgcQf9Q121nfk5vEzflDUPrAlBact0gu+ayoojrx88hDH3qt4uCp
QMmOjWB1azXd9d35e+K7C+Gsj3ixs/96St9AFBb27Jf2LMbHR3bukoLceUeDx3JV
DoBjtP4RRPdChvSfJb38MBrHUmYiu0tUyBH98+wLiJP8k5PIfLHZXgl5H/Z8KqUv
sNZ0FzmjBqT+2nAViiSmg1tutfNQoukUjm5HPQY5b7K3ag4JYPImWfkuxN0INnOr
rXNM3mEcl4lEBAgYskU3dsobQVNKe+1zPk6roitzaHuReeAloISgFu19F/AX1qty
MOPfAAFp/NBk1uO6+xSgrHb2x9HNlkoKc4GF13QD+IG8kAYeBM7mmAHm5WnstogS
nDay1vq0w+xfhzQ3pmDzs8RT/OGuFU3AT5doaq+eNAuEVOosl3JEY23m8kMiNlLE
ZyoBCRJWEQ2SOa354DEmL6gQtNSFlfGtRa6XmGRSEXFfegNoZcaOem62b2hzwYHS
eWRnf04D9bYs8usAH72avYwvxLgYvBaJ1cTPyFbjITo8vyQt6K8GuWAyyYCgYB3Y
IlWrMFC9Vt3BTLy8I43/tlDWcF1ceDMDQz4ZPablYY5sBA9CqWTbQ3OpNY6d6CUN
/FnsRN6ude2JoYA3j+X5y4prcXVQ74xhflrbcRqEDtWWsnm8ZKo=
=umAi
-----END PGP SIGNATURE-----

--=-IspaYPQXxJfwXISycGWc--



--===============8463378983478191372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8463378983478191372==--
