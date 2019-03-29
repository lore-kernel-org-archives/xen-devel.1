From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Fri, 29 Mar 2019 17:56:07 +0100
Message-ID: <2d8735fa29e3c7add47b8e4c467760bfffc90b09.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5C9E3C3D0200007800222FB0@suse.com>
 <19e960b1-bcfd-45cb-7993-6af5bd407266@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1645975094776713107=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9unm-0004xC-S6
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 16:56:22 +0000
In-Reply-To: <19e960b1-bcfd-45cb-7993-6af5bd407266@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1645975094776713107==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-sRt/Go+qBkQZxWDihjkS"


--=-sRt/Go+qBkQZxWDihjkS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-29 at 16:46 +0100, Juergen Gross wrote:
> On 29/03/2019 16:39, Jan Beulich wrote:
> > > > > On 29.03.19 at 16:08, <jgross@suse.com> wrote:
> > > This is achieved by switching the scheduler to no longer see
> > > vcpus as
> > > the primary object to schedule, but "schedule items". Each
> > > schedule
> > > item consists of as many vcpus as each core has threads on the
> > > current
> > > system. The vcpu->item relation is fixed.
> >=20
> > the case if you arranged vCPU-s into virtual threads, cores,
> > sockets,
> > and nodes, but at least from the patch titles it doesn't look as if
> > you
> > did in this series. Are there other reasons to make this a fixed
> > relationship?
>=20
> In fact I'm doing it, but only implicitly and without adapting the
> cpuid related information. The idea is to pass the topology
> information
> at least below the scheduling granularity to the guest later.
>=20
> Not having the fixed relationship would result in something like the
> co-scheduling series Dario already sent, which would need more than
> mechanical changes in each scheduler.
>=20
Yep. So, just for the records, those series are, this one for Credit1:
https://lists.xenproject.org/archives/html/xen-devel/2018-08/msg02164.html

And this one for Credit2:
https://lists.xenproject.org/archives/html/xen-devel/2018-10/msg01113.html

Both are RFC, but the Credit2 one was much, much better (more complete,
more tested, more stable, achieving better fairness, etc).

In these series, the "relationship" being discussed here is not fixed.
Not right now, at least, but it can become so (I didn't do it as we
currently lack the info for doing that properly).

It is/was, IMO, a good thing that everything work both with or without
topology enlightenment (even for one we'll have it, in case one, for
whatever reason, doesn't care).

As said by Juergen, the two approaches (and hence the structure of the
series) are quite different. This series is more generic, acts on the
common scheduler code and logic. It's quite intrusive, as we can see
:-D, but enables the feature for all the schedulers all at once (well,
they all need changes, but mostly mechanical).

My series, OTOH, act on each scheduler specifically (and in fact there
is one for Credit and one for Credit2, and there would need to be one
for RTDS, if wanted, etc). They're much more self contained, but less
generic; and the changes necessary within each scheduler are specific
to the scheduler itself, and non-mechanical.

Regards,
Dario
--=20
<<This happens because _I_ choose it to happen!>> (Raistlin)
------------------------------------------------------------
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/

--=-sRt/Go+qBkQZxWDihjkS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeTicACgkQFkJ4iaW4
c+4tKA/+NnsgzXMpjTzUCZ0wVff31gp0b3lJUHYHpkESJNot04R1KL1VXT5tMBwY
UQwiKUp8bd+kpgi7U5/0ibUU9lMbJ6lUID7Qes2Glpqr+smWiSNRoK/a2O4doq8S
3RepDiIvhzuqyh+WkRU3QHM/lSARRaBER+7hSPfEmkc1QLO6qoCb4/2m1iRRTAF5
YdfBIsm/TjKaMlRLkgr+34smKFYzVUl31DMOlbUcTLOp4rFHJPb4sss831LJ82Ph
cm5N07khAYNLngn7U6b3jf2e6AteI5ThZKAO3rV+9ge4IqU8yJNc5zpCMhN21lg0
eKMCgVN/mQMsWKNdAU18hQRZs/at5iykKGbOIy/78kdTG9YajgRolBIgmXn0a2kB
0qYsJ0/rhzV3c+AAukPgwtINBHO/Md6vWbJ7GinEp0OVFsUv5EfaFLW6l3yEdZbU
8mHrJlHCUWa+UqHgbfi8ASqE2SPz+X8zWZqyVA4KaxdIVBk/QboV/0vhMO4AmBqH
AaawPJUL9Rd4NsYzyq843xSr7w8eEQv9QPQCEyWZJKpgdPlfQ3cxLiINa9zO1Wti
cqVOBVYQAJOTgaio1UnHXzxyxWznjVcFqbly6Afh9gjwliuZF/t5MNKV2lRMX+n6
1M0/Ix3AKNybwI6LtXkU2M0NtdGle7oH65vOTzltKu0oMrhC2PM=
=xOO/
-----END PGP SIGNATURE-----

--=-sRt/Go+qBkQZxWDihjkS--



--===============1645975094776713107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1645975094776713107==--
