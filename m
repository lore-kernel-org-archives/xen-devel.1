Return-Path: <SRS0=xX5W=CX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D495AC43461
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 10:16:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A3422076C
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 10:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A3422076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlWb-0004L6-8w; Mon, 14 Sep 2020 10:15:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHlWZ-0004L0-JC
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:15:51 +0000
X-Inumbo-ID: 2ff8d569-5982-4986-b1d9-65d333359bd9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ff8d569-5982-4986-b1d9-65d333359bd9;
 Mon, 14 Sep 2020 10:15:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76EC8AD21;
 Mon, 14 Sep 2020 10:15:55 +0000 (UTC)
Subject: [PATCH 1/9] build: use if_changed more consistently (and correctly)
 for prelink*.o
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Message-ID: <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
Date: Mon, 14 Sep 2020 12:15:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Switch to $(call if_changed,ld) where possible; presumably not doing so
in e321576f4047 ("xen/build: start using if_changed") right away was an
oversight, as it did for Arm in (just) one case. It failed to add
prelink.o to $(targets), though, causing - judging from the observed
behavior on x86 - undue rebuilds of the final binary (because of
prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
because of .prelink.o.cmd not getting read) during "make install-xen".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/Makefile |  4 +++-
 xen/arch/x86/Makefile | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 51173d97127e..296c5e68bbc3 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -95,12 +95,14 @@ prelink_lto.o: $(ALL_OBJS)
 
 # Link it with all the binary objects
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
+	$(call if_changed,ld)
 else
 prelink.o: $(ALL_OBJS) FORCE
 	$(call if_changed,ld)
 endif
 
+targets += prelink.o
+
 $(TARGET)-syms: prelink.o xen.lds
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 74152f2a0dad..9b368632fb43 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -136,19 +136,21 @@ prelink_lto.o: $(ALL_OBJS)
 	$(LD_LTO) -r -o $@ $^
 
 # Link it with all the binary objects
-prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y)
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
+prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y) FORCE
+	$(call if_changed,ld)
 
-prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
+prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
+	$(call if_changed,ld)
 else
-prelink.o: $(ALL_OBJS) $(EFI_OBJS-y)
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
+prelink.o: $(ALL_OBJS) $(EFI_OBJS-y) FORCE
+	$(call if_changed,ld)
 
-prelink-efi.o: $(ALL_OBJS)
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
+prelink-efi.o: $(ALL_OBJS) FORCE
+	$(call if_changed,ld)
 endif
 
+targets += prelink.o prelink-efi.o
+
 $(TARGET)-syms: prelink.o xen.lds
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
-- 
2.22.0



