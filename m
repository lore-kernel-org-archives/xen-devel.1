Return-Path: <SRS0=dV6x=CK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F197EC433E6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 11:10:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDBA20BED
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 11:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="dIKh1uzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDBA20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4BV-0000Wi-8v; Tue, 01 Sep 2020 11:10:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4BT-0000VB-EV
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:39 +0000
X-Inumbo-ID: 63ef6d52-76e3-4e40-8936-f4b822b1143a
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63ef6d52-76e3-4e40-8936-f4b822b1143a;
 Tue, 01 Sep 2020 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JdFoPoleaw4tuOelguNrercB/rGm2uumX09CkmN978M=;
 b=dIKh1uzViVnZK1MyPYFsFm7lYcM01zmMIT8NZqYeQN1BP20LDTSUl8eB
 +CkRlzWLHD9XDFGPY2Qt+Wqbq6VcfPpf6LEPovLyvOFh07bk3rOIEAE8b
 9mXXsDpoCYY21a1IZxcT/2bH15ri4qHgi1wH54W4bTJLFqvXo7+NcT7sh g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3PT9NW5SBded6iTc0FWkTFU3253T57O2Kjr8lD/3TZw8aLEx489kUJupa+QCfJ6C2AMkxnNOKe
 H/dEom+Ak5Wzioc08c97FSo0m2My97xb8au5rhtmfSLBXxOjwQx7/XnTGMnPOsx9REsz0GTZQX
 uRALeT47opfP8cCU52RGjVtuNUY24f0A/6SA16xpBPg0AUfbS1zELcXyPHCE5HkaxAkGvXWR9/
 USvO0cabvdFvxLtEc9OpKIBH7U0ldUnUlwCRO0ftqxHxkulZWUCcdVHaLA5qZdA2gIg3sOR2Ju
 Yl0=
X-SBRS: 2.7
X-MesageID: 25858454
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="25858454"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/8] x86/msr: explicitly handle AMD DE_CFG
Date: Tue, 1 Sep 2020 12:54:40 +0200
Message-ID: <20200901105445.22277-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901105445.22277-1-roger.pau@citrix.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
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

Report LFENCE_SERIALISE unconditionally for DE_CFG on AMD hardware and
silently drop writes.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Drop the bot_cpu checks and don't attempt to read the MSR, just
   return LFENCE_SERIALISE unconditionally.
 - Add a comment about OpenBSD panicking if writing to the MSR
   triggers a #GP.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/msr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index a478b91f23..e84107ac7b 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -292,6 +292,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = msrs->tsc_aux;
         break;
 
+    case MSR_AMD64_DE_CFG:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+        *val = AMD64_DE_CFG_LFENCE_SERIALISE;
+        break;
+
     case MSR_AMD64_DR0_ADDRESS_MASK:
     case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
         if ( !cp->extd.dbext )
@@ -517,6 +523,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_AMD64_DE_CFG:
+        /*
+         * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
+         * https://www.illumos.org/issues/12998
+         */
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+        break;
+
     case MSR_AMD64_DR0_ADDRESS_MASK:
     case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
         if ( !cp->extd.dbext || val != (uint32_t)val )
-- 
2.28.0


