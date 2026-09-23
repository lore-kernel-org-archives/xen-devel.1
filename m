Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FB7C9830C
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430383.1652858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrH-0006Ag-12; Wed, 23 Sep 2026 13:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430383.1652858; Wed, 23 Sep 2026 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrG-00068l-Pd; Wed, 23 Sep 2026 13:17:58 +0000
Received: by outflank-mailman (input) for mailman id 1430383;
 Wed, 23 Sep 2026 13:17:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mqn-0005hB-WE
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:17:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mqn-002EQZ-Cy
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:17:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d166-bab6-0a2a0a5309dd-0a2a4502a438-14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:29 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d167-6ca4-0a2a45020019-4a7de50cdafe-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:28 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-3286624d194so643177eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:17:28 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169447; x=1790774247; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkiRWh0yDSkP2OT8vLUxuaEaTt8B1WJVNLebJyYrgq0=;
        b=DXjGuOR3I7w+9pHSCd/ln/8Z6fbAAHJ0PmhX/r4DZvXn3gLidtjCpEHcQ6WNRKMlY5
         Si0092R0P+kPCHf+aKzeTVJ+iXxl1NDLxB2SsHddFXOd1wmDndfvswrbib/f/R7tpekD
         15yjP6O/9qqoPrY6Ydupjs/AtXPzZNoHSUf+tlBqWEUNUcCCYXHySxwAAu4P2gHOtlP4
         Qci8gREYhpwqbaUibWEWy80NBHCE5IDgmC0fWh+WsScoNs2F2XrjVOmKex8HdTy5DEnc
         QyFnqnWGuoMTZUSFXpbA+3zWwiJBjsdqDhlfSKlM1+DdylEs8aoVSxzZcErZhcya6LYx
         0X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169447; x=1790774247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkiRWh0yDSkP2OT8vLUxuaEaTt8B1WJVNLebJyYrgq0=;
        b=yIdste/PlkyU03Vho62xHe1Pn2iiUa5RmrnKJ3dUFU9+6Kqi+kXLrbHJPuiBviMzfC
         C465oIDoxkacAdhWL/fchPgcSiubxYh/UTtS8vdBaxcowEWByh8lfFZr/8Ht92REGMTq
         sA4eEbTT3xx5Inw4EtaAvt9mJ9FXN0mS6FfAxs7axnLV+3IpsypElArWQ1Xyd6eXxX41
         Xj7qmaOf5/diVBiiWPEiB8OlQgNRNnjlDroC7CCx16/1UEfjiONiFR0bc3K4TDNJ0s0W
         0hc0yVhqCO7TeJfP2PPqrdC0GukpOj9uffM+WKVsg01cdYvGSyOoRFwaJKEaIP8jbCDf
         rSwQ==
X-Forwarded-Encrypted: i=1; AKwUvByuC2iL1AkLzfEBIw5ZsTrZcFgAVF6A+NzLo6ftI6qJvrde2y7odrwIgzLUuD1vxllM7IR9KzDYI0U=@lists.xenproject.org
X-Gm-Message-State: AFuF++mPpAgoFa0r3yKPzTiLzNB9umvaWxzGJmBmg6oYWVFEEMyQai6A
	+/+oDmXwb7tVUvrvELo7ABiAP8sOJPfhQiWpLpmAv/tIBfvcL11hXiyr
X-Gm-Gg: AYBFou1/Lpdx+dAJOe5bXOxF08gZzcPLDq3GZ0dxJT3qL2rFAvDQ+TPGKCDx3PU7avO
	HsIZShTuSJfjEYYgWK6zfikQAFSJC5nX1R+YcqH9uulbq1a08dmlGAznfhxOfXcH21aiHffZlqf
	M+1Uf4KxZm4vGS6zdG1NlTWcA0MvDyViKJ0w//sxUY6jHxp+GEykES8bM0ZYOyj+EfcvmTUZVp+
	L4y3q/8qsTaZgh9KHLa2Wl4P8vZBYe513iYoSEXyi11E7fLmXV4icqSm4Ty2bIiU5Eyj0YMKymN
	DJCR7bnvO+MgthXkDb0spE8gYE2MLVKryJE1xL3gp76Oy+fcKklXbRWp5nYi7yhRfzDiWi2dUg0
	78hRR1iTJaa1svULtO+XdwxH/WJgKZ307x1uCBQxpYh0I3c48fpV3EHmsyI4ui4YrZUGM7V2LU1
	zB57MUH6Jp7EmtFBi+Ic5nMd0qJzWUITEcjdYfwP+AUS9CrtUcCrPnpev3aqjVN6FgmarALf8q0
	B88o4x6tMOiS39aOYI6TjVFoitG3kk=
