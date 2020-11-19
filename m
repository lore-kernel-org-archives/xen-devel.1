Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3BCC56201
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 15:59:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7B32224A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 15:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="q4bJoCGp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7B32224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31038.61251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmKr-0005d1-IN; Thu, 19 Nov 2020 15:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31038.61251; Thu, 19 Nov 2020 15:59:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmKr-0005cu-FT; Thu, 19 Nov 2020 15:59:01 +0000
Received: by outflank-mailman (input) for mailman id 31038;
 Thu, 19 Nov 2020 15:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfmKp-0005ch-HW
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:58:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa303717-5def-4e0f-8768-f75e3b99fd43;
 Thu, 19 Nov 2020 15:58:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0203DABD6;
 Thu, 19 Nov 2020 15:58:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfmKp-0005ch-HW
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:58:59 +0000
X-Inumbo-ID: fa303717-5def-4e0f-8768-f75e3b99fd43
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa303717-5def-4e0f-8768-f75e3b99fd43;
	Thu, 19 Nov 2020 15:58:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605801538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ysR6G+ilv1ZK/CN9cDx2z22TTMlLoSfLmZbOqMSI0v8=;
	b=q4bJoCGpHCJ+SgQ7ExVNkDi7bSAgbXzag6FkidTDhvDWM5RSkFpo92t5N23MZ1rV3nzQMy
	C/LJxUkbFMAb01xdnHk9N5BtSPpzzwIMcVhUZBlzLnnkoi0rutsD2A8+XrER6WoO0AHrzq
	X/CHsySCe9CIisxyr6kNYVVNSpNUZ/Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0203DABD6;
	Thu, 19 Nov 2020 15:58:57 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: avoid UB in guest CR3 retrieval
Message-ID: <1a5bca28-b37c-eaa7-3a64-51428d24915f@suse.com>
Date: Thu, 19 Nov 2020 16:58:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Found by looking for patterns similar to the one Julien did spot in
pci_vtd_quirks(). (Not that it matters much here, considering the code
is dead right now.)

Fixes: 3a7947b69011 ("amd-iommu: use a bitfield for DTE")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -70,7 +70,8 @@ static void guest_iommu_disable(struct g
 
 static uint64_t get_guest_cr3_from_dte(struct amd_iommu_dte *dte)
 {
-    return ((dte->gcr3_trp_51_31 << 31) | (dte->gcr3_trp_30_15 << 15) |
+    return (((uint64_t)dte->gcr3_trp_51_31 << 31) |
+            (dte->gcr3_trp_30_15 << 15) |
             (dte->gcr3_trp_14_12 << 12)) >> PAGE_SHIFT;
 }
 

