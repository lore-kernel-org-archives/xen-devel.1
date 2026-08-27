Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FDAC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400815.1636404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtB-0004Mo-7o; Thu, 27 Aug 2026 15:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400815.1636404; Thu, 27 Aug 2026 15:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtB-0004Mf-3y; Thu, 27 Aug 2026 15:19:37 +0000
Received: by outflank-mailman (input) for mailman id 1400815;
 Thu, 27 Aug 2026 15:19:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbt9-00044F-N9
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbt9-00Fhjf-4C
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90556f-e002-0a2a0a5209dd-0a2a4504aa60-48
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:35 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905586-b57f-0a2a45040019-d1558029ade2-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:35 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so9183385e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:35 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843974; x=1788448774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STFNHra9/gv/dSpsPbk0M64rMisoQ8mC24edm4rMW7I=;
        b=fwav/Q4jSfKLP5I8ww1qwdgUhPD0MtMfFWu+OKBM3hE31wwCtkmh6CPcGXQK2Z+gn9
         rXYpNwUWFGVFk/23HI3/c5U8uHFjY+n6k5rY9rYCKp507j9uH8V2u+uoSphO5KNQUGaL
         hMGeDX9ErQIlnBqKt/bb+080NNRvEfefYV7nx/S5/5CPR0Xr83mw/E5duSXnIWiF1wn8
         suMg1vbBGvKwRePYEzKX+v8GMY858fPV423IYIxecERi6MoM+fdqqSPLNgq/kaJSW0Vq
         6TH2YvN8kBRMZA7mNeMCANkngGWGofbR/PlCIVM6Wzy2AS3+7BEyMVmZEDPucbu7LwE+
         wi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843974; x=1788448774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=STFNHra9/gv/dSpsPbk0M64rMisoQ8mC24edm4rMW7I=;
        b=FWRcNK9/6xfvhKmhIcYMzhI1au1P+9v3xDkFACXtaEXldqE0aD28UnWK1hC9bfKDhc
         LilmBW7GjLj0+b5ECVp+uAFPzgxxh271XXT7ft7jcpX55+sseAbteSg9uYz4BmBkgerw
         tGlvz3z+XirATRCszwx8MMSPzq63YTI0YFy/S8lLPzMp/1hSsR8y7kM3eYY9IrcgS3oL
         D2ZrapH1bNRT5moH4jZO5dlT/Te1Kkgoq6ftL1jdSueIvuqwIpowblIcjewR/qo5Ygtq
         4bHcTKRL3chWmcSnR8j1Gr+C5IS6uJgbM024uC6ryk0QmHRnfGmnRJ4x1gwUk/xUapjG
         EU/g==
X-Gm-Message-State: AFuF++lYhGqaMSXwKOPKFu9QH3tF32MipkxolfVCNzr/7GOw53n5ka4V
	qg5N6r0OYB2bjYJKh4g7jn5aZYnrlEraOcoWRqm3j17DHZT62E+K2CNj7AhJ2A==
X-Gm-Gg: AR+sD13k0eg4RZOf+osTnTSq7/5LixbTtq9w8NxZFmo7dN7mFyHmz6XVYDX65KI1QqQ
	ofWTercjaXdlg8VQnKcqxTcvcOGxd0MlWDdUFZKR1BqMu06A7kE1r3cQaS2ZRMYnk9Pcs/xArGT
	rKM3ksbbmXBdXHXINcIXFaMh2v9dv5DSyTXxPvzWeS6hbwmgns2bhTEC1jzpUsyAOhoSnIWb3S2
	hdwYXCvlIACbsz0o+l0h8yUqE2QWUfVpAUkzT94KlPYsp2G9ph9pmTeQ2QiPNO3sn9MXHOhsr3c
	S5yojlIo9wlKBUYX4vbAafwDFchqXSuJpmdKw5Z4AsJt2pFjepHGKmX2dwD76BV4REgIOzIPTxM
	wLOu3pPhk97Vs0kZIPPY69WKHb0a089nMa3JOe5XcNM4sc8UM6p3aJkRb7bPzaMpSj/pAd0Ba5B
	kOofQlWq/AqvuDnq9j0BHv5IKt8newibnsaoUhw30lrcSCA06f4ZCO+W7VceFaMZKPNh9Crv9Pj
	lwh0idB04axLgw+0UtrY4AIVJHOrWSm
X-Received: by 2002:a05:600c:46cc:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b909e92aamr34144205e9.10.1787843974248;
        Thu, 27 Aug 2026 08:19:34 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 06/20] xen/riscv: implement make_timer_node()
Date: Thu, 27 Aug 2026 17:18:59 +0200
Message-ID: <b4182eb14902863f7a13c02a989d4db0fe7f820e.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787843975-510DDB50-74627B63/10/73395122804
X-purgate-type: spam
X-purgate-size: 1618

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
Changes in v3-8:
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
index 1af4c48fb30c..d7613721db95 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,6 +3,7 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 
@@ -154,3 +155,10 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 
     return fdt_end_node(fdt);
 }
+
+int __init make_timer_node(const struct kernel_info *kinfo)
+{
+    /* There is no need for timer node for RISC-V. */
+
+    return 0;
+}
-- 
2.55.0


