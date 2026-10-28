Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A81B606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=l3z8l0yG
Received: from list by lists.xenproject.org with outflank-mailman.1463788.1674582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6O-0004kp-Nq; Wed, 28 Oct 2026 23:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463788.1674582; Wed, 28 Oct 2026 23:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6O-0004i3-Cy; Wed, 28 Oct 2026 23:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1463788;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-000488-OV
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pOf-3YQ3;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjM-00000001KpM-2iMG;
 Wed, 28 Oct 2026 23:06:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=Lb7F1xsyX+9AldokNzH9xX+s7w05jag/1Hr7PjUMcMQ=; b=l3z8l0yGmyqfmyFdtycjVXedq4
	iCQ//Nnas7iBBxKw4PiF6OSB7UIGbld8sxVMjF1UF6qmZGRDO9M6BuRxpLY4sH6lX+wLvQRksId+y
	CL4GqqpqszWlR/GXnqRXXK2zUXVoBKY4NWivOmnDjYH7blTzFjhJefdGxJ73fk+VaZWQ=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 16/45] xen/gunzip: process pending softirqs once per deflate block
Date: Wed, 28 Oct 2026 23:05:30 +0000
Message-ID: <20261028-asi-hvm-v5-16-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Nothing in the gzip decompressor lets the CPU run softirqs.  The NMI
watchdog treats a CPU as stuck once its timer softirq has not run for
the watchdog's timeout, 5s by default, so a decompression that runs
that long panics the host.

Decompression is normally quick, but it need not be.  Every compressed
deflate block builds its Huffman tables with xmalloc() and frees them
with xfree(), and those calls reach the xenheap whenever a request is a
page or more, or a free empties an xmalloc pool page.  A subsequent
change can make every xenheap free end in a TLB flush on all online
CPUs.  With it in effect, decompressing the PV dom0 kernel and reading
its ELF headers on a 480-CPU host took 5.2s instead of 0.5s; with
cpufreq=xen:performance max_cstate=1,0 dom0_nodes=0,relaxed added to
the command line as well, the watchdog fired before decompression had
finished, on each of eight boots.

Process pending softirqs after each deflate block, as libelf does for
each ELF note since c5089fae0f6f ("x86: avoid tripping watchdog when
constructing dom0"), and as the PV and PVH dom0 builders do in their
long loops.  Every caller of perform_gunzip() runs during domain
construction at boot, on the boot CPU with interrupts enabled and no
lock held: x86's PV and PVH dom0 builders, which call
process_pending_softirqs() themselves, and kernel_decompress(), which
Arm uses for dom0 and for dom0less domains.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 xen/common/gzip/gunzip.c  | 1 +
 xen/common/gzip/inflate.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 89f45d4050..9551d470aa 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -3,6 +3,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
+#include <xen/softirq.h>
 
 #define WSIZE           0x80000000U
 
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index cb146555c8..737aff505e 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1018,6 +1018,7 @@ static int __init inflate(struct gunzip_state *s)
         r = inflate_block(s, &e);
         if (r)
             return r;
+        process_pending_softirqs();
     } while (!e);
 
     /* Undo too much lookahead. The next read will be byte aligned so we
-- 
2.56.0


