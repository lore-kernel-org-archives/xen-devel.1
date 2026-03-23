Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63AEF483D3
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2026 16:31:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259498.1552834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iC0-0000uD-4e; Mon, 23 Mar 2026 16:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259498.1552834; Mon, 23 Mar 2026 16:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iC0-0000u6-1R; Mon, 23 Mar 2026 16:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1259498;
 Mon, 23 Mar 2026 16:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n/J7=BX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w4iBy-0005Bu-TE
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:31:50 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca65196c-26d5-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 17:31:49 +0100 (CET)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so51729466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:31:49 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:31:45 -0700 (PDT)
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
X-Inumbo-ID: ca65196c-26d5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283508; x=1774888308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMI2TSXemPnTPjqj7KVuKJpiKREscd9/P5Ya9QFAfVg=;
        b=jPYy5kxLwecoyRMJVPK+ih/GfoiAzKnSMBQAwSQA4/9L54IhqLuL37agnsldzmJtEM
         R/gG8lX/S9ThO/XMCm4kkOZAYcNdxsW/klSE5/YKvC3PFkwbP6BZE2//zriZsqzE3i9G
         6O0ObcDiLOrw5eDtWY52xz8s40Ly1evPML1MkgNxRaTmKtiePbg1mVJ78qKE649Gk9mS
         iqiGtzrwrJSV0yqNz8jm1Ng4sA5hEc+8i0dMI+7CLcBumYj9cBc6axXHV2FEu+ARbu53
         SU5Km7CAzXcQCXtEVr6vXtXNdLPAKiF1qYL5BR/i89hCKxY5pemyGkzAJp6u0qq/NDXK
         eb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283508; x=1774888308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RMI2TSXemPnTPjqj7KVuKJpiKREscd9/P5Ya9QFAfVg=;
        b=XceWQfgVzLm8KlM1aZSWGqorUz9erpYYg+AusUkFPsd0UG0BMOTRP/5v2B1wrjoPQC
         PpO8/qceeq0/+SMCwc5Pq/r/iSjxLhni6ZzehM8lbh0v4sB09B+PTCgRCbzzzB/N7rIl
         st4pTUS3LKStmfYumUUDtwLk9/knX3PV6bnja7CDIpZpVXr14GqohG3RJXGmTVl7iHY0
         skml3OuytqYvrnlUDZ39vWa31TI8KdBvAQtfqRdHJUubCM3JYOCSDJLRAqUzgRpM4A5U
         UwwZo2b2/0HR4/nobkLisMVYZgphCW76ORcVbl0Ij0LPA7d0jMXSgcPxFUB0iahSjPuZ
         L5PQ==
X-Gm-Message-State: AOJu0Yz+4zjbc2rqpJJB7q5Ssme7ki/HUj5g9vztdtgWfXGo3LABdAnA
	7EGnAhcqc11Kx+He/KQozb4D8AO47PXOtUeeoDVmoiDEwX+KpEhx27DvYXAGGA==
X-Gm-Gg: ATEYQzxdBLGgEeU0NNKg4DBjWpTwnOPOK0IGf5O4Qy+V8AYiNa5cp7yF/853WeGss0e
	reDUzkirVnSU8DnuEcTPdfdBXuSMRY55cD1smwU0uXFXpLc0XpfDgAIHu2Qbri0Cni/eYAdd94y
	sHHw10cH+OVEIwhgd4bm3t33gUFLwTdvdM3glhyJhTkNEW3ldeT0u57kAuQ4RpDPelxCA+5o1gS
	vrZPfaHS6gwwFMpImcco7dDW9D1orAecOCVG+0uPURUDZtCPAW4ynrs4e1IyVY0KTv55q2m8vdI
	6IwIht+h6HrMXKJgII7z4kai26j7NQLJ/e8LRezN5kyO3QNZOoc89gH5xMq8Auod2peMdvGIJ/4
	KQFKgu2YkHlnPI2r+MsrnVdPJEasMtZZpz4yiaIM0dFqBClzV8HE0MpygZw96pD3nGkSX1d5N38
	T5N54gAqb/KZZBgR5er0Wb7/S0YObgC2wUDPtLBfVTOdQT+2uW+iC/tDkw89ZwM4LlVQ==
X-Received: by 2002:a17:907:174b:b0:b98:cb6:e896 with SMTP id a640c23a62f3a-b982f3df694mr736739566b.38.1774283508208;
        Mon, 23 Mar 2026 09:31:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 11/11] xen/riscv: enable DOMAIN_BUILD_HELPERS
Date: Mon, 23 Mar 2026 17:29:52 +0100
Message-ID: <7cd07d4faa06152795f753bd0cac69cb59e4675b.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Everything is ready to enable DOMAIN_BUILD_HELPER which are necessary
for dom0less common code. So enable it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Move introduction of p2m_ipa_bits to separate patch. Also:
   - do rename of it to p2m_gpa_bits to follow moe arch-neutral
     naming.
   - use __ro_after_init for p2m_gpa_bits;
   - initialize p2m_gpa_bits in guest_mm_init and update if necessary
     in p2m_init().
 - Move to separate patch introduction of guest banks constansts.
---
 xen/arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index a5e87c1757f7..41426c205292 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
-- 
2.53.0


