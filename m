Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC71606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=vA5d3dcR
Received: from list by lists.xenproject.org with outflank-mailman.1493174.1693287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPha-0006Dy-Su; Tue, 17 Nov 2026 20:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493174.1693287; Tue, 17 Nov 2026 20:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPha-0006Dg-P3; Tue, 17 Nov 2026 20:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1493174;
 Tue, 17 Nov 2026 20:22:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTPhZ-0006B6-81
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:22:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTPhY-006F17-Kw
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:22:48 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afcb756-8faa-0a2a0a5109dd-0a2a450bd962-32
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:22:48 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afcb798-b7e8-0a2a450b0019-d155dd2ab58d-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:22:48 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-49465892f7bso127998f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:22:48 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560ab59sm640224f8f.29.2026.11.17.12.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 12:22:47 -0800 (PST)
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
        d=citrix.com; s=google; t=1794946968; x=1795551768; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9YTSCL58EsecGXbQ/X7hj5UBKfJw0lJH4nFZK9MARE=;
        b=vA5d3dcRAuol8zCmabBV23Pmf7Q1rYBO+WQS738FcPEruSpRb3zHUCkckmACW0GFej
         uOvuq2XMgEn8I+uyflHA4GidSpvb3jAEuonsK3twQpJZ3XHmmF2S0OgfLIXcuTzn1I+t
         mALDkyZKYVxhmpJlwVOLuBwJm/3yECWMwTVEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946968; x=1795551768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9YTSCL58EsecGXbQ/X7hj5UBKfJw0lJH4nFZK9MARE=;
        b=tHov9zGValthIzgsEwIY+B6OAlnWVwzjuDauJ85xxb+znebmE6UZZ7DqGhFWH3gCOz
         StckC5Zseo87sOXYfeVZ06E5qBdnU2i5kYU1SWDotqlLz9JNWNgw26gCaUX4KbyWbMyO
         Z2nYdoDihm0t61uInNmgNwJcZacagmW3dpjsKzHtjQjs3hYD3bAd8QfAGX2Zxn2hQ4Tt
         8o2UWVwsWVUDlk51F+ksX2CTBRSaEygyXDNFAskox6MGSqfRT7j8AM6UVmMYL2KBxFQV
         UlLJOl8O2qXnA9yQ+YekfW8S+L5JMpB3OSSdRHvfU5lePnLAzVk4v+UINWzY+fKx6Mdp
         3W9w==
X-Gm-Message-State: APuU4Z+N0Gn4RckM+HgD3EYfGxoOzqhc7h181L0TJDhgQ/osvMD2jgnK
	39ywJ6yKCq3G80qtTnMucY0VV7i4qFNfSH4ymDUqtUwlYhhy3gFn65LuMru8HxJr2n2901AuglL
	JVznJSD8=
X-Gm-Gg: AZFdTZdCMWo4N7h9BuB/HO7AL0Nzr3xJi8Jr0RrrwELrA9QZhzaNoToeRTFDDmU8Ywi
	btsgLrWXhXMDPm+vFLJDz4MMY/B2ngi+E++DXpGYVMYboP/Q8XxOUW3tjBWDTOSBH5c9EchXuCk
	DlZRkXJJxP/ZbAcyOZ3m/7knUsU/YxcMXRc8aYlXgQLSOWn58gLhZ4vDGEIQdkx1mshtnWqLJSn
	xvXJLKTY97aaku67oKjdL02DEGNSfhDSPOY1YA29ju7i4GS9KgAPRMfx0uA8sp6tktWjdSbmMVg
	BCgGVBCVQjsDRRTC8bzX6t7Dv0fl3Px67SHqHcRVq1qkpg4vX+GGrCJgblFhPKxsLewdUZSyJ5F
	zxhgvJ1wdBSXDmSYe5QES10EMMbJIY6fR7+7PhEIA7D3MOoLPw1bFum+PnrUIqgxSHLMkuhC9xU
	Az5Fo+FIP8vJpEinr8f7sqCG7iZr8dGAg5+LG1zQa74tFszeZJb2v1qgrpIqiWAUTij4efdEyG5
	EL+yfbOdhr+46AhKQHlxFTERtVReDY9PLGyyMIf/qK74vVSG+uh/h2I2tC0fcVwR0tRQN/XzzLR
	sKhnod+6A8PZyrmpMdPTF+NSIaS35UVYGwqGbehJYW71mRLxOTTXoVfd2qz2upwNRtNxsM3d++h
	Ect5CtwROn/BpAXftOaVLrqPr
X-Received: by 2002:a5d:5888:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4a639475750mr1131251f8f.17.1794946967794;
        Tue, 17 Nov 2026 12:22:47 -0800 (PST)
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
Subject: [PATCH v2 1/2] xen/build-id: Introduce is_gnu_build_id()
Date: Tue, 17 Nov 2026 20:22:43 +0000
Message-Id: <20261117202244.4054656-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
References: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1794946968-AA2C49EA-CF307D3C/10/78276251493
X-purgate-type: spam
X-purgate-size: 3440
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

v2:
 * Check for n->descsz within len, not exactly len, to accomodate possible
   padding.
---
 xen/common/version.c         | 34 ++++++++++++++++++++++++++++++++++
 xen/include/xen/elfstructs.h |  2 ++
 xen/include/xen/version.h    |  2 ++
 3 files changed, 38 insertions(+)

diff --git a/xen/common/version.c b/xen/common/version.c
index 80e7a9b981cf..5e1f5ecfb68b 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -114,6 +114,38 @@ void print_version(void)
 /* Defined in linker script. */
 extern const Elf_Note __note_gnu_build_id_start[], __note_gnu_build_id_end[];
 
+/*
+ * Check whether @n is a GNU Build ID note.
+ *
+ * We check that:
+ *  - type is NT_GNU_BUILD_ID
+ *  - name is GNU\0
+ *  - desc is non-empty and fits within the buffer.
+ *
+ * If this returns true, the contents starts at n + NT_GNU_HDR_SIZE, and is
+ * n->descsz long.
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
+    if ( n->descsz > (len - NT_GNU_BUILD_ID) )
+        return false;
+
+    return true;
+}
+
 int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
                        const void **p, unsigned int *len)
 {
@@ -234,6 +266,8 @@ static void __init __maybe_unused build_assertions(void)
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
-- 
2.39.5


