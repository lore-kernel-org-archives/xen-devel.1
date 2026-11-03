Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0F6606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cQXafJ3u
Received: from list by lists.xenproject.org with outflank-mailman.1469954.1678755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVP-0002Jf-Hg; Tue, 03 Nov 2026 14:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469954.1678755; Tue, 03 Nov 2026 14:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVP-0002F4-A9; Tue, 03 Nov 2026 14:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1469954;
 Tue, 03 Nov 2026 14:24:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFR1-00012X-49
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:24:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFR0-00Ebmi-HC
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:24:22 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee94-bab6-0a2a0a5309dd-0a2a4505c524-8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:22 +0100
Received: from [95.215.58.91] (helo=mta1.migadu.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee96-4cb1-0a2a45050019-5fd73a5bcac5-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:22 +0100
Received: by smtp.migadu.com with ESMTPS id 5b316335c9d00bc3;
 Tue, 03 Nov 2026 14:24:17 +0000
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
DKIM-Signature: a=rsa-sha256; bh=dYbGEk+OxE1iCeEfZYz8a9H/YzpNF62CSNH/K1fJ+ps=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715862; v=1; x=1794320662;
 b=cQXafJ3uwH0TreaSD1hMXwnWUzoRbM7TelnyM1q8RwJmcpvECZdsV/E/1wCDafoXIWHR+miE
 ziz0DJYb/trcAJQan+kDz8W9becXOMHdL5TweSANpv2KTVWQqYqu2LtW/TUYZDCArLfacLNvaXy
 gNoTQNAZ3K+1yCIbrRXNbtx8=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 5b316335c9d00bc3
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
Subject: Re: [PATCH v8 17/18] hw/usb/redirect-server: Implement isochronous OUT transfers
Date: Tue,  3 Nov 2026 08:23:27 -0600
Message-ID: <20261103142327.1348025-9-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-18-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-18-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793715862-247132A1-A637A2B6/0/0
X-purgate-type: clean
X-purgate-size: 626
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:22:27AM +0000, Jamin Lin wrote:
> Implement the three for an OUT endpoint. Endpoint 0 is control, so
> refuse it. The host sends a packet for every OUT transfer. It sends
> nothing for an IN transfer, so refuse an IN endpoint with a stall.

usb-audio exported from ast2600-evb (ASan build), Debian guest behind
qemu-xhci: a 2 s aplay at 48 kHz stereo now completes with 1995 iso
packets, all status 0, then stop_iso_stream; no disconnect, no ASan
report. The IN refusal path was not exercised.

Reviewed-by: Junjie Cao <junjie.cao@linux.dev>
Tested-by: Junjie Cao <junjie.cao@linux.dev>

