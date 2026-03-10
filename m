Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB17FD4F06
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 16:45:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250307.1547801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cb-0003U4-MH; Tue, 10 Mar 2026 16:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250307.1547801; Tue, 10 Mar 2026 16:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cb-0003Tx-Ix; Tue, 10 Mar 2026 16:45:01 +0000
Received: by outflank-mailman (input) for mailman id 1250307;
 Tue, 10 Mar 2026 16:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gdb/=BK=bounce.vates.tech=bounce-md_30504962.69b04a86.v1-9b6333b3049249c998ca885eb31c564d@srs-se1.protection.inumbo.net>)
 id 1w00Ca-000397-1C
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:45:00 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 778e17c0-1ca0-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 17:44:55 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fVfqp4Pfbz3Xd
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9b6333b3049249c998ca885eb31c564d; Tue, 10 Mar 2026 16:44:54 +0000
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
X-Inumbo-ID: 778e17c0-1ca0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161094; x=1773431094;
	bh=tvGZ8I5yGbu47GPCSHdjFhh+QbtkVjwXJ0lx4QYZVe0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=f+ok+lZ1MIhQ10pUJKYcsy3e+6upbZvj+PaxUR+G77adqmsuV3e+Ru0rPOnU9aJGH
	 dSZZd37YZQnbFnDVR10pTnhJJwfnO7B7hIsxOj/ao453TeedkCtCR6b5TAnvGfat0n
	 myQtOYShmp0OBxAowTgaLAKWwNlm2eJcz2KFo94Q5My3TcNppkCgiUIBYoaYDL5GMW
	 lnBv24K3T4Yu6ISfUolkDjYAOHo0fqXcGwE3a3nTYezVMVezKxEiCYJFop8dtOlbIa
	 y56I1w3L6IX+msOfRyBOcgPgJtOgIAzM4HQZjx6vqLcT3cOFnSZE/FN1IYgSCbnjN6
	 lvheCSAgDxO1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161094; x=1773421594; i=teddy.astie@vates.tech;
	bh=tvGZ8I5yGbu47GPCSHdjFhh+QbtkVjwXJ0lx4QYZVe0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KXMnZNFrrA8b5m3sXEqulAOlvCodPU4aOi824JbxmHOOBaMydwSI4kll1wCHP04dt
	 MSQ8sS2ZECDYuaI6jGuX8bLPMg6AkjSJ5uBYe0z95G1Zq+4I62AkHDp+p6ersiGlVc
	 6PVHV+nPUnYjPTU6q3tX3gKbzTwuCPRDAbw2qxeAgBdgiR5TKEb0D8XG65QuXGio73
	 SXERIvLCXuep4hVniAlNdAaFGwmbTKbUAeNfdvUYECaGo0rYZw+WRkdYrso6iy1PJL
	 5WQ3IErRYShy9BoF8dQRHczHTsfvNHRZkuLkmFn3PJxSo00OXi6EZHN7hD/N+xr7Vd
	 CgAr1XfAzr2tg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=202/6]=20x86/vpmu:=20Expose=20PEBS=20and=20DS=20area=20in=20PV=20mode?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161093696
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1773160025.git.teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9b6333b3049249c998ca885eb31c564d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I don't see any reason for them for not be available, especially
since core2_vpmu_do_wrmsr has PV specific logic for MSR_IA32_DS_AREA.

Fixes: 27c554198666 ("x86/VPMU: add support for PMU register handling on PV guests")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/pv/emul-priv-op.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index b2556f9213..0d93218030 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -993,6 +993,8 @@ static int cf_check read_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(7):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+    case MSR_IA32_PEBS_ENABLE:
+    case MSR_IA32_DS_AREA:
         if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
@@ -1170,6 +1172,8 @@ static int cf_check write_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(7):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+    case MSR_IA32_PEBS_ENABLE:
+    case MSR_IA32_DS_AREA:
         if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


