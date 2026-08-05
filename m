Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6211C55838
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 01:53:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382732.1626071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQod-0007tg-D5; Wed, 05 Aug 2026 01:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382732.1626071; Wed, 05 Aug 2026 01:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQod-0007tX-9v; Wed, 05 Aug 2026 01:53:07 +0000
Received: by outflank-mailman (input) for mailman id 1382732;
 Wed, 05 Aug 2026 01:53:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wrQoc-0007t8-Th
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 01:53:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQoc-0068Ru-0A;
 Wed, 05 Aug 2026 01:53:05 +0000
Received: from [203.221.94.45] (helo=Mac.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQob-00CujO-0m;
 Wed, 05 Aug 2026 01:53:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=+sgH7buv7ht5eYGRQ/eq/HiItqeiSBS/Osfxgw6BGz4=; b=lQ53XEufoqc9wMSfBo8QJ8NJ+6
	JZSHlHlngaKGMD6BcpyCkI25g8GnpwGo/0lGkxge/wNU06nFkRJQKXgWlz8Td/uUpXpsPqRAqqIKe
	YUuN4jMGpTDetKyG9gZwTJpgyQDWVP54VAQ2p5w8qNuZLPrqc8VajPxFrYRH+sSYm3Pw=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] build: add compile_commands.json target
Date: Wed,  5 Aug 2026 11:52:40 +1000
Message-ID: <20260805015247.41943-4-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805015247.41943-1-gwd@xenproject.org>
References: <20260805015247.41943-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a phony convenience target generating the compilation database
from a built object tree, alongside the other developer conveniences
(tags, cscope, cloc -- the last of which already walks the same .cmd
files):

    make -C xen compile_commands.json

The output lands in the object tree root, where clangd and other
consumers discover it automatically when opening files from an
in-tree build.

Note the database records the compiler invocations actually used.
With a clang build it is consumable by clangd as-is; for a gcc build,
clang-based tools may need a small .clangd configuration
(CompileFlags: Remove/Add) dropping gcc-only flags.

Also add the generated file to .gitignore.

Assisted-by: LLM
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
 .gitignore   | 1 +
 xen/Makefile | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/.gitignore b/.gitignore
index bfc7bdf043..0aa9b801de 100644
--- a/.gitignore
+++ b/.gitignore
@@ -192,6 +192,7 @@ xen/arch/*/include/generated
 xen/build-dir-cppcheck/
 xen/common/config_data.S
 xen/common/config.gz
+xen/compile_commands.json
 xen/cppcheck-htmlreport/
 xen/cppcheck-report/
 xen/cppcheck-misra.*
diff --git a/xen/Makefile b/xen/Makefile
index d39bdfdd53..f87240f33c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -685,6 +685,10 @@ cloc:
 	    done; \
 	done | cloc --list-file=-
 
+.PHONY: compile_commands.json
+compile_commands.json:
+	$(PYTHON) $(srctree)/scripts/gen_compile_commands.py -d $(objtree)
+
 # Target used by xen-analysis.sh script to retrieve Xen build system variables
 export-variable-%:
 	$(info $*=$($*))
-- 
2.55.0


