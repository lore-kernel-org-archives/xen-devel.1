Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3503CC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 15:08:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1CDB205CB
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 15:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1CDB205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc9H9-0007h2-EM; Fri, 22 May 2020 15:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jc9H7-0007gx-RN
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 15:07:53 +0000
X-Inumbo-ID: 01c67b96-9c3e-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01c67b96-9c3e-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 15:07:52 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pywG/WyueHGMEDxq8X+fh8wZanoO5OpJS1+aiLTRESYwg1GCNloMICFlG+JfSS9bVyJjzZXMYM
 eT7dAQQ0eRjsFMHCZm9tpf7UtUysia/NIrFNKt4JqpD5LiA05zStGO4h7c2dToLqv5n7uV/iqM
 MtFLu6LY0TL+PF2XKkizuvEcwfo7dTnXBo/paJmK0KRxMrKY8JNqU3tDuCb32BaJcPUtbnO0oK
 OsoWXO/rTvP0BA0QNTszdvAYx6t+Sg/I8zA/ABx/L33KVZfUKk0K6zaSH4k3ncEwF8rxc/6VPK
 zfY=
X-SBRS: 2.7
X-MesageID: 18449305
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18449305"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/idle: Extend ISR/C6 erratum workaround to Haswell
Date: Fri, 22 May 2020 16:07:33 +0100
Message-ID: <20200522150733.18422-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This bug was first discovered against Haswell.  It is definitely affected.

(The XenServer ticket for this bug was opened on 2013-05-30 which is coming up
on 7 years old, and predates Broadwell).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

We've followed up with Intel, but based on conversations, I was expecting
Haswell to be treated the same as Broadwell in this regard.
---
 xen/arch/x86/acpi/cpu_idle.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 178cb607c2..a2248ea11f 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -583,8 +583,16 @@ bool errata_c6_workaround(void)
          * registers), the processor may dispatch the second interrupt (from
          * the IRR bit) before the first interrupt has completed and written to
          * the EOI register, causing the first interrupt to never complete.
+         *
+         * Note: Haswell hasn't had errata issued, but this issue was first
+         * discovered on Haswell hardware, and is affected.
          */
         static const struct x86_cpu_id isr_errata[] = {
+            /* Haswell */
+            INTEL_FAM6_MODEL(0x3c),
+            INTEL_FAM6_MODEL(0x3f),
+            INTEL_FAM6_MODEL(0x45),
+            INTEL_FAM6_MODEL(0x46),
             /* Broadwell */
             INTEL_FAM6_MODEL(0x47),
             INTEL_FAM6_MODEL(0x3d),
-- 
2.11.0


