Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE54CC79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 21:32:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411069.1641827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3gx9-0003kg-LN; Mon, 07 Sep 2026 21:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411069.1641827; Mon, 07 Sep 2026 21:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3gx9-0003kZ-IW; Mon, 07 Sep 2026 21:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1411069;
 Mon, 07 Sep 2026 21:32:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x3gx8-0003kT-LJ
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 21:32:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3gx8-00GtOk-1N
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 23:32:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9f2d31-8faa-0a2a0a5109dd-0a2a4509d3be-34
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 23:32:33 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9f2d71-be1a-0a2a45090019-d1558031a4c0-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 23:32:33 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49b0eab380eso33433805e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:32:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588394fa1sm29801934f8f.8.2026.09.07.14.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 14:32:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788816753; x=1789421553; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1m3vZKFL0g/sGBvqTg0JocdJ+WVDcptllpplD2p/x7A=;
        b=au57hIewRAhS9+2F8iiBn1PIZC3i3lqhgfdHtP+5o1Jd4WkqdQf1uHM+cnMsNhZ5T2
         kS7KOg0ZXu/ajgbJoP60uR1rQJFjP1j0IT4UVsWGfn4btqqAjqmUCAJ6J+e/WqJLotwv
         HLfC3HJNYlG9OoXmvmoRgq6dMqhXXwYkh3GAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816753; x=1789421553;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1m3vZKFL0g/sGBvqTg0JocdJ+WVDcptllpplD2p/x7A=;
        b=Twb33zj3zyQJODSYrZv2RtogBPxcdUEgUeJXTxnxCsE4wDoERidNW3hCDnZfjPC6rV
         tq4i8jHGZDt15L+IazHl1uGa2OHLNXqNabzV20z1WZUSqhuRUQCKq3tdnlODrRO/op/6
         XDa/e0vLSn1CyaS+L/ixt03jpgLkFKleqlRqgDxAvakk8kqAtaKgPwHjgcHKBGIkFTC9
         REvCTsEbtCGC5qm7xsfexFcqJyLJWzHsr4kDNidcHTYRTLc5zYrPmRAnkUIkSBNOeuj5
         QpiQNNLGUgnuuYnZv4/pxZMoZPO27m48CxbGQhFVkcDqoTCJta6kFBKqjmhlUi2c0Wh1
         vQQA==
X-Gm-Message-State: AFuF++n4EERaa3DsCbOC4Q4c883qcMGBOgEx3id9bi1pC6MBbgf3rXGe
	RD3V4KqO4d7Z277JOhHmXKDuxCSHysvi4gxbjKSP5VHzpln95L0Dq2o9W7fi3gpCMYzC8o/MZvt
	nY8DSs1E=
X-Gm-Gg: AYBFou0aSJyZvsrrOD5ybffR3oWAEHHvzFbWpDh/1p9yzwYnxpAQC6PX1FmO8EOy9hY
	90PiAx+L7FXr1O17YAIWC2gKsrrDjfcNakY7svQgirl+saO8xuIwiqAWOUxCrBCfgu/CP1N00qS
	sHSR9C3z+nktq93SXyOvC9HsSBO8hcfeOT4VbjY12ydfihA4dhNLJz9VJhUKgOYC9TkkpfoHSEi
	DfqN2LNNbijKWE3sS2rb1QtmPgMieBm3EEaWSsMe3uUWD+xW/6pGclIJoikwri0FSnnxWbb/b+U
	opqmCcLIydtFIT33G1+waXaoC9+SV/8peuz3uhFCPEk4ItpYGPNvBnimVQy+VtoMGuVRyWw5lTX
	RyEO51NTJBvnKbnGk9RXxKXyzESRUr3wDU/bxwqw/wsbxaxSwjJY988ZFJ4QSv/et7p/vnpeaXB
	+c3qiP4A2aaCQNROjh6NE6wplYclcUM6ZyXsm2aj0+XgVGXpIzTX5p2G5NHMphAfBt15/z+xY6/
	ulJLk8R/4FKaoMFM2mUY7iphUIqzJ5L2V/JJBY=
X-Received: by 2002:a05:600c:204e:b0:49c:e0e8:bd94 with SMTP id 5b1f17b1804b1-49cee5b0415mr277544055e9.1.1788816753202;
        Mon, 07 Sep 2026 14:32:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/ucode: Work around Granite Rapids erraturm GNR98
Date: Mon,  7 Sep 2026 22:32:30 +0100
Message-Id: <20260907213231.3159241-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788816753-BE0C5034-14A2B057/0/0
X-purgate-type: clean
X-purgate-size: 3122

Block loads which are known to hang the system.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

A more complete solution is in the works, but it's taken 4 months to get this
much published...

v2:
 * Correct the sign of the cpu_sig->rev check.
 * Expand the comment to explain why we are not following what GNR98 says.
---
 xen/arch/x86/cpu/microcode/intel.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index c45b00c6b033..dc21a89aa47b 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -27,6 +27,7 @@
 #include <xen/string.h>
 #include <xen/xmalloc.h>
 
+#include <asm/intel-family.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/system.h>
@@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
     return false;
 }
 
+static bool microcode_safe_to_load(const struct microcode_patch *mc)
+{
+    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
+
+    /*
+     * Treat pre-production as always safe - anyone using pre-production
+     * microcode knows what they are doing, and can keep any resulting pieces.
+     */
+    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
+        return true;
+
+    /*
+     * GNR98 states that Granite Rapids systems hang when loading new ucode on
+     * sufficiently old firmware.  GNR101 retroactively declares that one
+     * ucode had incorrect min_rev fields, in light of discovering GNR98.
+     *
+     * Both are incomplete statements of the problem.
+     *
+     * At the time of writing (August 2026), the believed safe sequence is:
+     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
+     *
+     * Disallow known-unsafe loads while permitting believed-safe loads.  For
+     * GNR, this allows multi-hop loading to get up to the latest.
+     */
+    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
+         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
+         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
+          (cpu_sig->rev < 0x01000405 && mc->rev >  0x01000405)) )
+    {
+        printk_once(XENLOG_WARNING
+                    "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
+                    "microcode: Firmware update recommended\n", mc->rev);
+        return false;
+    }
+
+    return true;
+}
+
 static int cf_check intel_compare(
     const struct microcode_patch *old, const struct microcode_patch *new)
 {
@@ -365,6 +404,7 @@ static struct microcode_patch *cf_check intel_ucode_parse(
          * one with higher revision.
          */
         if ( microcode_fits_cpu(mc) &&
+             microcode_safe_to_load(mc) &&
              (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
             saved = mc;
 
-- 
2.39.5


