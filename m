Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC84606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G24u1cdW
Received: from list by lists.xenproject.org with outflank-mailman.1469940.1678721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001fG-MN; Tue, 03 Nov 2026 14:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469940.1678721; Tue, 03 Nov 2026 14:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001eh-HI; Tue, 03 Nov 2026 14:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1469940;
 Tue, 03 Nov 2026 14:23:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQQ-0000x5-0h
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:23:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQP-008qRj-DI
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:23:45 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee5e-e002-0a2a0a5209dd-0a2a4509b40a-36
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:45 +0100
Received: from [95.215.58.3] (helo=mta1.migadu.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee70-be1a-0a2a45090019-5fd73a036aaa-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:45 +0100
Received: by smtp.migadu.com with ESMTPS id 8d5e30092c84e0cb;
 Tue, 03 Nov 2026 14:23:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:To:Subject:Date:Message-ID:MIME-Version"
X-Envelope-To: xen-devel@lists.xenproject.org
DKIM-Signature: a=rsa-sha256; bh=TnIL01EYzJL8JJTpVq6O/937dbzj+ZPigqvXodpgbHc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715824; v=1; x=1794320624;
 b=G24u1cdW1aRdOwL/H0En74GiM9tv+4Yj1xDV1bhmhYVYzhaU8DCgTXcVAwiUY/0e/5y2MhDV
 OdT8F76pyaT5awoya3ciaWSL21dwcNd17Sk+zHd6lj0ZnQDFRC4NY68lskHMtL8RleJPkn5Nu36
 R6NM9Z12QOuKDifLlX0qWmH4=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 8d5e30092c84e0cb
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: jamin_lin@aspeedtech.com
Cc: kraxel@redhat.com,
	marcandre.lureau@redhat.com,
	clg@kaod.org,
	pierrick.bouvier@oss.qualcomm.com,
	peter.maydell@linaro.org,
	kane_chen@aspeedtech.com,
	philmd@oss.qualcomm.com,
	kfting@nuvoton.com,
	wuhaotsh@google.com,
	zhao1.liu@intel.com,
	richard.henderson@linaro.org,
	deller@gmx.de,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@gmail.com,
	troy_lee@aspeedtech.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org,
	junjie.cao@linux.dev
Subject: Re: [PATCH v8 09/18] hw/arm/npcm7xx: Keep the automatic hub
Date: Tue,  3 Nov 2026 08:23:21 -0600
Message-ID: <20261103142327.1348025-3-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-10-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-10-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793715825-FD26A034-018C6EB2/0/0
X-purgate-type: clean
X-purgate-size: 424
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:22:15AM +0000, Jamin Lin wrote:
> npcm7xx has no versioned machine type, so compat cannot reach it. Turn
> the property on here instead. The companion shares the EHCI bus, so
> the EHCI carries the property.

Checked quanta-gsj and npcm750-evb: a second HID device still fits,
through the hub.

Reviewed-by: Junjie Cao <junjie.cao@linux.dev>
Tested-by: Junjie Cao <junjie.cao@linux.dev>

