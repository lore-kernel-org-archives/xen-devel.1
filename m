Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F764C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 16:28:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382458.1625822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrI0W-0001HN-63; Tue, 04 Aug 2026 16:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382458.1625822; Tue, 04 Aug 2026 16:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrI0W-0001HG-3K; Tue, 04 Aug 2026 16:28:48 +0000
Received: by outflank-mailman (input) for mailman id 1382458;
 Tue, 04 Aug 2026 16:28:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <broonie@kernel.org>) id 1wrI0U-0001Fw-IU
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 16:28:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrI0S-00FQlU-7E
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 18:28:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <broonie@kernel.org>)
 id 6a72131d-bab6-0a2a0a5309dd-0a2a450acd8c-36
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 18:28:43 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <broonie@kernel.org>)
 id 6a721339-f2d2-0a2a450a0019-ac6904fee07c-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 18:28:42 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 62FAC600B1;
 Tue,  4 Aug 2026 16:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D41C1F000E9;
 Tue,  4 Aug 2026 16:28:39 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860921;
	bh=Kdx7GX4k8VWy3HBExGDyAtAIzWicr30iQzQ7BTOYMx0=;
	h=Date:From:To:Cc:Subject;
	b=RfJsSEv+0WQIiqBqX+7JmXsd3Yao6K9YFuLGoKPMZHayEMm6OPcMpVasJ1roiqS5/
	 rH6vRfL086JTj4gCfzn8Jjo83RdWKQsWUouiRq8i462SqUhipclb1katmLwp97Bc/P
	 zuZ6b6Hqfd3w0ZfbHOddHZKjj0qEApyu6Oqo9V5nSD+xHCcujTxvAlDbKd3k+hsLvT
	 gjkmxpVJZSaYLr/LB0CkweTPoFRqZBtr9C45HucfPhBqxlp33OxzgDr8HmAo7TPt/b
	 voYOypuu6WZX1zVakCN7jF8jxsIDZkX25YA8yharns0KvCxx7ERFntRp5KILs+3Ht5
	 tNOTZrdkWJPTQ==
Date: Tue, 4 Aug 2026 17:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <anITNOG1qicdE-TI@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rglbo7ou1xcCVJY2"
Content-Disposition: inline
X-purgate-ID: tlsNG-4011c0/1785860923-4BED2CFC-7A2F5682/0/0
X-purgate-type: clean
X-purgate-size: 1029


--rglbo7ou1xcCVJY2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "init_mm" [drivers/xen/xen-privcmd.ko] undefined!

Caused by commit

  64d26fb2ad1f2 (xen: privcmd: fix ioeventfd crash under PV domain)

I have used the tree from next-20260803 instead.

--rglbo7ou1xcCVJY2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyEzQACgkQJNaLcl1U
h9DmEgf9GH3biACmWnmq/yNJJWbRBo9ckKis4YF8r9wWF3cUXlbPpFU/onwdiX1R
8niVRJ6do7WpnIleXDsraBsdZT+5A519dVcvwZQTGPZij3w+H6/8kbtSBvDK0hH8
QXNlGwdUHrC4Dmfnn3b7cSHA0kM1u7lkmGwlNjDnDypmVw/tV9KOVRSrFRDk1yax
mjo6dYuai6eYmZ0RwZlX7R1u0BDDnJq0qwuI0Rz88ZvK8YSrE267CSXwQl9sJhzy
S4Jclf7ASn5mR3RiNeI7ad/S8CmWOE4hFQLD/MaWEOFXB1ZkFpM06cRsD/nuSzld
nTl9c3Va63TUmODp3RhIh3aLzwy7Wg==
=/t8B
-----END PGP SIGNATURE-----

--rglbo7ou1xcCVJY2--

