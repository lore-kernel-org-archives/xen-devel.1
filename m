Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD70606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TMo/rHva
Received: from list by lists.xenproject.org with outflank-mailman.1471352.1679794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUBx-0005Ab-LM; Wed, 04 Nov 2026 06:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471352.1679794; Wed, 04 Nov 2026 06:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUBx-0005AU-IF; Wed, 04 Nov 2026 06:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1471352;
 Wed, 04 Nov 2026 04:51:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oss.patchbox@gmail.com>) id 1xOSxq-0004Qx-Dl
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 04:51:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOSxp-008rnK-JX
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 05:51:09 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oss.patchbox@gmail.com>)
 id 6aeab9a2-8faa-0a2a0a5109dd-0a2a4502ce78-12
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:51:06 +0100
Received: from [209.85.219.51] (helo=mail-qv1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oss.patchbox@gmail.com>)
 id 6aeab9b9-6ca4-0a2a45020019-d155db33e9c7-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:51:06 +0100
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-91c67992ce5so2910836d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 20:51:06 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e7dfe973bsm9124196d6.22.2026.11.03.20.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 20:51:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793767865; x=1794372665; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lko1J/xdlV9mXW4kngv+mqRt+rt4DBpN9L4JspYiP7M=;
        b=TMo/rHvacQX9Lq+rchRmEfUrQMBNGGQypMbapTXQdhcEQdwJ7JRJp5NmYv1+neVXl+
         mXQZXZGAeKqgPz5pXhV2OZKtefdGG7CRkhMDNrk++Rqu/5VBOTqiqiR1qe3G233QiSl6
         TBSrQCoZ+3sIdl7CxNXjFiT3yjoltYMR7fh0R6Klf8QgwTpB4mumP4EdRtwUebXZDM/O
         2pQA5aAACwSByKf3Pp32SgUGEMfzQXEv7MccCH07ifLkOpA1+WH8EOzvqLjSlASxamKA
         Nc36oGaQUPQN4zrxAk7FGQYiP7VEurW+USpQs+9prbOE1MlHsNztDyzWXm2tM5hq0bxr
         5sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793767865; x=1794372665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lko1J/xdlV9mXW4kngv+mqRt+rt4DBpN9L4JspYiP7M=;
        b=Ig+FvxSpE68nxRG3IdNaIL7hvNlCz3UsG2dTys04FltNhQNdXZbYfP1M1F56gByiTo
         d2OK2SJJiPyzymZrwe6htEwrUaVT01EnjPZTo0EELKwG6aWMzyMbn3Ozt3lr/QnCn6WV
         ZMX1kS82kJkABX4bYsll73OxjawSqVX29BWU9oZLEdk5fQNdeO8+/18cZhpI6QK8jAav
         nHxpjeQjsNGAfdPF9x5EjjBbB1+5jrpFJ5dx9jAiAjHyWXSFHNjTgMieHTG1wFnO/nLM
         k8hIH4FQgJe3E8Kos3DBXmkI//eznF9J+5FPIimMC0LpPis50ihtmPhw+GQJy2BMjsT9
         jfcg==
X-Gm-Message-State: APuU4Z9PDA/kyZ6No/u8Yp/J/djjyFBBk9eVgs3JhyWSdAvDN91mrMwo
	zefqr/mTo/eeV3Qqr/T4dKvTt5VL6LfvIse9MkQSIBlxlenYos8XXiyHfatxRw==
X-Gm-Gg: AYBFou3vHQguG17j492EHmcabt0jMId2FVB1kPLuOHOkBxVVOyTfhI6Bnu+hw4Xxp8O
	7WBHwl9MFT/PGHTzEK92g04aY1qtSb5q5hH5tMTYfX2tKimAqV2ZtV5TkWmmyHXB7+VH6gbvZd9
	L24iCeld3kVrNKxmn+xzzIwvhHVktHKv0OvypmWJ2DS6qgEvDigMy1FPuqomzT0XZLWV59gj8jM
	UVd6DVUF7dXOYfa4oxLKhF7a5dn3LS2Dws1OsVBWV65reCyT4PRnR3lyYCwkcuYwGo2yRwo5+uq
	TufB7gl/ijqzEqmy06HswYuLj5umFSa5EviLz/PRf3lI4QyxHleSwkVckO+xIqRftLq83+ZOBCT
	H9ung94DoFgB4GfLK8lnHq+G1PMcbyP2wWkVxy9wbei4jpmdJk8TGR2xOKASvFEkjvuOMeAOVaH
	yUomUxnESUlQFhauzjQWom+BOEOWpZRiksXCIaAiEBI9yQm+VZmGbdZWhTfF/N7OokAmY/Wyd/9
	m6mLVgj4n1z4OpycAbjat/pNEGc/KU2PxLPQ2+UVwkIvSw3iKeGd3P7EjCAC7Gms2kwXdUpkYtA
	ti7YxxOY/W4emd4+tNJNja0/lpf0ec9S8p8gZJCYD0UI2UWnRIl8
X-Received: by 2002:a05:6214:519b:b0:91c:64ec:33e1 with SMTP id 6a1803df08f44-91ca4bc6c82mr238028266d6.53.1793767865247;
        Tue, 03 Nov 2026 20:51:05 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] x86/platform: fix the MTRR rollback in XENPF_add_memtype
Date: Tue,  3 Nov 2026 23:50:50 -0500
Message-ID: <20261104045058.1434821-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793767866-668B42AC-F3DF2DBC/0/0
X-purgate-type: clean
X-purgate-size: 1272
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If copying the result back to the caller fails, XENPF_add_memtype
tries to undo mtrr_add_page() with mtrr_del_page(ret, 0, 0). By then
ret holds -EFAULT, so mtrr_del_page() looks up an MTRR with base and
size 0 and releases nothing. The register that was added, or whose
usage count was raised, stays in use, and the caller only gets
-EFAULT, without the register number it would need to delete it.

Pass the register number saved in op->u.add_memtype.reg instead.

Fixes: 8ee614278c2d ("[XEN] Fix memtype accessor domctls.")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Build-tested only (x86_64 defconfig); not run.

 xen/arch/x86/platform_hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 6dee4922f3..0f3c791fc2 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -295,7 +295,7 @@ ret_t do_platform_op(
             ret = __copy_field_to_guest(u_xenpf_op, op, u.add_memtype) ?
                   -EFAULT : 0;
             if ( ret != 0 )
-                mtrr_del_page(ret, 0, 0);
+                mtrr_del_page(op->u.add_memtype.reg, 0, 0);
         }
         break;
 
-- 
2.43.0


