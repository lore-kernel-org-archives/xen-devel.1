Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E8606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=mGPC5J62
Received: from list by lists.xenproject.org with outflank-mailman.1504055.1699622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd5-0006kw-U0; Thu, 26 Nov 2026 21:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504055.1699622; Thu, 26 Nov 2026 21:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd5-0006kI-OJ; Thu, 26 Nov 2026 21:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1504055;
 Thu, 26 Nov 2026 21:03:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xWgd4-0006ID-5W
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 21:03:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWgd3-00Gh7b-IS
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:03:41 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089e8b-e002-0a2a0a5209dd-0a2a4505d4c0-30
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:41 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089ead-4cb1-0a2a45050019-d155802fb4e6-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:41 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4bb69f5b161so48613465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 13:03:41 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm570536295e9.1.2026.11.26.13.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 13:03:40 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1795727021; x=1796331821; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KsoWdzVqgLh50C55Otz6lIcCOhPOwZrY/bEiWn2xKQE=;
        b=mGPC5J62uAbATfY4xSq9Gdb9hoY/qPrRfdIV9thpLeZ6+ZlVTG9xSjs19mPoDnEJ1A
         sl+krgHQUh5leUcmOZQ6CfeSoONgNGrS3XnwNsrRagUKzEyc0gchrF4as0BWtGZfnxuf
         W3e572FaV93pv+3pKnU7I9SnsI1B0o+LXZS3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727021; x=1796331821;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsoWdzVqgLh50C55Otz6lIcCOhPOwZrY/bEiWn2xKQE=;
        b=fUtdnI4qZq9/WGsVbx+wQOgVHP2C7i35K2c4HxQsoVJxe26/85jsXYgVZzjVHe1m7A
         L8OxPXWUOTruq14jfDO9fLxnM8/2CtMFnewTuDhyLVLINspNYyPXowHFT9tUQA0JxjQz
         ZGwelNS59XzNVlN8O8qbSiTmeXXzZqrma6+rIeYBkShfgWyxNzA35RfQUr54LJ69hrYf
         OCXe7P4N24QI06NPgDvn9ET2wo0mZrpSlDiJd+0iARBadSpC3Ze5HkHXPtFgugcaX2FS
         HDFJ5CxyfAs4BzEwdIuLY4q2rcfi7NSyGpW1XBmkzx3z0n8WoPcd5mNlzaaX4iq1pISM
         7Ehw==
X-Gm-Message-State: APuU4Z8MHXol3f9eLmrIuic8xTX+aV5PfexdjqfAHzQr6MJuDQjWM0fX
	lomRnn4Io0X+C92VubGUsOuQvvvu6Wbma9Wz3+ONnifxmRncvhS5wCrG7PZDpMx8TP8Pwz+XwEs
	jNLu/cSE=
X-Gm-Gg: AZFdTZcMkCJS7LiBAePR/Yh7auczrXmx2lonWc4Q4nEEK3rtgwLnZSgKJck1IWPAo41
	qbLLMXgLkzhHstS41dQNArhasXXBYjN2Vieu4JrMFQHiZcuthbVo8+NACp1kOp+Viwu5g+N/GA0
	C6ZA8tIWeEqtXWmM4CA6tw/48D5adUNFJK6+1Rn6l1VB2OLeKCTyviAq1V0hv5qEIlxGaw4wMVn
	cv1Vw1k0Is88+z0Qli8UmF3eVK6iSfZgzvOuFtslsJN2qMe77IF2f9Qx8nUUMi3wwG/xA5Nqo9r
	WZmYh+/SC9cKOap87biyDv317Xw/+/3Hgzsqa4TIHPp1lhZ0pAu1T2D+0Zs9dGZGq4gZrmrWBaz
	m9L11SivVSix5egyfdBVBZjnQRG0fYXeqiPYsrvnVka+itsSOXyZ4WwSzD+hHrDOUtrUcm6MUeN
	keWh07bB9O6APNG7PvORPlfTIx82CUXs2mP3MkwWlQOR1J71FvsQ3tCtWnwNlulz/fHKyrxgGBV
	00y08d+BF/sWVaWOE+rMzXPP79Se+zG7NzF5BMoQctMlPE6tE5QE783qejZ6UmRr67kwW56Anj9
	jzkNdWjiu4/Klpm7ZaszQFavLkyFOJvZ2UaNgKuD50GtAn0w1qATLxU2fI6T4ygw4BGbtNm2d8D
	DEPc=
X-Received: by 2002:a05:600c:3113:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb88816b2bmr480697455e9.27.1795727020724;
        Thu, 26 Nov 2026 13:03:40 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [PATCH 3/4] x86/efi: Split .init section to satisfy Microsoft UEFI signing requirements
Date: Thu, 26 Nov 2026 21:03:36 +0000
Message-Id: <20261126210337.746228-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261126210337.746228-1-andrew.cooper3@citrix.com>
References: <20261126210337.746228-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795727021-71CA82A1-59987A2E/0/0
X-purgate-type: clean
X-purgate-size: 2940
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Since 2022, Microsoft require that sections are not both writable and
executable, in order to be able to apply W^X restrictions.

Xen specifies SectionAlignment=2M, which technically requires that all
sections have such alignment.  For now, only separate code and data sections
in this way.  This is good enough to get an OVMF based StrictNX test working
in CI.

In the longterm Xen needs to be reworked to use SectionAlignment=4k, which
will allow us to become fully compliant without more than doubling the size of
Xen in memory.

Link: https://techcommunity.microsoft.com/blog/hardware-dev-center/updated-microsoft-uefi-signing-requirements/1062916
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <freddy77@gmail.com>

This reverts part of commit 1308f0170c1f ("x86/EFI: warn about r/o sections
requiring relocations"), following the work to ensure that Xen does not write
into read-only sections.
---
 xen/arch/x86/xen.lds.S | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index cef3d404a1a8..474cdd95c9e8 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -192,11 +192,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.multiboot)
        *(.init.text)
@@ -212,12 +208,19 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
-  DECL_SECTION(.init.data) {
+
+#ifdef EFI
+  /*
+   * Xen.efi specifies SectionAlignment=2M, allowing it to be constructed with
+   * superpages.  StrictNX requires code sections to be non-writable, so
+   * .init.data must not share the same superpage.
+   *
+   * TODO: Rework Xen to use SectionAlignment=4k.
+   */
+  . = ALIGN(SECTION_ALIGN);
 #endif
+  DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
        *(.init.data.page_aligned)
 
-- 
2.39.5


