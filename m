Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8638E7E0D0
	for <xen-devel@archiver.kernel.org>; Mon,  9 Feb 2026 11:37:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1225271.1531737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpPa8-0008PZ-V6; Mon, 09 Feb 2026 11:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225271.1531737; Mon, 09 Feb 2026 11:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpPa8-0008PS-SP; Mon, 09 Feb 2026 11:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1225271;
 Mon, 09 Feb 2026 11:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tm/7=AN=bounce.vates.tech=bounce-md_30504962.6989c6f7.v1-6799114329fc46f48f27ec1887b0cf2b@srs-se1.protection.inumbo.net>)
 id 1vpPa7-0008PM-70
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 11:37:31 +0000
Received: from mail177-22.suw61.mandrillapp.com
 (mail177-22.suw61.mandrillapp.com [198.2.177.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b66e5807-05ab-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 12:37:29 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-22.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4f8jNS0H8PzGlspFm
 for <xen-devel@lists.xenproject.org>; Mon,  9 Feb 2026 11:37:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6799114329fc46f48f27ec1887b0cf2b; Mon, 09 Feb 2026 11:37:28 +0000
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
X-Inumbo-ID: b66e5807-05ab-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1770637048; x=1770907048;
	bh=9FCMY3mXWbB9oHBO/NmmXAPXVQaSYKElKez8x1qxfjc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Fa1F22hzxMIkjK6N1Ju5WjQ+Z6AGHhcOrOOyVOfDuHeVGCjKvSDoDDKTWuhWfDP9u
	 ZMp4jwxFAZ1nRJw6obgoIzlE47sNpIa/OIys4oVftVRy7UJ1lQ3NmiF0r/xwWr41ws
	 LNMJZsb6Gq+/qHbxXRa3LDcUNLTTAg0vS2q5hU80Q5DCOocEJGn4g/eoF4i2K4ziLi
	 80R3qsMlx+XepH2IDn8PcO99NjL//AhTbS+LudH89RTTsALP8iSLbpcQfsCPbhvgKY
	 XJs/qSgnn3Umj6lIESfWWYwUgt9yTUl/KF34CCBEBdrMawGvYKCyaRa9zP+4YzdD1Y
	 MvaGh0OSaKtEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1770637048; x=1770897548; i=julian.vetter@vates.tech;
	bh=9FCMY3mXWbB9oHBO/NmmXAPXVQaSYKElKez8x1qxfjc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=15XNw88vA7zZuXdMA3QqNK/Av9hW0zol3+pcreLCBCTG0+YokYPjyfxpRkyPpHq1w
	 KEM9ejrjx6e1qBWHIVbI6cudoCGlc/JkG66uzOAH4r83WvpuvVZbctkioBfmp733wo
	 bUCeXxL3E71RHesW/HlDqttJ+REYFmCqL0pNab29r28kwRpmI9CLKy7+cIMvzqoroB
	 VWbnogEdP+XutFmecZuaXO/EZWfxjR6RUEJrQp+qhN/NGuJyX9R4ybA+P3rxMSeq10
	 TfkPwnpiVsiwJx+fhW0pPMbfUd83nZPtwR2CH34H+QI6TS8Yb7AGS1p5olzBg9bN3Y
	 NVz+3+I7BWEcQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/hvm:=20Add=20x2APIC=20topology?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1770637047143
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260209113721.2604894-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6799114329fc46f48f27ec1887b0cf2b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260209:md
Date: Mon, 09 Feb 2026 11:37:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

HVM guests with more than 128 vCPUs require APIC IDs above 255 (since
APIC ID = vcpu_id * 2), which exceeds the 8-bit xAPIC limit. Currently,
CPUID leaf 0xB returns EBX=0, making firmware (OVMF/EDK2) fall back to
CPUID leaf 1 for APIC ID discovery, which is limited to 8 bits and
cannot distinguish vCPUs with APIC IDs greater than 256.
To address this, implement proper CPUID leaf 0xB x2APIC topology
enumeration. Present all vCPUs as cores in a single package with correct
shift values based on the maximum APIC ID, and non-zero EBX so that
firmware uses the 32-bit x2APIC ID from EDX. Moreover, set CPUID leaf 1
EBX[23:16] (max addressable logical processor IDs) to the appropriate
power-of-2 value, but capped at 255.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
 xen/arch/x86/cpuid.c | 54 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index ceac37b3ae..fb17c71d74 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -284,10 +284,26 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         const struct cpu_user_regs *regs;
 
     case 0x1:
-        /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
         if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+        {
+            unsigned int max_apic_id, max_lp;
+
+            /*
+             * EBX[23:16] = Maximum number of addressable IDs for logical
+             * processors in a physical package. Must be large enough to
+             * accommodate all vCPU APIC IDs. Round up to next power of 2.
+             *
+             * With APIC ID = vcpu_id * 2, max APIC ID = (max_vcpus - 1) * 2.
+             * We need max_lp to be greater than max_apic_id for proper
+             * enumeration.
+             */
+            max_apic_id = (d->max_vcpus - 1) * 2;
+            max_lp = min(1u << fls(max_apic_id), 255u);
+
+            res->b = (res->b & 0xff00ffffu) | (max_lp << 16);
+            res->b |= (uint8_t)(v->vcpu_id * 2) << 24;
+        }
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -463,11 +479,41 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
          * coupled with x2apic, and we offer an x2apic-capable APIC emulation
          * to guests on AMD hardware as well.
          *
-         * TODO: Rework topology logic.
+         * Provide a simple topology where all vCPUs are cores in a single
+         * package (no SMT). This ensures EBX is non-zero so that software
+         * (like EDK2/OVMF) uses the 32-bit x2APIC ID from EDX.
          */
         if ( p->basic.x2apic )
         {
-            *(uint8_t *)&res->c = subleaf;
+            unsigned int max_vcpus = d->max_vcpus;
+            unsigned int max_apic_id = (max_vcpus - 1) * 2;
+            unsigned int shift;
+
+            /* Calculate shift value for Core level topology. */
+            shift = fls(max_apic_id);
+
+            switch ( subleaf )
+            {
+            /* SMT level - no hyperthreading, 1 thread per core */
+            case 0x0:
+                res->a = 0;         /* No shift (1 thread per core) */
+                res->b = 1;         /* 1 logical processor at this level */
+                res->c = 0x100 | 0; /* Level type 1 (SMT), level number 0 */
+                break;
+
+            /* Core level - all vCPUs are cores in one package */
+            case 0x1:
+                res->a = shift;     /* Bits to shift to get package ID */
+                res->b = max_vcpus; /* Number of logical processors */
+                res->c = 0x200 | 1; /* Level type 2 (Core), level number 1 */
+                break;
+
+            default: /* Invalid level */
+                res->a = 0;
+                res->b = 0;
+                res->c = subleaf;   /* Level number only, type 0 (invalid) */
+                break;
+            }
 
             /* Fix the x2APIC identifier. */
             res->d = v->vcpu_id * 2;
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


