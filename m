Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB83D1951B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Jan 2026 17:54:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1213838.1524361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmn-0006SW-M3; Mon, 26 Jan 2026 17:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213838.1524361; Mon, 26 Jan 2026 17:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmn-0006RK-Aw; Mon, 26 Jan 2026 17:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1213838;
 Mon, 26 Jan 2026 17:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQml-0004HW-Je
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd1c4f0e-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:53:58 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so36405185e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:57 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:56 -0800 (PST)
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
X-Inumbo-ID: fd1c4f0e-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450037; x=1770054837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Try1cZQOOfQY5RdnyC25WW3N+d8l3jQHbsgtA/sxQ94=;
        b=HVQtNFLMzT3MI1HTrdXNhNxM93FlCY3vWD4OHRGyCzMPCOYLu+cNMZ9P5ZjMPS5pPx
         9ALF4sC9wDw73TNafQkX8tIIrQlfMfsJ2tBR2qVl9PlPXYwQXl+Bp76BsuGt/W3bqpNq
         3zKSw9xPArmfRDI2LYV0acQcZRtpf/3G8RUjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450037; x=1770054837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Try1cZQOOfQY5RdnyC25WW3N+d8l3jQHbsgtA/sxQ94=;
        b=GFkc8i4eGlP+oCd+yYIGnTxABKTO7CKnAqJFcK9sko5Z+XxUXoBuy0K2uJrw9+Bc2w
         LxQmT01k+rzXlFj+DM3xIITXEyRwRy2Z2aVy7xv1rUaBChtIwFNwJUa6coXoXXf46A+J
         uZpKa/wTvH/+GbDA7O2mABdmV+imuE18xMwLHKbKetrilHEmCIOtvNcOXV6DxEs43TUg
         5UUsC3c4VPOqeOsF44+k4ANAFX5tpx//e91vHWgE0l6Mm1FUsA+qQ/C8mq86N5yl5AdL
         U8zmoz+gj111sz/yfpKpDAqFyqGdi9YtAEo5zWsYIchwuvc3SZC8yDjyIt5lNMfYEUGE
         2N5g==
X-Gm-Message-State: AOJu0YwaMqzyQ1K1uYlBevcjeJpM+JgwHcQpOVmxKpqWZzvJoGMO0klj
	ghiQM4AdcoEz4sV2X/03BARN4qZ9wLLMKz+g8hdPeXwO0+p88dMXXMpYdupF9XEL5BCT6y7AwVB
	RCVW9
X-Gm-Gg: AZuq6aL25VX8sRYzQSuvtOCrR6bsdqqGC8+5ms5Z3GF+f5QCzkh65sN4mAbNU/qtNQj
	J+R4bUMB3mXXbhoZq7ele5129HZc95xXn2Om9gGINrI3xnKW2M4I9Yk0UMhsJq0QwB7gcZ+fsCl
	5kN8i9JqFUzi7WvsRE+oErOghd1ygNvOnQiv4Nc5DuD9VgGGGOl22fygPKhwnTXuLWAU8NUKeYM
	ndnvL4kVnJ3rziyL8QcrDTKbatqRtRJL4i94dvJXacfakYYgt1xm5hRmE686VuFfVj55Ou1L042
	RZG9peTrV73UD+1PNAmX3zss2ywNg9YCklneYOVDuHUP0qCB3giBpAD67ADY8x36w/3LFNFY8un
	GM+nA/O9UAnoggWkaypowhxkPnjsJ6RmoZ5fZE3SC7ahOIjejBRjjsb0V/4Nf7OkqL8g9xRW7Jf
	tJhdoL/ZTS1YkFNPczURjRHC7LisLNRrAtJMZj6juutvYIoD/XAJHCF9OGTZ3fKA==
X-Received: by 2002:a05:600c:c087:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-4805d95d3e1mr64802295e9.22.1769450037164;
        Mon, 26 Jan 2026 09:53:57 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 11/16] x86/amd: Fix re-activation of TopoExt on Fam15h CPUs
Date: Mon, 26 Jan 2026 17:53:40 +0000
Message-Id: <20260126175345.2078371-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

init_amd() tries to re-activate TOPOEXT on certain systems, but only after
amd_init_levelling() has calculated the levelling defaults, meaning that the
re-activation will be lost on the next context switch.

Move the logic into early_init_amd() so it takes effect before calculating the
levelling defaults.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/amd.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index e8daf7415bb0..a14a12fb1d60 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -620,9 +620,32 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 		*low_mhz = amd_parse_freq(c->x86, lo);
 }
 
+static void amd_early_adjust_cpuid_extd(void)
+{
+    struct cpuinfo_x86 *c = &boot_cpu_data;
+    uint64_t val;
+
+    /* Re-enable TopologyExtensions if switched off by BIOS */
+    if ( c->family == 0x15 && c->model >= 0x10 && c->model <= 0x1f &&
+         !boot_cpu_has(X86_FEATURE_TOPOEXT) &&
+         !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, &val) )
+    {
+        val |= 1ULL << 54;
+        wrmsr_safe(MSR_K8_EXT_FEATURE_MASK, val);
+        val = rdmsr(MSR_K8_EXT_FEATURE_MASK);
+        if ( val & (1ULL << 54) )
+        {
+            __set_bit(X86_FEATURE_TOPOEXT, c->x86_capability);
+            printk(XENLOG_INFO "CPU: Re-enabling disabled Topology Extensions Support\n");
+        }
+    }
+}
+
 void __init cf_check early_init_amd(void)
 {
-    amd_init_levelling();
+    amd_early_adjust_cpuid_extd();
+
+    amd_init_levelling(); /* Capture defaults after early CPUID adjustments */
 }
 
 void amd_log_freq(const struct cpuinfo_x86 *c)
@@ -1145,21 +1168,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		}
 	}
 
-	/* re-enable TopologyExtensions if switched off by BIOS */
-	if ((c->x86 == 0x15) &&
-	    (c->x86_model >= 0x10) && (c->x86_model <= 0x1f) &&
-	    !cpu_has(c, X86_FEATURE_TOPOEXT) &&
-	    !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, &value)) {
-		value |= 1ULL << 54;
-		wrmsr_safe(MSR_K8_EXT_FEATURE_MASK, value);
-		rdmsrl(MSR_K8_EXT_FEATURE_MASK, value);
-		if (value & (1ULL << 54)) {
-			__set_bit(X86_FEATURE_TOPOEXT, c->x86_capability);
-			printk(KERN_INFO "CPU: Re-enabling disabled "
-			       "Topology Extensions Support\n");
-		}
-	}
-
 	/*
 	 * The way access filter has a performance penalty on some workloads.
 	 * Disable it on the affected CPUs.
-- 
2.39.5


