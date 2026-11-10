Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FFE606B9D3
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=taQxzLoz
Received: from list by lists.xenproject.org with outflank-mailman.1481338.1685202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi98-0000os-5b; Tue, 10 Nov 2026 09:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481338.1685202; Tue, 10 Nov 2026 09:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi98-0000oi-2Y; Tue, 10 Nov 2026 09:28:06 +0000
Received: by outflank-mailman (input) for mailman id 1481338;
 Tue, 10 Nov 2026 09:28:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQi96-0000ms-Vs
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:28:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi96-006eIn-CB
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:28:04 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af2e3a2-bab6-0a2a0a5309dd-0a2a450583ac-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:28:04 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af2e3a4-4cb1-0a2a45050019-d155dd30c5b2-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:28:04 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-49318428d98so915346f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:28:04 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498363dffa1sm3882707f8f.39.2026.11.10.01.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 01:28:01 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794302884; x=1794907684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5rS9OwRyHt36OIepr1Z0/Xx3lcEBaeQuQqQaT3Lu8g=;
        b=taQxzLozwCkgqqxioz2GJgW3tO16TGZabbW+B+F6+maxsyQjCVUJmT3EEHRsAu+zu5
         aXePp4UTfqaz+vf40YH7ZByxznf4qacQS2qBLY0JTDKItMdGaE/MP1ta4fSlrhiu/zNh
         l4TP7DzCDJGTeD+M1gBMwDyVFsi4laYVZ+FDQx0n3/WjSfA3oY0OuwMkBRm83NCz5fNd
         f+3w9mWj+vNEwRbRlVplMbOrUklpVI2uFw++Z0pt7W/7yHSvzmSs2O4se2wJHnvodRw5
         Vp9eTw+/BVnvYfJYwRo0YZ+0h+w5w61PHaGcopuo9flDYyq2vBIxaKXrOTZI/bVJTgHy
         Doew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302884; x=1794907684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5rS9OwRyHt36OIepr1Z0/Xx3lcEBaeQuQqQaT3Lu8g=;
        b=OHVV/aSfD5BXbKknvRbyRRrrakLD5KxoMNrgbafVUDbsNf+A1hhdgT2qTb77E9pXr9
         HQxS5AqrdAwe2mL4SRAcE2k3Jf9HYyHPywnebMIeiMT6rr4tyrhjqsGF1YlNaz6PqMGo
         dUHqUFCoTMpxAKSTmfMFr8DqAYMWPPpWgT5ulzsIvjYy4lE/t2eXLVU63td9cGrCsHwf
         QFr3KxLNWQFQB9OyWkyJ3kz+z8GYdHqZCM1it+dTKEXwPPcYGyP/qPEaPkHn4IXWuf59
         OCPhwHpjbOK1oNhBzXDC47Ti0ijWnE8pUXfl7DZS8k3KtMkul0CnggNncG16ZTEO7oeQ
         vpkQ==
X-Gm-Message-State: APuU4Z9ZAy/zBVvZvuNwNHr0ypc92kNoZ7upL1sBy940xCarpra9YRaM
	g3U9I4rnRLVMkAYkakvNa7DdwB9M0O3dK9c8j6ONDc9Ng7QpTLRBbS48Xu/SRw==
X-Gm-Gg: AYBFou115O1wH7eqbestl7f6FrI9PbaXh719SIFpW4CsDZz4ncIqqYAkB28mSZ0gDhK
	fmmzl0+8fsINlXqT2bWvR+bnQX/ZxYMAm6RJYYhsoU0OhRqbH4fzm/SE0hLwKVnglKiS8WFWIMh
	IgRMOK0AZmOIP/iQNW433uF5J7VJuwN3DhnsQQ22+QeiAgGEMflwFi+Z5YDlQZNY2wSJ67KvWu4
	D+1Qqguc/VvaZQlbeJxA/QpjVPpH4IrmPBI9kScgTmbnO1UQZjtcmROcHz7x7AXIYjNkqkR97L2
	kS1AmppQD81G2E1FOWoKb/mq8j82Rm3RExQ9NnC+knXANQJSHDd8QWiVY+vf9PmrdmGwfrX7saI
	Yx+FDzwzavBbTEzjbzNJL6rIqfLFcAHb6P5wT+u9XW0qwDUnwJ7wl6kVXiOgSYZGH+EtVggVipe
	gSiWPJC1RLRA6eTJ2pcQakPaWStohhpDM+jTAFez3GdxkrvWOqp5dZulQ+FnD3OB8pXYBtip7fs
	TREQHYH70jtdpkW7Be7ZM5I818lUl78dYyE5aqPfCrgj3YNtSWtsGqDrQF9XPIkzE7pihSSB3do
	zPY16faNB83/d0XXXGH74Vr+BIa2iJmQRjUYCirhR79sryAaYGKyZdMbFNZqzkjWxR2x
X-Received: by 2002:a05:6000:608:b0:490:71a7:6f3c with SMTP id ffacd0b85a97d-4983124989bmr3773687f8f.55.1794302883571;
        Tue, 10 Nov 2026 01:28:03 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
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
Subject: [PATCH v2 2/2] xen/riscv: fix the base ISA checks in riscv_isa_parse_string()
Date: Tue, 10 Nov 2026 10:27:57 +0100
Message-ID: <20261110092757.25213-2-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110092757.25213-1-oleksii.kurochko@gmail.com>
References: <20261110092757.25213-1-oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794302884-F56AD2A1-AD794CB0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1731
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_isa_parse_string() is meant to reject a riscv,isa string which
doesn't start with "rv32" or "rv64" (depending on Xen's bitness), but
the checks are written with && instead of ||, so a string is rejected
only when both characters of a pair are wrong. As a result, e.g.
"xv64i" or "rv62i" is accepted on RV64. Also, for a string as short as
"rv", isa[3] is read past the terminating NUL.

Use || so that each character is checked.

Fixes: f74ebf58b518 ("xen/riscv: identify specific ISA supported by cpu")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v2:
 - Add A-by and R-by.
---
---
 xen/arch/riscv/cpufeature.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 9767ba0b5824..b1c614867cd8 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -261,14 +261,14 @@ static void __init match_isa_ext(const char *name, const char *name_end,
 static int __init riscv_isa_parse_string(const char *isa,
                                          unsigned long *out_bitmap)
 {
-    if ( (isa[0] != 'r') && (isa[1] != 'v') )
+    if ( (isa[0] != 'r') || (isa[1] != 'v') )
         return -EINVAL;
 
 #if defined(CONFIG_RISCV_32)
-    if ( isa[2] != '3' && isa[3] != '2' )
+    if ( (isa[2] != '3') || (isa[3] != '2') )
         return -EINVAL;
 #elif defined(CONFIG_RISCV_64)
-    if ( isa[2] != '6' && isa[3] != '4' )
+    if ( (isa[2] != '6') || (isa[3] != '4') )
         return -EINVAL;
 #else
 # error "unsupported RISC-V bitness"
-- 
2.56.0


