Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362C606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CAvV7b/r
Received: from list by lists.xenproject.org with outflank-mailman.1469946.1678730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVO-0001o5-5t; Tue, 03 Nov 2026 14:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469946.1678730; Tue, 03 Nov 2026 14:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001mf-U8; Tue, 03 Nov 2026 14:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1469946;
 Tue, 03 Nov 2026 14:24:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQf-0000zL-43
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:24:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQe-0076YX-Gv
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:24:00 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee6e-2eae-0a2a0a5409dd-0a2a450cc714-32
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:00 +0100
Received: from [91.218.175.41] (helo=mta0.migadu.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee80-f479-0a2a450c0019-5bdaaf29e534-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:00 +0100
Received: by smtp.migadu.com with ESMTPS id ac8235e10c04efea;
 Tue, 03 Nov 2026 14:23:59 +0000
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
DKIM-Signature: a=rsa-sha256; bh=a/ZoT8xtlAOieDh+8krvJHnDyCHIqIIaNoy1fZC+ruw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715839; v=1; x=1794320639;
 b=CAvV7b/rrxvycryXIaoXNdfpugXKeMlI6eyKtqGmAyuW0I+3KZOiTsU0vFebTZedQDTkp7QM
 oPE2Vkxj9I7eh/vcPARvDyb7XnwFy1tGGKHwOEfk0XVGFb6dvt/onav1FkjwToleP2dF/GzrkTB
 mbfUv9cEy4dFirriOLzCe7OQ=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: ac8235e10c04efea
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
Subject: Re: [PATCH v8 11/18] hw/usb/redirect-server: Add a usbredir server device
Date: Tue,  3 Nov 2026 08:23:23 -0600
Message-ID: <20261103142327.1348025-5-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-12-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-12-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793715840-774D7A5B-73C5B458/0/0
X-purgate-type: clean
X-purgate-size: 510
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:22:18AM +0000, Jamin Lin wrote:
> Add "x-usb-redir-server". It exports a USB device from this QEMU to a
> USB host in another QEMU, using the usbredir protocol. The other side is
> the existing "usb-redir" device.

In an --enable-modules build, -device x-usb-redir-server loads
hw-usb-redirect.so, and the device comes up with a usb-kbd behind it on
ast2600-evb and ast1030-evb.

Reviewed-by: Junjie Cao <junjie.cao@linux.dev>
Tested-by: Junjie Cao <junjie.cao@linux.dev>

