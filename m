Return-Path: <SRS0=SN9p=EE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D7EC4363A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 15:15:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CB92076E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 15:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qwlKE0y6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CB92076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.14277.35384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9dR-0006eK-Ad; Thu, 29 Oct 2020 15:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14277.35384; Thu, 29 Oct 2020 15:14:41 +0000
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
	id 1kY9dR-0006eD-7g; Thu, 29 Oct 2020 15:14:41 +0000
Received: by outflank-mailman (input) for mailman id 14277;
 Thu, 29 Oct 2020 15:14:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY9dP-0006e8-Gt
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:14:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78dbd365-d764-406e-bec0-2c668edd3c62;
 Thu, 29 Oct 2020 15:14:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAD13AC91;
 Thu, 29 Oct 2020 15:14:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY9dP-0006e8-Gt
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:14:39 +0000
X-Inumbo-ID: 78dbd365-d764-406e-bec0-2c668edd3c62
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 78dbd365-d764-406e-bec0-2c668edd3c62;
	Thu, 29 Oct 2020 15:14:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603984477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oMm5zPzSCOpinbtJseRPVozVV46YNC4lZVuO5Wv53SE=;
	b=qwlKE0y67hLWNKXrJGKqtVR99n1tU6yiChiyezvSLufQJOeW6emmrYRk5AH/v3OHzsDRbJ
	i3vRUl046RD61nYf+d0FduPGTH8xM4NMXcXLyemLAVfqUqKzKyQpfxqRX5l6kikAKU+4Oj
	ECNYMkTO9QXHtKoQe2TZXUOjhQnZVgY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AAD13AC91;
	Thu, 29 Oct 2020 15:14:37 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: send mapcache invalidation request to qemu
 regardless of preemption
Message-ID: <d33721a8-af91-7efc-b954-1d775bd4e35c@suse.com>
Date: Thu, 29 Oct 2020 16:14:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Even if only part of a hypercall completed before getting preempted,
invalidation ought to occur. Therefore fold the two return statements.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Split off from "x86/HVM: refine when to send mapcache invalidation
request to qemu".

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -326,14 +326,11 @@ int hvm_hypercall(struct cpu_user_regs *
 
     HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu -> %lx", eax, regs->rax);
 
-    if ( curr->hcall_preempted )
-        return HVM_HCALL_preempted;
-
     if ( unlikely(currd->arch.hvm.qemu_mapcache_invalidate) &&
          test_and_clear_bool(currd->arch.hvm.qemu_mapcache_invalidate) )
         send_invalidate_req();
 
-    return HVM_HCALL_completed;
+    return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
 
 /*

