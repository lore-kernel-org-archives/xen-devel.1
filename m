Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A663606A32D
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D/Yy7Ivz
Received: from list by lists.xenproject.org with outflank-mailman.1476486.1682558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPI9R-0007Dc-Bv; Fri, 06 Nov 2026 11:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476486.1682558; Fri, 06 Nov 2026 11:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPI9R-0007DV-98; Fri, 06 Nov 2026 11:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1476486;
 Fri, 06 Nov 2026 11:30:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xPI9N-0007DM-KT
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 11:30:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPI9M-003Ld6-Qp
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 12:30:28 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6aedba49-e002-0a2a0a5209dd-0a2a4501dcc2-24
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 12:30:28 +0100
Received: from [95.215.58.251] (helo=mta1.migadu.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6aedba53-5984-0a2a45010019-5fd73afbc550-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 12:30:27 +0100
Received: by smtp.migadu.com with ESMTPS id 1377caa7985a86b7;
 Fri, 06 Nov 2026 11:30:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:To:Subject:Date:Message-ID:MIME-Version:Content-Type"
X-Envelope-To: xen-devel@lists.xenproject.org
DKIM-Signature: a=rsa-sha256; bh=XsI4CJ2an+tJXTOsJyS0x8/XxNKm4P+8FVw9XUcVmiY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793964627; v=1; x=1794569427;
 b=D/Yy7Ivzk5Esf10z8IA3huM8f4it3Y4DMptPt4+FzfwW+H57K39WkEkc5IUxunspu0wALl8+
 tFcVmKrBdGPYaSdJUMtyQOyJtoJrQ9sZtnxWgIfbkuJIj98VGvWOsl5FPxSXdGt9Wt8jVCN1guQ
 K7dhkC2ppLNv+Ml4G52qUt/k=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 1377caa7985a86b7
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: berrange@redhat.com,
	jamin_lin@aspeedtech.com
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
Subject: Re: [PATCH v8 02/18] hw/usb/hcd-xhci: Add an auto-hub property and leave it off
Date: Fri,  6 Nov 2026 05:30:21 -0600
Message-ID: <20261106113021.2841297-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <au2ZDOY7MGdY74L9@redhat.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-3-jamin_lin@aspeedtech.com> <20261103142327.1348025-1-junjie.cao@linux.dev> <SEZPR06MB73626D50E685F83DFB006D8DFC762@SEZPR06MB7362.apcprd06.prod.outlook.com> <SEZPR06MB7362D089282550D7585C16DEFC762@SEZPR06MB7362.apcprd06.prod.outlook.com> <au2ZDOY7MGdY74L9@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793964628-1E664757-5944A4E0/0/0
X-purgate-type: clean
X-purgate-size: 393
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks, Daniel. I'd be happy to continue reviewing v9.

Hi Jamin, if you decide to split the series, patch 01 could stay with the
server: it keeps existing controllers unchanged while letting the server
disable auto-hub. Patches 02–10 could follow separately, with the compat
TODO Daniel suggested.

I checked that 01 plus 11–18 apply cleanly to current master.

Thanks,
Junjie

