Return-Path: <SRS0=ZRtW=JL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71AEC433B4
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 04:40:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2C56128E
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 04:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2C56128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.110238.210415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWXKS-0006Df-Tl; Wed, 14 Apr 2021 04:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110238.210415; Wed, 14 Apr 2021 04:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWXKS-0006DX-Qe; Wed, 14 Apr 2021 04:40:40 +0000
Received: by outflank-mailman (input) for mailman id 110238;
 Wed, 14 Apr 2021 04:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCy3=JL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lWXKS-0006DK-5V
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 04:40:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcf77da9-147a-4b09-896a-7b6f1e31c026;
 Wed, 14 Apr 2021 04:40:39 +0000 (UTC)
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
X-Inumbo-ID: dcf77da9-147a-4b09-896a-7b6f1e31c026
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618375239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=kHmdNeilZg/p0sQ7+gnQS7Iyi+YvCL5otA+t6Ipsfh4=;
  b=bH/Zhy5kcczj2mBLkd3df+Dg2Ep7jeq/KS42iR8jKVR9PMw89p2XhJQP
   +cxLfkBaeLR16rdqwnJwzu8cYUo/jkXVFvFWP1IkcJavvEFNWeqD7nuqq
   qhJo6iLDmql/3W2D4iuTQQds/wD3q2zZE9pqmSoTVM23q2lZl0YnTJpjU
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 737Ffi+JJYFgEfAHj89YiBMDJcHHWopOzx2QAzBzEYVYuERuevmS4FCbVlZVPcKDDiQDEXxfGs
 c05mWqIzszKRlSxMpP+qyd4ROqUZLfSZDEd/B7n76grfrwanydu4yhOIbra5kgXyMLWDsVw2fu
 zzqrRqJJow+rN0tYb2Su6L7lgvEAzo0JAbV3en9eKBHBqkjhsSyjjKT5GwnIsh4qbqyLukEO3o
 CD6G7CKSj83AWxZxEUQifzz6tOT3Xc3jOWronToEvF/94K4a4VoBKsK9CMJd3Vm0sho6aGwdL3
 zsU=
X-SBRS: 4.0
X-MesageID: 41922793
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xH0SwaF54esV1gIqpLqEcMeALOonbusQ8zAX/mpaICY1TuWzkc
 eykPMHkSLlkTp5YgBZpfmsMLSNKEmslqJdzpIWOd6ZMzXOmGztF4166Jun/juIIVybysd49Y
 NNN5dzE8fxC18St7eC3CCdH8w7yNeKtICE7N2urUtFdg1hZ6F+4woRMG/yeScaKDVuPpY3GI
 GR4cBKvVObCBMqR/+2G2UfWKz7r8DL/aiWByIuPQIt6wWFkFqTiILSLh7w5HkjegIK5b8j9G
 Tf+jaJg5mejw==
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="41922793"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v4 2/2] x86/intel: insert Ice Lake-SP and Ice Lake-D model numbers
Date: Wed, 14 Apr 2021 05:40:22 +0100
Message-ID: <1618375222-9283-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618375222-9283-1-git-send-email-igor.druzhinin@citrix.com>
References: <1618375222-9283-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

LBR, C-state MSRs should correspond to Ice Lake desktop according to
SDM rev. 74 for both models.

Ice Lake-SP is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
(as advisory tells and Whitley SDP confirms) which means the erratum is fixed
in hardware for that model and therefore it shouldn't be present in
has_if_pschange_mc list. Provisionally assume the same to be the case
for Ice Lake-D while advisory is not yet updated.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v4:
- now based on SDM update
- new LBR (0x1e0)does not seem to be exposed in the docs

Changes in v3:
- Add Ice Lake-D model numbers
- Drop has_if_pschange_mc hunk following Tiger Lake related discussion
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
index 5a4ca35..52469ca 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2982,7 +2982,7 @@ static const struct lbr_info *last_branch_msr_get(void)
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


