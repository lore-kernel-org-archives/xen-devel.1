Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E029C624D6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:44:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405699.1639175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNc-0006po-Ox; Wed, 02 Sep 2026 11:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405699.1639175; Wed, 02 Sep 2026 11:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNc-0006pE-LF; Wed, 02 Sep 2026 11:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1405699;
 Wed, 02 Sep 2026 11:43:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x1jNb-0006XK-6f
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:43:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jNa-002dpt-JZ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:43:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bf1-2eae-0a2a0a5409dd-0a2a450c86b0-4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:46 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bf2-f479-0a2a450c0019-d155802ced19-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:46 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so9470345e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 04:43:46 -0700 (PDT)
Received: from andrew-laptop.. ([185.110.61.35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46422desm61190055e9.1.2026.09.02.04.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 04:43:45 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788349426; x=1788954226; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPYy19A3VYnJ024xk3KSPpW7Iy5omW83P4l1qm8dQF8=;
        b=IO6uFrMWviobIVYavFcstMOKvicLVopc8qCNhnPgWraK5QuVGVB4jCehrAfbKY+o1I
         zoqVmyEGT3MgrZ47YgssqqCkZuA0p/+F4bwI8W14JjWonKpcdzfmiNRkX30sh8ymQ5ms
         lBVhYLtCFFe5NckXzMa9FI0qR0P2/Q0+BVdPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349426; x=1788954226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPYy19A3VYnJ024xk3KSPpW7Iy5omW83P4l1qm8dQF8=;
        b=C9gRq8VrmS6oPi1nEguj4aUyQBX/oRzNmbIRp0kxQy6NsUhOmxdHzR0uBwyciWndhB
         drzvcgvD5rDIi0sTMi94LNHEgHEOBnw+ig8ARjWiRujBKz4GE5gRNszkz7VANlyCBEl1
         a0XvuY8OMhVbRj+AxBVyC5uHp5ObFN7oWXByRdnWaFOXu0XcrgVnQVb9F4qC3T3OYmz0
         J/o0TiIuLL1LRTiwn/5exDTFZ1CxN5QlJh/FI/Da5/7jcAmkmS0FiM3kX4idJQvlR8zr
         QpQ2P5XBbSqa+Z0ysElzfJAc1AQgLhg6GKIiMfM5SSwId3IiqUujr51fudEnXsLeuZRi
         dB2Q==
X-Gm-Message-State: AFuF++lHNqHEeQREgQoIW+lkI6WyMY+Ro+sTWd/EQryvPt2U7wDH8Zk4
	YmmvEF+tvuUG3sFw0vNIzK1g3uBloZT1IPRViV5vsuu34BeTUsqqA84qZ+9yUA64DJlrcnD2cD9
	oRQbXMRg=
X-Gm-Gg: AR+sD12ignx7cKVomi4oOlW5loU8HJEIsASsu+HBT35qqcqVnLIQV9xQOrZ8INujhJm
	Ggk53+ptOkgiPaJ3RWP3E5UrE0eqD7r4Wglh4yuTh9VJO+/be2njWWhkGyWbfSPXbHQ5wuq1ghv
	fTvemrzd5kQ/ON8P1C6aWV3a5VOZUloTnwzjv09W/rEqxT1A4NpU6IB4J5LzRwxe/6h1HWQyB+b
	sEq3BlgAiCFfTdzNeUw+t/lXEIECyaDG2psIiZxm5TVGC0Fspw8dfEddVMQcSMFTtk0bvHG3Xzw
	a31Y6vZ3P9Bb0vYjwBihj5nbFylzgGCPgUg11GWv+oxBNDnSQ6tRafq+PBeaq7fRQ7YqTmMAzIG
	lxJozXuLWqPnThY26f7G+nV63UJJYzsaN9CK4kAWMAYlK1E3PM2jvhiKRGVzHvy6hp1Yx+fsJhK
	8y09xnD8wbyLs8Eu7qOj7AoT1w7zr0H/B2InoMhvuCOZe8aMss27i9NxtX+FdVOLeCLaI+M3Aj
X-Received: by 2002:a05:600c:1906:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49ce57e7a9dmr68340755e9.4.1788349425726;
        Wed, 02 Sep 2026 04:43:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/4] x86/bitops: don't cast away volatile-ness
Date: Wed,  2 Sep 2026 12:43:39 +0100
Message-Id: <20260902114339.62043-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902114339.62043-1-andrew.cooper3@citrix.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788349426-5270FA5B-662980E7/0/0
X-purgate-type: clean
X-purgate-size: 2542

From: Jan Beulich <jbeulich@suse.com>

Doing so, besides being a bad idea in general, violates Misra rule 11.8.
Use the helper macro we have available anyway.

No functional change intended.

Fixes: f1879b2c2584 ("xen: introduce generic non-atomic test_*bit()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Rebase over removal of ADDR.
---
 xen/arch/x86/include/asm/bitops.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 45fc64474344..8f6bea388035 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -185,7 +185,9 @@ static inline int arch__test_and_set_bit(int nr, volatile void *addr)
     asm volatile ( "btsl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (*(int *)addr) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (*(volatile int *)addr)
+		   : [nr] "Ir" (nr)
+		   : "memory" );
 
     return oldbit;
 }
@@ -233,7 +235,9 @@ static inline int arch__test_and_clear_bit(int nr, volatile void *addr)
     asm volatile ( "btrl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (*(int *)addr) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (*(volatile int *)addr)
+		   : [nr] "Ir" (nr)
+		   : "memory" );
 
     return oldbit;
 }
@@ -247,7 +251,9 @@ static inline int arch__test_and_change_bit(int nr, volatile void *addr)
     asm volatile ( "btcl %[nr], %[addr]\n\t"
                    ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
                    : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit),
-                     [addr] "+m" (*(int *)addr) : [nr] "Ir" (nr) : "memory" );
+                     [addr] "+m" (*(volatile int *)addr)
+		   : [nr] "Ir" (nr)
+		   : "memory" );
 
     return oldbit;
 }
-- 
2.34.1


