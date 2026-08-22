Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD61FC5DF9C
	for <xen-devel@archiver.kernel.org>; Sat, 22 Aug 2026 18:33:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398245.1634673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWm-0005mf-Gn; Sat, 22 Aug 2026 18:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398245.1634673; Sat, 22 Aug 2026 18:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWm-0005mW-D1; Sat, 22 Aug 2026 18:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1398245;
 Sat, 22 Aug 2026 18:33:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wxqWl-0005mF-IF
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 18:33:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxqWk-00A7NX-An
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 20:33:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb36-e002-0a2a0a5209dd-0a2a4505d466-26
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:09 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb65-4cb1-0a2a45050019-d561b338b6d6-3
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:09 +0200
Received: from 186-249-148-4.shared.desktop.com.br ([186.249.148.4]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wxqWY-007bWT-8S; Sat, 22 Aug 2026 20:32:58 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=n2eXcmcuOEY5+UkfCm5BTRwUz6gPnjMX1HXpAy+v/E8=; b=cP6yEYns8j2dRwJXrWoFYQ5BVR
	qfq6ToaLjISpVJANbLI3P1DvSluu2WkFJEVIqY4tE2Z7T9SwN1Jdw+eF0y1CxZ7RmG92O2tAcRVkv
	LjqxzDHDLDiX7wDdGalIqKDBD+LU6DXJEezoQ06jxmkGwWW/1jdUEHTdES/+mh1beEwdMW3c3i8Ds
	VPHlyVJd8FnmCKFLJaEuusG1OuniSIPpRQmnWuyT9gp9r16spbqif03L9VUxfuKJBW+GaPwopDlHF
	GXkGqQWsMf8e6DlaWBbu6z1gw/Ypw830A2mbdmFKoQlrvC24qcuV3zeLzYdBYueKWItwzWNzzvZ3n
	e5tBH3ow==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Sat, 22 Aug 2026 15:33:17 -0300
Subject: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
In-Reply-To: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-c201ff/1787423589-2491C2A1-02535D52/0/0
X-purgate-type: clean
X-purgate-size: 1843

According to the GCC documentation, conditions in the flags register
(e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].

Also, clobbers (e.g., "cc") may not overlap with an output operand [2].

Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
"=@ccnz" output operand.

    """
    6.11.2.4 Flag Output Operands

        On some targets, a special form of output operand exists by which
        conditions in the flags register may be outputs of the asm. [...]

    6.11.2.6 Clobbers and Scratch Registers

        While the compiler is aware of changes to entries listed in the
        output operands, [...]

        Clobber descriptions may not in any way overlap with an input or
        output operand. [...]
    """

Reported-by: "H. Peter Anvin" <hpa@zytor.com>
Link: https://lore.kernel.org/all/5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com/
Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length test in memcmp()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Flag-Output-Operands [1]
Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers-1 [2]
---
 arch/x86/boot/string.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 1632d40e1f545ae0665597069b568ea6b6c263e5..03278b4393887cb71cb063818d3378c4f52b06f8 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -40,7 +40,7 @@ int memcmp(const void *s1, const void *s2, size_t len)
 	asm volatile("test %3, %3\n\t"
 		     "repe cmpsb"
 		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
-		     : : "cc", "memory");
+		     : : "memory");
 	return diff;
 }
 

-- 
2.47.3


