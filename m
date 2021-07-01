Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B21C11F6C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:21:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89498613FE
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89498613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148786.275086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZZ-00036P-DP; Thu, 01 Jul 2021 14:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148786.275086; Thu, 01 Jul 2021 14:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZZ-00033E-0w; Thu, 01 Jul 2021 14:21:45 +0000
Received: by outflank-mailman (input) for mailman id 148786;
 Thu, 01 Jul 2021 14:21:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxQY-0005tj-3C
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:12:26 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15a5bb7c-acdc-4168-94ea-f77cf4018776;
 Thu, 01 Jul 2021 14:11:00 +0000 (UTC)
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
X-Inumbo-ID: 15a5bb7c-acdc-4168-94ea-f77cf4018776
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VYtJdbyxr0lMfwQQB1MSi1pDA6ObAawqWdtJQrYS9po=;
  b=RZ/AqPFO3RtE2bZM2a+6ZjsbgbADUyMHPIDxzmx6D5qKXQhpI1vjhDId
   RAUPCyKWq8X3Mugkan2g73J+wRj90HQHgOY3K0TP9T0a0EUu84Q3lfx/T
   GT+3ZCXDbjxdhjWhOe4heqipxkx69anfEIwsBU1CB+01THxdbpZ9JmznZ
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gCca3NaYK5NXXlP8zzfd2Es4Q6xWeJKic81AuQvAcHairi0uqKEAhynP3h64VNELTzpd3ikKwM
 vEVBgmeZRmBSvAyOtMBkdqIRtxmfnlfe8ZP0vs+dv+3xKahhvusr5uPnPLxK5aAub7l+1/oDfa
 BKz61EK8oqKIwfan9lo0UbG9P6X/ZIoT/8Os/0uk5ubJm4MfIUSkj7bEuX5Gusb7hwVKCGIHa3
 dTrlNQNp5zX7EXEdjmsk4Vqa3e0kpl+/WKUdJaFqvP2j4Syp3PEJqcmQEvlNOqc/MUrwC+xJxw
 2L4=
X-SBRS: 5.1
X-MesageID: 47384444
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zoJpmqosS7oNlMtgtLh3LAYaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47384444"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 25/31] build: remove unneeded deps of x86_emulate.o
Date: Thu, 1 Jul 2021 15:10:05 +0100
Message-ID: <20210701141011.785641-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Those two dependencies already exist so make doesn't need to know
about them. The dependency will be generated by $(CC).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 3bd302d28ccf..fc719247eac9 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -84,7 +84,6 @@ extra-y += xen.lds
 ifneq ($(CONFIG_HVM),y)
 x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
-x86_emulate.o: x86_emulate/x86_emulate.c x86_emulate/x86_emulate.h
 
 efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
                       -O $(BASEDIR)/include/xen/compile.h ]; then \
-- 
Anthony PERARD


