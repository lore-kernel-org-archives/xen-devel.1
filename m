Return-Path: <SRS0=9A1V=LF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84442C48BE6
	for <xen-devel@archiver.kernel.org>; Fri, 11 Jun 2021 16:37:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB80613BC
	for <xen-devel@archiver.kernel.org>; Fri, 11 Jun 2021 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB80613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.140551.259676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9L-0000XM-OK; Fri, 11 Jun 2021 16:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140551.259676; Fri, 11 Jun 2021 16:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9L-0000X8-Ks; Fri, 11 Jun 2021 16:36:51 +0000
Received: by outflank-mailman (input) for mailman id 140551;
 Fri, 11 Jun 2021 16:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdcj=LF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lrk9L-0008Of-5W
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 16:36:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 051cac6f-9077-4608-9d60-e1b53a200168;
 Fri, 11 Jun 2021 16:36:41 +0000 (UTC)
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
X-Inumbo-ID: 051cac6f-9077-4608-9d60-e1b53a200168
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623429401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j0PLpWa/uAzrwIeuD9efCXaNBu+kISYj0KlPiUCAb5o=;
  b=Emx2XDaGGGOSeHTndNeLi6UrqTNH33e9r6t6VIN9QbzfgdjU1IDoBsus
   8Oqu8cs7bFuSh+dAX2vXl+G1AuMp+TPQAJdESzxd5BFk8aesADSGL2lj7
   WEpsCVFaWMPZ3t2qXOknBeLHtb6rQqSo5L61VjHkGsLI4jWEs2DhMrKVg
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KHWKseF7XjIeVzjmp3F1vZTuP1yEelPBkcq1vTL/hEpqnckMxU2Lb/l5h5Kto+YsIWPmJrSaR/
 t75CE0FdW2AEikEQirZjHAj/N3mHgEwImpOaA7NFgFcd7+SBMigOZrZruBkaPFsybFAjh0TxzU
 cH81rl7+m/7JORFCqrkgdDhBNfNUxLpKYuv5YuNIeQtxE39wk78l2i8Y5q2rdqdooLTHe8bGOD
 SlSlJ9WhcVY1saKKLUbVg0LVwp8R7WBIDn+WdP8xHt26Dwg+y4woSF6uMtaguxd/qPMnDb1VDu
 gU0=
X-SBRS: 5.1
X-MesageID: 45958353
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:InE0Sa2ax5NQUwOoxYFI5QqjBIgkLtp133Aq2lEZdPRUGvb4qy
 nIpoVi6faUskdpZJhOo6HiBEDtexzhHNtOkO0s1NSZLW/bUQmTXeNfBOLZqlWKcUCTygce79
 YGT0EXMqyKMbEQt6bHCWeDferIuOP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.83,265,1616472000"; 
   d="scan'208";a="45958353"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] x86/platform: Permit reading the TSX control MSRs via XENPF_resource_op
Date: Fri, 11 Jun 2021 17:36:24 +0100
Message-ID: <20210611163627.4878-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210611163627.4878-1-andrew.cooper3@citrix.com>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We are going to want this to write some tests with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/platform_hypercall.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 41d8e59563..284c2dfb9e 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -74,6 +74,12 @@ static bool msr_read_allowed(unsigned int msr)
 
     case MSR_IA32_TSC:
         return true;
+
+    case MSR_TSX_FORCE_ABORT:
+        return cpu_has_tsx_force_abort;
+
+    case MSR_TSX_CTRL:
+        return cpu_has_tsx_ctrl;
     }
 
     if ( ppin_msr && msr == ppin_msr )
-- 
2.11.0


