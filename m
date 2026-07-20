Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F6DC44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367367.1617148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wltCA-0006Ky-Kv; Mon, 20 Jul 2026 18:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367367.1617148; Mon, 20 Jul 2026 18:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wltCA-0006Kr-IA; Mon, 20 Jul 2026 18:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1367367;
 Mon, 20 Jul 2026 18:58:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wltCA-0006Kl-56
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:58:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wltC9-00AwZr-33
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 20:58:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a5e6fa4-5cb7-0a2a0a5109dd-0a2a4508e5e4-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:58:29 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a5e6fd4-f659-0a2a45080019-d155dd2ee5cf-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:58:28 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f707e5d75so1106825f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:58:28 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eea8afsm33778107f8f.33.2026.07.20.11.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 11:58:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1784573908; x=1785178708; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5799y5iIIojFgzqH1Ihy5MpdLnEhNiqlo2EdcvUAiLs=;
        b=aboz95hAR0bzsCMq0DperwxgNGMDIlBwH4X5lK0LLwxP3DRnxbcnchsHF1PsyiY8js
         oDrt3BGlRVkYA3ORQPfVFVIguHff4c2MjUd8IBOltXubMDrBO+UV9O0cXNqjOUm1yM4t
         d373+MgGqJ5TP4eFhFMfkUfxay023V2Sc6lxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784573908; x=1785178708;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5799y5iIIojFgzqH1Ihy5MpdLnEhNiqlo2EdcvUAiLs=;
        b=V3fR5jzTXwEEXVjYzE4zlP2IK/2bTfVosmwWTmEWwgm2E9rfUq714M2vYPXQXLRhUV
         6R1CCB9ciVouUsvyok+VOgfxAdqGryRIIISmFCMYGtpU6UcFC8JnV9WMCjYDuwUaPZH5
         E6H3GPndHuUtZOZVqhTwn5pH+VRguME6ZDWM0UYDVLfrY9p4VNPpMJ9rN2uA142A5aTT
         KDfCMxxtfQH2jxoCBkEPKt4pq2+7oTTWj6kV8+xzgHG1AJOMtzG5zvpsCKsbLiR0NHvq
         leXkQqqei7VMc+k7eguIi59CGAGEr2Gy2WM8mdQABYTLNTcs+M/SNNcKqAW8I8cuneSQ
         SuCw==
X-Gm-Message-State: AOJu0YzzwFC2tEHTxBR/K3kP/OldW9/uyZURWZvJytki5Hl8iCVGlFW2
	WgAG+Km6Ex6l1TnuceDKnkSTrW3RYLebABY3R0fgUt8PYTtzx6dnu0k5itYJ++qXxliXKEDoV1P
	PV1927NE=
X-Gm-Gg: AR+sD11G9u0BO2aJ2zyZZ4rsbdcJYEq3pJ3D7Jk3PgzWBVBDLcH9PdbpVyIjoMnuSkc
	j4nL3F3wNdCU11W8eT6h5tD1I0fGUXufgn5WOh00PqmzjsbUGmypjPFKtE3h3KdCXG9DIYez+SG
	U31q/bP9F7jWVQr1Alia8lRGjUTF/FQJqaevQxC7onpkpfZvbX9PLUiQtzw0wOEjYgZVCHpcPRF
	d4pgVNiiXa4rkpleu+qYLLlqo/2VmtWbjubJm+bZKnbBD5dqw8f1sIRtK6yt4ynINOpE4OjiUTg
	0m3R2AJJlznjAjYtOFKbxebq8eW8jx4OPDBO24ftjixhkh/x+gWKx4Uuw/BEh2xBIsNkqlDUd13
	0tINTNYuMCIm5B7g8coSTGQDUfwmlsX1Cjh6Om+oT7pYRDEpgNVaqFMEahNu6/qNHN+3XoZbgAY
	3K/ipH2ojTERX1/1pqLXgjgIv0eIr44owd2c/2bERkp12ANA4fMVxI
X-Received: by 2002:a05:6000:2383:b0:47f:778a:60f0 with SMTP id ffacd0b85a97d-47f778a6147mr7208181f8f.4.1784573908108;
        Mon, 20 Jul 2026 11:58:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] xen/kexec: Wire up kexec hypercalls for PVH hardware domains
Date: Mon, 20 Jul 2026 19:58:25 +0100
Message-Id: <20260720185825.2204624-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784573908-D574B87B-316EE8D5/0/0
X-purgate-type: clean
X-purgate-size: 1564

Nothing in do_kexec_op() is PV specific.  Plumb in PVH guests too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

kexec-tools in userspace still has a PV check needing dropping before kexec is
generally usable for PVH dom0's, but the Xen side should be all fine.

Bloat-o-meter reports:

  Function                                     old     new   delta
  hvm_hypercall                               2118    2309    +191
  hvm_do_multicall_call                       1366    1411     +45
  Total: Before=4226938, After=4227174, chg +0.01%

which reinforces my hatred of this entire infrastructure.
---
 xen/include/hypercall-defs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index a625d634b694..79ee72993dfd 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -280,7 +280,7 @@ sysctl                             do       do       do       do       do
 domctl                             do       do       do       do       do
 #endif
 #ifdef CONFIG_KEXEC
-kexec_op                           compat   do       -        -        -
+kexec_op                           compat   do       compat   do       -
 #endif
 tmem_op                            -        -        -        -        -
 #ifdef CONFIG_ARGO

base-commit: 50e7b8a32dcb1360dbe9e0fa8b81a3ad02d0b670
-- 
2.39.5


