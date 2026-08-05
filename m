Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD0EC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:45:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383390.1626666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrazy-0004Sj-GN; Wed, 05 Aug 2026 12:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383390.1626666; Wed, 05 Aug 2026 12:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrazy-0004Sc-CX; Wed, 05 Aug 2026 12:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1383390;
 Wed, 05 Aug 2026 12:45:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wrazx-0004Pq-Pr
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:45:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrazx-004adb-5y
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:45:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a733061-2eae-0a2a0a5409dd-0a2a450382f4-24
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:29 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a733069-fae8-0a2a45030019-d155dd31b952-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:29 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f84023916so817188f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:45:29 -0700 (PDT)
Received: from andrew-laptop.. ([157.231.70.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e533sm8779762f8f.28.2026.08.05.05.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:45:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785933928; x=1786538728; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9e6A8lC1tkLbZ56fkZqK4C1TbgXO56ls4av+lt8mI4=;
        b=oti0kg3AVl1LHrgzwn6xfD6lu0S2jgpc69Bd+ZBIvOSVfroggz8dqYvfnst7nuXXFo
         UMyhpBsLHmC4Vnipzvzb8T415oy8mBIUncblimuA1WVwvSPijU3H5u1DYcro28w8vVPk
         7iJp6Z5EcMHiAw83+TTSBqyJp8xn9OHGzpnLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933928; x=1786538728;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9e6A8lC1tkLbZ56fkZqK4C1TbgXO56ls4av+lt8mI4=;
        b=hnnWWWadiWjrYGBTxZqXvcW3I+CDTKH9OHKagtZab/AQtLUBXrP/NhMWEoqt65gQRo
         fgWnmRo+H6/z+h5weXw5x6RPTIXuLaHoket1cN0mtGvNtBdJ6TFEHslkCL2O7Y2ayeWD
         qjQEyXfZDHxwhknubm8s3DsGd+8sGhTM2f5+/NbzbEGo2oYHS0T9pNEcX3rNgCcZGRjH
         +q6K1eR0iIwfPWzBs37LhRdzuKNCms7sGw5NVwfRFQUWM6i/5FT0RHB/vJH7ynzqRcU2
         lRblTKWjK6g8ZkkZYnQSfG5OhtrRHDxYlxBL+l6rQFuVNBviJQinPnVS/oGOpvlJ/E66
         uR1A==
X-Gm-Message-State: AOJu0YzlZYhHPvL0585h8fHwFI7dOiTGkKqyKfCVMci8yscSIWY5L7fg
	iK2yVoIgHrnEQ+gPE3CidDPpJk6AfqTT2s8FqK/0uF4H70weyIdkCDGr3u0KK++Ooxj94dRv1Bz
	L7fMFLac=
X-Gm-Gg: AR+sD10ewMCSIIVXo+EOLHika776xFvy9H0uFxwihmPCValhlx0EZBWVN+axV9vsmyZ
	FD94mZff9sAxUW2oJEpYgHTp0qCFQFHfC14XoJh1ucchBeSj/L1ZR/O/O8sYDrSZYxX33yElczs
	HweDrmDSwGWLqcf+YOLhO0ErBy9yoTbAhep+t5V4XCH3KC+zSxw0hA5b7FEn9IK4lZWQs0HPhvW
	OUSmGICOGAOZcO9oYX3dR46PLty9zjD8RtSwG9VDZlSNyd1tIXuNDw7nC/Og0Ul2zoDsgoeE828
	VygqClMa/tBfbZEg9OJfn0+BHh3MuJo94HfnZpaoPIMltd88AHNHt35Sl9bGz6bDuGfOLL0eeV+
	z8M5agQbXY5CdfRdsJKgl4xDFrJ7aNXvykrM+o0Y45H9El9d0rjEQzE1bD+e9d7MnLUWCagmi8O
	mCJVt7gKyOWtn0FxTYTbxBt/5pLpAWgVfubN+e4F8TDGkW+7u2DkXeFlgXyUGJZwBBFkwXzYQp
X-Received: by 2002:a5d:5f09:0:b0:47f:7aee:ed3c with SMTP id ffacd0b85a97d-47fec4e2a1cmr12936314f8f.5.1785933928318;
        Wed, 05 Aug 2026 05:45:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/5] x86/nmi: Drop {reserve,release}_lapic_nmi()
Date: Wed,  5 Aug 2026 13:45:21 +0100
Message-Id: <20260805124525.105457-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805124525.105457-1-andrew.cooper3@citrix.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785933929-768FA4E9-06458010/0/0
X-purgate-type: clean
X-purgate-size: 3296

With Oprofile support dropped, there are no more users of these.  Drop them.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/apic.h |  2 --
 xen/arch/x86/nmi.c              | 50 ---------------------------------
 2 files changed, 52 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 918f1cee3567..f30d57ad22c5 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -174,8 +174,6 @@ extern void setup_boot_APIC_clock (void);
 extern void setup_secondary_APIC_clock (void);
 extern void setup_apic_nmi_watchdog (void);
 extern void disable_lapic_nmi_watchdog(void);
-extern int reserve_lapic_nmi(void);
-extern void release_lapic_nmi(void);
 extern void self_nmi(void);
 extern void disable_timer_nmi_watchdog(void);
 extern void enable_timer_nmi_watchdog(void);
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 91f95fe6d080..616bfdbc9029 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -89,20 +89,6 @@ static int __init cf_check parse_watchdog_timeout(const char *s)
 }
 custom_param("watchdog_timeout", parse_watchdog_timeout);
 
