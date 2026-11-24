Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B04606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=bxGxcmdd
Received: from list by lists.xenproject.org with outflank-mailman.1501460.1697527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVw7j-0001o5-0t; Tue, 24 Nov 2026 19:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501460.1697527; Tue, 24 Nov 2026 19:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVw7i-0001ny-UT; Tue, 24 Nov 2026 19:24:14 +0000
Received: by outflank-mailman (input) for mailman id 1501460;
 Tue, 24 Nov 2026 19:24:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20f0401210001cf5@swg.vates.tech>)
 id 1xVw7h-0001ns-Sd
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 19:24:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVw7g-00AaO7-OA
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 20:24:12 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20f0401210001cf5@swg.vates.tech>)
 id 6b05e44f-2eae-0a2a0a5409dd-0a2a4509a8ce-26
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 20:24:12 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20f0401210001cf5@swg.vates.tech>)
 id 6b05e45c-be1a-0a2a45090019-b9ff1c239491-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 20:24:12 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20f0401210001cf5.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 19:24:10 +0000
Received: from leducb.tail4c4a28.ts.net
 (lfbn-gre-1-56-253.w92-157.abo.wanadoo.fr [92.157.33.253])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C78CA81DE6;
 Tue, 24 Nov 2026 20:24:08 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=KQ8iOV9YP+TlI5ZeHmG9kp8m9qk1amazrVFu0PGWRww=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=bxGxcmddmcqCVD2gQaYVS78FpsnX2GtpNombEEG4LfuhLqZTyke2u/ar0gXeWckTvKTaPhdLt
 culT5GbWY7R7WjKsFkh4hqMLy+nm2F3li8UHNdHxw2Ax05YM4unYsnXeeASU9KbUkFTeCQYvc21
 GgyoujgYJbydhskaTZfIo3x1YQs1l7u7aExElzsTx56/ocs8fcleDdIGz7RPxyfKp/+WzqhJ/Qx
 O6o7O849OXXkNslG5KpyDMFoonQPSsj6HCRrGMTuFprHL/TMVD0LWEJ0qcxoVG+Wvg8gE5nqpTX
 SxizUvILgPq86kHYsEZWjldpKxCil9dqtEAYcI2egT1A==
X-Zone-Loop: 29e1ccc9a792c13413a8257d63e268e45c878c955c0c
x-campaign-type: default
x-transaction-id: ef912efb-50ec-4aa2-bc9c-80072f7c5cf3
x-swg-uid: 01-9d14c85f-1b1f-4926-a07c-babed2d2e0e5
X-Mailer: Sweego
Message-ID:
 <1795548250.8631fc262581453bbf619ec5b2062170.1a20f0401210001cf5@vates.tech>
x-swg-bid: 1795548250.8631fc262581453bbf619ec5b2062170.1a20f0401210001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: Re: [PATCH v7 0/3] xen/mm: Introduce NUMA-aware memory claim sets
Date: Tue, 24 Nov 2026 20:24:08 +0100
In-Reply-To: <cover.1778272036.git.bernhard.kaindl@citrix.com>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795548249079
X-purgate-ID: tlsNG-bad1c0/1795548252-BF2DC034-4235A120/0/0
X-purgate-type: clean
X-purgate-size: 748
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernhard,

Gentle ping on this series. I saw your claims-main-v8 branch already
splits it as suggested in my v7 review, thanks!

Some data on why we care: on a 2-socket Xeon host running your v2 node
claim (carried in XCP-ng 9), a 44 GB VM started while another domain
filled the same node stayed fully local in 40/40 runs. With a host-wide
claim instead, its start failed in 36/40. The claim itself has no
measurable cost on allocation or VM start time.

When do you plan to post v8? I am happy to review it and rerun these
tests on it. If I don't hear back by the end of November, I will pick
up the series from your v8 branch and post it, keeping your authorship.

Thanks,

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

