Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF6DF459F6
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 15:55:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1279415.1563848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECR-00073M-1v; Fri, 10 Apr 2026 15:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279415.1563848; Fri, 10 Apr 2026 15:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECQ-00072l-Sd; Fri, 10 Apr 2026 15:55:14 +0000
Received: by outflank-mailman (input) for mailman id 1279415;
 Fri, 10 Apr 2026 15:55:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECP-0006xl-DC
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECN-00Cwd5-7o
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d56-bab6-0a2a0a5309dd-0a2a450cb636-16
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:12 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d60-f40c-0a2a450c0019-d1558032cce8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:12 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso21891455e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:12 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836512; x=1776441312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn185YypiDfOEWixrDVwqtteBm6bdiTVXiEGngdxI1A=;
        b=WMjkiq7nWY1QPOmYYFMstz0ihWMUut040lCHgRvWX7Tsgbf+SA4XlDOQ42/wqAq9Iu
         B32nDvUR48VyZ92ve75jF1EoVkvNvuVtnL02crGza3F7k/ZmLmz560aT7qs1FKZua5V5
         YujsCIdvEZkLRt0p/gTHvZzPJjQ74ZbkvwbZjDoBpkmpJjXk71TQ5YVpj+LLVt7pDJXh
         L1S2wKC86vySSdioa07VX+WmyJJw9z87RoaIGBWkbsD5pVsxNwBA1OXn/32H7ARUP0Pn
         gjt8ahAJzyW6qpmT31XtPYrOQajiPE9uHLJMbrO5M4/iccsVkqbQlNk355q7hxUk3/gl
         VSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836512; x=1776441312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kn185YypiDfOEWixrDVwqtteBm6bdiTVXiEGngdxI1A=;
        b=ejsvwEFcLtaUJrlaa9Gx3JOUIB1MyUqDJ51erhVeuY2IMp9yHMC7gu4VBkWMUvgW3q
         IMU1+7qhD/ZjESqZc4vPQzELTrIIL44YZzb/xREoNWKrTwYWa9irHbJ2DJkFBd3a8qxK
         HS7Qo5KxRc4Ik7nurrgQW5Ftj7MEfSJT3U9FG49zofEpfXbYD+cAiUpqOmm4b8znB7CM
         CHDVp6I5F4hT3+dNw3wzSSkju26LaRx0huy7KJlezzm6nzMSUfcgyRtajk/3dD6KRU4N
         SoWGFgoYz89caXx3P4Fc7aUi8KAdeUwGIFzNYy4FHsW970Hu61+BVFqLAug3B50x4Vch
         1bUg==
X-Gm-Message-State: AOJu0YxwX8c2vSUslPaS9fZCpO6zBOklusSozm9UpBm2DP4pByEW/Bs5
	oNXTsj/ETrY3kV4NSEEvPnv/u+TX/y9O28F5QXEzvgil5NjY0CYG1siRGbY3ag==
X-Gm-Gg: AeBDiesf5UjMtT6c04JsHKu4o67YBDjOBWcqT8RcUpBG+sAoB1+xnQB9ezHckSaI/jZ
	nxh5jjD0/ww0WrpL5lgVziz5qjS5JN2F+3IPU+n7mxAcrOP6lLlWIKxhagg7Pwhj+qNCMahCdnd
	Ekl7cG9D5n+zg6G/ahavx1nffhAKY8ZSViv02O1xP5n0fJlLjXu2xAF+T6asYqyJjKbshAv9Za6
	7OVMGXeQ2xJUVKjaaoO+pQFznqU5Cdxdq5HxhfVKy7EzbHKS23dbCUUtLlrR9XTksFtg1iujHGV
	pf69ByYtINBTJaLGTJymw7deJda94a0btiiGRyvIVLuZDZSkjkjh3Mb0BIf4VBgrC4xekrLdEb0
	BVwHEFJNakIJI445dwcIIBUd3kbgTJtHnC05QiNgHf083e5WBlQszr+apo4+D1b6lZQPGBM1AY1
	P3LGS9uZhiwAhe8AFoBw0zlE3yfvSELOFY0A3I0sdvVHGG2kOv/S4FATACA+Tjw9dv9A==
