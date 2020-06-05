Return-Path: <SRS0=7n4I=7S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4974BC433DF
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 14:23:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220D2206DC
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 14:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220D2206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDFD-0000rr-IQ; Fri, 05 Jun 2020 14:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jhDFC-0000rk-5s
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 14:22:50 +0000
X-Inumbo-ID: 087f11be-a738-11ea-96fb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 087f11be-a738-11ea-96fb-bc764e2007e4;
 Fri, 05 Jun 2020 14:22:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C5F8AAB64;
 Fri,  5 Jun 2020 14:22:51 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] build: fix dependency tracking for preprocessed files
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <ec58c0cd-2e39-15bd-a102-fd5b40e5e35d@suse.com>
Date: Fri, 5 Jun 2020 16:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While the issue is more general, I noticed that asm-macros.i not getting
re-generated as needed. This was due to its .*.d file mentioning
asm-macros.o instead of asm-macros.i. Use -MQ here as well, and while at
it also use -MQ to avoid the somewhat fragile sed-ary on the *.lds
dependency tracking files. While there, further avoid open-coding $(CPP)
and drop the bogus (Arm) / stale (x86) -Ui386.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Move -MQ ahead on command lines.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -201,13 +201,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y)
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
-cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
+cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
 
 quiet_cmd_cc_s_c = CC      $@
 cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
 quiet_cmd_s_S = CPP     $@
-cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
+cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
 
 %.i: %.c FORCE
 	$(call if_changed,cpp_i_c)
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -123,9 +123,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-off
 	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
 
 xen.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(a_flags) -o $@ $<
-	sed -e 's/xen\.lds\.o:/xen\.lds:/g' <.xen.lds.d >.xen.lds.d.new
-	mv -f .xen.lds.d.new .xen.lds.d
+	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
 
 dtb.o: $(CONFIG_DTB_FILE)
 
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -244,9 +244,7 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
 
 efi.lds: AFLAGS-y += -DEFI
 xen.lds efi.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<
-	sed -e 's/.*\.lds\.o:/$(@F):/g' <.$(@F).d >.$(@F).d.new
-	mv -f .$(@F).d.new .$(@F).d
+	$(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
 
 boot/mkelf32: boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<

