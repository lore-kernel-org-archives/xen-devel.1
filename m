Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFEDC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430562.1653089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Muy-0003Yd-4R; Wed, 23 Sep 2026 13:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430562.1653089; Wed, 23 Sep 2026 13:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Muy-0003YV-1L; Wed, 23 Sep 2026 13:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1430562;
 Wed, 23 Sep 2026 13:21:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Muw-0003Vh-1W
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:21:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Muv-006Pa4-EL
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:21:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d262-bab6-0a2a0a5309dd-0a2a450b9ba0-20
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:45 +0200
Received: from [74.125.229.140] (helo=mail-dl2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d267-b7e8-0a2a450b0019-4a7de58c9069-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:45 +0200
Received: by mail-dl2-f12.google.com with SMTP id
 a92af1059eb24-142dd04edb4so764526c88.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:21:44 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169703; x=1790774503; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQcT2TCunpJ4XJOGDsLRORw+wafc2yMdlkK9/vuTXoQ=;
        b=DtntKWzu3Sqd+TbjcsxRCSsda6fmFmUA14btT+RvQZaUWUSkoUYCyFq7jEXFHQrnwt
         H8GLtrRZTy5+F7YkTSPzePE2z4T9QfKF2nRbvPfOsasesfyerjcqvx6msaD/jxRzHI40
         CpqyTz/f8bOl3Wv8v/t2c3IORiRTzIMTOXRyFH0MmpQvoQxH1k/wwpKnvRDchCmlpIX8
         MLj2L+DbtMoEliZlIL9Wdh02nPwl6A8ZI9fBcMdErz7cpR/LuB0SdEF4J7FcYiK+CFet
         prAy5r1Cx4fXbUa7APP4748n79c6EeMn4r4CiDGhUBxYPhCmv528Ha5TxGXeLEBsN/Le
         MXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169703; x=1790774503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQcT2TCunpJ4XJOGDsLRORw+wafc2yMdlkK9/vuTXoQ=;
        b=qWZn6Xcxdddot2tC0EZvSiw0MK0Rss2lFY4dwn5b6Qtb3B3UnsiJaWb2MC9M8GjyQv
         cqbjS8pzs2l6rpC1Tyd8AKuB+Hwdnkj1JV9C7zvJR4Qo4GfT2T2ErogNL2/WOFhNth4Q
         IrA+L7OxOaMQ2NlF0k07tl355Up4wPWgoEwKj+hJEew5U6KzSNP5POM0f8eJXDbgwikO
         fWrB37x294Y4ZdQ6zgPONZgWwpCIg12sObJip1prBcILwnSaAoJjX7ipg2LbVm0Yuao7
         HpduLgNI1awE7yrQw7p91yfPEKUp3ppvNd/wkF0qC761wAWR2+cpGHYqhmbreSY0FG+r
         sTgw==
X-Forwarded-Encrypted: i=1; AKwUvBxOwxZflLCBxB23wVyrKGePkOar3JZdjXzcrhLrAopnJDd3pUj7tZQjC08fCIWAdGzD1g9oDJ3NFfE=@lists.xenproject.org
X-Gm-Message-State: AFuF++lLJKtGHHMY0sJls4k3fKUhqh8JsLOYGEsF5idv5wILiDMB/IWu
	DShHFa5otLktJmeGU+oBugUcH/4VtJl1t9tolcAJMRnBaW5szi3ujcj+
X-Gm-Gg: AYBFou3VG8bteLUsiGbJovzDN9roiPp9qDfymvMmpwPm58ZmdARR+Ye0A/M/JEvv+kr
	q9AkbpJxr4RpWwHC9DccJEJa12ICZ/Br+rfduTHXi/OKxqBClB0aomjVCE/Fnsyidm8NXy5aUg6
	gNKyUeJ6zlzLx64tE2Yyd3oVLKV5m2kUvraf3ligc1MBUuaeguu79nait+ulPnjqpojnF7SjEgc
	AzRJ/gVeKH1KHJM7cidagEfYDYrigzWboaN0KNeLyCrHI1yPG/d6hB5n61iG5yEDNu1jYO8hvBd
	YqhTDD62yB+aHkgzKb1y5b63iqu83Ou+wdcUuf1NFxF9ZsfZBZpGiLwp75BS1nqLl7FPjqRkCvL
	sZSAE+FV7FKx4YIWn8CFHpaxOF6sHcFXKAoDytr0bWx2B+QJfUmIqNpPaHY+1KnbnkiCw5BXtei
	WGvwcD9E7ttJm45/lo46954Nmp1uOqCWIufeNbg0t++ymgUNVdylDQFkNFzkhfWoTcnu+t3Nh9j
	+JCV8FoWuaEHxXKoeJwlkGBSuIQmhuR82ZlcRKvnGI=
X-Received: by 2002:a05:701b:4551:10b0:144:fd7c:84f4 with SMTP id a92af1059eb24-144fd7c8641mr1564469c88.5.1790169700288;
        Wed, 23 Sep 2026 06:21:40 -0700 (PDT)
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
Subject: [PATCH v3 028/114] hw/intc: use kvm_enabled() in APLIC AIA helpers
Date: Wed, 23 Sep 2026 21:15:02 +0800
Message-ID: <20260923131635.1894-29-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790169705-1A2C49EA-A12480D9/0/0
X-purgate-type: clean
X-purgate-size: 1295

- Replace CONFIG_KVM ifdefs in riscv_use_emulated_aplic and
  riscv_aplic_set_kvm_msicfgaddr with kvm_enabled().
---
 hw/intc/riscv_aplic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index d8e25bfda14..03a0852b8b8 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode)
 
 bool riscv_use_emulated_aplic(bool msimode)
 {
-#ifdef CONFIG_KVM
+    if (!kvm_enabled()) {
+        return true;
+    }
+
     if (tcg_enabled()) {
         return true;
     }
@@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)
     }
 
     return kvm_kernel_irqchip_split();
-#else
-    return true;
-#endif
 }
 
 void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
 {
-#ifdef CONFIG_KVM
+    if (!kvm_enabled()) {
+        return;
+    }
+
     if (riscv_use_emulated_aplic(aplic->msimode)) {
         addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
         aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
         aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
                                  APLIC_MMSICFGADDRH_VALID_MASK;
     }
-#endif
 }
 
 /*
-- 
2.52.0.windows.1


