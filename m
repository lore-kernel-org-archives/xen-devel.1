Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C15FC001B0
	for <xen-devel@archiver.kernel.org>; Sun, 25 Jun 2023 20:49:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.554872.866292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfe-0002j2-Iw; Sun, 25 Jun 2023 20:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554872.866292; Sun, 25 Jun 2023 20:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfe-0002h6-Bc; Sun, 25 Jun 2023 20:49:18 +0000
Received: by outflank-mailman (input) for mailman id 554872;
 Sun, 25 Jun 2023 20:49:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfc-0002bq-Vd
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfc-0003Lu-La; Sun, 25 Jun 2023 20:49:16 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfc-00021M-DA; Sun, 25 Jun 2023 20:49:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=9w0nZdIHxyhiPgNJV2nNqGag3fqrurdY4W4q6aF8hO0=; b=P4wzfzxnhQFImT7ocJPK4FhQMa
	MB+CM/UwBTtJdUqR1QgSF0mVJR/SdxD4ai6WIaLBAXDb6mOj64aShcnNMK89Wv1D1oQic7iEdhmUG
	p+9uzZu7+P3STuBKaEMsloWfgVqMQDcba58XjSOjwOM9r0ZKgXS6j8ncfXmuFy4eYT20=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/9] xen/arm: Check Xen size when linking
Date: Sun, 25 Jun 2023 21:48:59 +0100
Message-Id: <20230625204907.57291-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The linker will happily link Xen if it is bigger than what we can handle
(e.g 2MB). This will result to unexpected failure after boot.

This unexpected failure can be prevented by forbidding linking if Xen is
bigger than the area we reversed.

Signed-off-by: Julien Grall <julien@xen.org>
---
 xen/arch/arm/xen.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index be58c2c39514..c5d8c6201423 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -241,3 +241,4 @@ ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
 ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
 ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
 ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
+ASSERT((_end - start) <= XEN_VIRT_SIZE, "Xen is too big")
-- 
2.40.1


