Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A29FCCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 11:56:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451714.1666630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgXQ-0005ga-4A; Fri, 16 Oct 2026 11:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451714.1666630; Fri, 16 Oct 2026 11:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgXQ-0005gQ-0O; Fri, 16 Oct 2026 11:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1451714;
 Fri, 16 Oct 2026 11:55:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491772e0008425@swg.vates.tech>)
 id 1xHgXO-0005YH-Lj
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:55:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHgXO-005irR-2Z
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 13:55:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491772e0008425@swg.vates.tech>)
 id 6ad210b9-bab6-0a2a0a5309dd-0a2a45068da2-28
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:55:50 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491772e0008425@swg.vates.tech>)
 id 6ad210c5-195a-0a2a45060019-b9ff1c23b627-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:55:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14491772e0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 11:55:46 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CF94D820A2;
 Fri, 16 Oct 2026 13:55:45 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=bEP1KJLvJPIye/L03+Bba3bLDuYREROjy9vT7lGKjE4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=LfbCnWvKl6W/DfpCrggrgqZh4hKb/d2ofrx4SiokHxU7Zuu8NK6uQyjO62E3nsxKfjELui6KR
 U7M8jnDNiX6GT7ajfB6+TVFPM2vfwd/qHfua9x2JP7ELlyly6gADQ9bsw3i/pUoVyEB8J9dWFNe
 ZpvqErFykTF3upezAnbzvG4Mh9UjXQk+xt5BJkyBMU5QsFWVcW74wRuwbOwD1IBT/mAKxraXOi6
 9FR5bdrNg/I8Bi8R0cYWO0zaBPt7xlLU28e56Bqrl/snbDB+23K9fQhLB7bKqixOA+zXV9ErWEm
 1dvMiyNb5yfE1fLvNa99R3tSut8/apk7QMQVtE3y+5SQ==
X-Zone-Loop: caef1e2764d721f5ce2c10e8916a513d127bf8c32f86
x-campaign-type: default
x-transaction-id: 99eea488-6124-4d29-be42-9707ab898170
x-swg-uid: 01-6ee9d462-cd79-4e63-9096-e53147192dd4
X-Mailer: Sweego
Message-ID:
 <1792151746.8631fc262581453bbf619ec5b2062170.1a14491772e0008425@vates.tech>
x-swg-bid: 1792151746.8631fc262581453bbf619ec5b2062170.1a14491772e0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/3] tools/libxenstat: fix output initialisation in
 parseNetDevLine()
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Olivier Lambert <olivier.lambert@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1792142038.8631fc262581453bbf619ec5b2062170.1a143fd56420008425@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech>
 <1792142038.8631fc262581453bbf619ec5b2062170.1a143fd56420008425@vates.tech>
Date: Fri, 16 Oct 2026 13:55:37 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792151740; l=999;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=T7e+whLdZXdyiegonGx5qOYa3D+L+vpmuvPyzAot4y8=;
 b=Z8VIRlDcWGY2xB5UUKvZ9ar+tewXuw8tjjWN9Y7JHYrBsm1tnNc122Rv1AcyIrA3RAwxsGhLr
 N7MAEyx4gBiCv0/nSfBqXltRIK57zIg8P/7YM92kFukWsX2VM57tJs8
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792151745929
X-purgate-ID: tlsNG-16d1c6/1792151750-FC80577B-DD8AC354/0/0
X-purgate-type: clean
X-purgate-size: 999

> parseNetDevLine() zeroes all the outputs it is passed before parsing the
> line, but *rxPackets is zeroed twice while *rxMcast isn't zeroed at all,
> so it would be left untouched for a line that doesn't parse.
> 
> Also, iface is cleared with memset(iface, 0, sizeof(*iface)), which only
> covers the first byte. The function isn't told the buffer size, and an
> empty string is all that's needed, so write the terminator directly.
> 
> No functional change intended: the only caller passes NULL for rxMcast.
> 
> Assisted-by: Claude-Code:claude-opus-5-5
> Signed-off-by: Olivier Lambert <olivier.lambert@vates.tech>
> ---
The subject says "fix", but the body says no functional change. Either
it's a bug fix and wants a Fixes: tag, or it isn't, and then I'd use
Amends: 1fd93d4f8cb8 ("xenstat: Linux dom0 statistics for case we use
network bonding") and drop "fix" from the subject. Based on the changes, I think the latter.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