X-Received: by 2002:a05:600c:5249:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-488d680079bmr45339755e9.13.1775836511858;
        Fri, 10 Apr 2026 08:55:11 -0700 (PDT)
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
Subject: [PATCH v3 02/12] xen: fix len type for guest copy functions
Date: Fri, 10 Apr 2026 17:54:48 +0200
Message-ID: <9154aea41a11bc0ba95ad15c217db79d029dd119.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775836512-8254FA3D-75CFC99F/10/73395122804
X-purgate-type: spam
X-purgate-size: 4947

Widen the len argument of copy_to_guest_phys_flush_dcache() and the
copy_to_guest_phys_cb typedef from unsigned int to unsigned long, as
the function can be used to copy large blobs such as the initrd which
may exceed 4GB. Update the internal copy_guest() len argument to
unsigned long accordingly.

Change the type for local variable size in copy_guest() to avoid
compilation error because of type mismatch.

raw_* wrappers above copy_guest() keep returning unsigned long to
avoid type narrowing; it is not an issue for raw_*'s len argument
to remain 'unsigned int' since the assignment to copy_guest()'s wider
unsigned long parameter is safe and there is no raw_* users who
are using a value bigger than what can fit into 'unsigned int'.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Correct the declaration of copy_to_guest_phys_cb() instead of return
   'unsigned int' to be in sync with len argument, the type of len argument
   is changed on 'unsigned long' as initrd could be pretty big and also its
   size is stroed in 'paddr_t' which is 'unsigned long'.
 - Update copy_guest() prototype to avoid trancation bug for len argument.
 - Revert prototype changes for raw_* wrappers above copy_guest() as they
   should keep returning unsigned long to avoid type narrowing; it is not
   an issue for raw_*'s len argument to remain 'unsigned int' since the
   assignment to copy_guest()'s wider unsigned long parameter is safe.
 - Change the type for local variable size in copy_guest() to avoid
   compilation error because of type mismatch.
 - Add Reported-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/guestcopy.c                | 6 +++---
 xen/arch/arm/include/asm/guest_access.h | 2 +-
 xen/include/xen/fdt-domain-build.h      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index fdb06422b8e9..ca0f72a80bff 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -53,7 +53,7 @@ static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
     return page;
 }
 
-static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
+static unsigned long copy_guest(void *buf, uint64_t addr, unsigned long len,
                                 copy_info_t info, unsigned int flags)
 {
     /* XXX needs to handle faults */
@@ -65,7 +65,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
     while ( len )
     {
         void *p;
-        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
+        unsigned long size = min_t(unsigned long, len, PAGE_SIZE - offset);
         struct page_info *page;
 
         page = translate_get_page(info, addr, flags & COPY_linear,
@@ -136,7 +136,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                                               paddr_t gpa,
                                               void *buf,
-                                              unsigned int len)
+                                              unsigned long len)
 {
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_ipa | COPY_flush_dcache);
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 18c88b70d7ec..c13cbec55b65 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -14,7 +14,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                                               paddr_t gpa,
                                               void *buf,
-                                              unsigned int len);
+                                              unsigned long len);
 
 int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
                                uint32_t size, bool is_write);
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 886a85381651..1d9e77df0eb3 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -47,7 +47,7 @@ static inline int get_allocation_size(paddr_t size)
 typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
                                                paddr_t gpa,
                                                void *buf,
-                                               unsigned int len);
+                                               unsigned long len);
 
 void initrd_load(struct kernel_info *kinfo,
                  copy_to_guest_phys_cb cb);
-- 
2.53.0


