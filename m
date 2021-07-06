Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5196FC07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 12:58:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF04B619AF
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 12:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF04B619AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151273.279583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kec-0002L1-4x; Tue, 06 Jul 2021 12:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151273.279583; Tue, 06 Jul 2021 12:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kec-0002Ku-20; Tue, 06 Jul 2021 12:58:22 +0000
Received: by outflank-mailman (input) for mailman id 151273;
 Tue, 06 Jul 2021 12:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0kea-0002Ko-7x
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:58:20 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5b742f6-de59-11eb-8494-12813bfff9fa;
 Tue, 06 Jul 2021 12:58:19 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx66CwCRlC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 14:58:12 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d5b742f6-de59-11eb-8494-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625576292;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=y27MN19P+v4IsV7slXfgmGmCq7jpZDxfZi6KGgnJHIs=;
    b=M7FsjiAm87D4SbehzUja6Hc9wrhB7LN4Gn+Kxj3TPGDArVE9J1gtw0DhIPlQ/xtffM
    37DUhB7vtuzw9XM5joQp5+sCW+xwguLgQqxd0lLdcjWZVjoB+WxQPlTgHf0b6JMca8sc
    yNas2IC+AU2SL8kymZegMwsxya8qN2ulcubD1iVauVTPoA9emhmvRlOAzn54Cb75b5vi
    sWirNmcSIjiFP7ikEbf8XQ1aSIOA3Mw3czJ6cjziPqxNNwXVwkURqU/jqRt/owLOG8PH
    yIKCvmIyDADBsNYldpBWLbj4TTxS2dnfMZQSCC7iDRMWSYTswBn5UVWv/4SjCNJlXZSd
    0kQA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 14:58:04 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
Message-ID: <20210706145804.1ab98f16.olaf@aepfle.de>
In-Reply-To: <20210706112332.31753-3-andrew.cooper3@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
	<20210706112332.31753-3-andrew.cooper3@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9bXYdQyId9Sn4B4JWXmjPiV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9bXYdQyId9Sn4B4JWXmjPiV
Content-Type: multipart/mixed; boundary="MP_/UT++wQs95qNG2mZqpgw9kgp"

--MP_/UT++wQs95qNG2mZqpgw9kgp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Tue, 6 Jul 2021 12:23:32 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> +    count =3D stats.dirty_count;

Is this accurate?

I remember the reporting is broken since a while, and testing a busy domU i=
ndicates it is still the case.

# xen-logdirty `xl domid domU`
0: faults=3D 0 dirty=3D 258050
1: faults=3D 0 dirty=3D 257817
2: faults=3D 0 dirty=3D 253713
3: faults=3D 0 dirty=3D 253197
4: faults=3D 0 dirty=3D 255154
5: faults=3D 0 dirty=3D 260876
6: faults=3D 0 dirty=3D 259083
7: faults=3D 0 dirty=3D 253163
8: faults=3D 0 dirty=3D 258349
9: faults=3D 0 dirty=3D 260330
10: faults=3D 0 dirty=3D 259754
11: faults=3D 0 dirty=3D 257273
12: faults=3D 0 dirty=3D 255756
13: faults=3D 0 dirty=3D 258209
14: faults=3D 0 dirty=3D 257847
15: faults=3D 0 dirty=3D 59639
16: faults=3D 0 dirty=3D 81
17: faults=3D 0 dirty=3D 86
18: faults=3D 0 dirty=3D 111
19: faults=3D 0 dirty=3D 81
20: faults=3D 0 dirty=3D 80
....


Olaf

--MP_/UT++wQs95qNG2mZqpgw9kgp
Content-Type: text/x-c++src
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=logdirty.c

/* gcc -Wall -o logdirty -O -lxenctrl logdirty.c */
#include <unistd.h>
#include <errno.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>
#include <xenctrl.h>
#include <signal.h>

#define PAGE_SHIFT              XC_PAGE_SHIFT
#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))=
-1))
#define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
#define BITS_PER_LONG (sizeof(unsigned long) * 8)
#define ORDER_LONG (sizeof(unsigned long) =3D=3D 4 ? 5 : 6)


static unsigned int domid =3D 0;
static xc_interface *xch;

static unsigned long xdmg(xc_interface *c, unsigned int d)
{
	unsigned long r;
#if XEN_DOMCTL_INTERFACE_VERSION < 0x0b
	r =3D xc_domain_maximum_gpfn(c, d);
#else
	xen_pfn_t gpfns =3D 0;
	r =3D xc_domain_maximum_gpfn(c, d, &gpfns);
#endif
	return r + 1;
}
static void sigint_handler(int sig)
{
	int rc;
	fprintf(stderr, "User aborted\n");
	rc =3D xc_shadow_control(xch, domid, XEN_DOMCTL_SHADOW_OP_OFF, NULL, 0, NU=
LL, 0, NULL);
        if (rc < 0)
                perror("XEN_DOMCTL_SHADOW_OP_OFF hypercall failed\n");
	exit(1);
}


