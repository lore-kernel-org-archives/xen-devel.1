Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95ADC4361B
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 16:16:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D6723BDF
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 16:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D6723BDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48486.85787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28s-0004cy-M1; Wed, 09 Dec 2020 16:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48486.85787; Wed, 09 Dec 2020 16:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28s-0004cn-Ht; Wed, 09 Dec 2020 16:16:38 +0000
Received: by outflank-mailman (input) for mailman id 48486;
 Wed, 09 Dec 2020 16:16:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn28r-0004SF-2F
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:16:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d08d6373-737d-49ff-ac70-952481d7f693;
 Wed, 09 Dec 2020 16:16:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 444A3AF8A;
 Wed,  9 Dec 2020 16:16:21 +0000 (UTC)
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
X-Inumbo-ID: d08d6373-737d-49ff-ac70-952481d7f693
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8rJKVfvD7B5g+TUwc6aQ0QAVGKg6M4SOf5V18X4xJk=;
	b=Gr6xFEk+e4HbG53mSI/tfN9x/ztLT9J2Zxt4L6Qqof0hSTZHL5Nq6i8ZsB+1CPQgqTnG+x
	52z7Na5xWdk5TXma52nhw8mqa7aeoxBofwRZMBIk2SKhl6tsDo5mZoy6jqNoOZ1Ep1iNyc
	Hvs7W0Uq5gR2nqDxE++F3QCbGktgcLI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: paul@xen.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 3/3] xen/domain: add per-domain hypfs directory abi-features
Date: Wed,  9 Dec 2020 17:16:18 +0100
Message-Id: <20201209161618.309-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209161618.309-1-jgross@suse.com>
References: <20201209161618.309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new per-domain hypfs directory "abi-features" used to control
some feature availability. Changing the availability of a feature is
allowed only before the first activation of the domain.

The related leafs right now are "event-channel-upcall" and
"fifo-event-channels". For those bool elements are added to struct
domain, but for now without any further handling.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs_dom.c  | 39 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  4 ++++
 2 files changed, 43 insertions(+)

diff --git a/xen/common/hypfs_dom.c b/xen/common/hypfs_dom.c
index 241e379b24..b54e246ad6 100644
--- a/xen/common/hypfs_dom.c
+++ b/xen/common/hypfs_dom.c
@@ -10,6 +10,42 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 
+static int domain_abifeat_write(struct hypfs_entry_leaf *leaf,
+                                XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                                unsigned int ulen)
+{
+    struct hypfs_dyndir_id *data;
+    struct domain *d;
+
+    data = hypfs_get_dyndata();
+    d = data->data;
+
+    if ( d->creation_finished )
+        return -EBUSY;
+
+    return hypfs_dyndir_id_write_bool(leaf, uaddr, ulen);
+}
+
+static const struct hypfs_funcs abifeat_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = hypfs_dyndir_id_read_leaf,
+    .write = domain_abifeat_write,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_FIXEDSIZE_INIT(abifeat_evtupcall, XEN_HYPFS_TYPE_BOOL,
+                            "event-channel-upcall",
+                            HYPFS_STRUCT_ELEM(struct domain, abi_evt_upcall),
+                            &abifeat_funcs, 1);
+static HYPFS_FIXEDSIZE_INIT(abifeat_fifoevnt, XEN_HYPFS_TYPE_BOOL,
+                            "fifo-event-channels",
+                            HYPFS_STRUCT_ELEM(struct domain, abi_fifo_evt),
+                            &abifeat_funcs, 1);
+
+static HYPFS_DIR_INIT(domain_abifeatdir, "abi-features");
+
 static const struct hypfs_entry *domain_domdir_enter(
     const struct hypfs_entry *entry)
 {
@@ -131,6 +167,9 @@ static int __init domhypfs_init(void)
 {
     hypfs_add_dir(&hypfs_root, &domain_dir, true);
     hypfs_add_dyndir(&domain_dir, &domain_domdir);
+    hypfs_add_dir(&domain_domdir, &domain_abifeatdir, true);
+    hypfs_add_leaf(&domain_abifeatdir, &abifeat_evtupcall, true);
+    hypfs_add_leaf(&domain_abifeatdir, &abifeat_fifoevnt, true);
 
     return 0;
 }
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 31abbe7a99..fb99249743 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -424,6 +424,10 @@ struct domain
      */
     bool             creation_finished;
 
+    /* ABI-features (can be set via hypfs before first unpause).*/
+    bool             abi_fifo_evt;
+    bool             abi_evt_upcall;
+
     /* Which guest this guest has privileges on */
     struct domain   *target;
 
-- 
2.26.2


