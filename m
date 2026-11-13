Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487A5606A33A
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hF3oZKax
Received: from list by lists.xenproject.org with outflank-mailman.1487736.1690076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWv-0004J0-6b; Fri, 13 Nov 2026 15:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487736.1690076; Fri, 13 Nov 2026 15:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWu-0004Fb-7K; Fri, 13 Nov 2026 15:49:32 +0000
Received: by outflank-mailman (input) for mailman id 1487736;
 Fri, 13 Nov 2026 15:49:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWq-0003e6-Mc
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWq-00AqRw-2J
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:28 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7316a-8faa-0a2a0a5109dd-0a2a4508d80e-48
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:28 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73186-f659-0a2a45080019-d155dd2fc8db-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:26 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so527752f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:26 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:25 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584966; x=1795189766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5Q9hPFtrqcxaaYVQWBdJWXsW46cm4VhwI9n7djYBMA=;
        b=hF3oZKaxEwIMYRTJtkd4Sz9fdST+5QWuQBwRjn/Lvxjb9Y1UCoI75/JC3WapgKgTvj
         HzVA3GSFJQBxXCn0YIc/yNknoxda1aBWH1MxvBa0LyQlESqAcR3TdI8/V7qcQu2evK3V
         XU29IitpIKmGW6qrU3Qg2siH+lLgwGFeIEfMhxNj9D0Mxs8GHKqTJEaJ4Pie2I+Li9zO
         whE3LI3SxxaFq1Nj6Qev5HUelGRIw2PYW6KpZvK6VlMKmI2zL8g9GBNzu6GxPkRJb2jA
         n6eLGdtJMWY4t5pQzCDySqtFJHgCf0NbteQ0xJ4hYXhlCDKxDAChUhUrKAf4BjBiPaay
         ymvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584966; x=1795189766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5Q9hPFtrqcxaaYVQWBdJWXsW46cm4VhwI9n7djYBMA=;
        b=nO1uQvovE//KQnZLyEqn8JM2pser7K5OfOLODuqF6Ak0cIcfUlMjlFJ1cY+ShB1Nve
         ZqkAWZ7e9P0fbGm5xJQrLZSZeWu1xgP20qriw7cYsw62nFJSexcMVAK2ZnatFmV3kYu+
         cyf9+iWUPdtoyzb/R6w5GVDlKDXKp79pLPkzDvmYgBbDjKzIE/k5DB2pTwDmnTGFJIla
         PWhIqqC5EhxIoiSD77aXKi1a6NQOG+/Y0iiFhebNRJWzmr3FMXSpiuJbxO5zTeBcrsX4
         y4w5rBgrmHQNlHhSrkjIu3eeoF7ujTKmaY6gXmiJfQUtPWV385QI/ReeAsKlHtMl06/f
         ULkg==
X-Gm-Message-State: APuU4Z8kh5Fb2xO+OqVpYVVsQ/+63UrzbCblD7J6vQa+GtuiyIIQ5Dad
	xwDOZG5ApyCstLz4G0GggmQZJCDeMAmuvZ3iPLcaVJZp1uU92/llz+fufDgR/w==
X-Gm-Gg: AYBFou2VjfF6ZlmNgiFU1Oz5ao6KgOgTii/qq6c0BxPCwW/GNf5oxvauwEfG7Fw0uK2
	XVcdi17Wu3QQy8+Bcp/j5JMrL/BW/c7xRbOuFcLX3+JsCEjtiCLcemCYbUfKndV2bWxgIuN4jjx
	iGBA/1RhMUvMrZU5eChVU8ytMSDAwZVpY6zUUk5JNWTXGGSGF8dBEqZtQmBhDqSg4BA/p9/N87N
	VM0L15EVVO6B9cmfUFwt1T8rzkGgQ0LASWDE3wCMZ4hs7I18VMRjKSeWRjR6rPqM71bZCo+jUCB
	YyPeIsCpIRhogJbcDfECk5cvsdoihyy9lP5aH++P14/56PsweJUctSXg4Uks3Fc/QtVoPom5ByJ
	4H8bnyG1j0W9HoZ1ZsfMVtIi6DA6Su2xJrlzWDFjVTs8Z7vlb5Pj1jnlcKtEdlO59wRafCCY5jP
	zD9Vea2JihGLVLIqURqBOkmoaUJR+hcKYYIG1ujsvedq9IqEW3ioIncr0KDcC833xtZVvpB1O1T
	+KyuQLF9zBaN9EMqJIyBWO/lrJiHN69PaTwb2CiQacg/XLuM6E00c/1yFM7LXWRnuOS99jWdm1W
	i6Hu3LKBndro7N02y3P/B+ZFZpCFY1nNz6Senvm8QLvPYQghWC/qtRz8pbQ6FpzQjDFY
X-Received: by 2002:a05:6000:46ca:b0:493:bd29:a6e3 with SMTP id ffacd0b85a97d-49c70ed913cmr4629456f8f.15.1794584965702;
        Fri, 13 Nov 2026 07:49:25 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 17/42] xen/riscv: detect Shtvala
Date: Fri, 13 Nov 2026 16:48:38 +0100
Message-ID: <4ed33fdc81c5ac850eba3ce6ea8fed80249c5577.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794584966-CFED287B-F0793025/10/78276251493
X-purgate-type: spam
X-purgate-size: 2215
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H extension allows htval, on a guest-page fault, to be written with
either the faulting guest physical address or zero. The Shtvala extension
removes the ambiguity of this zero-write by guaranteeing that htval is
written with the faulting guest physical address in every circumstance
permitted by the ISA.

Not offered to guests: Shtvala describes htval, an HS-mode-only trap
register a VS-mode guest never touches, and the H extension it belongs to
is already hidden from guests. The guest-visible equivalent is a
separate extension, Shvstvala, covering vstval instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/cpufeature.c             | 1 +
 xen/arch/riscv/include/asm/cpufeature.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index b1c614867cd8..2cca5165804f 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -196,6 +196,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(zba,            ANY),
     RISCV_ISA_EXT_ENTRY(zbb,            ANY),
     RISCV_ISA_EXT_ENTRY(zbs,            ANY),
+    RISCV_ISA_EXT_ENTRY(shtvala,        NONE),
     RISCV_ISA_EXT_ENTRY(smaia,          ANY),
     RISCV_ISA_EXT_ENTRY(smstateen,      ANY),
     RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index d42189e8ebe7..f0f9b5ad72d2 100644
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
2.56.1


