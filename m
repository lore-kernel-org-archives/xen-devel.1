Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978FDC98310
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430588.1653126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MvT-0005Jy-CZ; Wed, 23 Sep 2026 13:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430588.1653126; Wed, 23 Sep 2026 13:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MvT-0005Jr-7H; Wed, 23 Sep 2026 13:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1430588;
 Wed, 23 Sep 2026 13:22:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MvR-0005IZ-Lu
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:22:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MvR-00BQAt-2k
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:22:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d27c-8faa-0a2a0a5109dd-0a2a450bb9a2-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:16 +0200
Received: from [74.125.229.170] (helo=mail-dl2-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d287-b7e8-0a2a450b0019-4a7de5aac134-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:16 +0200
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-144f47a9b57so964243c88.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:22:16 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169735; x=1790774535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dE9e1D/hNDaJ+34nzjVxm6PaKrug7kV63zAG9/GlOBQ=;
        b=U5Ab4cFRUnNhOcO1reKr8zZjobJoNBqEjSaQS84glgOJq/3izbZYN8jybIQpqT7AIX
         cLPuU/o26UdAc+ZVCAeZnE8yQqHzem2WP2HFV94bZOwc90txY+hJ47q/iUmMR9BVSybu
         M46W3LZQjFrCHWDN78rFyuW+gWXVFsNc5BS+uBrSa1lhHFfXgNaS4iJpx8U/A6v+Dct2
         GXGd/+hA8K5ICshpcFMwU/EY63gfSBZIY6ZC7BFFzdKixFLJpFoVxRdz/wjWzCuU2AnI
         2BH9KYoAgvUOh2hV0WRC/T3BnHoW9D0pvyGPMB2UUjNi2IGG7/qvY7LeVf2B/Ukpn6Fw
         jhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169735; x=1790774535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dE9e1D/hNDaJ+34nzjVxm6PaKrug7kV63zAG9/GlOBQ=;
        b=ulWZp69V3nyPZpvYseHmKw/eRagrg9mBw6XD4MVnY1HV7ScYPWIK85XHoWzV/Fhtsr
         HzL2qC4e8ajgXB0RLOzUdU/WA5ay6nvvjpF5fjEVPI1DqicXrC7JNd/Ndd7Q/iizUTu4
         uC9h1eWFH8FivyaeutllSV7Ot+wBvBLBb2oOIAMAolrk81N9W2yp0SoVBLQyBOfNgSnL
         /uOZioVz8v+f/MLvMGAJ1mMnDR4yZ7SDoAG6KVAjMIv2MkjKnhgJBehC784HIa7FfFZa
         stI0Wlzklrf5RCu/3RCMVmJIPw/srhh8W/MeRniOrj6w3WiBwOZVoFOL0McAr738M36f
         ogQw==
X-Forwarded-Encrypted: i=1; AKwUvByNCUtFUGDMGoh6MZgEGxsIjGhV8Mf1PrLBjR4Gn8XJ7J6eS6uvjB72yZ67BQKwAD7dYJA9BUTDocw=@lists.xenproject.org
X-Gm-Message-State: AFuF++lxC93F3NOrKipYQtg3zZiXAKWUCE5Aac5E4MO7eGN9eF5uQWvF
	iD1Jo9gNH5c7L+0U6CYclV5Kq8VSlD4Qo7/nLJqgUL5dMm+QI0/TPVbk
X-Gm-Gg: AYBFou3HFpkJaznXOwKMVjoSUU87to1dslEwlFg5ABRLAnAVj8PKEeDsKtTOxwZeKbh
	Nni+edcCp7tswIoFhJoOk7rsVvDDvnujBX5/s6F7rTR7czBC+pJUPX0bVSyF7m3EFr7E4K1f+PV
	CHPNrM91zyNAQZshQ+435K5HfprRPIKltkxSMs0+mrgcoGk6P4RaPqh5OvFr0+aPONbWdO3DoZK
	UsKi6QhzU+m7/tSf6pUvCqQ4kErlBjyw8ZaCP02DZNrcth74AbR362T0W3xzbQ4TJg8Xn3VFBrk
	nh0JHOXNTsc/yB5AcYDbdl88iRs5mkweY0hZdIdCi2TO7dizewNJBsQL/iIuwSX7SPRk6sZ2JlY
	JHaPHDObm6SfuPjSZSnm63jnRjidEUjtzGg1VmPWgb0g3gfl264ncyskHnMLP9D2pPvFr6N/G77
	8zs94jYv1YLCK0LmErAZOQcgAVSj/P6kOd4v4xW78xhGw2QiQiZWhikdWwP/AAkFV94vvP92H+x
	0hY3PETnWK+B2AwXkNYiPO8FxmYORI=
X-Received: by 2002:a05:7022:6b87:b0:143:57c1:6242 with SMTP id a92af1059eb24-144f917e7a9mr3802797c88.26.1790169734421;
        Wed, 23 Sep 2026 06:22:14 -0700 (PDT)
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
Subject: [PATCH v3 032/114] gdbstub: drop per-target cpu-param.h from helpers.h
Date: Wed, 23 Sep 2026 21:15:06 +0800
Message-ID: <20260923131635.1894-33-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790169736-19AC09EA-0F5152AA/0/0
X-purgate-type: clean
X-purgate-size: 678

- Stop including cpu-param.h from gdbstub/helpers.h so once-compiled
  gdbstub can use the helpers without TARGET_* macros.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/gdbstub/helpers.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index b2f41d6d280..7250e457c2c 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -15,9 +15,6 @@
 #include "qemu/bswap.h"
 #include "qemu/target-info.h"
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu-param.h"
-#endif
 
 /*
  * The GDB remote protocol transfers values in target byte order. As
-- 
2.52.0.windows.1


