Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D70C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430385.1652865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrH-0006HJ-DF; Wed, 23 Sep 2026 13:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430385.1652865; Wed, 23 Sep 2026 13:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrH-0006EK-3v; Wed, 23 Sep 2026 13:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1430385;
 Wed, 23 Sep 2026 13:17:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mqw-0005hx-Jy
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:17:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mqw-002EU2-0h
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:17:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d16a-8faa-0a2a0a5109dd-0a2a4503847a-16
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:37 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d170-fae8-0a2a45030019-4a7de50c81a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:37 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-33b9e805130so667924eec.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:17:37 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169456; x=1790774256; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElUpYvhknnIwSPfbcSK8wY490g/9t35RPhM2WyomKNg=;
        b=scT/3AqeDmupbfNVZmMacnnAzsFwc48mA//AWCLiQVAZAO3fjzbqMp/PiKVKNETptS
         z+KUaV3stKO4QfklcofmlbyRXTXsaux43/XNcIesXvlCPGHME1v2mShGUIaMC5C67cnx
         5mXLZjdM8846GnXPFofDZ+cS8dm9DNWbejj5glanG713u4VIkaI78byl8uy5IG5jOjbV
         VCOaWIPM0CfvqjiZWWLhBwpqERf0GlC0bjPtctCRcGch1FYvF3HX0Zk9yXrU2UcoYlaz
         NFb0sJ+mDeiXx9jJ+dmKi5HpvS5/9Jf+TwtKhwqoYDYnoD93OKOX4GqVaH6RkObGCdbI
         KK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169456; x=1790774256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElUpYvhknnIwSPfbcSK8wY490g/9t35RPhM2WyomKNg=;
        b=tQ8TdMBrMTlPGGBMp67OnUIIkvljPe+YfF7Zmi0xBA1Imd3nDAX0t2H2mpNmMsWDJU
         HrJkDvOeqFRlVoczMz3Y2S7Yp4mqXyms4gEbG/k+cOvf0QwXWiZpF2fiMgKn8aHxqFWO
         Bi0fwyed/Ugjg40zL0FvLX6FjE17P0cRows/UoL7SzFQ95VVmiVwf2FkVeq9sxJqgU87
         00W5UQvKfbQNXwH8kyYE7HI9i8CQMN5neIAScjH8N7NtFvTU+PrMYK00pewxPjn1B6+P
         7NshGBJLON26ByL0Vwyd5caTs0NqoPNzMvPY1dj/7HRdc+FuLR9YcNJ2WdyHna42sNq5
         GnHw==
X-Forwarded-Encrypted: i=1; AKwUvBzKH43doDUIySwjUP0b3TkQ6Mm5BwLJh+juWyFGmfHmHMuIb+BpP3FpSfYIazPZZSAKuEAXV8YK0FI=@lists.xenproject.org
X-Gm-Message-State: AFuF++n7F0+dEnoAuFjWMm/vZq0P0iFqAc2iGThN/Ts77WO/adAt88Pa
	JaGv7o2urzvdcG/2XrwVdkCWZ+XgjVEAyjB68y/FmcK8RAev7I+OcqNu
X-Gm-Gg: AYBFou30o957YrQJU+NhYhffG0IWCAj74xeOlD4kW5U+HSYxox4iMPENmf42aluvXc3
	ROKVV3pbrceW8ozV9Ben5JUg7PdEAIQAwnlR38Xdxmv5ZKxmtsgOL9KTawUd27CEFrC3fAXAERO
	/DWmrtVxp45Phs73sfkWDj5ylqnRHbLbLCsyhCbRGpk1ScRQsgEZfYvg2JNbTZHIlXfGtSuXfVF
	siJkYVmWhhEv+pCQCErBSBliKmD7nutxTBQj39CrLZV6ajFqLfNcsD2uI9eWqcEoKmIJMfbNvKB
	7vxSFSLkfxJO9GvurlLMtXyleeFQ9B3jeOD3tiE1QP/UB4bxeBca6H7xVCW8vlEMFhU0uMohkBp
	oYapAtH/dmWYWQY+h+wf3umos/bv6wY0SS8p4LFJr1QIO8EfuxpOzC9LmbB6GdUzmMrkegP3KJJ
	6lQpG3P5x7atqbYaXgKzPciiGHkAm9OawpYryNAnswEM2DlIEYiaAimTMdozQiFv17lddNExRDM
	czAvQwxdfMBs1UmhH8/muLhKAy1UaiEKwVx7ldOEQ==
X-Received: by 2002:a05:7300:b286:b0:30e:f0a5:8762 with SMTP id 5a478bee46e88-33e8d9ca3c8mr2607807eec.19.1790169455486;
        Wed, 23 Sep 2026 06:17:35 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 005/114] target-info: set cpu_type from TARGET_BASE_ARCH
Date: Wed, 23 Sep 2026 21:14:39 +0800
Message-ID: <20260923131635.1894-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790169457-6ECCB4E9-00AA5DB7/0/0
X-purgate-type: clean
X-purgate-size: 5027

target-info-def.c no longer includes cpu.h, so CPU_RESOLVING_TYPE
is unavailable. Emit TARGET_BASE_ARCH as an uppercase identifier in
config-target.h and set cpu_type to TYPE_${TARGET_BASE_ARCH}_CPU.

