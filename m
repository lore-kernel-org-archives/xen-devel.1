Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18759606A32F
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=bhuUbDQy
Received: from list by lists.xenproject.org with outflank-mailman.1471921.1680046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObOw-0003VT-MD; Wed, 04 Nov 2026 13:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471921.1680046; Wed, 04 Nov 2026 13:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObOw-0003VK-Ja; Wed, 04 Nov 2026 13:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1471921;
 Wed, 04 Nov 2026 13:51:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xObOv-0003UD-Fb
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:51:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xObOu-00EfW9-Si
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:51:40 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aeb3869-bab6-0a2a0a5309dd-0a2a4502df3e-0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:51:38 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aeb3869-6ca4-0a2a45020019-d1558035d9c5-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:51:37 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so5588575e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:51:37 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4107b7198sm27919235e9.0.2026.11.04.05.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 05:51:36 -0800 (PST)
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
        d=citrix.com; s=google; t=1793800297; x=1794405097; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OqSioAZzTvnhGM+tiUAbYDv/FOQtdV5dVRzP9neOBc4=;
        b=bhuUbDQytX7y1xM9E0HcOSYH2RFcAQGxG1ugvGsa2pz6W4fbsP59A8PmZy/ppRCpFP
         akdrckLC+7rxSzh9LwmB9awZEUEY7JbORxzWYEm8M63tQ7NGXy/yXSY7W+GR2r6cO2+r
         mzBC1lzGWIThFlLUj3U2I+gH4MHhDx9keYKlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800297; x=1794405097;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqSioAZzTvnhGM+tiUAbYDv/FOQtdV5dVRzP9neOBc4=;
        b=hNMMDrNJ3Yo2sI4iE3mIYlY/b9mAQd3DheChrZmyAKWpeyALwyBPoSZlPL2sjF6sdn
         +hBjMzHnIxT0gIEV0X+LaD9q4PJXySrw29VQp+2LhmpQYPdHnzKb1IexeKJ0Z+QqBVns
         LUCTOlN/hQCAt1TrSpFDjasMw2bFmdl9S/GyIepPYnXI+oxqk/RvXi+oRx92OTEZYv6x
         zv8ESCNskafS8xiRCLIdjMOGHZXCP0RrC5wm0izU99lIvHkB5p+l7wuTjlQmiR3Dcb+X
         V4vI9wXAq6Vga0m8fuD45PwD/9cfWFCQG+l8QqbOnyvFw34TwRrloXbM8h2WjBMxJuiL
         8GZg==
X-Gm-Message-State: APuU4Z9z2MZNq3gaCs6OwLSD6ZMPRQ73+CEtuqCyDbNuNFA4u5tVD1AB
	2DaZEZ4zeXGHSZYtLY2pvbBfB2ZW76rdIyCb+jXsMISJrOeNUD41JrnVp8QSvn6/GWc/P3XjyUs
	b6nbJYNc=
X-Gm-Gg: AYBFou1ueQJ31c7skZGgwizJ0hoi2aF0kcLCAabNfhGq8Qt766p+zeaeCqDgx/MHsN5
	vp6q2+8CKF/+e4C2yoJLDmq7rLTCnWB8JhW29I13J1bMldOOHJjOEmeB6zhbSsrU+5YC7T5WA3u
	C8xDO08HF0aVVwzKZz2hwKIP7gGAxn3/tDV2d+mLLGZiwv4StlmI34P1Omeq4onEghg6/tdGhui
	0vTvrTCn5rLSqV/n16zx3RnR7FZXbTc9hVFM40IAcS3PLec2CgJZLP+842a3qTm4fGNcG9K5ZHh
	mIsLRovCTrpR7epM38Y21uBn7qlk33W+ny4r03gbS+5eJlAbWtSrJWm+Grh+aEielULzaTGnkwM
	AtANSyqs9qSnJb/iflTwxrQ8i7AqMJggqhFRLulMG8BUB4VUwNhlDChU7VecK+zUU7HlpK2956V
	B8u5jKULAteIXTxX67AVmnX9MtgTBaq2EM0VMAjgfnwLm2URo6lsPqaZQ/Lq6O53OSSlbg66cvu
	GsD/4IClyYIhptV3GLUtvtTy4pVpQBU5z3MO8rt4sJUAmxTf4TI86o6eXKGLVsdMG/VngVidvFt
	fmDC+x/EtVq4BYZvnm2arpTzXnAXv/5Ba6+n2k+31lMQIFRuIU8KLuw8D35/vGD9t+igIuwkJVU
	Ymu4=
