Return-Path: <SRS0=Z/2m=B3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B196C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 09:50:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9CB206FA
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9CB206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bmK-0005FX-0P; Mon, 17 Aug 2020 09:50:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bmJ-00046j-0z
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:50:07 +0000
X-Inumbo-ID: a8619b2a-2e46-4991-9c8d-01785a01a443
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8619b2a-2e46-4991-9c8d-01785a01a443;
 Mon, 17 Aug 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1990EAF06;
 Mon, 17 Aug 2020 09:49:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 13/17] tools/libxc: rename all libxenguest sources to
 xg_*
Date: Mon, 17 Aug 2020 11:49:18 +0200
Message-Id: <20200817094922.15768-14-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some sources of libxenguest are named xg_*.c and some xc_*.c. Rename
the xc_*.c files to xg_*.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxc/Makefile                          | 59 ++++++++++---------
 .../libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c}  |  0
 tools/libxc/{xc_dom_arm.c => xg_dom_arm.c}    |  0
 ...imageloader.c => xg_dom_armzimageloader.c} |  0
 ...{xc_dom_binloader.c => xg_dom_binloader.c} |  0
 tools/libxc/{xc_dom_boot.c => xg_dom_boot.c}  |  0
 ...bzimageloader.c => xg_dom_bzimageloader.c} |  0
 ...m_compat_linux.c => xg_dom_compat_linux.c} |  0
 tools/libxc/{xc_dom_core.c => xg_dom_core.c}  |  0
 ...compress_lz4.c => xg_dom_decompress_lz4.c} |  0
 ...ss_unsafe.c => xg_dom_decompress_unsafe.c} |  0
 ...ip2.c => xg_dom_decompress_unsafe_bzip2.c} |  0
 ...lzma.c => xg_dom_decompress_unsafe_lzma.c} |  0
 ...o1x.c => xg_dom_decompress_unsafe_lzo1x.c} |  0
 ...afe_xz.c => xg_dom_decompress_unsafe_xz.c} |  0
 ...{xc_dom_elfloader.c => xg_dom_elfloader.c} |  0
 ...{xc_dom_hvmloader.c => xg_dom_hvmloader.c} |  0
 tools/libxc/{xc_dom_x86.c => xg_dom_x86.c}    |  0
 .../libxc/{xc_nomigrate.c => xg_nomigrate.c}  |  0
 .../{xc_offline_page.c => xg_offline_page.c}  |  0
 .../libxc/{xc_sr_common.c => xg_sr_common.c}  |  0
 ...{xc_sr_common_x86.c => xg_sr_common_x86.c} |  0
 ..._common_x86_pv.c => xg_sr_common_x86_pv.c} |  0
 .../{xc_sr_restore.c => xg_sr_restore.c}      |  0
 ...tore_x86_hvm.c => xg_sr_restore_x86_hvm.c} |  0
 ...estore_x86_pv.c => xg_sr_restore_x86_pv.c} |  0
 tools/libxc/{xc_sr_save.c => xg_sr_save.c}    |  0
 ...sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} |  0
 ...c_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} |  0
 tools/libxc/{xc_suspend.c => xg_suspend.c}    |  0
 30 files changed, 30 insertions(+), 29 deletions(-)
 rename tools/libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c} (100%)
 rename tools/libxc/{xc_dom_arm.c => xg_dom_arm.c} (100%)
 rename tools/libxc/{xc_dom_armzimageloader.c => xg_dom_armzimageloader.c} (100%)
 rename tools/libxc/{xc_dom_binloader.c => xg_dom_binloader.c} (100%)
 rename tools/libxc/{xc_dom_boot.c => xg_dom_boot.c} (100%)
 rename tools/libxc/{xc_dom_bzimageloader.c => xg_dom_bzimageloader.c} (100%)
 rename tools/libxc/{xc_dom_compat_linux.c => xg_dom_compat_linux.c} (100%)
 rename tools/libxc/{xc_dom_core.c => xg_dom_core.c} (100%)
 rename tools/libxc/{xc_dom_decompress_lz4.c => xg_dom_decompress_lz4.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe.c => xg_dom_decompress_unsafe.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_bzip2.c => xg_dom_decompress_unsafe_bzip2.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzma.c => xg_dom_decompress_unsafe_lzma.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzo1x.c => xg_dom_decompress_unsafe_lzo1x.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_xz.c => xg_dom_decompress_unsafe_xz.c} (100%)
 rename tools/libxc/{xc_dom_elfloader.c => xg_dom_elfloader.c} (100%)
 rename tools/libxc/{xc_dom_hvmloader.c => xg_dom_hvmloader.c} (100%)
 rename tools/libxc/{xc_dom_x86.c => xg_dom_x86.c} (100%)
 rename tools/libxc/{xc_nomigrate.c => xg_nomigrate.c} (100%)
 rename tools/libxc/{xc_offline_page.c => xg_offline_page.c} (100%)
 rename tools/libxc/{xc_sr_common.c => xg_sr_common.c} (100%)
 rename tools/libxc/{xc_sr_common_x86.c => xg_sr_common_x86.c} (100%)
 rename tools/libxc/{xc_sr_common_x86_pv.c => xg_sr_common_x86_pv.c} (100%)
 rename tools/libxc/{xc_sr_restore.c => xg_sr_restore.c} (100%)
 rename tools/libxc/{xc_sr_restore_x86_hvm.c => xg_sr_restore_x86_hvm.c} (100%)
 rename tools/libxc/{xc_sr_restore_x86_pv.c => xg_sr_restore_x86_pv.c} (100%)
 rename tools/libxc/{xc_sr_save.c => xg_sr_save.c} (100%)
 rename tools/libxc/{xc_sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} (100%)
 rename tools/libxc/{xc_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} (100%)
 rename tools/libxc/{xc_suspend.c => xg_suspend.c} (100%)

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index f3f1edc07b..e1b2c24106 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -54,20 +54,20 @@ CTRL_SRCS-y       += xc_devicemodel_compat.c
 GUEST_SRCS-y :=
 GUEST_SRCS-y += xg_private.c
 GUEST_SRCS-y += xg_domain.c
