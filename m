Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E08FDEE47
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 20:04:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1292626.1570973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Hc-0007Sb-3q; Thu, 23 Apr 2026 20:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292626.1570973; Thu, 23 Apr 2026 20:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Hc-0007SQ-10; Thu, 23 Apr 2026 20:04:20 +0000
Received: by outflank-mailman (input) for mailman id 1292626;
 Thu, 23 Apr 2026 20:04:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wG0Ha-0007FJ-J6
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 20:04:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wG0HZ-005MS0-W8
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 22:04:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b40-5cb7-0a2a0a5109dd-0a2a4505d46e-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:17 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b41-aaa8-0a2a45050019-d155dd2ddde8-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:17 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43d6fbd0954so5585381f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 13:04:17 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm60065442f8f.24.2026.04.23.13.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 13:04:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776974657; x=1777579457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDfhd227o6gGh3k3sHyBHCTFmn0oVFwYEqgY5uwBNT0=;
        b=UzRiAQxsJHjx+XfeEt5bh3mMBYBaQJOSfi2ngqVL9QnfRV4+8xp9ZWXTCyDW14tB6H
         uWhdUXNoXwhgw1iQWN4V00BsYCaSyiPQ/4eSXPGIxpe3qkhpsrHXDxhhsYjgeM3LjNiZ
         DQkgIFh1AS/TEGND6LpgZtCbLdQ69aoyX7Mu2PJWAx7gepVQb6crg01lOH9kr0mUU2sA
         f5eaagr5SUv9kgXvBfg+tGF7FL4vvUKjugzn2rROqx6/Uvh81S9myPwT7IFk1sF4i4rm
         SChvMe7jljMe8qJuxZJMfskoFG37BqNjPxh9HzK47JFIfuCaqqMnSxkopC6BQu5686Wf
         lqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974657; x=1777579457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XDfhd227o6gGh3k3sHyBHCTFmn0oVFwYEqgY5uwBNT0=;
        b=jc38qOmdrdgCBSdj73jYiOA3egfjFZz1f3CYhlzuLjOWUQ9Gy7skOxT58UuioxXxVY
         ez5/Mm2dtJKpXlz1VO5bl6fCy8EZuJzXhd7Z3mRAida95WWlDWiL2jF3pz3UTrGcFLX8
         Y1LR4Dw+/epgpS050ujjuNS4ALbXCGlAfjkUKNcNLXbsNsmMD1Q1t5e9Mse3qu1HBlp8
         +xm8+Hx2X1un7dstYWQRo1IPRqw9f5ZuraJZFrhtJe8XhQ2fX8JBp6EDlgJEKEdifE0x
         DH1vfsTGFUqbZMhWn79sbfzLuBRNf9FiL9w6zpoGu5dol2Tx8wEFwLFS1lVrB4Z5e8Un
         D1jA==
X-Gm-Message-State: AOJu0YyKqpFfN7A1XC9ElI/uu2U0Uuj6LaZdlHHFp108Ms4kc6kE2yfn
	aFWuuPTFuMIhH4TVt2W0Wu6vYNHmFBbfhiYn0Fhy12yXxp15qkkMasLj7oRc2+TA
X-Gm-Gg: AeBDies2e/ROep9y4NvUDkke8+w+GSz1Ase5+XDCZNXvuBG2vBesKceI+K0KKtD2RyZ
	uNyzp6dGr24B2RKrRDmqgb94gj8XWupDvsCAPzcyVhQVLTSDWeHAdMJDFUmNXKNwwc/ViWZtI8q
	zoR1RfPPhTzF5r8JnCwc47hesxC9C2poBSBbaCMoJwfAohAHBPu/kCjc5w6wClh5RxbTIcfKRk6
	phPwV6jSwxpTX0u2B3gbelbd0E9dgaIfmmFYGe61t09dceqMZdbx4nRR7eWfK/1NpHMm4NSnjZN
	ufEVYE8w9hnLrPlY2XcsX8YdAHUuo+OtWZcfLWCfs1nKuRF8Pq3VnsJFU61Uz2rTali7dIjh7fH
	Gt+aHNogSNTWD3Tla2n2K/kYc9RrSkJOChYt3VieqlaNDVA3gTvz8djQ0FtjDRgBdlaTm6Lfglx
	lzwuGdrZ+M81joyYMvvIb/OeNYBGNrkBOFlccd38bzvoBLibXvTBWDePUc7Vjr8G31v7rckHM1L
	UQe
X-Received: by 2002:a5d:64c3:0:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-43fe3db2d1amr41210620f8f.6.1776974657013;
        Thu, 23 Apr 2026 13:04:17 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/4] xenguest: Reduce number of parts in write_split_record
Date: Thu, 23 Apr 2026 21:03:56 +0100
Message-ID: <20260423200406.28178-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423200406.28178-1-frediano.ziglio@cloud.com>
References: <20260423200406.28178-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1776974657-2A374443-FBC3E0F8/0/0
X-purgate-type: clean
X-purgate-size: 1576

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
There's no much sense to split the header in 2 pieces, it will
just take more time and space to reassemble them in the final
buffer.
This also avoids truncating combined_length to 32 bit in case of
64 bit machines potentially avoiding following record_length check.
The function become more coherent with following read_record
function.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 7ccdc3b1f6..86c148c62f 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -59,11 +59,11 @@ int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
     static const char zeroes[(1u << REC_ALIGN_ORDER) - 1] = { 0 };
 
     xc_interface *xch = ctx->xch;
-    typeof(rec->length) combined_length = rec->length + sz;
+    size_t combined_length = rec->length + sz;
     size_t record_length = ROUNDUP(combined_length, REC_ALIGN_ORDER);
+    struct xc_sr_rhdr rhdr = { rec->type, combined_length };
     struct iovec parts[] = {
-        { &rec->type,       sizeof(rec->type) },
-        { &combined_length, sizeof(combined_length) },
+        { &rhdr,            sizeof(rhdr) },
         { rec->data,        rec->length },
         { buf,              sz },
         { (void *)zeroes,   record_length - combined_length },
-- 
2.43.0


