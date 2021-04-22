Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52979C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 17:43:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D348661405
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 17:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D348661405
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115769.220914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZdMP-0001Tb-I5; Thu, 22 Apr 2021 17:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115769.220914; Thu, 22 Apr 2021 17:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZdMP-0001TU-F1; Thu, 22 Apr 2021 17:43:29 +0000
Received: by outflank-mailman (input) for mailman id 115769;
 Thu, 22 Apr 2021 17:43:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZdMO-0001T6-7k
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 17:43:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZdMO-0003NY-16; Thu, 22 Apr 2021 17:43:28 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZdMN-00038B-JO; Thu, 22 Apr 2021 17:43:27 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=AzfpKaBdrt3x7984/tvCLbD88cab96Phr9IzS6ojQd4=; b=hh/y4HXpxsco8erDeu6Ou/s0R+
	kcdn9vWUanHZD4hFghReBXhQbeI83CdjJ8MkCq2yghwMgtvWAvemTagQnFiCtDZ6Ml/BD0AcAr+8j
	4UseTu+CrxnI9LFjMrqAEnueB+ywwoSxzuSRZiNp69g5urUmGtKn1SwO/5CxDC0CuYmk=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mm: fix wrong unmap call
Date: Thu, 22 Apr 2021 18:42:30 +0100
Message-Id: <a59a28ee297d683933d057cc2a4d0d26ebd90bc9.1619113334.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1

From: Hongyan Xia <hongyxia@amazon.com>

Commit 'x86/mm: switch to new APIs in modify_xen_mappings' applied the
hunk of the unmap call to map_pages_to_xen() which was wrong and clearly
should have been at the end of modify_xen_mappings(). Fix.

Fixes: dd68f2e49bea ("x86/mm: switch to new APIs in modify_xen_mappings")

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Tested-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 50229e38d384..84e3ccf47e2a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5532,7 +5532,6 @@ int map_pages_to_xen(
 
  out:
     L3T_UNLOCK(current_l3page);
-    unmap_domain_page(pl2e);
     unmap_domain_page(pl3e);
     unmap_domain_page(pl2e);
     return rc;
@@ -5830,6 +5829,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
  out:
     L3T_UNLOCK(current_l3page);
     unmap_domain_page(pl3e);
+    unmap_domain_page(pl2e);
     return rc;
 }
 
-- 
2.17.1


