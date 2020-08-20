Return-Path: <SRS0=1JDs=B6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6244DC433E1
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 15:35:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343362075E
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 15:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JL7sYxyG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343362075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mar-00075x-FH; Thu, 20 Aug 2020 15:35:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8maq-00073R-OH
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:35:08 +0000
X-Inumbo-ID: 9e87654b-1000-4c67-9331-29cfc67269a6
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e87654b-1000-4c67-9331-29cfc67269a6;
 Thu, 20 Aug 2020 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597937703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m0MqL0vp9RCmkiBc8RYLrmpVSs++vFfi2eCAWgx23YQ=;
 b=JL7sYxyGcgxblWkceXRReRCZiPRJuHiMfHo4rs+7Mc2UQvHKjk/9qJdY
 OvwOHICUNkohhutEqLAdc538JIpzhtXTeOBSjQi6Bob1lDYHBZRsMIO3D
 TyPDL48L1ZLpt+ujC7YaOp9ZfSS0/mXDaO0sK8fLZtnmLqkiVU2p7bIcq E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0+xNgEV4nGwQ05xP97QOGBt2VFhllkn9X7C2zTUfK4UUQmxgrO/m5QxBXhTq0NBov8XVEqkjSy
 gBTUJOjrAPqy8iMzf/OhZheMF+LVmf9thKRxggxAQiA73JDME56mjZirVcFFCYohie8ueM9KDw
 WIfFB0CtECe4JR6tIdCMHDI/7cQmihiCp9pXq/DzyLMsWsuPFTYjC0HJl1SjVz1w+LwXBUYxHh
 Ht7NPLDbsjqWJm/kEsYGnHoLZl+1Kzg+fKyBmWk3k0OmBvCv4ulNjiGj+v5D10Zher/MJSFTub
 KKk=
X-SBRS: 2.7
X-MesageID: 25294997
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25294997"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/vpic: also execute dpci callback for non-specific EOI
Date: Thu, 20 Aug 2020 17:34:42 +0200
Message-ID: <20200820153442.28305-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820153442.28305-1-roger.pau@citrix.com>
References: <20200820153442.28305-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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

Currently the dpci EOI callback is only executed for specific EOIs.
This is wrong as non-specific EOIs will also clear the ISR bit and
thus end the interrupt. Re-arrange the code a bit so that the common
EOI handling path can be shared between all EOI modes.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vpic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index feb1db2ee3..3cf12581e9 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -249,15 +249,15 @@ static void vpic_ioport_write(
                 if ( priority == VPIC_PRIO_NONE )
                     break;
                 pin = (priority + vpic->priority_add) & 7;
-                vpic->isr &= ~(1 << pin);
-                if ( cmd == 5 )
-                    vpic->priority_add = (pin + 1) & 7;
-                break;
+                goto common_eoi;
+
             case 3: /* Specific EOI                */
             case 7: /* Specific EOI & Rotate       */
                 pin = val & 7;
+
+            common_eoi:
                 vpic->isr &= ~(1 << pin);
-                if ( cmd == 7 )
+                if ( cmd == 7 || cmd == 5 )
                     vpic->priority_add = (pin + 1) & 7;
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
-- 
2.28.0


