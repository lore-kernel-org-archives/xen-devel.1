Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A1FC4320E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:02:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A207613B1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A207613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171099.312436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCY-0004AK-5J; Tue, 24 Aug 2021 11:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171099.312436; Tue, 24 Aug 2021 11:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCX-00046E-7C; Tue, 24 Aug 2021 11:02:41 +0000
Received: by outflank-mailman (input) for mailman id 171099;
 Tue, 24 Aug 2021 11:02:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3j-0003Ux-Dg
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:35 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54450de8-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:09 +0000 (UTC)
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
X-Inumbo-ID: 54450de8-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wyakQUKzvA/qzxlf5PAdsehWsfJUw3GHFdkxUbHnaEU=;
  b=fgMl12XMe+2bVu1ZMERv4LNW8R3efLb0VCsNaOIZ6Utii6J4vFjK8c+a
   8WfDZFlr+yBX22DgCEYzdjRE6sjHxBNN2jxbsgSpsT26fLPPbRzFnhYlx
   Pu7swGgi2PJ4+uhqrzUCQafnrpc6LCaaLfQH9iy3ivAXcBcHLLyZCPMid
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +iLW90S7GLk8lkL/fsZ7NSKAhaj88cz4KZgwV3HnAy2kFQk8b+7FvZGEWi4r4UjjVxt3YPm1ko
 X/A+YzI/NfZo201rcY/TKnxlSPDj6yi7kCF9EVm3PACF/NtbuyGoNrcznTNs3whxMW0ZY/kLvP
 mo8Vmy0LIz+gT1evkVnCocxeroOgkoUNLkWuP6V6Np9tYFd+kGgYjCSwZB02GR66XY79dm0vml
 o1K2ZWNOia8O+POLlLdTb00A0WAeHu7AJuBk3oT9bnHJjEdZvItZjBts9ZtRgHAoELQgoUUZN2
 uljK7w1p5pGnL4LnhPP2F4m5
X-SBRS: 5.1
X-MesageID: 51166407
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+ipPgKyntdoZT+CwHpOoKrPxkOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBHpTiBUJPhfZquz+8N3WBxB8boYOCIghrNEGgP1+XfKl7bamfDH4xmpM
 BdmsFFYbWdYmSS5vyKgzVQZuxQpeVvh5rY59s2oU0NcShaL4VbqytpAAeSFUN7ACNcA4AiKZ
 aa7s1b4xK9ZHU+dK2AdzU4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUglI3awp/Q
 H+4kPED+SYwr+GIy3npi/uBqdt6ZjcIxx4dY6xY/0uW3TRY8CTFcFcsvO5zXQISaqUmS4XeZ
 H30mwd1oJImj7slyiO0GHQ8hil3zA053D4z1iExXPlvMziXTo/T9FMnIRDb3LimjwdVfxHod
 Z2Nliixu1q5NL77VXAzsmNUwsvmlu/oHIkn+JWh3tDUZEGYLsUqYAE5ktaHJoJASq/sekcYa
 FTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8xUoFw84UmGsG6fsGOtB5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIWh7IOHL6GyWTKEjGAQO+l3fT2sRK2AiHQu118HICou
 WzbLoDjx9OR6vHM7zw4LRbtgvKXHiwGS/wz8023ekIhoHB
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166407"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 40/51] build: fix dependencies in arch/x86/boot
Date: Tue, 24 Aug 2021 11:50:27 +0100
Message-ID: <20210824105038.1257926-41-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Temporary fix the list of headers that cmdline.c and reloc.c depends
on, until the next time the list is out of sync again.

Also, add the linker script to the list.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/boot/Makefile   | 9 ++++++---
 xen/arch/x86/boot/build32.mk | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 2469ca7c4530..73a3b1514965 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -2,19 +2,22 @@ obj-bin-y += head.o
 
 DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
 
-CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h
+CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h \
+	       $(BASEDIR)/include/xen/kconfig.h \
+	       $(BASEDIR)/include/generated/autoconf.h
 
 RELOC_DEPS = $(DEFS_H_DEPS) \
 	     $(BASEDIR)/include/generated/autoconf.h \
 	     $(BASEDIR)/include/xen/kconfig.h \
 	     $(BASEDIR)/include/xen/multiboot.h \
 	     $(BASEDIR)/include/xen/multiboot2.h \
+	     $(BASEDIR)/include/xen/const.h \
 	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
 
 $(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
 
-$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS)
+$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
 	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
 
-$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS)
+$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS) $(src)/build32.lds
 	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
index 8cd5403926a3..e90680cd9f52 100644
--- a/xen/arch/x86/boot/build32.mk
+++ b/xen/arch/x86/boot/build32.mk
@@ -27,7 +27,7 @@ CFLAGS := $(filter-out -flto,$(CFLAGS))
 		done
 	$(OBJCOPY) -O binary -R .got.plt $< $@
 
-%.lnk: %.o
+%.lnk: %.o build32.lds
 	$(LD) $(LDFLAGS_DIRECT) -N -T build32.lds -o $@ $<
 
 %.o: %.c
-- 
Anthony PERARD


