Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B497FC5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 18:59:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391430.1631250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7L-0005Bl-Hh; Fri, 14 Aug 2026 18:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391430.1631250; Fri, 14 Aug 2026 18:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7L-0005Be-EP; Fri, 14 Aug 2026 18:58:59 +0000
Received: by outflank-mailman (input) for mailman id 1391430;
 Fri, 14 Aug 2026 18:58:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wux7K-00051t-Mp
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:58:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wux7K-003WkB-3h
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 20:58:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6541-e002-0a2a0a5209dd-0a2a450ca5e2-30
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:58 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6571-f479-0a2a450c0019-d155dd2fb89c-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:58 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47362928f65so1275884f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 11:58:58 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f229681sm8682153f8f.16.2026.08.14.11.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 11:58:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1786733937; x=1787338737; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H8CEnLypOeiEHj/KssqxJXig/KwJTFmcmbXdDvWWB3I=;
        b=nfjLlvjMPuTRzIM01KfrmBgOE0M8n/L1O81Bgaf2ZorNW5mttMVyie3OQ0yuVKAoOo
         8rBe2zaqTsT90uNJ8yyi1BiAnziQJuDMDNqFFQecvM2LWBy9gRBA6BTDm5i2Os3nA5sW
         xVna6jZNu7S9LMQrScKz0YDupj84h0ygmvJUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786733937; x=1787338737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8CEnLypOeiEHj/KssqxJXig/KwJTFmcmbXdDvWWB3I=;
        b=nn/GXuZGoR5M2tBF9y9sdaPu3lLjzdEMPckRPyqE6kEupZxOMIi7k3f9rxg8xURXfr
         t41TApX5lQW6WseH4jKYOKeGnc5sTrw3iCcqk8rp8VX+DkWcbEbyYOhL6R4uuXwO/WpY
         AG2fz37OOpN5T8cpNuFaVoY/+JJWOdJPf82sVqmYqm0Tvb+7nNyw34ftL5S0rAohJ5al
         x6BUnSZhxLMH3Xf8M36eJe/+pVmbS20TN/doC0foN2glMG5OJ5Gx9VW/gdxq0gPJ1qME
         MINvbks0Iee8YCOWb3kkc/1NZE9vCLP8YrLTD9nJXAsieM0b/0rcpvvz6U3ffvryI13A
         aXdg==
X-Gm-Message-State: AOJu0YyaTsJbMD0FeBkJJyVyHzW9uFWitvuta2ybIXLcu9OY3gFFtdoV
	vDFjmnR6mOM4YXmA29tveun457xyudhBL0hJF5QXa7Mwm1Ihm4o1kv3qeqanY7ZOAQ6Y9Dq7CDD
	hyV7r
X-Gm-Gg: AR+sD11v2B5kb1PfPDtKcjJ0kEazO9P9e0tryz2otk6aVz2hC3qTUTy5fMK4nxlq81C
	nzYDHlkKtxf/qhN/ZKRTfwG1d5eea1kL2hwASoGEuNQ35uuM4X+SK0toEdZZRNgzagQhvPKvCis
	yzQFSc7uz21z/cvk3U1mYuBBALm1MVTB83ciYi/hnvyUhEulD2t1WPGkfXNXVRRDbDQJTu+Oi/x
	bzeqNqLinOHB8FvgNnHMEU5SNAokuMZOBSmrefyMCurxJ9CLgUhGU2ExDTGHgBWhzrVkKY/djNu
	zR2np/5h5iAjBCV5oWpp9HaWhlUEWzUv8Lwp6mi09ccs/T1KRwIvjBn9upeuOS/8U0mHkkVY3oO
	knBRBO3NdEK+od4lXrpJ7Y03dI9+vU8RwKhynemA0bCBTPG6QPYDEE++zPIwcOIxzvBhmnJH7iN
	3gnAHruZt2nO8jyqmLGNAfVdNf1Fft198Aljgpymj2350KQUaFHKKinj8uLaK3G6T4CSLqqn0oz
	1kjsfrN8o/9FsiaqnYF6h9cQPQ7u5bxIlG8Qect
X-Received: by 2002:a05:6000:2206:b0:47f:7aee:ed3c with SMTP id ffacd0b85a97d-481606fbddamr13030909f8f.5.1786733937018;
        Fri, 14 Aug 2026 11:58:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/3] x86/emul: Adjust comments in x86-types.h
Date: Fri, 14 Aug 2026 19:58:39 +0100
Message-Id: <20260814185841.1757421-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
References: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786733938-024DFA5B-D205CDE3/0/0
X-purgate-type: clean
X-purgate-size: 1295

x86_segment enumerates segments, not segment registers.  Adjust the comment to
make this clearer.

Fix a stray tab with the closing #endif.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/x86-types.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86-types.h b/xen/arch/x86/include/asm/x86-types.h
index 1c43421885f7..26b06aeac380 100644
--- a/xen/arch/x86/include/asm/x86-types.h
+++ b/xen/arch/x86/include/asm/x86-types.h
@@ -16,9 +16,10 @@
 #endif
 
 /*
- * Comprehensive enumeration of x86 segment registers.  Various bits of code
- * rely on this order (general purpose before system, tr at the beginning of
- * system).
+ * x86 Segments.
+ *
+ * Various areas of code rely on this order (general purpose before system, tr
+ * at the beginning of system).
  */
 enum x86_segment {
     /* General purpose.  Matches the SReg3 encoding in opcode/ModRM bytes. */
@@ -73,4 +74,4 @@ struct segment_register {
     uint64_t   base;
 };
 
-#endif	/* X86_X86_TYPES_H */
+#endif /* X86_X86_TYPES_H */
-- 
2.39.5


