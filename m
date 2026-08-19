Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE7BC5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 18:08:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395741.1634009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwkhy-0006fK-Dj; Wed, 19 Aug 2026 18:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395741.1634009; Wed, 19 Aug 2026 18:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwkhy-0006fD-Ak; Wed, 19 Aug 2026 18:08:14 +0000
Received: by outflank-mailman (input) for mailman id 1395741;
 Wed, 19 Aug 2026 18:08:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1wwkhx-0006f7-9f
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 18:08:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwkhw-00AHdd-It
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 20:08:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a85f0de-e002-0a2a0a5209dd-0a2a45048bfc-28
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 20:08:12 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a85f10c-b57f-0a2a45040019-d155dd2fb0f9-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 20:08:12 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-472326ca506so904002f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 11:08:12 -0700 (PDT)
Received: from debian.debian ([102.213.48.6]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b145d31bsm6958670f8f.16.2026.08.19.11.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 11:08:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787162892; x=1787767692; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsZf5GBHmMPiBkZ0qQQi6d95RzL9J4vmayfNExw3wK8=;
        b=dM6GcryeHaguYc8kKkxRpnGPR61MuZWYCKiJp+MtlwKKbFCt7aEbuo7UNxJ9SGq+zr
         JxgEtvxBKyCoQMpalDcGL4yTWa3P6Ke8ouDK3+xvIVm7gKzu2p16YLlN7Z9LXwgYGvAN
         YXXA6VyuRnlCe1vVtG65QAX9kKb6cpUgah+1pbE/LCG6SZwciIQjP8vImgblGduCXvu3
         Lbos6KjvXmiyQDzHNUGTeUnMheNn3nYXFPEXTLUpczN2C6KCBAPMTPzlVWBZ18LczBll
         4eN1JANF/rM0ciH8yLRUOCKWhnjPFi7PnNMdNTTseSYVfm11qiA/UFOlL/oYe2ebasl3
         z7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787162892; x=1787767692;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wsZf5GBHmMPiBkZ0qQQi6d95RzL9J4vmayfNExw3wK8=;
        b=JsFkPokC2IA0HxyD9iWVdMmXgok+UJO643RLAQlL8nY89Z5saoYqwPKazGsom2w0LC
         hkEKZ5ESBsfrLhgFNjvsiXggytkitpNxApytws/nJKF1juzDsIsvngRfnEJVlP6lHaaI
         fF7WTWSXe1yoSDPRngIH2JXRb+P0OP+hHoyqMxpfTa/S0ky/2dnkua5AoXYn0DdyUgR7
         PidPGn1WwYzgTzlDPPtz0AWS+lxbJdNDchJ56Si8UB0Sb+aa95wjNzpr4+ZeLUdi+X7H
         KxCLTSpYgEGKl4GZulKBnRAHyYGZMN4A6tuRPYxqC4uB2HDoAa5h6ucokyGRrNT4iBLq
         unZA==
X-Gm-Message-State: AFuF++mTX2YUfRnnp5nYAI5aEp9zhNTPS6XMnkiKHrkelznMM/NrEqqR
	xbbSwwwZTQIWzXJmkJzoR3FbGKtz0BZwIFm1O0NOAZQz9WQHTfnK7IMs31vSU2COAK8=
X-Gm-Gg: AR+sD12w55joxF3lYAWbEErPKK1Vj7uhPO+po6APkoQuTyzIRTHrfHFUR5bIY4DTLKv
	PZnCDmcGHpBmA+i6CxNgjY3VgJEmYNY8nfgVH8TfTdi2kskggg+Aynrfdav9KQvgQnddjeGGbFq
	VakRl8J0foMEEjuKc1qBjjmY5is0SdytsgTZEHouBUuJcYC6tkBZss62Ca1mAaHuJSJth945KsY
	9MXfsg3mt3X01YmA1SqTg3Pmty7zG0YE/ZLK4uY7gJd/XEKHLPJB8DHehUTSeuvf9Ll6ojFgqtV
	wWgM74B/q4YIDvR2IPijau0DJkGpaoetac/lw2zW46KFyK59OOEHxm8jllEyrPSHmwgU4f2Xde4
	bsJU4nVT6AN1ptMKAbytxeqQYrmWq/eQJxYUBTEnfhRB9naPKkIBMC8eAx/CMlb730WjnsgapFL
	b2+X3rgYnMrhIx3XooD/3dxrRR+EMy4pSnctG4/BdSuvkLmJT4YZiQlStF691iPd2uHpD7dA==
X-Received: by 2002:a05:6000:41fd:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482b1fef313mr12519204f8f.17.1787162891893;
        Wed, 19 Aug 2026 11:08:11 -0700 (PDT)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	anthony.perard@vates.tech,
	Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [BUG] x86emul/test: avoid assertion in emul_test_read_xcr() when XSAVE is absent
Date: Wed, 19 Aug 2026 21:07:34 +0300
Message-ID: <20260819180735.135911-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787162892-C3EC6B50-8A026238/0/0
X-purgate-type: clean
X-purgate-size: 2800

While running the x86_instruction_emulator fuzzer via AFL, I encountered an assertion failure in the emul_test_read_xcr() function.
The fuzzer is able to generate a CPU state where cpu_has_xsave is false. If the fuzzer then generates & feeds an instruction containing AVX,the emulator
attempts to fetch the FPU state via x86emul_get_fpu(), which then calls emul_test_read_xcr() and hits the ASSERT(cpu_has_xsave). This assertion crashes the fuzzer.

The crash:
1. $ ./afl-harness < findings_dir/master01/...
   afl-harness: ../../tests/x86_emulator/x86-emulate.c:179: emul_test_read_xcr: Assertion `cpu_has_xsave' failed.
   Aborted

2. The stacktrace:
(gdb) bt
data_p=data_p@entry=0x55555604f320 <input> "\244\264\336\346\337\001\254%\247R\216d\204*\234\377\377\224λ\3237/\365ʿX\266?\353\036\227/\0323\351dj\257\v\207\031V֖\235{\036\225|:M\330\336 \314V:&\357\306@\224\331,\301\300\372FW\262.\020\\\276\244\203\242\276\262\022!\337)F&\261\2064\200\200\377I;J\376X41\2061\206\325 \021\017F\026\267\275\340\361\357)\255\343\237n\377\374n\357#ֽ\226\365d",
size=size@entry=580) at fuzz-emul.c:934

Possible fixes:
To prevent the fuzzer from getting stuck on this state,would it be better for emul_test_read_xcr to return X86EMUL_UNHANDLEABLE (or something similar) instead of ASSERT(cpu_has_xsave) ?

I have attached the binary crash file(converted to Base64) found by AFL below:

pLTe5t8BrCWnUo5khCqc//+UzrvTNy/1yr9Ytj/rHpcvGjPpZGqvC4cZVtaWnXselXw6TdjeIMxW
OibvxkCU2SzBwPpGV7IuEFy+pIOivrISId8pRiaxhjSAgP9JO0r+WDQxhjGG1SARD0YWt73g8e8p
reOfbv/8bu8j1r2W9WQAJnNNzsTXiDzn+tIYXP5ib7u5oA9GFre94PHvKa3jn27N/G7vI9a9lvVk
f/9fO1wsISMXjMG1qMtVHNLp6uRBZb1cV0Ybc1T5SBvfAawlp1KOZIQqnP//lOi70zgv9cq/WPWk
5MOmSoAqmv+M1R9Sc8UnJgEA9fX1IvX19fXu9fX19fX19fX19fX1/+dKZ6S03ubfAawlv1j1pOTD
pkqAKpr/jDcv9cq/WLY/6x6XLxoz6WRrrguGGVbWlsD6RleQLuUQkKSDoqayEiHf1kYmsYY0gFPE
gP9JO0r+VzQxhtUgEdeIPOf60hhcBmJvu7mgD0YWt73g8e8preOfbv/8bu/c1sbQS2L9zkVE9Ohz
xScmAQD19fUi9fVfO1xJAAACAMG1qMtVHNLp6uRBZX+AAAAbc1TaSBsdNdgkffrwwtCPjXe/D62n
Z+mGpLTe5t8BrCWnUo5khCqc//+UzrvTNy/1yr9Ytj/rHpcvGjPpZGuuC4cZVtaWnXselXw6TQAP
f/9WOibvxpCU2SzBwPpGV7IuEFy+pIOivrISId8pRiaxhjSAZWVlZWVlZWVlZWVlZWVlZWJlZWVl
ZWVleGVlZWVlZQ==

Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
 tools/tests/x86_emulator/x86-emulate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x86_emulator/x86-emulate.c
index e2fbeb52e7..4d0b4610b5 100644
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -176,7 +176,8 @@ int emul_test_read_xcr(
 {
     uint32_t lo, hi;
 
-    ASSERT(cpu_has_xsave);
+    if ( !cpu_has_xsave )
+	return X86EMUL_UNHANDLEABLE;
 
     switch ( reg )
     {
-- 
2.47.3


