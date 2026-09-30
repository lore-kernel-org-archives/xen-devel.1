Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BFECA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437472.1656360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx1y-0005h9-0V; Wed, 30 Sep 2026 16:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437472.1656360; Wed, 30 Sep 2026 16:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx1x-0005h0-U0; Wed, 30 Sep 2026 16:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1437472;
 Wed, 30 Sep 2026 16:19:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx1w-0005eR-Os
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx1w-0008b7-5Y
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3681-8faa-0a2a0a5109dd-0a2a4507d690-26
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:40 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd369b-b4ea-0a2a45070019-4a7de18d9786-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:40 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso40972675e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:39 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785179; x=1791389979; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+PNt+3y/KK2OFRC3rLj+FscDUEuDZDVKtqoLnTNDd8=;
        b=eJtCy719ZseeOFzPTJ+qSfYbGpetxFK0vOY2YLQFytrVHmna5RnZfYJwzyaUmMM36V
         MapKtDKpOYBPe0zL22Cr4cifmLlCJT3mRjjg8p8MhuVbvnRLzba6Q+EEYNPqp1KXVL5G
         MzEjaC2lfi724kZ7PodqWPc98sbIZX4iTHFphBwbFbhAUwyVrc44cpA6djIyuirsfA9C
         tHWJezUwBe5C6N6EHJMvBoJ9Whl9KVAJwuaelsujGyW3Qgr27rp662B9MKG9tndAaQD5
         MOqIq3mu/RCmvrQ8L6LMFKbQOo3k0ztwfdfoz2hLR+COFENelAwpNuor9Vk0hnfwybPD
         QM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785179; x=1791389979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+PNt+3y/KK2OFRC3rLj+FscDUEuDZDVKtqoLnTNDd8=;
        b=a+/ljGDiPcFil7Sm/rlKZj1NbXQBy4fzr7ZwY+bBDWEJR3JVfxqxdV6JUkAxf8hl1z
         E/CRlPMmVkOYCgF2T904p0aGJwqTJv2CTRkpTQ7l2cSV8nHmLlFrCT8G33lhYvtZGuoe
         huNl9B8sJq3yRITQcmWPMbs3siA8ckv5ZPTRE1d2hNcDVKUbMHpba7LlgE2Itamt8mj/
         OeUEKD+Yi2/kNeBuZe+ePT9XjazB2BhlqirIgFrHksKnowXa++RmF9IFr2EDEdkKSSy3
         fXv5dbI/wudJzt9iaxXQlW4JbuQHh9rK90zuEPQzAOqpKaPXsfejNbNZSZiuMCCuKqXy
         +hMA==
X-Gm-Message-State: AFuF++m+PdfutTtCvV+vaw08GQq59TwaQXBcCD0FVn0fjEvQAH61m9Ng
	CzN9bxwkcU2eRWqN9CsZIAC34G9E5fesRVEBofQCodMubBvuKIqcPSs1rpiW+g==
X-Gm-Gg: AYBFou1yeHKIwION5qxR4bKn9d1PwLbaede1I/xZ2yCpaJwiUzpSldiaw3FAjKZaY1k
	XNDN2ak6idChQC0V2V9sq6OXHB8i0+9D8xzrYYVZ8okEZcN6JUuRESieKPtFMBjTYIZE1+7ILel
	5TfcYh4gHpj33J+zRxxJZEY8iHHXKE6aS7JyOKwThebeCREt2Wx4Mh/8AKKLOEM/WB+bJ5OFxPb
	euKSZNOupYdVl/AEhUsdxP/0YPP1iFYalgD+1PJ9EZqdvqWry51QA/sah94mBnCOpGygrDf3Yu9
	x4K7uJgNo0Y0pNbzjRZ/DF34fHHLukZxuQTZ8bhNtlPXM5Vz6tePd/2ZCOTPgp/1n+hWfC13c3H
	u2wnY9tXBYbNE3EMMzQuC0YjqGaFSHD5kCNilVVPSNKIZixQr1xXgxf0c/UBAkw4xdIwD6mdf63
	P4XKdGrEqRrpsPsLvkf/TkciezlddbhvYb/3KqjC0o3u8D+usyuzlQuHu+SFcX46oPmV236P07i
	539hRHvTvZ2BE4gKtYGJmPZSnEZ1CuT/Rfvgoug
X-Received: by 2002:a05:600c:45d3:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-4a01aff2060mr27284845e9.11.1790785179254;
        Wed, 30 Sep 2026 09:19:39 -0700 (PDT)
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
Subject: [PATCH v3 02/39] xen/riscv: set the domain type for 64-bit kernel images
Date: Wed, 30 Sep 2026 18:18:44 +0200
Message-ID: <bd072fd8e2406a80aa783b1b81c41d4fe8739eeb.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790785180-A5CC7AE4-0F729281/10/73395122804
X-purgate-type: spam
X-purgate-size: 1344

kernel_image64_probe() never set info->type, so every domain kept the
DOMAIN_32BIT value a zeroed KERNEL_INFO_INIT leaves behind, even though
Xen on RISC-V is only built for RV64 and accepts nothing but a 64-bit
Image.

Nothing consumes d->type on RISC-V yet, so there is no functional change.

Fixes: f6a20eda9212 ("xen/riscv: add Linux kernel loading support")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
d->type being left wrong is a bug on its own, whether or not anything
consumes it yet. Its future user is "xen/riscv: set the guest's XLEN
explicitly in hstatus.VSXL" in this series.

The patch is placed ahead of that one, as it fixes an issue which already
exists and doesn't depend on it. If preferred, the two can be merged.
---
Changes in v3:
 - New patch.
---
---
 xen/arch/riscv/kernel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/kernel.c b/xen/arch/riscv/kernel.c
index 8580cdb32d7a..5601b2818b37 100644
--- a/xen/arch/riscv/kernel.c
+++ b/xen/arch/riscv/kernel.c
@@ -233,6 +233,8 @@ static int __init kernel_image64_probe(struct kernel_info *info,
     info->image.text_offset = le64_to_cpu(image.text_offset);
     info->image.start = 0;
 
+    info->type = DOMAIN_64BIT;
+
     info->load = kernel_image_load;
 
     return 0;
-- 
2.55.0


