Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D53FEEF44
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2026 14:24:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1275060.1561033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA7LS-0005MD-Fu; Tue, 07 Apr 2026 14:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275060.1561033; Tue, 07 Apr 2026 14:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA7LS-0005M6-DN; Tue, 07 Apr 2026 14:23:58 +0000
Received: by outflank-mailman (input) for mailman id 1275060;
 Tue, 07 Apr 2026 14:23:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wA7LR-0005M0-Ii
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 14:23:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA7LQ-00CTsg-Gm
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 16:23:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d5136d-e002-0a2a0a5209dd-0a2a4505d3ec-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:23:56 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d5137c-3760-0a2a45050019-d155802fd158-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:23:56 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488b00ed86fso22327815e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 07:23:56 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e9630ddsm568190645e9.13.2026.04.07.07.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 07:23:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1775571835; x=1776176635; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdXRlsvJI2LDhbcrmPKpVP0y+FqWL2ueHDugm/aw4Bg=;
        b=cpwmNIWoaZxgfVx1H+ShgByLgIZJDQc2gVpNNrCaOOtVIAnE9s0Bhhtg9Kle1pciU2
         PCWH0Ci7RVCe3Rlbq0SCcerYa0s//vy1dqA614itrZjomk6kG8DROVJu0V24GVG9XMFy
         nZmzi4Fou4P7FQ/yOOiq8sPfmXmQx4rvDfILY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571835; x=1776176635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdXRlsvJI2LDhbcrmPKpVP0y+FqWL2ueHDugm/aw4Bg=;
        b=QB3zd4WlRT4jER+0O9swlH3U18eRqVHcqO1vqjVAeDQ0T7UlGU/U35hqgvzO/iHd0T
         XU3fOrR7zRqh3/6ARjD0Jtcz/LH8Nyfdkv87+CJzpq4AJw1UosplRFeyLr3SJcrKH49r
         3wiV6DFh/nn+ISE8Wgw3gWR9/T19SzQ4OCbLV6ZcyMMxklj1yEFd4l0upliZ2ilm9jhU
         JjLH5OwGynKdnhgPgAhVzMnNZzP6T4F/ltrZL9D+9IA8JO5TUq7OGacqgNpX7ER34Ma+
         L/ccZ1zpLfFGIVIPSTStWJqHJyddZEhu3sEYbojrjIi0R7qwYWvHwDKzZ2tC8B9CsdFa
         hfQw==
X-Gm-Message-State: AOJu0Yx4OUEexwxqUJPKmZsQPKFaEQYuZ0WcNPx5ZRwe01bYDjfk/iH+
	xyDdnwnTyCe1DgJbkZqb/iiwttERZGgqterdUwXIeawU6pg2txbG3p8BitMkCH71IcNyrWgp5zv
	Un+jF
X-Gm-Gg: AeBDietgUOR6wnoVCnkCbdAriP/IZf1RPSx+ir/A87hW4H7IfXaDpaakf7YmGoWrJTl
	D/7jC5uDQgzZpZJklOBNxpi9fBncb5toNr+ONMZCc6G8daDg8q8y3AEZkUMM+LWLz/t6TBu44Ln
	iF58DZWTAQGhNiLpraq0gLwc4SMWnCpBxV0wNhP4E7VnnjmpNnDLdTMWDHDgNQP3xtC0+ur9qUp
	DpUmb2kZ1kfdO5/J60aUeZ7bFGMLftBDKAmnCMxQSuHtCe+uH4barx+Rroz1PqOTHSFO3QVdEyw
	klvv4Etol/WnyAnGPaJFB8EmkkGzgFqrIW/pHyQp4UBQn6JV+VERXBPnCLPG7MyZrA5DJUGng6D
	XPdhR5W20+QxvTsB7kdzyeQO8SDRnnGdR6IZ8WUjV6UFr+bRgcrP51zJ8eg29yQ0jJ1J6ZRTe0T
	3DClUFtxM+CKI1oJHCicW/Wn3m8kxxJD8PuyVKjcBrTDDZhTQCyUBy4dC0CdG6SiLAymVX4mq0f
	Odm
X-Received: by 2002:a05:600c:628e:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-488997da325mr226707645e9.25.1775571834567;
        Tue, 07 Apr 2026 07:23:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/emul: Remove fallback path from SWAPGS
Date: Tue,  7 Apr 2026 15:23:51 +0100
Message-Id: <20260407142351.73049-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775571836-33F2E96F-13E6A62A/0/0
X-purgate-type: clean
X-purgate-size: 3241

In real hardware, accesses to the registers cannot fail.  The error paths are
just an artefact of the hook functions needing to return something.

The best effort unwind is also something that doesn't exist in real hardware,
and makes the logic more complicated to follow.  Instead, use an
ASSERT_UNREACHABLE() with a fallback of injecting #DF.  Hitting this path is
an error in Xen.

While adjusting, remove {read,write}_segment() and use {read,write}_msr() to
access MSR_GS_BASE.  There's no need to access the other parts of the GS
segment, and this is less work behind the scenes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Retain x86_emul_reset_event()
 * Pass an error code for #DF
 * Drop goto done now that generate_exception() is used
 * Use 2x{read,write}_msr()

Tested using LKGS's extention of the test emulator for SWAPGS.
---
 xen/arch/x86/x86_emulate/0f01.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
index 6c10979dd650..54bd6faf0f2c 100644
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -189,22 +189,24 @@ int x86emul_0f01(struct x86_emulate_state *s,
         generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if(!ops->read_segment || !ops->read_msr ||
                 !ops->write_segment || !ops->write_msr);
-        if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
-                                     ctxt)) != X86EMUL_OKAY ||
-             (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+        if ( (rc = ops->read_msr(MSR_GS_BASE, &sreg.base,
                                  ctxt)) != X86EMUL_OKAY ||
-             (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
-                                  ctxt, false)) != X86EMUL_OKAY )
+             (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+                                 ctxt)) != X86EMUL_OKAY )
             goto done;
-        sreg.base = msr_val;
-        if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
-                                      ctxt)) != X86EMUL_OKAY )
+        if ( (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                  ctxt, false)) != X86EMUL_OKAY ||
+             (rc = ops->write_msr(MSR_GS_BASE, msr_val,
+                                  ctxt, false)) != X86EMUL_OKAY )
         {
-            /* Best effort unwind (i.e. no real error checking). */
-            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
-                                ctxt, false) == X86EMUL_EXCEPTION )
-                x86_emul_reset_event(ctxt);
-            goto done;
+            /*
+             * In real hardware, access to the registers cannot fail.  It is
+             * an error in Xen if the writes fail given that both MSRs have
+             * equivalent checks.
+             */
+            ASSERT_UNREACHABLE();
+            x86_emul_reset_event(ctxt);
+            generate_exception(X86_EXC_DF, 0);
         }
         break;
 
-- 
2.39.5


