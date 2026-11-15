Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47AB606A31F
	for <xen-devel@archiver.kernel.org>; Sun, 15 Nov 2026 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hl7W+SwI
Received: from list by lists.xenproject.org with outflank-mailman.1489877.1691052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSbmU-0006d5-TZ; Sun, 15 Nov 2026 15:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489877.1691052; Sun, 15 Nov 2026 15:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSbmU-0006cw-OZ; Sun, 15 Nov 2026 15:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1489877;
 Sun, 15 Nov 2026 15:04:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xSbmS-0006cq-0S
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2026 15:04:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSbmR-00FYi3-6l
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2026 16:04:31 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6af9c9d3-e002-0a2a0a5209dd-0a2a450ae8fa-28
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2026 16:04:30 +0100
Received: from [91.218.175.132] (helo=mta0.migadu.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6af9c9fd-f2d2-0a2a450a0019-5bdaaf847b00-3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2026 16:04:30 +0100
Received: by smtp.migadu.com with ESMTPS id 3acce0f40d080449;
 Sun, 15 Nov 2026 15:04:29 +0000
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
DKIM-Signature: a=rsa-sha256; bh=nPKUOhKzk88267WTnZC+BhfvJDjbFcVQONJE5o9YV7c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794755069; v=1; x=1795359869;
 b=Hl7W+SwIJCvpp/F3ZrfqAD9i+rSRfZl7vWIyBH+bG97n6HEBLOLATCDkEuoQ4CAEjZ5m0trN
 WcfEW/0szLWv2V6BH8jLtWsbVRih1xRZJKRWO0/zuKhBeGbrWWCbZezlBByAjk9U9aW0QXsk+HO
 8L3N48Rh3Hz4T9nclsKtUCWc=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 3acce0f40d080449
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: jamin_lin@aspeedtech.com
Cc: berrange@redhat.com,
	kraxel@redhat.com,
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
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org,
	troy_lee@aspeedtech.com,
	junjie.cao@linux.dev
Subject: Re: [PATCH v9 14/19] hw/usb/redirect-server: Implement control transfers
Date: Sun, 15 Nov 2026 09:04:18 -0600
Message-ID: <20261115150419.1309675-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110072818.2883349-15-jamin_lin@aspeedtech.com>
References: <20261110072818.2883349-15-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794755070-51EC2CFC-0DCED155/0/0
X-purgate-type: clean
X-purgate-size: 129
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both issues I raised on v8 are fixed: the hello/control case and reset
with pending requests now behave as expected.

Junjie

