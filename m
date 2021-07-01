Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1B2C11F64
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194AA613FD
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194AA613FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148723.274972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPj-0005br-1X; Thu, 01 Jul 2021 14:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148723.274972; Thu, 01 Jul 2021 14:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPi-0005bc-UR; Thu, 01 Jul 2021 14:11:34 +0000
Received: by outflank-mailman (input) for mailman id 148723;
 Thu, 01 Jul 2021 14:11:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPQ-0005tj-1B
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b66e1eab-b8ae-48a5-a179-fd2a76fe5be5;
 Thu, 01 Jul 2021 14:10:42 +0000 (UTC)
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
X-Inumbo-ID: b66e1eab-b8ae-48a5-a179-fd2a76fe5be5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fDJGU3FkNLcK/b6b+O2MvcAjqOVoHCERsz8l937Wo3Y=;
  b=RITo4k8GBDsKxs9WtVh7mdRGibRgzUglQn76NioOkl2tPHswO3a4xB67
   pxnkSkcAdU/F4LNBFunTSUti8i4P+ookTmXoNIC1O14BhzR54znyrO3bp
   aMQXTSG1P9nAEcN9wGouZB60jpyjX+BNequ+nQsIFs28xy3R+bMcRL319
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ME0FSXPCr5qneEQ3bqxXA1FhkzMSN+hx4FUkzBNSr/GN+K+AAw0cdUFgmbQSgJbvKeUq1CR7Hk
 XP6/NlvO0uNNo4KjAZW8lfl8mU9oEXU+ZW2Om8tmobiLYCtgnAQhrC2BQ0HRnGRqJFK08kQaZ0
 4illMf3xHfttdTutn/1CgxAw+GUOBvW6EQtVl+EGQSzFZqnEKwF999DP72dm+Hne07AG3uvdF4
 76A4We69tsBzDNNoujunXbhWQ3yQyDAt2ZXicuUhZ6MlhZtp1LsbNUne6OJ5CoAjg0XCIgCAHZ
 8c8=
X-SBRS: 5.1
X-MesageID: 47093352
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dtpGEa9pNNDiOdvCFWBuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47093352"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v6 16/31] build: avoid building arm/arm/*/head.o twice
Date: Thu, 1 Jul 2021 15:09:56 +0100
Message-ID: <20210701141011.785641-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

head.o is been built twice, once because it is in $(ALL_OBJS) and a
second time because it is in $(extra-y) and thus it is rebuilt when
building "arch/arm/built_in.o".

Fix this by adding a dependency of "head.o" on the directory
"arch/arm/".

Also, we should avoid building object that are in subdirectories, so
move the declaration in there. This doesn't change anything as
"arch/arm/built_in.o" depends on "arch/arm/$subarch/built_in.o" which
depends on $(extra-y), so we still need to depend on
"arch/arm/built_in.o".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/Makefile       | 7 ++++++-
 xen/arch/arm/arm32/Makefile | 1 +
 xen/arch/arm/arm64/Makefile | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3d0af8ebc93c..cc90d9796e6e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -64,7 +64,6 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
 obj-y += vpsci.o
 obj-y += vuart.o
-extra-y += $(TARGET_SUBARCH)/head.o
 
 extra-y += xen.lds
 
@@ -76,6 +75,12 @@ endif
 
 ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
 
+# head.o is built by descending into the sub-directory, depends on the part of
+# $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and build
+# head.o
+$(TARGET_SUBARCH)/head.o: $(BASEDIR)/arch/arm/built_in.o
+$(TARGET_SUBARCH)/head.o: ;
+
 ifdef CONFIG_LIVEPATCH
 all_symbols = --all-symbols
 ifdef CONFIG_FAST_SYMBOL_LOOKUP
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 96105d238307..3040eabce3ad 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -11,3 +11,4 @@ obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
 
+extra-y += head.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 40642ff57494..0bb284dedab2 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -13,3 +13,5 @@ obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
 obj-y += vsysreg.o
+
+extra-y += head.o
-- 
Anthony PERARD