-/*
- * lapic_nmi_owner tracks the ownership of the lapic NMI hardware:
- * - it may be reserved by some other driver, or not
- * - when not reserved by some other driver, it may be used for
- *   the NMI watchdog, or not
- *
- * This is maintained separately from nmi_active because the NMI
- * watchdog may also be driven from the I/O APIC timer.
- */
-static DEFINE_SPINLOCK(lapic_nmi_owner_lock);
-static unsigned int lapic_nmi_owner;
-#define LAPIC_NMI_WATCHDOG	(1<<0)
-#define LAPIC_NMI_RESERVED	(1<<1)
-
 /* nmi_active:
  * +1: the lapic NMI watchdog is active, but can be disabled
  *  0: the lapic NMI watchdog has not been set up, and cannot
@@ -239,41 +225,6 @@ void disable_lapic_nmi_watchdog(void)
     nmi_watchdog = NMI_NONE;
 }
 
-static void enable_lapic_nmi_watchdog(void)
-{
-    if (nmi_active < 0) {
-        nmi_watchdog = NMI_LOCAL_APIC;
-        setup_apic_nmi_watchdog();
-    }
-}
-
-int reserve_lapic_nmi(void)
-{
-    unsigned int old_owner;
-
-    spin_lock(&lapic_nmi_owner_lock);
-    old_owner = lapic_nmi_owner;
-    lapic_nmi_owner |= LAPIC_NMI_RESERVED;
-    spin_unlock(&lapic_nmi_owner_lock);
-    if (old_owner & LAPIC_NMI_RESERVED)
-        return -EBUSY;
-    if (old_owner & LAPIC_NMI_WATCHDOG)
-        disable_lapic_nmi_watchdog();
-    return 0;
-}
-
-void release_lapic_nmi(void)
-{
-    unsigned int new_owner;
-
-    spin_lock(&lapic_nmi_owner_lock);
-    new_owner = lapic_nmi_owner & ~LAPIC_NMI_RESERVED;
-    lapic_nmi_owner = new_owner;
-    spin_unlock(&lapic_nmi_owner_lock);
-    if (new_owner & LAPIC_NMI_WATCHDOG)
-        enable_lapic_nmi_watchdog();
-}
-
 /*
  * Activate the NMI watchdog via the local APIC.
  * Original code written by Keith Owens.
@@ -417,7 +368,6 @@ void setup_apic_nmi_watchdog(void)
         return;
     }
 
-    lapic_nmi_owner = LAPIC_NMI_WATCHDOG;
     nmi_active = 1;
 }
 
-- 
2.34.1