X-Received: by 2002:a05:600c:c16d:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4ac150b204fmr354563865e9.1.1793800297209;
        Wed, 04 Nov 2026 05:51:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen/build-id: Introduce is_gnu_build_id()
Date: Wed,  4 Nov 2026 13:51:32 +0000
Message-Id: <20261104135133.2209628-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
References: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793800297-67EBB2AC-84823A1B/10/78276251493
X-purgate-type: spam
X-purgate-size: 3387
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Broken out of the subsequent change for legibility reasons.  It will be used
to replace xen_build_id_check().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/version.c         | 33 +++++++++++++++++++++++++++++++++
 xen/include/xen/elfstructs.h |  2 ++
 xen/include/xen/version.h    |  2 ++
 3 files changed, 37 insertions(+)

diff --git a/xen/common/version.c b/xen/common/version.c
index 80e7a9b981cf..7eb8a0221d82 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -114,6 +114,37 @@ void print_version(void)
 /* Defined in linker script. */
 extern const Elf_Note __note_gnu_build_id_start[], __note_gnu_build_id_end[];
 
+/*
+ * Check whether @n is a GNU Build ID note.
+ *
+ * We check that:
+ *  - type is NT_GNU_BUILD_ID
+ *  - name is GNU\0
+ *  - desc is non-empty and exactly covering the rest of the buffer
+ *
+ * If this returns true, the contents starts at n + NT_GNU_HDR_SIZE.
+ */
+bool is_gnu_build_id(const Elf_Note *n, unsigned int len)
+{
+    const char *name;
+
+    if ( len <= NT_GNU_HDR_SIZE )
+        return false;
+
+    if ( n->type != NT_GNU_BUILD_ID ||
+         n->namesz != 4 )
+        return false;
+
+    name = ELFNOTE_NAME(n);
+    if ( strncmp(name, "GNU", 4) != 0 )
+        return false;
+
+    if ( len != n->descsz + NT_GNU_HDR_SIZE )
+        return false;
+
+    return true;
+}
+
 int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
                        const void **p, unsigned int *len)
 {
@@ -234,6 +265,8 @@ static void __init __maybe_unused build_assertions(void)
 {
     BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
     BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
+
+    BUILD_BUG_ON(NT_GNU_HDR_SIZE != sizeof(Elf_Note) + 4);
 }
 
 /*
diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index 8ee0d5aa5b15..1f0287aeed49 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -46,6 +46,8 @@ typedef uint32_t	Elf64_Word;
 typedef int64_t		Elf64_Sxword;
 typedef uint64_t	Elf64_Xword;
 
+#define NT_GNU_HDR_SIZE 16 /* sizeof(Elf_note) + "GNU\0" */
+
 /* Unique build id string format when using --build-id. */
 #define NT_GNU_BUILD_ID 3
 
diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
index b9fa8d70520d..ee857616f9e4 100644
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -2,6 +2,7 @@
 #define __XEN_VERSION_H__
 
 #include <xen/elfstructs.h>
+#include <xen/stdbool.h>
 
 const char *xen_compile_date(void);
 const char *xen_compile_time(void);
@@ -26,6 +27,7 @@ extern unsigned int xen_build_id_len; /* 0 -> No build id. */
 void xen_build_init(void);
 int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
                        const void **p, unsigned int *len);
+bool is_gnu_build_id(const Elf_Note *n, unsigned int len);
 #else
 static inline void xen_build_init(void) {};
 #endif

base-commit: 2043d22b7e926f508cc23391b4c75325fa7211e9
-- 
2.39.5


