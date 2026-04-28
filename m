Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06292FF886F
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2026 14:34:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1296331.1572769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVb-0005th-TE; Tue, 28 Apr 2026 14:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296331.1572769; Tue, 28 Apr 2026 14:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVb-0005ta-PJ; Tue, 28 Apr 2026 14:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1296331;
 Tue, 28 Apr 2026 14:33:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVa-0005fQ-Ie
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVZ-008e9B-Ur
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:53 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c540-e002-0a2a0a5209dd-0a2a4503cd3a-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:53 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c551-672d-0a2a45030019-d1558034d159-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:53 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4891cd41959so98298555e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:53 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386833; x=1777991633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rklfHL8DGEAm9CydTFB48ZDQQ+epyIb/xn7d2p7FG4A=;
        b=HRZoCAygyKY9vYHGPkCpG3e9x7i5aHzZZRHNiyzwCkfK2ESow60vmXFhv8w7Y3ENgO
         MGz3Q+d9MA9X6gErJw1h+Lt9QTP/WyBVppTM1QCDc4I90DsqPZTCmYFW/l1OAHoA4KvC
         Q8yrPvT7+x4zQE2JrOCO8koYWZEaqIhvq7hhlgE0b57+ogTj9f8kjvYuzf5CbgdHEU+2
         fYP4RDrmLn0y2o8qDBeUmuPLx4qBrfXyf7dZj+IHoyo6AwfE0A6cYsorONgWG2dtDvvI
         PWR+rL5ZUsN2SpLbCzoBqzIwjg5OGbnzx9E9FRg5TP9Ba2QXj/61txARgCn/lsGjbFh0
         xCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386833; x=1777991633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rklfHL8DGEAm9CydTFB48ZDQQ+epyIb/xn7d2p7FG4A=;
        b=Gc2eqSVtJXltaDxKSBCewArmP4uBTB3h7pAN1/2Eb7nIOYEWvGFSwL1HmPAryNLQ6z
         9HmK0leQGAzHSl6wFzFS8cgE3SGPFFAwSpN65ZRIZJLNC5UKmaiuQDYUgEgGrpig0jrG
         TQaSU+8bkwfpkuCulWPb0JWNx/N8lQZxzF9frojsMz1JYfdFacAvNUGcne/PaKFO3/kf
         pACIiyp+FfSLEFqBZH8I3FktLavl+BFFIIascQNMOaDxB6bRqnh/D0jAy7x0hVHvbn/W
         /MHWrp847/Lte5vsiU7MQDplgCZ6MqF3FjiIC2FQ86vt66aNYmpIEPbCMJw+B6D24gRs
         QWyA==
X-Gm-Message-State: AOJu0YxCbxQei+KfFEKIm99Sj1SFhkQTqglA28kW7rgJwunSudiQNQ8p
	fWSS6GT1hSTO4RBM9ChDguqWDj6wKfUfLX16iWP40AVPKA0E/gAGuZ9jWlXTfQ==
X-Gm-Gg: AeBDiesKDb40bC5TFMXQ/g0Nf3qNSuSVrkXYiMsjz8aTM5P5XRMvuN4wCEF0mFXxBvd
	5yhrH+fPxu/AZxwkcDagrYQmrd9BzEYdF0lyMDoR+mzz0z6C57uA/YUW93OhvGX6ndWrKkDzLI+
	v4NXIOa4hD5L35YXxVrymIT7wgR9Cvsq3zorGiMrvP5GjhCU+BFTifSIDyscLkPoyoxpqlOUc3z
	TAMboFjQftk+wZ8PnvdC0JmVy9HKiB6Bkuo4eaGmc0pcF965HbvmXsfL83lagdEgHUMuRg6ywG4
	oziKXHYBxg/PAPk/Pg4fwLBPhGWylxzTS+DCcwT7vz5LpQRa71Sot4GcQfvNTD3gUupyZfkset1
	XxnkQ1+p1jHgc9gfsq2PsdWR1NX+8Ongj5AhJ+OQRmdakX4Zyi/OTV5ihEFUFn6FBCOpJnS3vDp
	IIJLbv1dDyLpTneb0m2jGELZwyvBo3bMd9tOGKS0JdK1LjoKV+QeIpi3dUvIQBJEnBst0on/p5p
	m4J
X-Received: by 2002:a05:600c:1e8b:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48a77b176b3mr49380825e9.24.1777386832704;
        Tue, 28 Apr 2026 07:33:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 03/11] xen: move declaration of fw_unreserved_regions() to common header
Date: Tue, 28 Apr 2026 16:33:32 +0200
Message-ID: <2c26370460f0380bed128cbb59de4eacd77a8456.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1777386833-A376E938-8B277FDF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1457

Since the implementation of fw_unreserved_regions() is in common code, move
its declaration to xen/bootinfo.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2-v4:
 - Nothing changed. Only rebase.
---
---
 xen/arch/arm/include/asm/setup.h | 3 ---
 xen/include/xen/bootinfo.h       | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 899e33925ca4..0d29b46ea52b 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -43,9 +43,6 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 void create_dom0(void);
 
 void discard_initial_modules(void);
-void fw_unreserved_regions(paddr_t s, paddr_t e,
-                           void (*cb)(paddr_t ps, paddr_t pe),
-                           unsigned int first);
 
 void init_pdx(void);
 void setup_mm(void);
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index f834f1957155..dbf492c2e36e 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -210,4 +210,8 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
     return banks;
 }
 
+void fw_unreserved_regions(paddr_t s, paddr_t e,
+                           void (*cb)(paddr_t ps, paddr_t pe),
+                           unsigned int first);
+
 #endif /* XEN_BOOTINFO_H */
-- 
2.53.0


