Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FF2C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400960.1636709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvj-0003Q8-RX; Thu, 27 Aug 2026 15:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400960.1636709; Thu, 27 Aug 2026 15:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvj-0003Nc-4E; Thu, 27 Aug 2026 15:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1400960;
 Thu, 27 Aug 2026 15:22:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvh-00031n-Ef
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvg-009kzH-RF
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905616-2eae-0a2a0a5409dd-0a2a4501a8e6-44
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:12 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905624-5984-0a2a45010019-d155dd34dcb0-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:12 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso1868714f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:12 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844132; x=1788448932; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQi5AqxjI4j3kdKeC5mUOmbX7W1Kjge/ElYxM922heI=;
        b=rwtMwSBiR5NkKgDTUPZfbhyo9o0SOhG6JROO7CCD3nrCGG8ZwcFBRdrjkkQ0UnhrX8
         W40LESvDFYoKAK8NFHxapD32IDYzd7Vb9W65MamB+CZuKb74hKKzOwmTtWz/z2hHjSeS
         26c/1X0lc9iM4laNChWoY36Hr7OJwejoz83PhDCQ6MUogw5rj6Di4xmUZVejdHgO05Ld
         RVLEsG74Nv0LgoFjEAX5NvHm22SjVsopNKF27MaZ5spmSOATtP9/zD52B9VZauNhe7aQ
         JLBkrtknplPgkQeooqYxkKUfOtkJsiJzmrqNhLklDl8T6X1FgcifdzBBJb4bQgcZJw2o
         y8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844132; x=1788448932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HQi5AqxjI4j3kdKeC5mUOmbX7W1Kjge/ElYxM922heI=;
        b=cntuibtT4VBH2uHzLIGY9/TtilVJWrgk5BYWIgygTm2TfxJbaYpaR5X0AbHL9THI47
         6PDlV9yKv+KM0MNYj3SRU8iRee88Km6a3/HZ/Twp0Gf04kT80d1mge8hyE0omuKpSwRC
         bRzY/g4qutKPuXmltb4IBjgm+oYPENOXVyvW9qPneGV4O5HIFWpb0di0FpxQ5WZSlbwq
         mVtVJyzcK07zeqqfSnf8XlA/B6Ts/ksfX4AorD7YtiBvPOTc7dTfSwIuLQ5LXdlZCxa5
         Igr7s/4+Torga6dKPbvD2vEXcYfGe5AUdTmZepMXxKuu3D5cL46khzFdB5AcDpKP83Aj
         Skww==
X-Gm-Message-State: AFuF++kQhQCbr84Cd6hfsJDMhBfzCKYWzKogqEoH1QqwAjYQTSoZvuAQ
	1A1LejTkv8zN8pLTOOVn1KmABTBMDKAqLvSQr0yG5ilFkS23B7zSZN7YCTzBxQ==
X-Gm-Gg: AR+sD10t1AuaL+VGPfouRJKvtEgPaM8hQEV/6MGuhdEY/LdA1KpDlNZPoJ1ZyHIt/AM
	kS2onxTaHZsxRTI0GMJjBgdNUrRedgxVbUHMITB+iKPqE49NAmQ5XJ9Grau3s/jV0H1vpZHi4cA
	+jfLzc19iy4fPnaz13EZpJThPiDv+FTzpQFVBe+lRcsTMD1a6jtbGVu6OfqpeCZk5QNgf0sstml
	/2zAAOm6vyWr/2VUwdlnReAKe/4fciXXn0OLo/87fVW/2RcpFfsgl1pAEEKlZEuDxO0itLJGZHx
	lvFL3yTSCUo9MjhBZS9LYWdAhlyCHxp1dlUDLb/Yw5YdenuUqMBa0cD7DokX/jlPHH5Yf9jkF1V
	Jl7jX8LCpMW0K4M5rYJYV9thpBlsl/7yt/3jCAq8EZ/IhiQ7I1VKHxfdz8tEh/0pQ2v+jPCN00Y
	rI2WBd2Ix1eSncyPZ5bGs3D3Vi7ANNxSoMfNwzXzAsJ4IU1VijipkHKXzxAmBDL/obZYRtugCUb
	d4ip6mQiSVDYymK8CAmkr+uN9Tp9vhgSHRldLQCbp4=
X-Received: by 2002:a05:600c:1d1d:b0:499:737c:8a8b with SMTP id 5b1f17b1804b1-499dc81eb1emr193079615e9.12.1787844132127;
        Thu, 27 Aug 2026 08:22:12 -0700 (PDT)
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
Subject: [PATCH v2 20/39] xen/riscv: detect Shtvala
Date: Thu, 27 Aug 2026 17:21:04 +0200
Message-ID: <611683b3d2e3b836d08d0499f7caff782ba80a34.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787844132-1E27A757-2AF5C80E/10/73395122804
X-purgate-type: spam
X-purgate-size: 2034

Shtvala says that htval is written with the faulting guest physical address
on a guest-page fault. The H extension itself allows an implementation to
write htval with either that address or with zero, so where the extension is
absent a zero htval cannot be told apart from a genuine fault on guest
physical address 0-3.

It is not offered to guests. Shtvala describes the HS-mode trap interface,
which a VS-mode guest never sees, and the H extension it belongs to is
already withheld from guests. Its guest-facing counterpart is a separate
extension, Shvstvala.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Change in v2:
 - New patch.
---
---
 xen/arch/riscv/cpufeature.c             | 1 +
 xen/arch/riscv/include/asm/cpufeature.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 4bcbf56cb694..09a06f12318c 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -195,6 +195,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(zba,          RISCV_ISA_EXT_GUEST_ANY),
     RISCV_ISA_EXT_ENTRY(zbb,          RISCV_ISA_EXT_GUEST_ANY),
     RISCV_ISA_EXT_ENTRY(zbs,          RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(shtvala,      RISCV_ISA_EXT_GUEST_NONE),
     RISCV_ISA_EXT_ENTRY(smaia,        RISCV_ISA_EXT_GUEST_ANY),
     RISCV_ISA_EXT_ENTRY(smstateen,    RISCV_ISA_EXT_GUEST_ANY),
     RISCV_ISA_EXT_ENTRY(ssaia,        RISCV_ISA_EXT_GUEST_ANY),
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 2973eb13a513..ac8c68007072 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -36,6 +36,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zba,
     RISCV_ISA_EXT_zbb,
     RISCV_ISA_EXT_zbs,
+    RISCV_ISA_EXT_shtvala,
     RISCV_ISA_EXT_smaia,
     RISCV_ISA_EXT_smstateen,
     RISCV_ISA_EXT_ssaia,
-- 
2.55.0


