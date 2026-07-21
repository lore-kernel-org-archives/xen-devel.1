Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85127C44533
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:57:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367907.1617577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCq9-0003xl-J9; Tue, 21 Jul 2026 15:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367907.1617577; Tue, 21 Jul 2026 15:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCq9-0003xe-FF; Tue, 21 Jul 2026 15:57:05 +0000
Received: by outflank-mailman (input) for mailman id 1367907;
 Tue, 21 Jul 2026 15:57:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wmCq7-0003YG-Ue
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:57:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmCq7-0030N8-4j
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:57:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96a5-2eae-0a2a0a5409dd-0a2a450bdfd2-46
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:02 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96ce-b7e8-0a2a450b0019-d561b338c9a4-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:02 +0200
Received: from 186-249-149-197.shared.desktop.com.br ([186.249.149.197]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wmCpx-001fqi-Oj; Tue, 21 Jul 2026 17:56:53 +0200
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
	bh=De2dzZj2ttdukFtf63NNllXcxOhpCCmsArNb8hGxCvQ=; b=narRMe9qdgSyv2htjupS5xLCA/
	UpBYEUhR2i7F/ieE7TontYsiFUncVK+69v4Zh6RreeDii9nB5w0mQ/aC83KKCzLthuHglKUcYDjko
	u0Cs3LJCpghLi0lNGq+IcEyNpfEL2wVLDToXk09DFSc5KghK7ihXvzoVNm4zZ4CcP2+MKIgelye0E
	tPvA1WtxAd94eKFrS9Fot9kNePPEkXciEOfL5JniFP9DWPzl18KD8YGFqCyohIyZ8wM38mRYXw7RO
	L9jxpje39WQcyovalSh1T/nkn+h4gQawnjhvCxX5ydVUVcI4rE4mY7RvOoKNKr2w4EZ7sDPHeyiGL
	i7oZ772w==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 21 Jul 2026 12:56:43 -0300
Subject: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
In-Reply-To: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-42698a/1784649422-AB2DC9EA-B8750806/0/0
X-purgate-type: clean
X-purgate-size: 1320

Add the volatile qualifier and clobbers parameter to prevent bugs with
instruction reordering and optimization.

Also check the zero-length case, as the 'repe' prefix does not run the
'cmpsb' instruction if the 'count' register is zero, which doesn't set
the condition-code/zero flag, so the result is based on a stale flag.

Those are pre-existing issues found by Sashiko.

Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/include/asm/shared/string.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dccab3cdac281d67aef5d44 100644
--- a/arch/x86/include/asm/shared/string.h
+++ b/arch/x86/include/asm/shared/string.h
@@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_
 {
 	bool diff;
 
-	asm("repe cmpsb"
-	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
+	if (len == 0)
+		return 0;
+
+	asm volatile("repe cmpsb"
+		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
+		     : : "cc", "memory");
 
 	return diff;
 }

-- 
2.47.3