-GUEST_SRCS-y += xc_suspend.c
+GUEST_SRCS-y += xg_suspend.c
 ifeq ($(CONFIG_MIGRATE),y)
-GUEST_SRCS-y += xc_sr_common.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_common_x86.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_common_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_restore_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_restore_x86_hvm.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_save_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_save_x86_hvm.c
-GUEST_SRCS-y += xc_sr_restore.c
-GUEST_SRCS-y += xc_sr_save.c
-GUEST_SRCS-y += xc_offline_page.c
+GUEST_SRCS-y += xg_sr_common.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
+GUEST_SRCS-y += xg_sr_restore.c
+GUEST_SRCS-y += xg_sr_save.c
+GUEST_SRCS-y += xg_offline_page.c
 else
-GUEST_SRCS-y += xc_nomigrate.c
+GUEST_SRCS-y += xg_nomigrate.c
 endif
 
 vpath %.c ../../xen/common/libelf
@@ -88,25 +88,26 @@ GUEST_SRCS-y                 += cpuid.c msr.c
 endif
 
 # new domain builder
-GUEST_SRCS-y                 += xc_dom_core.c xc_dom_boot.c
-GUEST_SRCS-y                 += xc_dom_elfloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_bzimageloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_decompress_lz4.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_hvmloader.c
-GUEST_SRCS-$(CONFIG_ARM)     += xc_dom_armzimageloader.c
-GUEST_SRCS-y                 += xc_dom_binloader.c
-GUEST_SRCS-y                 += xc_dom_compat_linux.c
-
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_x86.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_cpuid_x86.c
-GUEST_SRCS-$(CONFIG_ARM)     += xc_dom_arm.c
+GUEST_SRCS-y                 += xg_dom_core.c
+GUEST_SRCS-y                 += xg_dom_boot.c
+GUEST_SRCS-y                 += xg_dom_elfloader.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_decompress_lz4.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_hvmloader.c
+GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_armzimageloader.c
+GUEST_SRCS-y                 += xg_dom_binloader.c
+GUEST_SRCS-y                 += xg_dom_compat_linux.c
+
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_x86.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
+GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
 
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_bzip2.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_lzma.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_lzo1x.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_xz.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_xz.c
 endif
 
 -include $(XEN_TARGET_ARCH)/Makefile
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xg_cpuid_x86.c
similarity index 100%
rename from tools/libxc/xc_cpuid_x86.c
rename to tools/libxc/xg_cpuid_x86.c
diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xg_dom_arm.c
similarity index 100%
rename from tools/libxc/xc_dom_arm.c
rename to tools/libxc/xg_dom_arm.c
diff --git a/tools/libxc/xc_dom_armzimageloader.c b/tools/libxc/xg_dom_armzimageloader.c
similarity index 100%
rename from tools/libxc/xc_dom_armzimageloader.c
rename to tools/libxc/xg_dom_armzimageloader.c
diff --git a/tools/libxc/xc_dom_binloader.c b/tools/libxc/xg_dom_binloader.c
similarity index 100%
rename from tools/libxc/xc_dom_binloader.c
rename to tools/libxc/xg_dom_binloader.c
diff --git a/tools/libxc/xc_dom_boot.c b/tools/libxc/xg_dom_boot.c
similarity index 100%
rename from tools/libxc/xc_dom_boot.c
rename to tools/libxc/xg_dom_boot.c
diff --git a/tools/libxc/xc_dom_bzimageloader.c b/tools/libxc/xg_dom_bzimageloader.c
similarity index 100%
rename from tools/libxc/xc_dom_bzimageloader.c
rename to tools/libxc/xg_dom_bzimageloader.c
diff --git a/tools/libxc/xc_dom_compat_linux.c b/tools/libxc/xg_dom_compat_linux.c
similarity index 100%
rename from tools/libxc/xc_dom_compat_linux.c
rename to tools/libxc/xg_dom_compat_linux.c
diff --git a/tools/libxc/xc_dom_core.c b/tools/libxc/xg_dom_core.c
similarity index 100%
rename from tools/libxc/xc_dom_core.c
rename to tools/libxc/xg_dom_core.c
diff --git a/tools/libxc/xc_dom_decompress_lz4.c b/tools/libxc/xg_dom_decompress_lz4.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_lz4.c
rename to tools/libxc/xg_dom_decompress_lz4.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe.c b/tools/libxc/xg_dom_decompress_unsafe.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe.c
rename to tools/libxc/xg_dom_decompress_unsafe.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_bzip2.c b/tools/libxc/xg_dom_decompress_unsafe_bzip2.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_bzip2.c
rename to tools/libxc/xg_dom_decompress_unsafe_bzip2.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_lzma.c b/tools/libxc/xg_dom_decompress_unsafe_lzma.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_lzma.c
rename to tools/libxc/xg_dom_decompress_unsafe_lzma.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_lzo1x.c b/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_lzo1x.c
rename to tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_xz.c b/tools/libxc/xg_dom_decompress_unsafe_xz.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_xz.c
rename to tools/libxc/xg_dom_decompress_unsafe_xz.c
diff --git a/tools/libxc/xc_dom_elfloader.c b/tools/libxc/xg_dom_elfloader.c
similarity index 100%
rename from tools/libxc/xc_dom_elfloader.c
rename to tools/libxc/xg_dom_elfloader.c
diff --git a/tools/libxc/xc_dom_hvmloader.c b/tools/libxc/xg_dom_hvmloader.c
similarity index 100%
rename from tools/libxc/xc_dom_hvmloader.c
rename to tools/libxc/xg_dom_hvmloader.c
diff --git a/tools/libxc/xc_dom_x86.c b/tools/libxc/xg_dom_x86.c
similarity index 100%
rename from tools/libxc/xc_dom_x86.c
rename to tools/libxc/xg_dom_x86.c
diff --git a/tools/libxc/xc_nomigrate.c b/tools/libxc/xg_nomigrate.c
similarity index 100%
rename from tools/libxc/xc_nomigrate.c
rename to tools/libxc/xg_nomigrate.c
diff --git a/tools/libxc/xc_offline_page.c b/tools/libxc/xg_offline_page.c
similarity index 100%
rename from tools/libxc/xc_offline_page.c
rename to tools/libxc/xg_offline_page.c
diff --git a/tools/libxc/xc_sr_common.c b/tools/libxc/xg_sr_common.c
similarity index 100%
rename from tools/libxc/xc_sr_common.c
rename to tools/libxc/xg_sr_common.c
diff --git a/tools/libxc/xc_sr_common_x86.c b/tools/libxc/xg_sr_common_x86.c
similarity index 100%
rename from tools/libxc/xc_sr_common_x86.c
rename to tools/libxc/xg_sr_common_x86.c
diff --git a/tools/libxc/xc_sr_common_x86_pv.c b/tools/libxc/xg_sr_common_x86_pv.c
similarity index 100%
rename from tools/libxc/xc_sr_common_x86_pv.c
rename to tools/libxc/xg_sr_common_x86_pv.c
diff --git a/tools/libxc/xc_sr_restore.c b/tools/libxc/xg_sr_restore.c
similarity index 100%
rename from tools/libxc/xc_sr_restore.c
rename to tools/libxc/xg_sr_restore.c
diff --git a/tools/libxc/xc_sr_restore_x86_hvm.c b/tools/libxc/xg_sr_restore_x86_hvm.c
similarity index 100%
rename from tools/libxc/xc_sr_restore_x86_hvm.c
rename to tools/libxc/xg_sr_restore_x86_hvm.c
diff --git a/tools/libxc/xc_sr_restore_x86_pv.c b/tools/libxc/xg_sr_restore_x86_pv.c
similarity index 100%
rename from tools/libxc/xc_sr_restore_x86_pv.c
rename to tools/libxc/xg_sr_restore_x86_pv.c
diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xg_sr_save.c
similarity index 100%
rename from tools/libxc/xc_sr_save.c
rename to tools/libxc/xg_sr_save.c
diff --git a/tools/libxc/xc_sr_save_x86_hvm.c b/tools/libxc/xg_sr_save_x86_hvm.c
similarity index 100%
rename from tools/libxc/xc_sr_save_x86_hvm.c
rename to tools/libxc/xg_sr_save_x86_hvm.c
diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xg_sr_save_x86_pv.c
similarity index 100%
rename from tools/libxc/xc_sr_save_x86_pv.c
rename to tools/libxc/xg_sr_save_x86_pv.c
diff --git a/tools/libxc/xc_suspend.c b/tools/libxc/xg_suspend.c
similarity index 100%
rename from tools/libxc/xc_suspend.c
rename to tools/libxc/xg_suspend.c
-- 
2.26.2