static inline int bitmap_size(int nr_bits)
{
	int nr_long, nr_bytes;
	nr_long =3D (nr_bits + BITS_PER_LONG - 1) >> ORDER_LONG;
	nr_bytes =3D nr_long * sizeof(unsigned long);
	return nr_bytes;
}

int main(int argc, char *argv[])
{
	int rc, ret =3D 1, i, runs =3D 42;
	unsigned int lflags;
	xentoollog_level lvl;
	xentoollog_logger *l;
	DECLARE_HYPERCALL_BUFFER(unsigned long, to_skip);
	unsigned long p2m_size;
	xc_shadow_op_stats_t stats;

	errno =3D EINVAL;
	if (argc > 1)
		domid =3D atoi(argv[1]);
	if (!domid)
		goto out;
	if (argc > 2)
		runs =3D atoi(argv[2]);
	if (!runs)
		goto out;

	errno =3D 0;
	lvl =3D XTL_DEBUG;
	lflags =3D XTL_STDIOSTREAM_SHOW_PID | XTL_STDIOSTREAM_HIDE_PROGRESS;
	l =3D (xentoollog_logger *) xtl_createlogger_stdiostream(stderr, lvl, lfla=
gs);
	if (!l)
		goto out;

	xch =3D xc_interface_open(l, 0, 0);
	if (!xch)
		goto out;

	p2m_size =3D xdmg(xch, domid);
	if (!p2m_size)
		goto out;

	to_skip =3D xc_hypercall_buffer_alloc_pages(xch, to_skip, NRPAGES(bitmap_s=
ize(p2m_size)));
	if (!to_skip)
		goto out;

	signal(SIGINT, sigint_handler);

	rc =3D xc_shadow_control(xch, domid, XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,=
 NULL, 0, NULL, 0, NULL);
	if (rc < 0) {
		rc =3D xc_shadow_control(xch, domid, XEN_DOMCTL_SHADOW_OP_OFF, NULL, 0, N=
ULL, 0, NULL);
		if (rc < 0)
			goto out;

		rc =3D xc_shadow_control(xch, domid, XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY=
, NULL, 0, NULL, 0, NULL);
		if (rc < 0)
			goto out;
	}

	rc =3D xc_shadow_control(xch, domid, XEN_DOMCTL_SHADOW_OP_CLEAN, NULL, 0, =
NULL, 0, NULL);
	if (rc < 0)
		goto out;

	for (i =3D 0; i < runs; i++) {
		sleep(1);
		if (1)
			rc =3D xc_shadow_control(xch, domid, XEN_DOMCTL_SHADOW_OP_CLEAN, HYPERCA=
LL_BUFFER(to_skip), p2m_size, NULL, 0, &stats);
		if (rc < 0)
			goto out;
		printf("%d: faults=3D %" PRIu32 " dirty=3D %" PRIu32 "\n", i, stats.fault=
_count, stats.dirty_count);
	}
	rc =3D xc_shadow_control(xch, domid, XEN_DOMCTL_SHADOW_OP_OFF, NULL, 0, NU=
LL, 0, NULL);
	if (rc < 0)
		goto out;
	errno =3D ret =3D 0;
      out:
	perror(argv[0]);
	return ret;
}

--MP_/UT++wQs95qNG2mZqpgw9kgp--

--Sig_/9bXYdQyId9Sn4B4JWXmjPiV
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDkU10ACgkQ86SN7mm1
DoBrag/+MWUBjX9AiiU9jRbeBS1nQQcbpARGAceyW9FLOJXTrHSTBXyJpaJL+0hT
pZXwOPs5xfzaGwU8RaLIH6n9ADNgjCtKL2D3nAc59WMunUTiZS5JILSsfKDRuAJS
vOOv9LHGqZFpOAHd6f5Rj/CWL/eUuJjDkckrp5DzDsVL2oryshVvTxtIlBhokc6B
aZhF2gZurRYugYsySNRtoYmVoedNltRu4iNBq0FJt6GhAJEuQhc8VEM7havPueVE
Zbiy8a/ctEwWksD84vbXYmWbzqrsFgqqH72HsC7uEXVvSt7TXR/HgZDstFBokyJ/
x6YER2VTvbDyphf2VgStTXtRSr1S0kYiThG5MzLF5LP/9C83FyW6Vsq7ma3ZCoTW
Y0zekhwVk88C2V20+HOucff+SXXuV/x/54ocivaKIVLvtAr3jf+v2EDpKSEt2w3a
BoDkgJNVSdDhUl7aWSzxcqVWBqgPkQmeAilH87rjWBtA6ksi7KABzBhluHzDkzis
bmTVP5iXr3Gg1GBTHR6Q5769ilRg0rYMxBw7PeCoCKLFjVzvZNJfGNKFWac+WTNg
gPPGGHJIbiwLHH0/lGq65DCL+4E8cHvH7TuvlV34ys00eAHfT5Xrcx6AZn/WKJef
G26VPeVvfOW9MFfLVvm6UY73YtnnPlhuLh6Hgks0XLZqZb4ul7c=
=ZDa9
-----END PGP SIGNATURE-----

--Sig_/9bXYdQyId9Sn4B4JWXmjPiV--

