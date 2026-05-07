Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADF0CD3442
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2026 08:59:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1302330.1576304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZb-0002t6-I0; Thu, 07 May 2026 08:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302330.1576304; Thu, 07 May 2026 08:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZb-0002sx-EO; Thu, 07 May 2026 08:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1302330;
 Thu, 07 May 2026 08:59:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZZ-0002c8-Gl
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZY-002y66-Ta
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5457-bab6-0a2a0a5309dd-0a2a450ced94-18
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:08 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545c-62f1-0a2a450c0019-d155da30b921-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:08 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b936331786dso67215866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:08 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144348; x=1778749148; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sw4ZCaBnDC39B9UBFiVaqqV8dCEu7NuEUb9SRjNkUL8=;
        b=oZC9YkzUexsgFZeGNoD+mfGClhG77Rpy5ZpBAbhEuVAhmMoAgSi659eGikTkLIT8Us
         jkkfrnfC8dfYUdQEf+qT+BpF6iuRAVl8XwdGfUtlxjgm0eTYuMFyU3ZSSOZUuqRCLDuy
         md+SezknuER+LW1NXFyxk+m+IiBlrx4m3ogr2m4T0oZI+9y6zbIRhA90Ue+8J/bgkOYL
         BytGhtDmfOCJ1LUWC1Q31ehW/hYHl/Xoz1D89Vsfik4VgCXsttG36DkqGMIWwDbQCLxo
         g+vCJRhYsRbYAYGxMNr03UDG8dxKXecHDqZQpIt09wDOHLZUO3FrcycKdXMUOi+KVHWh
         eQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144348; x=1778749148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sw4ZCaBnDC39B9UBFiVaqqV8dCEu7NuEUb9SRjNkUL8=;
        b=BmfnJNqot6pLvkjH8Tlx9/XNpdvm2Chyru+d74NqbVnBT4L1Kx5181q25GVukbnh3Y
         Zuml6iiyNJhPl4bPk7XOvKNmOk8Jz2OulhOVOLs1M9zPdmEnzJj33AWpUrkn4cbKwyA9
         +SUz9Mhk5SbsTjoh7a8acRWcHNwshRknfYMEypENW2KRq6eKPU1O537icrjOhGRgfqaJ
         yQByAyd1wOe+6usBhuipZLlf5g3YdMwrAGwW/FdJNSnTtRrlURHe4uQUN6kqwHnMniy9
         Z7abWWH/2tCeQAbcqVrAg85WsBY6qYr9uwEyOzxxYDfXJCWwUZUm1MZPVTlYAfWQ6mDl
         LF9g==
X-Gm-Message-State: AOJu0Yy5zu8qqRkD8OldGwsTBIrz+bCxv0vHJBNsBuDdeyIHaj9Ggwcr
	EsJ3WuVh79k0VVt78/pCYd+i7xW7XdBbGPiTq5OFQpJIAslhScHleP6NhKCVyw==
X-Gm-Gg: AeBDiev11a/IX+nxZifej846htEmZ3miBgqPS34R8E+AddwKpacvkEhhuq3gNWnS/hs
	/qv+899+yj6NyH5RXuUu17yw8EJMj93H8azQD9kJYjhGbEi/folefrlMtFj8NF/0mvWChrfWkVR
	MzeYU1/UWhYps2RpR15K8n2GLkvnjDmFa3Wwc6k28CFnOA1SHESSydsueQkrcnb8r1YG0ESscF6
	ybcbw8MgY9WARBwQJ9lyryLuZvO5NQRh84BMdrMwSFS9af1UwwU9Juw9Ub7fFyUmZkBR78MjR15
	K31JZnUFFVOa06b5CkhdrU7NhOxtgZwQJkXREmI+sfhB7YPWPmHgI0kh97wzYHCI7/b/jAtUUTJ
	plZpzY8dvvY8P5oqnr7au3VuCHZxv/rIoq3KYp6uRCM+Q3q7mtiMIl3klGY4fDr7kkODni0SZ1w
	cbbM+e1gMtABj8x6MRWmk5u70H5wpXJPiLDUDdTz3hTfkMss7YTpHqhhSulW92J1UcYBaFIgkaS
	D6C
X-Received: by 2002:a17:907:847:b0:bae:8734:18b4 with SMTP id a640c23a62f3a-bc56b321903mr389004666b.16.1778144347189;
        Thu, 07 May 2026 01:59:07 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v5 03/11] xen: move declaration of fw_unreserved_regions() to common header
Date: Thu,  7 May 2026 10:58:42 +0200
Message-ID: <6e79a0cf0a718e8e8c582cc5848ce5221cd56902.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778144348-E176ECF5-FFBFF987/10/73395122804
X-purgate-type: spam
X-purgate-size: 1585

Since the implementation of fw_unreserved_regions() is in common code, move
its declaration to xen/bootinfo.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v5:
 - Add Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>.
---
Changes in v2-v4:
 - Nothing changed. Only rebase.
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
2.54.0


