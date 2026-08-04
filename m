Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62595C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382267.1625658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNV-00089I-Fq; Tue, 04 Aug 2026 15:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382267.1625658; Tue, 04 Aug 2026 15:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNV-00086R-AR; Tue, 04 Aug 2026 15:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1382267;
 Tue, 04 Aug 2026 15:48:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNT-0007LB-3D
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNS-009Gcw-Fw
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209b7-bab6-0a2a0a5309dd-0a2a4505e25a-32
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:26 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209ca-4cb1-0a2a45050019-d1558032b837-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:26 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so36541325e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:26 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858506; x=1786463306; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLkIYss1rW/F2qb2oVl9fc594E2EtP3QPXzs49dm0sw=;
        b=b1BwFxD+XbEtmhYCLlAGre2G5NtvTNmLE/etUJpULzhzJ5NMPdu155LyF9YV/4UmiR
         YvJGsloZRiWGva+hUIod38oQU9jhjMnw8eGG4PcpVPuqHx1FaClOuiDTTixUVv/eFcdh
         V0iBVwRgkhA7wWs9l/AMAumpWHJOIY23h1CLTfm3tg5XRMclK9sGinXCn6GVIXLwJ/4L
         a/3skOBNozAyO2/RWQNPQTHWN+0fcPw/xiQ53znripQVoCicQOMwgexvLWUMH5p2euNO
         zNjXJXT773I9hQ/5HxGkHjs8ieAIPnSQDmaoYaLtcFEvh9RUuvdcBOqqt3noUAwGWE4e
         51ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858506; x=1786463306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLkIYss1rW/F2qb2oVl9fc594E2EtP3QPXzs49dm0sw=;
        b=Aa/7UgDDBtsYoJRu9aGDYTVPVMCq37DwsWYZTEXEsb4opUKAHJNHp6mvLIzOFUIMcG
         LeZIyooLZB1DTeCSdMxI2goyhCMJt2jNSWQKwYe4+laL9vx/Mzp8b8wUbCfixUcVj/c5
         j6cFzSN5wcYIqrEU/O6qUm0BKRcBZV4LKfd7q43z1iKWZD4swonOoWI+kZuW1KuOsYsy
         Di8C/cLWEn+YWav1oqHagicGMPkQcNjzkLubcTc/5Ow5EhW9Kalw8PTCqkQANogwOuI5
         JuoqLq+51szPP+zdvc8CWKS54a4gfPpCaYbDHYXlN4dyI/FVBCfYvPcJ+XOJ/wVlQXoc
         CuWg==
X-Gm-Message-State: AOJu0YyM7ELom/nPK28YLj84L73fuMdP7esJ8ztLWZNMxNgBLI6+oLqY
	TtyYQqY+G3MDYG3yivLxabqmYyB8FJeKkAEpcICLt9vjrC3qcjHglqBGPmjW8g==
X-Gm-Gg: AR+sD11romr588/THHmwTkR4eqgZ9YBFx987Ug1ZOiVKJgRKK0qijA1d1TISxijSXg/
	Ev/8nelQGW8J2fm3SUYECz25X1gFIydoImSs9o96VTaraxPo5lhAyrX1UeKRpWHS2rySm7LwKjt
	/IGBLgZUzD6Fz6ZQZWLsWWHGBHh3QMR8rl8vefkRkpBAM21N/zZsWTTBxcWLsiFvKIhRaXVCG0O
	5IJpgiwO0SKurNilZQkpK9jrlDZZrFL2uz1cEqXXC94oonRCdRPx/YgblHHR6GY4J4ouic7ziQx
	k22pSjsgY5biaAa+5hwlnOsawtr3GgRVzkQ3na+LxqNp1LORBrxYkJp2S7Q25Pp0itpkBiOEx14
	alZKNEBJotskajiWTXAwsxFyM5UOWYqrMLQ8U2Q+B7y8V67NirMsIQpxc1AqR8GfvOYgLX/x6Up
	3bc+YVM13QO9TnXz/YdL2fI6sIGeX+CcnBqOu5uy65UODTYCmlyjEtkHKXx4keN8suV2T1P1CyW
	l00DSRPIbWtctT/yXX8FavyxLHgH3GYTw==
X-Received: by 2002:a05:600c:1d0a:b0:495:5dcc:52b4 with SMTP id 5b1f17b1804b1-4994d9ef0b5mr33072185e9.3.1785858505967;
        Tue, 04 Aug 2026 08:48:25 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 06/20] xen/riscv: implement make_timer_node()
Date: Tue,  4 Aug 2026 17:47:56 +0200
Message-ID: <c5c21c800c0649af283955abc56126d93a463741.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785858506-F60AA2A1-EB1945B8/10/73395122804
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
Changes in v3-7:
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