X-Received: by 2002:a05:693c:228f:b0:33c:3134:1055 with SMTP id 5a478bee46e88-33e8c53b899mr2375553eec.12.1790169445480;
        Wed, 23 Sep 2026 06:17:25 -0700 (PDT)
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
Subject: [PATCH v3 004/114] target-info: rename target-info-impl.h to target-info-def.h
Date: Wed, 23 Sep 2026 21:14:38 +0800
Message-ID: <20260923131635.1894-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790169448-F36BF2AC-7521B523/0/0
X-purgate-type: clean
X-purgate-size: 3656

Rename the TargetInfo structure header and its include guard.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/{target-info-impl.h => target-info-def.h} | 4 ++--
 include/qemu/target-info-qom.h                         | 2 +-
 page-vary-common.c                                     | 2 +-
 page-vary-system.c                                     | 2 +-
 target-info-def.c                                      | 2 +-
 target-info-qom.c                                      | 2 +-
 target-info.c                                          | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 rename include/qemu/{target-info-impl.h => target-info-def.h} (94%)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-def.h
similarity index 94%
rename from include/qemu/target-info-impl.h
rename to include/qemu/target-info-def.h
index cf42aabbc8b..8019d2c7196 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-def.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef QEMU_TARGET_INFO_IMPL_H
-#define QEMU_TARGET_INFO_IMPL_H
+#ifndef QEMU_TARGET_INFO_DEF_H
+#define QEMU_TARGET_INFO_DEF_H
 
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-types-machine.h"
diff --git a/include/qemu/target-info-qom.h b/include/qemu/target-info-qom.h
index 91be415ed33..0f6772e65c3 100644
--- a/include/qemu/target-info-qom.h
+++ b/include/qemu/target-info-qom.h
@@ -9,7 +9,7 @@
 #ifndef QEMU_TARGET_INFO_QOM_H
 #define QEMU_TARGET_INFO_QOM_H
 
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qom/object.h"
 
 #define TYPE_TARGET_INFO "target-info"
diff --git a/page-vary-common.c b/page-vary-common.c
index ddd08633788..5a4654725a8 100644
--- a/page-vary-common.c
+++ b/page-vary-common.c
@@ -20,7 +20,7 @@
 #define IN_PAGE_VARY 1
 
 #include "qemu/osdep.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "exec/page-vary.h"
 
 /* WARNING: This file must *not* be complied with -flto. */
diff --git a/page-vary-system.c b/page-vary-system.c
index 6c49c10e23b..9773685dc16 100644
--- a/page-vary-system.c
+++ b/page-vary-system.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "exec/page-vary.h"
 #include "exec/tlb-flags.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 
 QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & ((1u < TARGET_PAGE_BITS_MIN) - 1));
 
diff --git a/target-info-def.c b/target-info-def.c
index d121b8c0170..fa19cabc55f 100644
--- a/target-info-def.c
+++ b/target-info-def.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/target-info.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qemu/target-info-init.h"
 #include "hw/core/boards.h"
 #include "cpu.h"
diff --git a/target-info-qom.c b/target-info-qom.c
index 6965e4d1169..2b38673a3f8 100644
--- a/target-info-qom.c
+++ b/target-info-qom.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qom/object.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qemu/target-info-init.h"
 #include "qemu/target-info-qom.h"
 
diff --git a/target-info.c b/target-info.c
index bba4503151a..9abe72b1f55 100644
--- a/target-info.c
+++ b/target-info.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/target-info.h"
 #include "qemu/target-info-qapi.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qapi/error.h"
 
 const char *target_name(void)
-- 
2.52.0.windows.1


