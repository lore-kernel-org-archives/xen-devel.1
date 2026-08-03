Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF05CC55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:07:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381103.1624682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktY-00034s-NP; Mon, 03 Aug 2026 05:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381103.1624682; Mon, 03 Aug 2026 05:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktY-00034h-Jp; Mon, 03 Aug 2026 05:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1381103;
 Mon, 03 Aug 2026 05:07:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqktX-00032f-Bx
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:07:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqktW-006W8q-P2
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:07:22 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a7021f1-2eae-0a2a0a5409dd-0a2a450aec7a-34
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:22 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702209-f2d2-0a2a450a0019-d1558034b5d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:21 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49557167508so14758105e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:21 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785733641; x=1786338441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CM+qUXy25CRFKkF1HaPx8PYdTauLZnNcJY3C0JI+/Dc=;
        b=TCB+1OEl9u/sNipcbKczY61o/1VCQ2cKvMu9vCsZxuZYjSCIC+lbD8uxSbSpA9hMkf
         C7RQvNNHKu1AeZr7jHTyvZ0GTYURSf5ewWYa40W3s/rvl0zZHrmfpRUpMcfk3T6qIJxS
         UzX283JLA7W1WpQ5ZGqvrKiFpJJlANnjnM/5bWXahjGJQpFHelDaDU+10i3Q0KtwFmeD
         XCDCORthkgSwR+UJZGrqJiuhFDGqYr6WCTeMIXZx5xkqbMYfcnIU13FQStaHIIo98LLG
         YvKwaXeNDJbk+yqv5oKVsQl1MQaA8WCQukDhTDGSgeqQ48uYdsOGE4ZfD2Tgel6ch8Jb
         pmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733641; x=1786338441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CM+qUXy25CRFKkF1HaPx8PYdTauLZnNcJY3C0JI+/Dc=;
        b=Fi5ahYbfUudRk+xY9zKdsQ0TGMN478GrmrMx6lq/NEkpj79j07uuU0Hx7Uy/ne+1DL
         YH8CKQnaGUwR1P6HUQteaotZn5pP7uhnvkxDSSMfcUA/MjYhQQnEXBzEHHUwA1drh5Fe
         4eZu6HG+lcnjVA7vUFZzlOyInGhKs75rFMdoCfsy/lCR1Wtcze9sWgHGEIPhgUm7TxMW
         Hh7neA1W2sECaUVKct+SqDNW3sWBRzgYiII3FgNjP4gloKKdZcQxMB6zEP6uya2UUHeS
         1WdwePmLn9sLwo5URu9didSk6H6msYxZ2HtK2/hGvraFZMRVJOoo6QKBlWm09+B7NTIp
         fXeQ==
X-Gm-Message-State: AOJu0YwYSU7n/hbCFNjkpvnZDMsooeCFb8MlOj5O+1HQUOBjeo3ZY5tU
	gfNGqZyo8J8NBJOXPGS5rc4EdoUX+NzktkvZiRUtyM8P/t2AQoECaX33pmuz3w==
X-Gm-Gg: AR+sD10wWtpzyABgA4Jnl+/5ppJRow5vpdjy958Co3o8wtwM6j0Y6xILBUX+nlN3c7u
	sLMxRWd4GW9mgjrR+cLFajVryYHbu2yTuMoNYcjEdT98XAJxEg1gaW+/QODyAswv8D/KAxG9sO/
	FaasbhF568aBSc/xZnkPykGkJAXhKBalS2G+YCD2qSXDLNdOl/S9CsfgjOl5s7tLRKZt8Q5ZZni
	M/XdGKgKeTAInx0lMjWXo2Cu6USCUfKxd0yq7Z83oIPzLHlZkwHdHPBV5K4qofDPrHgduTlCsKe
	uOemx92QnEe1v6hDL1CoWZxSK3o66xnqzDc/031W7CjRn3EgoZoW2lnOCyMvGNiVVV6HyQMLzjp
	mKUv2HpaBR0kyc7Rx0aWOnDtkdDFCqcrAJJWASRKCoHdirdv+KAwQG2c6PT6d197MKtFe6vTYB6
	Nvs+i4JyHCYsANXWexr92N0TsrW1dgYPgPb+xiKeNGbFVuVRyypVkZ4NYqLSqI0mA=
X-Received: by 2002:a05:600c:354a:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-4980c67d71emr173613755e9.19.1785733640879;
        Sun, 02 Aug 2026 22:07:20 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	dfaggioli@suse.com,
	stewart.hildebrand@amd.com,
	nathan.studer@dornerworks.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	michal.orzel@amd.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	tpearson@raptorengineering.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	oleksii.kurochko@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 3/7] xen/sched: credit2: migrate to new sched_ops
Date: Mon,  3 Aug 2026 08:06:10 +0300
Message-Id: <20260803050614.5222-4-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785733641-518C5CFC-88A0B142/0/0
X-purgate-type: clean
X-purgate-size: 1270

Declare sched_credit2_def as a struct sched_ops instead of a struct
scheduler, dropping the .sched_data field, and register it with
REGISTER_SCHED_OPS() so it is found through sched_ops_array[]
instead of schedulers[].

This moves the credit2 scheduler onto the new sched_ops
registration path.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/credit2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 95946634d1..9bcc90004a 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -4230,11 +4230,10 @@ csched2_deinit(struct scheduler *ops)
     xfree(prv);
 }
 
-static const struct scheduler sched_credit2_def = {
+static const struct sched_ops sched_credit2_def = {
     .name           = "SMP Credit Scheduler rev2",
     .opt_name       = "credit2",
     .sched_id       = XEN_SCHEDULER_CREDIT2,
-    .sched_data     = NULL,
 
     .global_init    = csched2_global_init,
 
@@ -4269,4 +4268,4 @@ static const struct scheduler sched_credit2_def = {
     .free_domdata   = csched2_free_domdata,
 };
 
-REGISTER_SCHEDULER(sched_credit2_def);
+REGISTER_SCHED_OPS(sched_credit2_def);
-- 
2.34.1


