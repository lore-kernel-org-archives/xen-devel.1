Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15668606A326
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=uS0e+fsj
Received: from list by lists.xenproject.org with outflank-mailman.1496123.1694765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0Gk-0000Ac-3T; Thu, 19 Nov 2026 11:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496123.1694765; Thu, 19 Nov 2026 11:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0Gk-0000AV-00; Thu, 19 Nov 2026 11:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1496123;
 Thu, 19 Nov 2026 11:25:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU0Gj-0000AP-3R
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:25:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0Gi-007wGo-C4
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:25:32 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afedca5-e002-0a2a0a5209dd-0a2a450b97b8-38
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:25:32 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afedcac-b7e8-0a2a450b0019-d1558033a80f-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:25:32 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4bb666304fdso6909945e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 03:25:32 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8535bbf7sm36687935e9.12.2026.11.19.03.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 03:25:30 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1795087532; x=1795692332; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTzGuo4askzPGIvwZk54nwCIcBM0t+D6agMN3WAX6AQ=;
        b=uS0e+fsjklBrQvbAG2DSXa9lp6ggTQR0BapTtBmXOOTJvBl1hR6P96yzk0LHw6AdDU
         Fjt2MM3zkwMzzKZ8/D3zg9k6bKSHUebFzP9FAqoK9nxr73yBrLj8/orGWX28LV7Nxgd6
         yTiY0SfURHo2bZJElv2UeZJE9YNWRv+uH1+5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087532; x=1795692332;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTzGuo4askzPGIvwZk54nwCIcBM0t+D6agMN3WAX6AQ=;
        b=gSSfBH3ABpk0H3+WiHhv95ECRRvEh9CArm0cZnzQET6ugHwMqy41rBPKBBEOi1T34m
         DzwS5G8bBC5xjdP3yZ15sa39wc44RBNRUwbUCFJm222zuvyY6q+zp/i+7aN/H7GagUw2
         j8I3JrY3o/dRR9IMb2UN8EemCqDu+8Ee7xxvd/Ym0peveY2iatz6Y8z6p4jW8dlw5iqM
         gjxXlErjRi60tRVjiMwDJtCfK3a6NVE9fK7dvq0zeRMZh1Llh9ywVLd24cx+fFu7fCh1
         E1yV9fB9MrAj/fv6FJREXPfKVf0cNK7EnbACGRBM86L7wZ1Z0xD7kg9KrJf2spsqF30j
         Ad2A==
X-Gm-Message-State: APuU4Z/LnIIYevlJCn3kjThM3hYgbpFhe3TgkUrfkCyEHkvxM3LTEM3D
	gPJngPS+bxB3MUQSkhrIQ8LGx5lGSJ4AvqPq6w9BpD1HvoacEPYn78qfAZ3yq96EUtKkFvDNByJ
	mTOcO
X-Gm-Gg: AYBFou17IE7B6+Ibgl5SiP79qSIvNohCLjsOmfur8YZuBnLq1l/49LlW0AD+9qCWwy4
	1VBDo945L802FahFyJ6/5XEYCyIbh4JUx4VzHkTYHK063f6XpziilY1DhDo8/IfaKOPfHWh/ljr
	H/gh3LusxF5/LDbxx+cSUQI+1Z6sKzIb1T1oZDaH1Eip9YbC3Kzyjq2abpRQ/oNNw6QkTNKoBv2
	4HTxI0DwESLZVrN6LLmUKERQvDzejAOBtfMBsK96ascGuI0vdbYuoh9NLlg7Q0TDwQBE2kF4Nee
	9KOhA+UK4ro3GBHR9HOu0M4pLfZ61aUoIVbHmgLm7iuCBizWbVd7JsXMqiha2CPCc13FgnQvAVE
	G5cchiYtCkKHliyZlMkDEbjRU7cAzw3noFPy09PqCruwUzxq7xadsxvZoOM87TDX29pFp9OhSnV
	sGvyk7FBMcLtuPCSkA/z0oLdApxtq5yy89t+lgGRiWaYMEAhzywhWOM7TYvO5LGE76lsT/iaoQg
	zw2NA7zLXyPF9yTP8n+k8AqQx8Yy4vUG4nPgP0ngXovkTDn4A+QNnQWK4dJtOsD9jY4V1aEUkPW
	cTcAakesdP5SPDNpYu6JyaMlEz7oK9ibUxYSvAHdv2XYd1HB9KCARfYvOJ0COxKA87HnBDwR2LN
	YlsI=
X-Received: by 2002:a05:600c:a015:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb860f637fmr17252065e9.4.1795087531132;
        Thu, 19 Nov 2026 03:25:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] x86/apei: Fix up headers and MISRA deviations following code removal
Date: Thu, 19 Nov 2026 11:25:23 +0000
Message-Id: <20261119112523.36032-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1795087532-A94C39EA-8651B232/10/78276251493
X-purgate-type: spam
X-purgate-size: 3121
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes: c6bd6cd2db1e ("x86/apei: Fully remove dead code")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ----
 docs/misra/deviations.rst                        | 8 --------
 xen/include/acpi/apei.h                          | 6 ------
 3 files changed, 18 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 58af4fb5cd15..ad37c98bd5fd 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -252,10 +252,6 @@ Therefore the absence of prior declarations is safe."
 -config=MC3A2.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
 -doc_end
 
--doc_begin="The function apei_(read|check|clear)_mce are dead code and are excluded from non-debug builds, therefore the absence of prior declarations is safe."
--config=MC3A2.R8.4,declarations+={safe, "^apei_(read|check|clear)_mce\\(.*$"}
--doc_end
-
 -doc_begin="asmlinkage is a marker to indicate that the function is only used to interface with asm modules."
 -config=MC3A2.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, -1..0))"}
 -doc_end
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index c17b44754310..9a00522df288 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -284,14 +284,6 @@ Deviations related to MISRA C:2012 Rules:
        it.
      - Tagged as `safe` for ECLAIR.
 
-   * - R8.4
-     - Some functions are excluded from non-debug build, therefore the absence
-       of declaration is safe.
-     - Tagged as `safe` for ECLAIR, such functions are:
-         - apei_read_mce()
-         - apei_check_mce()
-         - apei_clear_mce()
-
    * - R8.4
      - Given that bsearch and sort are defined with the attribute 'gnu_inline',
        it's deliberate not to have a prior declaration.
diff --git a/xen/include/acpi/apei.h b/xen/include/acpi/apei.h
index 495819e36234..8e7accbb67d3 100644
--- a/xen/include/acpi/apei.h
+++ b/xen/include/acpi/apei.h
@@ -17,12 +17,6 @@ typedef int (*apei_hest_func_t)(const struct acpi_hest_header *hest_hdr,
 int apei_hest_parse(apei_hest_func_t func, void *data);
 
 int erst_write(const struct cper_record_header *record);
-ssize_t erst_get_record_count(void);
-int erst_get_next_record_id(u64 *record_id);
-ssize_t erst_read(u64 record_id, struct cper_record_header *record,
-		  size_t buflen);
-ssize_t erst_read_next(struct cper_record_header *record, size_t buflen);
-int erst_clear(u64 record_id);
 
 void __iomem *apei_pre_map(paddr_t paddr, unsigned long size);
 

base-commit: 69625555f5cdd2d3b83ead3e4fd2bc7b7e819bb3
-- 
2.39.5


