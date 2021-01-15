Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B60EC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 23:11:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA7323382
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 23:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA7323382
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68831.123351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YFQ-0005yB-Hq; Fri, 15 Jan 2021 23:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68831.123351; Fri, 15 Jan 2021 23:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YFQ-0005y1-Ar; Fri, 15 Jan 2021 23:11:16 +0000
Received: by outflank-mailman (input) for mailman id 68831;
 Fri, 15 Jan 2021 23:11:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0YFP-0005vh-D3
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 23:11:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f55a9db-672a-42a0-9d96-32b0276fc11a;
 Fri, 15 Jan 2021 23:11:07 +0000 (UTC)
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
X-Inumbo-ID: 1f55a9db-672a-42a0-9d96-32b0276fc11a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610752267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fygCPvuaHloKWc6XP3jLPfZcdHpf7Ee8rM9SEUn8eHs=;
  b=Aek3vRHuYtvm0kW6tbjksWrpqvOsRLefXsKVBQJaBs79tTbn3/uSKmaL
   NpVA+BDJm0IyvrbXw8hkKsjfFCaqQrQK8zQu7IOS1i6/kNl/KlImg5a6B
   iBn95Umy45sGVx7csTX/EsmcrcrthGpq30CbT2f36N5C4uCmCaNImrZd3
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: U7jt1l8EztSXAKskEQujdVsvtWXihy4Dpggy/GRYdu6r7tGXptQfjzIRIw5AjEclWW34q+m+VX
 be6mfP0/alNAyMiEUCnIN30Gz4cp3JNNE0ZFqm0w9IuDfion2X6ki1AYq/+E63w7Ny86FxbnXO
 lrTrukgmz+/VyUTzZNQz6OFS5t26MEsgb/HJgHZsP/+0SP9kgGj+WpaMlNNL58yMjhxcWLbofo
 uc16V+vXJ1ZSTlYsNdhYUv4NdYMPrj+K/5ct084kTDh1Fq1r7vyPhyRGOPb4hx+bNa6j3eZSbZ
 Fc0=
X-SBRS: 5.1
X-MesageID: 36513456
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="36513456"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, =?UTF-8?q?Norbert=20Kami=C5=84ski?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 1/3] x86/smpboot: Re-position the call to tboot_wake_ap()
Date: Fri, 15 Jan 2021 23:10:44 +0000
Message-ID: <20210115231046.31785-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210115231046.31785-1-andrew.cooper3@citrix.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

So all the moving parts are in one function.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
CC: Michal Zygowski <michal.zygowski@3mdeb.com>
CC: Piotr Krol <piotr.krol@3mdeb.co>
CC: Krystian Hebel <krystian.hebel@3mdeb.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Rich Persaud <persaur@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>
---
 xen/arch/x86/smpboot.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 67e727cebd..9eca452ce1 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -426,6 +426,13 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
     int maxlvt, timeout, i;
 
     /*
+     * Some versions of tboot might be able to handle the entire wake sequence
+     * on our behalf.
+     */
+    if ( tboot_in_measured_env() && tboot_wake_ap(phys_apicid, start_eip) )
+        return 0;
+
+    /*
      * Be paranoid about clearing APIC errors.
      */
     apic_write(APIC_ESR, 0);
@@ -570,8 +577,7 @@ static int do_boot_cpu(int apicid, int cpu)
     set_cpu_state(CPU_STATE_INIT);
 
     /* Starting actual IPI sequence... */
-    if ( !tboot_in_measured_env() || tboot_wake_ap(apicid, start_eip) )
-        boot_error = wakeup_secondary_cpu(apicid, start_eip);
+    boot_error = wakeup_secondary_cpu(apicid, start_eip);
 
     if ( !boot_error )
     {
-- 
2.11.0


