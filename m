Return-Path: <SRS0=xlmN=JF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F2C433ED
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 12:20:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB11261041
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 12:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB11261041
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.107252.205037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTe8-0004hh-TW; Thu, 08 Apr 2021 12:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107252.205037; Thu, 08 Apr 2021 12:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTe8-0004ha-QT; Thu, 08 Apr 2021 12:20:28 +0000
Received: by outflank-mailman (input) for mailman id 107252;
 Thu, 08 Apr 2021 12:20:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTe7-0004hC-Td
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:20:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d3974a3-264d-4372-88fd-dc6326da25d9;
 Thu, 08 Apr 2021 12:20:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B643B0E6;
 Thu,  8 Apr 2021 12:20:26 +0000 (UTC)
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
X-Inumbo-ID: 1d3974a3-264d-4372-88fd-dc6326da25d9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQLFBbZwmFP7/XJISrFVWgSoZI+0nr2VJyf5BHmRMeA=;
	b=RQDKsL8zp4IN2ANmpnNqpG1LhduC6Z/nnT4q7+7JgHelBGhZIr6M0yByjuuC8Ph7W8mJ9V
	oPV3r7z7s+N1Q0dkGgzcX2sB1ANp69zW0VJJJ4Nr961S+nvIq2jY5IKHJhAjJO6+tw+Knh
	t3+gkgweDp2Qwj4X+28vF2CmHkiiiXo=
Subject: [PATCH 06/11] x86/IRQ: avoid over-alignment in alloc_pirq_struct()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <75885e8f-fd0a-5ac1-b194-7f8858320874@suse.com>
Date: Thu, 8 Apr 2021 14:20:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In particular in the PV case xzalloc_bytes() forcing SMP_CACHE_BYTES
alignment is counterproductive, as the allocation size there is only 40
bytes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1313,9 +1313,12 @@ void cleanup_domain_irq_mapping(struct d
 
 struct pirq *alloc_pirq_struct(struct domain *d)
 {
-    size_t sz = is_hvm_domain(d) ? sizeof(struct pirq) :
-                                   offsetof(struct pirq, arch.hvm);
-    struct pirq *pirq = xzalloc_bytes(sz);
+    union pirq_pv {
+        char space[offsetof(struct pirq, arch.hvm)];
+        void *align;
+    };
+    struct pirq *pirq = is_hvm_domain(d) ? xzalloc(struct pirq)
+                                         : (void *)xzalloc(union pirq_pv);
 
     if ( pirq )
     {


