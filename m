Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0888A606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kdfbgDc8
Received: from list by lists.xenproject.org with outflank-mailman.1469948.1678739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVO-0001sN-ID; Tue, 03 Nov 2026 14:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469948.1678739; Tue, 03 Nov 2026 14:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVO-0001pn-5K; Tue, 03 Nov 2026 14:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1469948;
 Tue, 03 Nov 2026 14:24:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQi-00010c-4g
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:24:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQh-008qVT-Ha
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:24:03 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee7c-e002-0a2a0a5209dd-0a2a45018e2e-18
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:03 +0100
Received: from [91.218.175.47] (helo=mta0.migadu.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee83-5984-0a2a45010019-5bdaaf2f5595-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:03 +0100
Received: by smtp.migadu.com with ESMTPS id 49fd60f0c25b3ce4;
 Tue, 03 Nov 2026 14:24:02 +0000
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
DKIM-Signature: a=rsa-sha256; bh=uxAVAj5I4ZNhE9FDm1hcjjRGig4oSJWX7ANkweiZjow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715843; v=1; x=1794320643;
 b=kdfbgDc8j5bL3MlHRDhlp49E5inOEdfwt8mNyHiSmdI5cCjoZG07J6YXwAvK8EkPXtQLC9sv
 2uxLnI/pamFlQXoy/C/8ZC4OXIiB/01dpoqL097a5P5BLqrJH4nQApNHiO2QRijsQSpfx+UWpv4
 6c94CMtMxR5No8L0X2d4ct98=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 49fd60f0c25b3ce4
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
Subject: Re: [PATCH v8 12/18] hw/usb/redirect-server: Connect usbredirparser to a chardev
Date: Tue,  3 Nov 2026 08:23:24 -0600
Message-ID: <20261103142327.1348025-6-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-13-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-13-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793715843-1E07B757-20F7A7A7/0/0
X-purgate-type: clean
X-purgate-size: 696
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:22:20AM +0000, Jamin Lin wrote:
> The chardev handling follows hw/usb/redirect.c: take no data before the
> parser exists, do not write to a closed backend, do not re-enter the
> writer, and let a close that is still queued finish before a new
> connection opens.

Exercised the close/reopen path with usb-storage exported: three
usb-redir clients in a row on one server each get hello and
device_connect. Killing a client with SIGKILL during a direct-I/O dd
loop leaves the server running (ASan build), and a fresh client gets
sda back and reads what it wrote.

Reviewed-by: Junjie Cao <junjie.cao@linux.dev>
Tested-by: Junjie Cao <junjie.cao@linux.dev>

