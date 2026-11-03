Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F9606A32F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=U+b8X8pR
Received: from list by lists.xenproject.org with outflank-mailman.1470118.1678889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSD-0006lI-DM; Tue, 03 Nov 2026 15:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470118.1678889; Tue, 03 Nov 2026 15:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSD-0006l6-A7; Tue, 03 Nov 2026 15:29:41 +0000
Received: by outflank-mailman (input) for mailman id 1470118;
 Tue, 03 Nov 2026 15:29:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOGSB-0006Sk-Rj
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:29:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGSB-007igP-8Z
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:29:39 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fdcc-2eae-0a2a0a5409dd-0a2a4508e184-30
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:39 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fde3-f659-0a2a45080019-d155802bf0b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:39 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so47974865e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:29:39 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm25430467f8f.45.2026.11.03.07.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 07:29:37 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793719779; x=1794324579; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDGy6hwgwHq8pad19ORCb8mC88V7O5aQmcoI2A6x98Q=;
        b=U+b8X8pRqqMNx4E1TKPy/u6B9dTRbqQBNUfo/OaQPPZw0HLjyksls9WJVOGaNo2Ir4
         SiqrZsbNMu6Jp/c94W3Z2LVygu7HQn8jn5xYpVtm32wz2vLJ/6U0YS80VIcfr5q5oKAP
         wcPeuh8fknP1OWKjcRL/pcknGE6ACdRJclbcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719779; x=1794324579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDGy6hwgwHq8pad19ORCb8mC88V7O5aQmcoI2A6x98Q=;
        b=Cn7NtgwAyIggeXviPMfQWkWyd3AvT9HJ2UhPXkSnqdonStMHsXjG5Ry8NHmnqfLT94
         g9b9mpM/pFcdRCuj+8vjs+enDWOf2Zd/ULUN4PdiY7cgQL5dWgl2dmau4R58wJF/daSu
         Ru8DvDlr/ObflhluZmLRv6TvQ1NMaX25hiX4dGkbwA3KrTnnMkwBvwmTByetsXg4ruim
         BuoXfDbqbcq5xOMIGBRpzr3AiASHQSxZUSa4chuzdCvCjvohxo8dQg1uwrc8LDbORLEi
         BeB2KRVKsSaDAfat59RGDRZxKIthuIYj2+C8sf0RblEks9OrbPToBHBnuikL4MrPYsk4
         4HDQ==
X-Gm-Message-State: APuU4Z/YiDeey8iAJ3JdvjOEcRodxC4mpXIgJbSA5rHDs39/YwYW0BXB
	f7i9t6HwVFaq36qNWuMaEjsiewT4+d0mEhIGTLzVx2mF2tfLXyMqAM/hug1FAph176kIS0FQL3X
	z4QUymu8=
X-Gm-Gg: AYBFou2q21JIAfnf6ZXKM110A71vu6AwEYPViEuqPN6wvrIV0BQfJ+ooyJQ/ENLo6oo
	r6NIfVvcOdHtAHBYHLw/og7doPirM40aNu4Bs6B6qg8KABei5h6XdIs7VScciviUsIQf3Jd0egD
	7rRJgWFTaoqLgWm55Sll+qidkP1045pTXo51ej0qS+0tnCrA+gJnf/s/mthN8NAyhFSZy4J1AZS
	CE6psuEJXS5xV1c4+B4AMWz9yeRHfirsiRx+gu3FUFaymR2adGjPfNLdD7IS82TcWHuCPQeQKhw
	SvLdSc10h43bgnSpUGyRPlIdt8jiFOjgwcUx008bY7keG0oP74WHfRbNRql99/svisMBxAaNIQt
	HTKcYD1A0DDB8+VQdTGMon/cvYDNHuDoRHbJuWXv+r1fkKGea9s70+qxG8KlcI9UD0/cX8Uhe3D
	F2hOy6ZUAyQxyiViTUpgolEMvRhAIRCR64FxNNTNfQqIJ4SVB82xoymg2FSq4s6pBVdcJB1/i+x
	I6Fkpm8LCKJG1fOmTLcSZRW4GZ0ao9wf3uFXXLkqS8PPuTyi+LFCISwGdvT0TeDNM9xqJKkYoiZ
	6YQJwXzpOh18KeWPRdhHMbYxQzQAaC8dUL3AtsAobjI4zUwkSF6t8AyG9zI9rb4rMKiYLzqS3uT
	GRxkqgM/RraEpWYS0WL7Lsbl9
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr304579455e9.7.1793719778359;
        Tue, 03 Nov 2026 07:29:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 4/6] xen/gnttab: Document how _cache_flush() works
Date: Tue,  3 Nov 2026 15:29:26 +0000
Message-Id: <20261103152928.2142176-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793719779-DF6D687B-FB76ABCA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1387
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/common/grant_table.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index f4ec7524140a..4cc23f9231e6 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3598,6 +3598,15 @@ gnttab_swap_grant_ref(XEN_GUEST_HANDLE_PARAM(gnttab_swap_grant_ref_t) uop,
 }
 
 #ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
+/*
+ * Issue a cache flush operation on memory owned by the domain, or a mapped
+ * grant from another domain.  The caller must pass in cur_ref = 0 initially,
+ * and preserve the value across continuations.
+ *
+ * Returns: 0 for success
+ *          1 for a continuation while searching the mapped grants
+ *     -errno for error
+ */
 static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 {
     struct domain *d, *owner;
-- 
2.39.5


