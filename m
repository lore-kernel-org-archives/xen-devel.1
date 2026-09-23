Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06474C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430569.1653098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mv8-00040q-Dp; Wed, 23 Sep 2026 13:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430569.1653098; Wed, 23 Sep 2026 13:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mv8-00040h-AT; Wed, 23 Sep 2026 13:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1430569;
 Wed, 23 Sep 2026 13:21:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mv6-0003wa-GA
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:21:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mv5-006Pd0-T8
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:21:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d26e-bab6-0a2a0a5309dd-0a2a4501e51a-10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:51 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d26e-5984-0a2a45010019-4a7de50cc127-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:51 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-328664d340aso547201eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:21:51 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169710; x=1790774510; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGdh00utr6Q+OpO6+8fa0s0hS8SKHylDK/Tx/Y6cmu0=;
        b=Rdd9FaFGcQNRMMJuwVGacozwC7wKe2KNfY0+UGqfGrRsqUNNFDRbp86U8V0URvZp/E
         WEmkNl6GfkeLJxtEK/enRc3sxxLYfNJh6BZGLobAA2xz5B2KyopNu2l+NlBXEwdeTOYI
         DogcXHIV4n8hSau1wiStnob+oS/baz4K1TBVAPAftsOxrNk4+kufS0TxuWd1Z5WOcQrD
         2gaDI3RApZ7ISH0JRPinVp1rfTRw0QiXJdTbAfJbeHmLKzi2N0VNWCwWCZZ8xBoK22Ll
         JPbbzcvPosMf4qZvW1qX6i39sRtAlsx6hA6766OcTKxfNQ1hzCkjK/Iv9QqKIiPZKQj2
         z39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169710; x=1790774510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGdh00utr6Q+OpO6+8fa0s0hS8SKHylDK/Tx/Y6cmu0=;
        b=FxKcYzJZc00bVZfA8QklX5aYKWRJVT7ItcuQg3huFqr/iyh1iSdxVtI7jHsRoGpVeA
         7Ng9mdxBkX9t/Eskv6pS2XHfLmTu/htmlQFgldozq8dLHG8SDfvd5tNW54jy2h0+d06K
         SYNzDp/OpA8kNNsLAyUyWmrsaQAJshfGT0QhmL8ueoET1j95zFwtkFIPR+y044oAUeJ0
         Pu0mVf+dKUAe4deNzi7eMH9+GPb1SiMYt1RcLUV7zXpVDv9b/4w2rfa2SAhNGx7IgvLQ
         5DumkQdkOTH8EW1HdNiaQPgl4lqd3le3uqesKeYn+fh1thHz3gcyIXgUwdN6wePe/AE/
         qEow==
X-Forwarded-Encrypted: i=1; AKwUvBwG0uOX2LCltDORU+keMbRTzfvODtRGxnQ86GhF/RE04SN31HyH9Wxw9zRzRNiflLP6DqqAWjSbFZs=@lists.xenproject.org
X-Gm-Message-State: AFuF++kwjddPKJBh3RJfDlM+8sRQfuiNYIktBJoP9HGk9vsefbP7quzP
	Eur8zbKLt7v9jUjTu8bpP9NJc126ZKWOcT77Wqcr4N0jGFGPudZw820T
X-Gm-Gg: AYBFou2U9nDbmwfUgb3IG5wpdh2VVZJX0a8r+99VFelKAQDmqGdGtPPyhzmJXcFRyAL
	zYmMGnyeHPz9FPGfdPQdGWlZI2e1kg0vKAlIbHcI+WVkDaq4w1c9rNp2LHMp9e7aI3S5Bye4Ka8
	0N3NfRbkX8LxbF7BLyjxZsrzUnqAcrKRkTbIYiYaSg44fx5Deyu92Vcl41DZyb6E9DKeGgpXn+N
	pFx2mYLdOJgsYaEhlwSmF1TOi6j+U/O+HtOtFpLDqThrDg2N3Fr0ApsitjALqAZJU2mRmZbTCtC
	WiQpM4kvzGxPl95J6c+CHMhlqyIYgVTF86B62e4sFhZo8FEOp2KDjIZBoKzeoqU6vUNK9n9S8Fz
	4El+63IdYE50qAw0k6Aqzs7B2zafV9vDqNUQU6kHZgklMWwu37X65I1E24Cw/ZJ7wUMxEEjRY3s
	ULtsaIAnq/GnUi9+KAEXOztF5S6lGKqVaaV2KQWIxZ0fW6reDBtXY3+1jdv96kmDYxt/GKr4wU3
	b/dKNvf5HZWqiHc0e4FAUQurYDtKxY=
X-Received: by 2002:a05:693c:88d4:10b0:33b:dcbc:6046 with SMTP id 5a478bee46e88-33e8bc70ee6mr2596067eec.7.1790169709341;
        Wed, 23 Sep 2026 06:21:49 -0700 (PDT)
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
Subject: [PATCH v3 029/114] hw/intc: send IMSIC MSI via kvm_irqchip_send_msi()
Date: Wed, 23 Sep 2026 21:15:03 +0800
Message-ID: <20260923131635.1894-30-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790169711-BD67C757-64952C21/0/0
X-purgate-type: clean
X-purgate-size: 1251

- Drop the CONFIG_KVM ioctl path and call kvm_irqchip_send_msi() when
  KVM and an in-kernel irqchip are enabled.
---
 hw/intc/riscv_imsic.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 30fb60cc312..033b7813060 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -311,19 +311,15 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
         goto err;
     }
 
-#if defined(CONFIG_KVM)
-    if (kvm_irqchip_in_kernel()) {
-        struct kvm_msi msi;
-
-        msi.address_lo = extract64(imsic->mmio.addr + addr, 0, 32);
-        msi.address_hi = extract64(imsic->mmio.addr + addr, 32, 32);
-        msi.data = le32_to_cpu(value);
-
-        kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
+    if (kvm_enabled() && kvm_irqchip_in_kernel()) {
+        MSIMessage msg = {
+            .address = imsic->mmio.addr + addr,
+            .data = (uint32_t)value,
+        };
 
+        kvm_irqchip_send_msi(kvm_state, msg);
         return;
     }
-#endif
 
     /* Writes only supported for MSI little-endian registers */
     page = addr >> IMSIC_MMIO_PAGE_SHIFT;
-- 
2.52.0.windows.1