Alias the base-arch tokens whose QOM name differs: TYPE_I386_CPU,
TYPE_OR1K_CPU, TYPE_PPC_CPU, TYPE_S390X_CPU, and TYPE_SH4_CPU.

Drop the ArchCPU parent_obj and env offsetof checks with the cpu.h
include. Page-size checks stay, via cpu-param.h.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info-def.h |  2 +-
 meson.build                    |  1 +
 target-info-def.c              | 11 +++--------
 target/i386/cpu-qom.h          |  1 +
 target/or1k/cpu-qom.h          |  1 +
 target/ppc/cpu-qom.h           |  1 +
 target/s390x/cpu-qom.h         |  1 +
 target/sh4/cpu-qom.h           |  1 +
 8 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/qemu/target-info-def.h b/include/qemu/target-info-def.h
index 8019d2c7196..ebd88463aea 100644
--- a/include/qemu/target-info-def.h
+++ b/include/qemu/target-info-def.h
@@ -19,7 +19,7 @@ typedef struct TargetInfo {
     SysEmuTarget target_arch;
     /* runtime equivalent of TARGET_LONG_BITS definition */
     unsigned long_bits;
-    /* runtime equivalent of CPU_RESOLVING_TYPE definition */
+    /* runtime equivalent of TYPE_${TARGET_BASE_ARCH}_CPU definition */
     const char *cpu_type;
     /* related to TARGET_BIG_ENDIAN definition */
     EndianMode endianness;
diff --git a/meson.build b/meson.build
index 8bd2d725ca0..20345860c9f 100644
--- a/meson.build
+++ b/meson.build
@@ -3378,6 +3378,7 @@ foreach target : target_dirs
       # Note that TARGET_BASE_ARCH ends up in config-target.h but it is
       # not used to select files from sourcesets.
       config_target_data.set('TARGET_' + v.to_upper(), 1)
+      config_target_data.set(k, v.to_upper())
     elif k == 'TARGET_NAME' or k == 'CONFIG_QEMU_INTERP_PREFIX'
       config_target_data.set_quoted(k, v)
     elif v == 'y'
diff --git a/target-info-def.c b/target-info-def.c
index fa19cabc55f..f167f5f2ac1 100644
--- a/target-info-def.c
+++ b/target-info-def.c
@@ -10,15 +10,10 @@
 #include "qemu/target-info.h"
 #include "qemu/target-info-def.h"
 #include "qemu/target-info-init.h"
-#include "hw/core/boards.h"
-#include "cpu.h"
-#include "exec/cpu-defs.h"
+#include "cpu-qom.h"
+#include "cpu-param.h"
 #include "exec/page-vary.h"
 
-/* Validate correct placement of CPUArchState. */
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
-
 /* Validate target page size, if invariant. */
 #ifndef TARGET_PAGE_BITS_VARY
 QEMU_BUILD_BUG_ON(TARGET_PAGE_BITS < TARGET_PAGE_BITS_MIN);
@@ -28,7 +23,7 @@ static const TargetInfo target_info_stub = {
     .target_name = TARGET_NAME,
     .target_arch = glue(SYS_EMU_TARGET_, TARGET_ARCH),
     .long_bits = TARGET_LONG_BITS,
-    .cpu_type = CPU_RESOLVING_TYPE,
+    .cpu_type = glue(TYPE_, glue(TARGET_BASE_ARCH, _CPU)),
     .endianness = TARGET_BIG_ENDIAN ? ENDIAN_MODE_BIG : ENDIAN_MODE_LITTLE,
 #ifdef TARGET_PAGE_BITS_VARY
     .page_bits_vary = true,
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index d4e216d000c..7619c4a4826 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -27,6 +27,7 @@
 #else
 #define TYPE_X86_CPU "i386-cpu"
 #endif
+#define TYPE_I386_CPU TYPE_X86_CPU
 
 OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
 
diff --git a/target/or1k/cpu-qom.h b/target/or1k/cpu-qom.h
index 14bac33312e..c0d5e9e81ba 100644
--- a/target/or1k/cpu-qom.h
+++ b/target/or1k/cpu-qom.h
@@ -12,6 +12,7 @@
 #include "hw/core/cpu.h"
 
 #define TYPE_OPENRISC_CPU "or1k-cpu"
+#define TYPE_OR1K_CPU TYPE_OPENRISC_CPU
 
 OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
 
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 8247fa23367..428cdc85488 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -28,6 +28,7 @@
 #else
 #define TYPE_POWERPC_CPU "powerpc-cpu"
 #endif
+#define TYPE_PPC_CPU TYPE_POWERPC_CPU
 
 OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index c59bb1eab15..07a8c881fe5 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -23,6 +23,7 @@
 #include "hw/core/cpu.h"
 
 #define TYPE_S390_CPU "s390x-cpu"
+#define TYPE_S390X_CPU TYPE_S390_CPU
 
 OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
 
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 6cf5fbb0745..08fa92106e9 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -23,6 +23,7 @@
 #include "hw/core/cpu.h"
 
 #define TYPE_SUPERH_CPU "superh-cpu"
+#define TYPE_SH4_CPU TYPE_SUPERH_CPU
 
 #define TYPE_SH7750R_CPU SUPERH_CPU_TYPE_NAME("sh7750r")
 #define TYPE_SH7751R_CPU SUPERH_CPU_TYPE_NAME("sh7751r")
-- 
2.52.0.windows.1


