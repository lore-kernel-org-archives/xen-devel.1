Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778DEC10F11
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 00:34:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4036520818
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 00:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4036520818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hENfi-0007N3-UX; Thu, 11 Apr 2019 00:34:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XEB1=SN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hENfh-0007My-Sq
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 00:34:29 +0000
X-Inumbo-ID: 8f3b2194-5bf1-11e9-92d7-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f3b2194-5bf1-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 00:34:27 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 11 Apr 2019 02:34:25 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Thu, 11 Apr 2019 01:34:16 +0100
Message-ID: <59657c28f62cf82860560efaece6d0bfb0983846.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 11 Apr 2019 02:34:15 +0200
In-Reply-To: <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
Organization: SUSE
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC 00/49] xen: add core scheduling support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6901963147790665466=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411003415.SkfUq0HcJ3SZx8_3de2Bzh_MzkK1LXrfsnIREOIlR30@z>


--===============6901963147790665466==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8xfrTydkJsQKnhGD5P3Z"


--=-8xfrTydkJsQKnhGD5P3Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-29 at 19:16 +0100, Dario Faggioli wrote:
> On Fri, 2019-03-29 at 16:08 +0100, Juergen Gross wrote:
> > I have done some very basic performance testing: on a 4 cpu system
> > (2 cores with 2 threads each) I did a "make -j 4" for building the
> > Xen
> > hypervisor. With This test has been run on dom0, once with no other
> > guest active and once with another guest with 4 vcpus running the
> > same
> > test.
> Just as an heads up for people (as Juergen knows this already :-D),
> I'm
> planning to run some performance evaluation of this patches.
>=20
> I've got an 8 CPUs system (4 cores, 2 threads each, no-NUMA) and an
> 16
> CPUs system (2 sockets/NUMA nodes, 4 cores each, 2 threads each) on
> which I should be able to get some bench suite running relatively
> easy
> and (hopefully) quick.
>=20
> I'm planning to evaluate:
> - vanilla (i.e., without this series), SMT enabled in BIOS
> - vanilla (i.e., without this series), SMT disabled in BIOS
> - patched (i.e., with this series), granularity=3Dthread
> - patched (i.e., with this series), granularity=3Dcore
>=20
> I'll do start with no overcommitment, and then move to 2x
> overcommitment (as you did above).
>=20
I've got the first set of results. It's fewer than I wanted/expected to
have at this point in time, but still...

Also, it's Phoronix again. I don't especially love it, but I'm still
working on convincing our own internal automated benchmarking tool
(which I like a lot more :-) ) to be a good friend of Xen. :-P

It's a not too big set of tests, done in the following conditions:
- hardware: Intel Xeon E5620; 2 NUMA nodes, 4 cores and 2 threads each
- slow disk (old rotational HDD)
- benchmarks run in dom0
- CPU, memory and some disk IO benchmarks
- all Spec&Melt mitigations disabled both at Xen and dom0 kernel level
- cpufreq governor =3D performance, max_cstate =3D C1
- *non* debug hypervisor

In just one sentence, what I'd say is "So far so god" :-D

https://openbenchmarking.org/result/1904105-SP-1904100DA38

1) 'Xen dom0, SMT On, vanilla' is staging *without* this series even=20
    applied
2) 'Xen dom0, SMT on, patched, sched_granularity=3Dthread' is with this=20
    series applied, but scheduler behavior as right now
3) 'Xen dom0, SMT on, patched, sched_granularity=3Dcore' is with this=20
    series applied, and core-scheduling enabled
4) 'Xen dom0, SMT Off, vanilla' is staging *without* this series=20
    applied, and SMT turned off in BIOS (i.e., we only have 8 CPUs)

So, comparing 1 and 4, we see, for each specific benchmark, what is the
cost of disabling SMT (or vice-versa, the gain of using SMT).

Comparing 1 and 2, we see the overhead introduced by this series, when
it is not used to achieve core-scheduling.

Compating 1 and 3, we see the differences with what we have right now,
and what we'll have with core-scheduling enabled, as it is implemented
in this series.

Some of the things we can see from the results:
- disabling SMT (i.e., 1 vs 4) is not always bad, but it is bad=20
  overall, i.e., if you look at how many tests are better and at how=20
  many are slower, with SMT off (and also, by how much). Of course,=20
  this can be considered true for these specific benchmarks, on this=20
  specific hardware and with this configuration
- the overhead introduced by this series is, overall, pretty small,=20
  apart from not more than a couple of exceptions (e.g., Stream Triad=20
  or zstd compression). OTOH, there seem to be cases where this series=20
  improves performance (e.g., Stress-NG Socket Activity)
- the performance we achieve with core-scheduling are more than=20
  acceptable
- between core-scheduling and disabling SMT, core-scheduling wins and
  I wouldn't even call it a match :-P

Of course, other thoughts, comments, alternative analysis are welcome.

As said above, this is less that what I wanted to have, and in fact I'm
running more stuff.

I have a much more comprehensive set of benchmarks running in these
days. It being "much more comprehensive", however, also means it takes
more time.

I have a newer and faster (both CPU and disk) machine, but I need to
re-purpose it for benchmarking purposes.

At least now that the old Xeon NUMA box is done with this first round,
I can use it for:
- running the tests inside a "regular" PV domain
- running the tests inside more than one PV domain, i.e. with some=20
  degree of overcommitment

I'll push out results as soon as I have them.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-8xfrTydkJsQKnhGD5P3Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyui4cACgkQFkJ4iaW4
c+7rhA//Zk+x5eoBmbiQC/MfJeUFauf0rX/GpcCkKGk/YDeyv6nMhi2H+L9jBKES
oW0gmhH8vHsj8OqyEv9w3mV1gvRrT38w4XlJN2uCuTbIJ51hgWhauH1jm76omdBY
weXMR6Gmv/3KrrnVhP2Qjue08xO4jfSXz39UDIZzgFc887tHBST/1DPp8MJHw736
4/IiacXbqSFhWEo6ICeYci07Rf8cpwFH2Cky/oS7XtAPCTSZLju9HIH1Ov5RIpmD
Vkgg86sSgtvcXow0olqufP8aesTJlZV99hojgU/j9U8/R1j83FXZdjBxEGDTBDHO
LaCkYNX6L0wpuX6V5HrUBjAF+RObo3UdSQ3+DyNV5vyT5OKthqEcVjRcdgFeICqj
J9k+rYn+ey252vFgNr5XEq50WsEgTueK+OjwV0kH2UvEn7WJxw8xBMKGxhth7NhU
JHhBQln8KcayhUZ6RVtqZVtujGe0PVl1SUds/JHC4AJgxzg6ppz+6xKfsKA04LA8
bBuswQXB0ewi/61uUgPk39ErQt2AwqSJ/N4T5K3GxBj7SU3jJW14W7vYM5VXXH26
5hvqDijPsQUU8zj4UFmYw34iXmqcBXtS3UjVK9pro7s0YEbn4U3Q3sjeylGZXqmN
0h+BKuuC5x1dZG0QVaqurRuetAvC0AmO74qnBWGHFLCCCGEPUqk=
=PhTl
-----END PGP SIGNATURE-----

--=-8xfrTydkJsQKnhGD5P3Z--



--===============6901963147790665466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6901963147790665466==--


