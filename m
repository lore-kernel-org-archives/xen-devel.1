Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5294606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hkTQuyP5
Received: from list by lists.xenproject.org with outflank-mailman.1469938.1678714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001Zg-CK; Tue, 03 Nov 2026 14:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469938.1678714; Tue, 03 Nov 2026 14:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001ZF-8Y; Tue, 03 Nov 2026 14:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1469938;
 Tue, 03 Nov 2026 14:23:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQO-0000wq-02
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:23:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQN-00EbcA-D6
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:23:43 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee5d-bab6-0a2a0a5309dd-0a2a45019db4-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:42 +0100
Received: from [95.215.58.241] (helo=mta1.migadu.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee6d-5984-0a2a45010019-5fd73af14f1c-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:41 +0100
Received: by smtp.migadu.com with ESMTPS id ccd15e2f84fc0457;
 Tue, 03 Nov 2026 14:23:41 +0000
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
DKIM-Signature: a=rsa-sha256; bh=xk5kInH8so8Y/14bnNg52lPes1DhR3UngTZMTq5ajyA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715821; v=1; x=1794320621;
 b=hkTQuyP5vo3vVZx6OR7TTxPjqnXEcEY18hgrz9jeWF+0kXUU/3VE02ZBPch4jhwbFBw/LKp5
 eONwIshCmqGxiRLwiEe2EoNJBxhGibUaAeR5FNCYIMAEnwyf87VupmFnKs2p/jRqhUlIsvRZ4/e
 4LNaSpebliTJBK6/Qv/L/KPU=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: ccd15e2f84fc0457
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
Subject: Re: [PATCH v8 06/18] hw/usb/hcd-dwc2: Add an auto-hub property and leave it off
Date: Tue,  3 Nov 2026 08:23:20 -0600
Message-ID: <20261103142327.1348025-2-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-7-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-7-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793715822-BEE60757-89C7D8F9/0/0
X-purgate-type: clean
X-purgate-size: 433
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:22:11AM +0000, Jamin Lin wrote:
> Add auto-hub and leave it off. raspi has no versioned machine type, so
> compat cannot reach it. bcm2835_peripherals turns the property on, and
> raspi keeps the hub it has today.

raspi3b and raspi4b with usb-kbd and usb-mouse still put both behind
the hub on port 1.

Reviewed-by: Junjie Cao <junjie.cao@linux.dev>
Tested-by: Junjie Cao <junjie.cao@linux.dev>

