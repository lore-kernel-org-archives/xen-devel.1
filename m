Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_03_06,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418E2C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 16:13:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036506124F
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 16:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 036506124F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184593.333301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj9m-0007pm-Td; Fri, 10 Sep 2021 16:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184593.333301; Fri, 10 Sep 2021 16:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj9m-0007pb-QH; Fri, 10 Sep 2021 16:13:38 +0000
Received: by outflank-mailman (input) for mailman id 184593;
 Fri, 10 Sep 2021 16:13:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyUy=OA=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOj9l-00075v-8G
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 16:13:37 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca8ce114-82cb-4ca1-8ddf-7eba1622de29;
 Fri, 10 Sep 2021 16:13:31 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 163129037659656.3504099923116;
 Fri, 10 Sep 2021 09:12:56 -0700 (PDT)
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
X-Inumbo-ID: ca8ce114-82cb-4ca1-8ddf-7eba1622de29
ARC-Seal: i=1; a=rsa-sha256; t=1631290379; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DWzvGC/MvXBC2nLTXp+5lSjhdtveh+ZwiCJY05cuX5NJVEG6wf2jJvYQEbQ7xxhkxe0C6gpIDlH0MTswDvd16IZySqGFziow+rit+LT2sa2AxHhgLcR8hoEOKCgx+8vkLCOi3jwBO0wwdQ5GrAiQjpuveZqZpwnxeRsXDJuQba0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631290379; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2IE2exj9FVV6j0OTxj+ijceEC3Bs7d1+JzBzHRRpcYI=; 
	b=Ubkb2ItdvZldo5RTvxFoM10O3W79QUSDKc8hB41cgJux2Hu21qyDNuUUT1O//ZgNcBFgXLwJRIhK24QkEAjW8L9WZXjl3Z/gFyLnZLAfxvY+Qp3qVYqTwILLSQ2z98oTIyh0qoHy2SdIVvyNwpPme5S97f1Gv+Cpbk1O4KipJkk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631290379;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2IE2exj9FVV6j0OTxj+ijceEC3Bs7d1+JzBzHRRpcYI=;
	b=L9EdEVmVhiaJX0ta79XPP7F17m1vHwUT9/YLGTQQvDDy3rFnpCYZOsHgQxq56nxL
	DZ+jyfyFkk5GDDp5xhEZrgTq+qXzI1f3YDQyvTbbuNPds0jZn0ljewG6q0Lnr2p0K/b
	gARtpsR1r5iNK0BlarD6ZtPeTlCpxStDShf8NUB0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v6 03/10] xsm: remove remnants of xsm_memtype hook
Date: Fri, 10 Sep 2021 16:12:58 -0400
Message-Id: <20210910201305.32526-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910201305.32526-1-dpsmith@apertussolutions.com>
References: <20210910201305.32526-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

In c/s fcb8baddf00e the xsm_memtype hook was removed but some remnants were
left behind. This commit cleans up those remnants.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/include/xsm/xsm.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ad3cddbf7d..335ba1b022 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -161,7 +161,6 @@ struct xsm_operations {
     int (*shadow_control) (struct domain *d, uint32_t op);
     int (*mem_sharing_op) (struct domain *d, struct domain *cd, int op);
     int (*apic) (struct domain *d, int cmd);
-    int (*memtype) (uint32_t access);
     int (*machine_memory_map) (void);
     int (*domain_memory_map) (struct domain *d);
 #define XSM_MMU_UPDATE_READ      1
@@ -632,11 +631,6 @@ static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
     return xsm_ops->apic(d, cmd);
 }
 
-static inline int xsm_memtype (xsm_default_t def, uint32_t access)
-{
-    return xsm_ops->memtype(access);
-}
-
 static inline int xsm_machine_memory_map(xsm_default_t def)
 {
     return xsm_ops->machine_memory_map();
-- 
2.20.1


