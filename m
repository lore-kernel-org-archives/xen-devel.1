Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FDBC56202
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 15:02:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458F220724
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 15:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="syqth9XS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458F220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34598.65736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDLp-0004Pt-6B; Mon, 23 Nov 2020 15:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34598.65736; Mon, 23 Nov 2020 15:01:57 +0000
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
	id 1khDLp-0004Pm-2W; Mon, 23 Nov 2020 15:01:57 +0000
Received: by outflank-mailman (input) for mailman id 34598;
 Mon, 23 Nov 2020 15:01:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDLn-0004Pe-Jp
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:01:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd456b9a-936d-46a8-b5da-2a135e65e8c0;
 Mon, 23 Nov 2020 15:01:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13045AD7C;
 Mon, 23 Nov 2020 15:01:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDLn-0004Pe-Jp
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:01:55 +0000
X-Inumbo-ID: dd456b9a-936d-46a8-b5da-2a135e65e8c0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dd456b9a-936d-46a8-b5da-2a135e65e8c0;
	Mon, 23 Nov 2020 15:01:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606143714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+7w6mRETpLiN9gIS/CB5Ox8gdBTEBBgqW1Djhev8xk=;
	b=syqth9XSc/mUBVBEYhesPojU45Qb0OIARL9ykjTHe2nkP3UCHZlyDbqbhSqstqof35oSjg
	9yFJUOmn4iHAvntmhg4kNhamyt1hg0WAbRM06eLYRK2p0OcIEc08jZIhlSsfoCFbjDbr3G
	7ucNGiDLi1PsoLJfvWuXHWbAiVNqz3M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 13045AD7C;
	Mon, 23 Nov 2020 15:01:54 +0000 (UTC)
Subject: [PATCH v2 1/2] x86/IRQ: drop three unused variables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <935d31ab-cb65-02d7-a624-d5e047316389@suse.com>
Message-ID: <1f4956f8-1d84-b7e1-65ab-d6b78b178a02@suse.com>
Date: Mon, 23 Nov 2020 16:01:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <935d31ab-cb65-02d7-a624-d5e047316389@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I didn't bother figuring which commit(s) should have deleted them while
removing their last uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Yet one more.

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1402,7 +1402,6 @@ void desc_guest_eoi(struct irq_desc *des
 {
     irq_guest_action_t *action;
     cpumask_t           cpu_eoi_map;
-    int                 irq;
 
     if ( !(desc->status & IRQ_GUEST) )
     {
@@ -1411,7 +1410,6 @@ void desc_guest_eoi(struct irq_desc *des
     }
 
     action = (irq_guest_action_t *)desc->action;
-    irq = desc - irq_desc;
 
     if ( unlikely(!test_and_clear_bool(pirq->masked)) ||
          unlikely(--action->in_flight != 0) )
@@ -1531,7 +1529,6 @@ int pirq_shared(struct domain *d, int pi
 
 int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
 {
-    unsigned int        irq;
     struct irq_desc         *desc;
     irq_guest_action_t *action, *newaction = NULL;
     int                 rc = 0;
@@ -1548,7 +1545,6 @@ int pirq_guest_bind(struct vcpu *v, stru
     }
 
     action = (irq_guest_action_t *)desc->action;
-    irq = desc - irq_desc;
 
     if ( !(desc->status & IRQ_GUEST) )
     {
@@ -1663,13 +1659,11 @@ int pirq_guest_bind(struct vcpu *v, stru
 static irq_guest_action_t *__pirq_guest_unbind(
     struct domain *d, struct pirq *pirq, struct irq_desc *desc)
 {
-    unsigned int        irq;
     irq_guest_action_t *action;
     cpumask_t           cpu_eoi_map;
     int                 i;
 
     action = (irq_guest_action_t *)desc->action;
-    irq = desc - irq_desc;
 
     if ( unlikely(action == NULL) )
     {


