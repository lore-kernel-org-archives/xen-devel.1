Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE3606A32C
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ljiM0iiO
Received: from list by lists.xenproject.org with outflank-mailman.1469952.1678752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVP-00029e-87; Tue, 03 Nov 2026 14:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469952.1678752; Tue, 03 Nov 2026 14:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVO-00028n-SA; Tue, 03 Nov 2026 14:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1469952;
 Tue, 03 Nov 2026 14:24:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQt-00011z-Or
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:24:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQt-00Ebip-5N
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:24:15 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee84-bab6-0a2a0a5309dd-0a2a450c8302-36
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:15 +0100
Received: from [95.215.58.77] (helo=mta1.migadu.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee8d-f479-0a2a450c0019-5fd73a4d5e4e-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:14 +0100
Received: by smtp.migadu.com with ESMTPS id 58be1cdf7a96866c;
 Tue, 03 Nov 2026 14:24:12 +0000
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
DKIM-Signature: a=rsa-sha256; bh=VdD29gcIkIgsrfCvVkl1tBfL/QQjL8PuYp/i7dQ5rKk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715853; v=1; x=1794320653;
 b=ljiM0iiOSQmx5cUgdi8Tkz/hmFoFxmm/uqVRpGAf3lQknlaBFinwo6uQe6VODPV+0HVsfInY
 diyhkGz8LqIRqnpL2yVYtpGhH4ys/UQSX5kZ2oSHE0WGWx7lBnVV9EG5uyStjHYqhVO0tTCyoc5
 BxyZNWrM8OIF/4DuO/XyEAiw=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 58be1cdf7a96866c
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
Subject: Re: [PATCH v8 15/18] hw/usb/redirect-server: Implement bulk and interrupt transfers
Date: Tue,  3 Nov 2026 08:23:26 -0600
Message-ID: <20261103142327.1348025-8-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-16-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-16-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793715854-76CDBA5B-C1DC344A/0/0
X-purgate-type: clean
X-purgate-size: 633
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:22:24AM +0000, Jamin Lin wrote:
> Send bulk and interrupt packets to the device and return the result to
> the host. Each one is a request and an answer, so they reuse the packet
> tracking and the NAK handling added for control transfers.

The OUT length problem from v7 is gone. usb-storage exported from
ast2600-evb, Debian guest on the other side: sda shows up behind both
qemu-xhci and usb-ehci, no resets after enumeration, and a 1 MiB
direct write/read compares equal. Only bulk was exercised.

Reviewed-by: Junjie Cao <junjie.cao@linux.dev>
Tested-by: Junjie Cao <junjie.cao@linux.dev>

