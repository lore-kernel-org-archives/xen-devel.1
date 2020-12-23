Return-Path: <SRS0=Rlng=F3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17621C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 20:45:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F07221F5
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 20:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F07221F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.58594.103202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksB0X-0007bf-16; Wed, 23 Dec 2020 20:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58594.103202; Wed, 23 Dec 2020 20:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksB0W-0007bY-UN; Wed, 23 Dec 2020 20:45:16 +0000
Received: by outflank-mailman (input) for mailman id 58594;
 Wed, 23 Dec 2020 20:45:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxwC=F3=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ksB0V-0007bQ-N3
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 20:45:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e571ab90-7c47-4c0c-9450-a477725d5b69;
 Wed, 23 Dec 2020 20:45:14 +0000 (UTC)
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
X-Inumbo-ID: e571ab90-7c47-4c0c-9450-a477725d5b69
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608756314;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=VcDRdLCPQ0tSFy5EC+0JfufBLFLHQk9/isCxuNjtbeo=;
  b=K0SKGjgvFuvPeWQ9OQ3kweB+lPmA9iDqI9pBCSNcJCR9YvjMC02c2V95
   wdp67k3pFeYhufSWZGIHW+iBnT1JpxpI8Hlwr3sWZtuBn7mmrgeAI+hdE
   lv4y/vSivOWPH/O++ik+LOKW/K6T2LeJvHlMJ+boyQ/HYvjp7ibuXrs9U
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VnFW6XtpNTgxgsucMleoa7VtQwCPaiAWgwpLBQbSgIPy4UYG26PJ/4YX7rPDzoD5llRp+mdmS5
 DacpOHVnyz8iqUi66OMzyYq2C8SZ/kDOBPgQKm9R3NPxYNDZRFvcAIyB+o5zN+ktZZEVIzaY8r
 0YxReaHoQ5X8gNNodSJx8EZtQsgH79w73k6Xcu3ZkF+yhdHYuhBQPwApOAgNEkVYXp4emnZoQH
 VuXRrK/apZM8ntihWFeIYfOubcC5hO2+xbBXDr3MQQHsrR+x+GVWIXdwmIT7pagoHaaz3aVBGz
 oo4=
X-SBRS: 5.2
X-MesageID: 35121504
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,442,1599537600"; 
   d="scan'208";a="35121504"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v3] x86/intel: insert Ice Lake-X (server) and Ice Lake-D model numbers
Date: Wed, 23 Dec 2020 20:32:00 +0000
Message-ID: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

LBR, C-state MSRs should correspond to Ice Lake desktop according to
External Design Specification vol.2 for both models.

Ice Lake-X is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
(confirmed on Whitley SDP) which means the erratum is fixed in hardware for
that model and therefore it shouldn't be present in has_if_pschange_mc list.
Provisionally assume the same to be the case for Ice Lake-D.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v3:
- Add Ice Lake-D model numbers
- Drop has_if_pschange_mc hunk following Tiger Lake related discussion -
  IF_PSCHANGE_MC_NO is confimed to be exposed on Whitley SDP

---
 xen/arch/x86/acpi/cpu_idle.c | 2 ++
 xen/arch/x86/hvm/vmx/vmx.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index c092086..d788c8b 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -181,6 +181,8 @@ static void do_get_hw_residencies(void *arg)
     case 0x55:
     case 0x5E:
     /* Ice Lake */
+    case 0x6A:
+    case 0x6C:
     case 0x7D:
     case 0x7E:
     /* Tiger Lake */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2d4475e..bff5979 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2775,7 +2775,7 @@ static const struct lbr_info *last_branch_msr_get(void)
         /* Goldmont Plus */
         case 0x7a:
         /* Ice Lake */
-        case 0x7d: case 0x7e:
+        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
         /* Tiger Lake */
         case 0x8c: case 0x8d:
         /* Tremont */
-- 
2.7.4


