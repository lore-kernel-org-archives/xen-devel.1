Return-Path: <SRS0=KeRi=OR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A410C433EF
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 21:00:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B21F60F41
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 21:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B21F60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.197182.350141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxjh-0001yf-6B; Mon, 27 Sep 2021 21:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197182.350141; Mon, 27 Sep 2021 21:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxjh-0001yY-2h; Mon, 27 Sep 2021 21:00:29 +0000
Received: by outflank-mailman (input) for mailman id 197182;
 Mon, 27 Sep 2021 21:00:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ukqu=OR=pengutronix.de=ukl@srs-us1.protection.inumbo.net>)
 id 1mUxjf-0001yS-DO
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 21:00:27 +0000
Received: from metis.ext.pengutronix.de (unknown
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57575a6e-72fb-4dfc-8457-a9109f6a3762;
 Mon, 27 Sep 2021 21:00:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mUxik-0003sZ-Tr; Mon, 27 Sep 2021 22:59:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mUxia-0001cX-8M; Mon, 27 Sep 2021 22:59:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mUxia-0001SG-3t; Mon, 27 Sep 2021 22:59:20 +0200
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
X-Inumbo-ID: 57575a6e-72fb-4dfc-8457-a9109f6a3762
Date: Mon, 27 Sep 2021 22:59:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Russell Currey <ruscur@russell.cc>, x86@kernel.org,
	qat-linux@intel.com, oss-drivers@corigine.com,
	Oliver O'Halloran <oohall@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jiri Olsa <jolsa@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marco Chiappero <marco.chiappero@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-scsi@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Fiona Trahe <fiona.trahe@intel.com>,
	Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <simon.horman@corigine.com>,
	linuxppc-dev@lists.ozlabs.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jack Xu <jack.xu@intel.com>, Borislav Petkov <bp@alien8.de>,
	Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Juergen Gross <jgross@suse.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	xen-devel@lists.xenproject.org, Vadym Kochan <vkochan@marvell.com>,
	MPT-FusionLinux.pdl@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Zhou Wang <wangzhou1@hisilicon.com>, linux-crypto@vger.kernel.org,
	kernel@pengutronix.de, netdev@vger.kernel.org,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Paul Mackerras <paulus@samba.org>,
	Tomaszx Kowalik <tomaszx.kowalik@intel.com>,
	Taras Chornyi <tchornyi@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-perf-users@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 0/8] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20210927205917.e763q5mojkwk6per@pengutronix.de>
References: <20210927204326.612555-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upxcpc44c7obtcwt"
Content-Disposition: inline
In-Reply-To: <20210927204326.612555-1-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org


--upxcpc44c7obtcwt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 27, 2021 at 10:43:18PM +0200, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I sent the series from the wrong email address :-\ I should have used
the above address as sender. Also I failed to add Christoph Hellwig to
Cc: (fixed for this mail). I guess I'll have to send a v5, but I will
wait a bit until the build bots are done with this series.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--upxcpc44c7obtcwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFSMKIACgkQwfwUeK3K
7AnalQgAlpBrfIgHu7fEFcJYkSR/33uv+V4CLZsCsu9MNXsSeds9vT38r8/y0bJl
rOEKhsH1blIcq3bsV8/AulLrFkmjYRkkih/gA/y9CeoqpbV0/NzhrS4Xo9kMos8z
n+0f+PzRO1qg1RVWyPL7K4pkXR5cMkqWGoie07ihkt3Y9mVY8ItYl9ny3oDxCRcU
r8KFjr7Jw0Vo8eI3Kr9lu62KyFZFByf1DDBurR5crF8ZcWM7e9kOezvJrxOQxGPP
Z82uFafVCkhtIkKaks/6/y9pMmJF9hzDd91ubgKfbkPIMvBjpL7n07Y/Sk4S34vM
5wdHQGNinogsdgdebn8YdZCULLmXSQ==
=/nd3
-----END PGP SIGNATURE-----

--upxcpc44c7obtcwt--

