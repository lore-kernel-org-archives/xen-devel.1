Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B185EC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366958.1616805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPx-00069U-0m; Mon, 20 Jul 2026 16:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366958.1616805; Mon, 20 Jul 2026 16:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPw-00068b-Ot; Mon, 20 Jul 2026 16:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1366958;
 Mon, 20 Jul 2026 16:00:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPv-0005yR-64
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPu-00HTTh-Ix
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4612-e002-0a2a0a5209dd-0a2a450abd5a-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:30 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e461e-f2d2-0a2a450a0019-d155dd2dd0bf-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:30 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so7492115f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:30 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563230; x=1785168030; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhEGDhlXrwyiseqyPc30kooLsaCELsXAQVmwDU9aLvI=;
        b=Wvv0tZfdRLS00CiA2IFBQuXPXujQeOgP+t87r3c+LaP3lhs/KB3CyP3jUxER+f0rIm
         T1ak5L9GvfPtYO4Pwn+AdqALpfRGzhKDnAurZJXfVv+GmJRkeCwZGqDiVySsEFz/LCS/
         ft7ZI3sHxMARm4CgMZmx2ElTLweqT1n9Ccmr1EiZg3aShh2vtNaBb+0bqLdMGjFjYhCU
         YJztXbdePtJ9PyIdnsCe84qMAfDDxxyKNEIxBCgWHLUoIgZ48CS/toID+2ge+jiUrAc4
         Zi7qXqYZdag3eXBu8D6J6wX3+zgrqGFP52HFEQyHpJoCO2ANo2UBmUIwI3yMeMTHgE+6
         GhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563230; x=1785168030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhEGDhlXrwyiseqyPc30kooLsaCELsXAQVmwDU9aLvI=;
        b=OQImWkp2Wd9UDMPz0d4lxZrVcm6BhgFzyg6/er0nNFWXFcWi8CC0LtNqm24RyvYkB3
         axRDZpF0Nt9eG19ys4yr9GdpE65bopZ5uFjh+sPbgncnY4kUoVyPnaJxanyt2uKGsAsp
         09zEAtO+04an1rKicvBxd2HD56Lex6DdUTJKAVNjAvWBiy7uGPOOtfxH9hA5ROdgeiGz
         2oduXn5KyReRpXXLFHN08/vfAWXGXfJfvNLANComT4qKMAolp00LjkCPMF2IOmalmNwS
         JCyi6t3vpQ4P+xls1NObSOLpfkSlp/C4XR8lt4wzO9BXDPURKSzJrDGCeWrIzyTrbZbA
         ghiQ==
X-Gm-Message-State: AOJu0YzjxvxhqQo7GQlKnP7wLT35BaMlmjVF+m0iK4ShM75CFb+B610b
	SBSWrHUabbdQvR5R5S2+u4kV9teGIOyJaH7F663Y3YtmAEVtTtp0CxWp0YrxPw==
X-Gm-Gg: AR+sD120bFkkWT2JUZ8s6X86xdtaTSLNjtrK3/SzvOREPvM3aN5F288sJ0VYSp7gZx2
	BkTD4wlR11RG5RKPhtyWMudgdMciCsp4cvMgNZBarW0465vrgaqoU1QC032Ns3iwLhSAwaPawlX
	iYHhS7EtgvbayAAank6JyddWi+Jq9pXoWJASY4UAf+2zDfgR5xlvjz32PSBlWUcAA7tPNBX6EFT
	ARWpbxHg3Lcsn+oWCV61QZSS0lblvX4YPztrtASfrcLbHhNFPuJJmvEFYTDthWD7MiDn6tIxBLX
	QTqAqEGP67jp+YR4cv+3/GkikkdlQpAcTkCaiG86TipfsiodWM6r7mqOsYusrPDPkATCUjq83uG
	MlPcQUTarw/ve2erJa7HCRCGPAz2fO5KPn5tvqhBi00JqXQMbADXy5rPeUEWzMKMrwqu5l9HGp3
	Sl9GeXovmfxiv2ni8Vd28wGM103bNTYC8I6t226TRpgf4nyeo=
X-Received: by 2002:a05:6000:4b03:b0:47f:4b20:e616 with SMTP id ffacd0b85a97d-47f622fccc2mr16913038f8f.8.1784563227764;
        Mon, 20 Jul 2026 09:00:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 08/23] xen/riscv: implement make_timer_node()
Date: Mon, 20 Jul 2026 17:59:49 +0200
Message-ID: <a52f788d208b6d1e0eb335104d1795a0606be45a.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784563230-59BC0CFC-C7BCC07A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1649

Generally, in DT for RISC-V there is a document which describes a timer
node (riscv,timer.yaml or sifive,clint.yaml), but the Linux timer driver
is declared with TIMER_OF_DECLARE(riscv_timer, "riscv", ...).
It matches the CPU node (compatible "riscv"), not the timer node itself.
It then calls of_find_compatible_node(NULL, NULL, "riscv,timer") only to
read the optional riscv,timer-cannot-wake-cpu property.

Since Xen does not care about that property for now, make_timer_node() is
implemented to return 0, as no timer node needs to be created for RISC-V
guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-5:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
 - Update the commit message.
---
---
 xen/arch/riscv/domain-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 8be29d9331d2..6b14dce9c0a6 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,6 +3,7 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
@@ -173,3 +174,10 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
     xvfree(isa_str);
     return res;
 }
+
+int __init make_timer_node(const struct kernel_info *kinfo)
+{
+    /* There is no need for timer node for RISC-V. */
+
+    return 0;
+}
-- 
2.54.0


