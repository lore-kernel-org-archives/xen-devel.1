Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E1AC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430603.1653142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mvj-0006G3-Qt; Wed, 23 Sep 2026 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430603.1653142; Wed, 23 Sep 2026 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mvj-0006Fn-Nb; Wed, 23 Sep 2026 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1430603;
 Wed, 23 Sep 2026 13:22:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mvi-0006EJ-LO
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:22:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mvi-00DrH3-2I
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:22:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d28f-e002-0a2a0a5209dd-0a2a4505a2ee-30
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:34 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d298-4cb1-0a2a45050019-4a7de50caa0f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:33 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-328664dbe2dso384614eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:22:33 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169752; x=1790774552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqXX4SX3rjdHTToJvg98g4i7PWcyKUf7129uvkL7/uk=;
        b=OG1jBjD9sVku7qnF5bJxhgSNT4n6gMfDDZFARO90jfQ4fg151swdO1hhQ/Rkyh2v31
         rafSx4CVP8JeHSPYFEY8YXr4L+LcQmTcdjZI3JpBUGG4H8FPlFouIHa9fx15rYEL9CtK
         smuFKj6/hEO9DnFy8m2l1V2LC8vW6pDye14poz/ak5PvpPkLSisI+szRGnnzFt1S8aMb
         g4nRyjmvw8UyHDLcFM1YQyF6/MPNQsCKn3sSj7k3JvkETmpc6UItO6X57Vik8NCAkz/7
         s8NecRkZsqGlVIU7bg8KMIqEx8Uto3faF8J3INOcwgaAn34NCwxs3UCyFawPxw4hDvCZ
         xO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169752; x=1790774552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WqXX4SX3rjdHTToJvg98g4i7PWcyKUf7129uvkL7/uk=;
        b=SfhFoHBiIelEYINvQR3LEWJzw3EGhD8Nh7VW9GXIogqvz/DOMxxVeYScDrt7nDuupw
         CPrIpSHebNpCEEiiIL80vibwBZlpUzerL9HoEiFgtXUIyHbjf1p8JUcHsgUdqJ41fcGo
         X7RE081yPvWcyvIIjjhGkX5YPfVTsqlsivXhio/GeUXbLhQIkFn4L29sSJS2JMEDmkPP
         CivYEdY4ItJ7DdJqYyhR9IgQFsPZ+xqy2p7g2oxLG7go1TyO7NEVldSOLTFmhRguRxeO
         /cI+XFPEI9wZd1g2y8EPNzLHOHdF59K4zWTm29g24WoSQkn0yiKoLfp8sz1YzW3x8/AW
         VnxA==
X-Forwarded-Encrypted: i=1; AKwUvBzqgkPD1RWxZ8gmISB+ThdYSNsXN/6+1oGd204QvofgkrjikAMbdKmeBenPGPUwgdpx2yhFEOpOBuk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kB4rQ8ExTfoGAhAGe0wCxuq/TQAiePI28eoGdRcSQyogEk3IHV
	Kwx8+oWh5vUURS3LnKcV3G48Bkb4FPf3d0unqbUk5Sw6WBZUqE2meQIL
X-Gm-Gg: AYBFou3Zq1njU0QgQX1LazgZ+fW8jqS56mZZ5sFV3e8iKQ4xVsYIuJZ//h1oEoblGz1
	Nu70qWi7CMdoFc5fqiuXHUZv29Md2qffZn4e0YQqtQB58iBtGCX8FnRXjufSPJVnvMQtQNzo/aZ
	cPH+Be3aS5TNL6e3Ib8Z1SgdZdYlSicewCqibyBafOAbPwDwU9MBEGMCNhw+C6kqRWMjNtdrmeT
	CQYlq0J5DfhqFQPFTx1ObeS/kYMVhRrqwFjYhk0VW5DGSN7wlaLW0UAeu0QzftlXIK4k4fDmMpN
	a6ZhcexYT+l5brA/Z0PfVInhL/1wV8SrpULjwx11s9cr7atl3jByjF6o3RN08znMSGKMhJd6ocz
	R4gIgCYNDgEAieUP98KqxcEKeR74L3avl4aP+UaTPTPC7ggneGwtwu4cMvQa+CzUa7peSMzlsBP
	kGSHA9xX9uHuYv8bLr5jyiN1EGKzyyD08/EjYFpEGSTkD7Qs4th08Tsw/BWAYxMBvpTUy4yNYxT
	uY90+7necp6JIm5
X-Received: by 2002:a05:693c:8814:20b0:33e:5e42:e0f9 with SMTP id 5a478bee46e88-33e7a4d6cd5mr2603893eec.6.1790169751387;
        Wed, 23 Sep 2026 06:22:31 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 034/114] target/riscv: Include migration/vmstate.h instead of migration/cpu.h in machine.c
Date: Wed, 23 Sep 2026 21:15:08 +0800
Message-ID: <20260923131635.1894-35-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790169754-F76BD2A1-97CE2D88/0/0
X-purgate-type: clean
X-purgate-size: 673

already uses fixed-width VMSTATE_* macros and does not need TARGET_LONG_BITS UINTTL helpers.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index bf203bffcef..00805745fbf 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -21,7 +21,7 @@
 #include "qemu/error-report.h"
 #include "system/kvm.h"
 #include "system/tcg.h"
-#include "migration/cpu.h"
+#include "migration/vmstate.h"
 #include "exec/icount.h"
 #include "target/riscv/tcg/debug.h"
 #ifdef CONFIG_KVM
-- 
2.52.0.windows.1


