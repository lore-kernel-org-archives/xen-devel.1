Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2F3C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 10:51:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF3D61245
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 10:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DF3D61245
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.170922.312020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1o-0006Uo-8x; Tue, 24 Aug 2021 10:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170922.312020; Tue, 24 Aug 2021 10:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1o-0006UR-0r; Tue, 24 Aug 2021 10:51:36 +0000
Received: by outflank-mailman (input) for mailman id 170922;
 Tue, 24 Aug 2021 10:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1n-0001EC-9I
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:35 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76f38e87-9105-480e-a83f-4a7dfa7b7b1a;
 Tue, 24 Aug 2021 10:51:04 +0000 (UTC)
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
X-Inumbo-ID: 76f38e87-9105-480e-a83f-4a7dfa7b7b1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uLKI3ja1OUbts2SnkXQR8tTgRcFYuztp8ELRrsey8HY=;
  b=VYroVH00n+ybuBn09VsyLn6GKpPdtSExr2nwZuXe09BMtGNsW7GtYt2z
   FrumIXCDB5RQyK5WpIE5PAx69ZLVZJbqtsWdtWbi7i+RC8q471utsOFO3
   SNmk7Sezft0TsysWWdkGrRaIezX6+YjpnovEZ2ocSur4Hai10Jla/Opov
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2oW+qoLJIU6VIRXe3KMj3mwIx+b59bIH+EIZhKH3DjENHu4zGYYHdIOv2UbL0i18aysFS9ZWa7
 GVDf4YPj1m+r7A+u5hN3WrPiK2JTCpFk61coLiaCp4iMchmd7srIPvFNNIwIcmCGAP7AdPI4aa
 SYmUz2tI5k0/KvZ96nZ6rOVxt4OSAFd3HtG1C4LGHt2ocJHcR/EfukDG63NizZAGeuD03lrxjy
 mzLS44BAcbPKCGdZEiuTBAIfr8vguqURFTGqHIoODQKEGKYny0DzN8dWSsQXJp5lL1GavEI6gi
 P2+Zdi9jqU5UNwfFOXu89w3G
X-SBRS: 5.1
X-MesageID: 52875438
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PjfI8aHoydIMXuc1pLqFVJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJkh8erhBEDyewKkyXcV2/hbAV7MZniDhILFFu9fBOjZsnfd8k/Fh4lgPM
 5bGsATZ+EYZmIK7voSlTPIdurIt+P3kpxA692+815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4iGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 f4ek3Cl+ueWsOAu1/hPlzontdrcRzau5l+7fm3+4kow/PX+0OVjcpaKvm/VXsO0ZmSAR4R4a
 LxSlEbTolOAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA23kAmcbzaVBOZ
 hwrhWkXltsfGL9tTW448KNWwBhl0Kyr3ZnmekPj2ZHWY9bbLNKt4QQ8E5cDZ9FRUvBmcgaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATlnFkyEkTwtAZgx47hdsAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yEWDJSQKkChPmHb0mLtB0B5vpke+I3FwY3pDXRHU49upApH
 2aaiIkiYcbQTOQNeSemIZM7g3ABH6gWDiF8LAv26RE
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875438"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v7 10/51] build,arm: move LDFLAGS change to arch.mk
Date: Tue, 24 Aug 2021 11:49:57 +0100
Message-ID: <20210824105038.1257926-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/Makefile | 8 --------
 xen/arch/arm/arch.mk  | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 0edd9dee6f49..3d0af8ebc93c 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -104,14 +104,6 @@ prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
 	$(call if_changed,ld)
 endif
 
-ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
-    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
-        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
-    else
-        XEN_LDFLAGS += --fix-cortex-a53-843419
-    endif
-endif
-
 targets += prelink.o
 
 $(TARGET)-syms: prelink.o xen.lds
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 11caec86ba14..6a2982059486 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -17,3 +17,11 @@ $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
     $(error You must use 'make menuconfig' to enable/disable early printk now)
 endif
+
+ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
+    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
+        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
+    else
+        LDFLAGS += --fix-cortex-a53-843419
+    endif
+endif
-- 
Anthony PERARD


