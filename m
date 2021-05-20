Return-Path: <SRS0=Fsm5=KP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41CDC433ED
	for <xen-devel@archiver.kernel.org>; Thu, 20 May 2021 13:34:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9186E610A2
	for <xen-devel@archiver.kernel.org>; Thu, 20 May 2021 13:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9186E610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.130986.245050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljioq-0008El-Dn; Thu, 20 May 2021 13:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130986.245050; Thu, 20 May 2021 13:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljioq-0008Ee-Aa; Thu, 20 May 2021 13:34:32 +0000
Received: by outflank-mailman (input) for mailman id 130986;
 Thu, 20 May 2021 13:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljioo-0008EY-VW
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 13:34:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b51d228-83c9-4c38-8ff7-7711c2681e1a;
 Thu, 20 May 2021 13:34:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 227A7ACAD;
 Thu, 20 May 2021 13:34:29 +0000 (UTC)
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
X-Inumbo-ID: 3b51d228-83c9-4c38-8ff7-7711c2681e1a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621517669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UkmRxEMjRg8EDY9RlqvwFs9Sc9dkUWwsLuUhnci+pxY=;
	b=FffhZbdD8UMsXj6TBfAm93pvLuk4ApEG2nqNdU53fViOpe5t9s5Q8na57O++Sx8rOdOz1u
	x1mRMpnBRMOdOu7obZiaL9wWr8XPq7Rwni9DlfjNmUr3suBoELAT7zmtSV8PJD0T1SB7mY
	crPpikRnzUiwysRJklX6H2aSmdJ90sE=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86emul: de-duplicate scatters to the same linear address
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
Date: Thu, 20 May 2021 15:34:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The SDM specifically allows for earlier writes to fully overlapping
ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
would crash it if varying data was written to the same address. Detect
overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
be quite a bit more difficult. To maintain proper faulting behavior,
instead of dropping earlier write instances of fully overlapping slots
altogether, write the data of the final of these slots multiple times.
(We also can't pull ahead the [single] write of the data of the last of
the slots, clearing all involved slots' op_mask bits together, as this
would yield incorrect results if there were intervening partially
overlapping ones.)

Note that due to cache slot use being linear address based, there's no
similar issue with multiple writes to the same physical address (mapped
through different linear addresses).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Maintain correct faulting behavior.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -10073,15 +10073,36 @@ x86_emulate(
 
         for ( i = 0; op_mask; ++i )
         {
-            long idx = b & 1 ? index.qw[i] : index.dw[i];
+            long idx = (b & 1 ? index.qw[i]
+                              : index.dw[i]) * (1 << state->sib_scale);
+            unsigned long offs = truncate_ea(ea.mem.off + idx);
+            unsigned int j, slot;
 
             if ( !(op_mask & (1 << i)) )
                 continue;
 
-            rc = ops->write(ea.mem.seg,
-                            truncate_ea(ea.mem.off +
-                                        idx * (1 << state->sib_scale)),
-                            (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
+            /*
+             * hvmemul_linear_mmio_access() will find a cache slot based on
+             * linear address.  hvmemul_phys_mmio_access() will crash the
+             * domain if observing varying data getting written to the same
+             * cache slot.  Utilize that squashing earlier writes to fully
+             * overlapping addresses is permitted by the spec.  We can't,
+             * however, drop the writes altogether, to maintain correct
+             * faulting behavior.  Instead write the data from the last of
+             * the fully overlapping slots multiple times.
+             */
+            for ( j = (slot = i) + 1; j < n; ++j )
+            {
+                long idx2 = (b & 1 ? index.qw[j]
+                                   : index.dw[j]) * (1 << state->sib_scale);
+
+                if ( (op_mask & (1 << j)) &&
+                     truncate_ea(ea.mem.off + idx2) == offs )
+                    slot = j;
+            }
+
+            rc = ops->write(ea.mem.seg, offs,
+                            (void *)mmvalp + slot * op_bytes, op_bytes, ctxt);
             if ( rc != X86EMUL_OKAY )
             {
                 /* See comment in gather emulation. */

