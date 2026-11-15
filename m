Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35E8606A337
	for <xen-devel@archiver.kernel.org>; Sun, 15 Nov 2026 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wfp/YTil
Received: from list by lists.xenproject.org with outflank-mailman.1489878.1691061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSbma-0006pn-1U; Sun, 15 Nov 2026 15:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489878.1691061; Sun, 15 Nov 2026 15:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSbmZ-0006pg-UU; Sun, 15 Nov 2026 15:04:39 +0000
Received: by outflank-mailman (input) for mailman id 1489878;
 Sun, 15 Nov 2026 15:04:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xSbmZ-0006pP-1Q
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2026 15:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSbmY-0092on-Eh
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2026 16:04:38 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6af9c9dc-2eae-0a2a0a5409dd-0a2a450cac02-10
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2026 16:04:38 +0100
Received: from [91.218.175.138] (helo=mta0.migadu.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6af9ca06-f479-0a2a450c0019-5bdaaf8a98ff-3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2026 16:04:38 +0100
Received: by smtp.migadu.com with ESMTPS id d079f2d505d062ac;
 Sun, 15 Nov 2026 15:04:37 +0000
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
DKIM-Signature: a=rsa-sha256; bh=D0MZnHog1A8EE4Bm1aHHU0xGqK8HZGz7uIjWlkiBHIw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794755078; v=1; x=1795359878;
 b=wfp/YTilzaW0aDtB3gn4FyDG4Kpck6bi1Wz4yrAJWDm+6KB1+V8+y+F6DAR86cdpT8pA2dqA
 2eYUOvRf/Ue9CUmdBjMIi0K+++TrKo13nD4i9K2fbRKJfkEPxsUPG9pzd7+CkViz8rRwvL2M9wL
 yi2BwHCOI+XXmhSIcN7q/rFM=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: d079f2d505d062ac
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
Subject: Re: [PATCH v9 15/19] hw/usb/redirect-server: Send device and interface information
Date: Sun, 15 Nov 2026 09:04:19 -0600
Message-ID: <20261115150419.1309675-2-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110072818.2883349-16-jamin_lin@aspeedtech.com>
References: <20261110072818.2883349-16-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794755078-036D6A5B-F55C6D8C/0/0
X-purgate-type: clean
X-purgate-size: 552
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With usb-storage exported from ast2600-evb, usb-redir's VID:PID and
interface-class filters accept and reject as expected.

A local test device exercised NAK retries, asynchronous completion,
malformed descriptors and timeouts. Reset, disconnect and unplug
during an asynchronous descriptor read cancelled the pending request
before cleanup. Configuration and alternate-setting changes update
interface_info and ep_info, including configuration 0.

Reviewed-by: Junjie Cao <junjie.cao@linux.dev>
Tested-by: Junjie Cao <junjie.cao@linux.dev>

