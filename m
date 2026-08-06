Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847AAC5AC9F
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385272.1627746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7de-0008Bc-0D; Thu, 06 Aug 2026 23:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385272.1627746; Thu, 06 Aug 2026 23:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dd-0008Ak-QD; Thu, 06 Aug 2026 23:36:37 +0000
Received: by outflank-mailman (input) for mailman id 1385272;
 Thu, 06 Aug 2026 23:36:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3gBp1agYKCeMXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 1ws7db-0007kf-Nb
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7db-00GcVS-4X
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3gBp1agYKCeMXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 6a751a81-e002-0a2a0a5209dd-0a2a450c8794-2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:35 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3gBp1agYKCeMXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 6a751a81-f479-0a2a450c0019-d155d6c5e156-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:34 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cee1ec30f2so33068775ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059393; x=1786664193; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AA+qmVUXq1UZoUYGqhY11Guml9As0mrU+L3gWPkVgC8=;
        b=ixyfPz9/AtOU4gqhTNmQ7HEQbdluEmTCxFLp+2HsWDMb5m45kBlLXlQNlFII7dXEX7
         pgYR+A0LWZO3abD7o0wWkpnenkpEbPLUidL9hw1t2FK0nv06h1mVGl8Bwft1b/WpDRIH
         e5jL/4X0cXdPjikP9B8ohzyJWqzDOU04M1IHCEU2YtUOT2udCqd7TPVol6KwRNmV4ENf
         Wl1lNsTWaZLxspm4OjCVjKAlKpYRS1PAGeaA2QhGxqcogoZ+Rycrmktvhtjp1F8K3xf/
         d4jFkOZ7UnCDsQIWLXHgi969584ZimWhdcmlfElI7fxUU1McJ+vz8YhDRrTRi9wTHt2Z
         wlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059393; x=1786664193;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AA+qmVUXq1UZoUYGqhY11Guml9As0mrU+L3gWPkVgC8=;
        b=WRg7SJ5wxcOo+Ls7TCcws1EJcOE1XljSG8YzVyzG8rQBN4v9mY1hfSXWYJzW/IOp+X
         j5xOwqO/t7mqGe2MHUDdYLlwQpmhj5XSI7ni8j2zZZPjR+lt6kPQcvGtALfH654Ax/bD
         lPzW3czQm3dmb8YdMMD230rVTAxN+ef335KPXEyC0+ne8bAnaCV6vAaoviB2XZedLdqC
         gYdNoycOPyKAZ6XxyMs82yON0lKX6rCjvrxMP/SXhc3wmSFUJZ44OpJp2O0IhPOt+wpY
         Tv75sMDTKXbTjkroAG2UGkn0aap6Hc3TLCgnYI0m+rLY0k3WNk+Hj6IFdaD/bNE0rQNx
         1rdw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4n2aiK4iAKjkEpEHpDdP8nwPGxKU+5ypyrc+u3BpXTc0dcktfAPGJq+LcWuX+NWfxhTr9hR3rg8A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKZGBU/gjf9tvDNzYJjflLE7MAWqrsYzXPJ05Zacr2s1KvoPRz
	qymHYX03/AuWt8BFGNKoAIiK8cXpEbHscYkJJjl24eG02b292t8VWOKrgjKibWnoImK9KCsgFPV
	kPzXbkg==
X-Received: from plbjc21.prod.google.com ([2002:a17:903:25d5:b0:2ca:d66c:97b2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef0a:b0:2c9:c517:d070
 with SMTP id d9443c01a7336-2d0ca7afebcmr224927325ad.3.1786059392825; Thu, 06
 Aug 2026 16:36:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:24 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-8-seanjc@google.com>
Subject: [PATCH v6 07/51] x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1786059395-77ED2A5B-32AC4DBD/0/0
X-purgate-type: clean
X-purgate-size: 1583

Move the check on having a Secure TSC to the common tsc_early_init() so
that it's obvious that having a Secure TSC is conditional, and to prepare
for adding TDX to the mix (blindly initializing *both* SNP and TDX TSC
logic looks especially weird).

No functional change intended.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c | 3 ---
 arch/x86/kernel/tsc.c    | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 665de1aea0ee..403dcea86452 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2025,9 +2025,6 @@ void __init snp_secure_tsc_init(void)
 	unsigned long tsc_freq_mhz;
 	void *mem;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
-		return;
-
 	mem = early_memremap_encrypted(sev_secrets_pa, PAGE_SIZE);
 	if (!mem) {
 		pr_err("Unable to get TSC_FACTOR: failed to map the SNP secrets page.\n");
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 09bf10f322ba..c710c71a1bdf 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1509,7 +1509,8 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
 
-	snp_secure_tsc_init();
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
+		snp_secure_tsc_init();
 
 	if (!determine_cpu_tsc_frequencies(true))
 		return;
-- 
2.55.0.679.g6767b8d81c-goog


