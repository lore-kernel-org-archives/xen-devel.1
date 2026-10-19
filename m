Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B287606A32C
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:24:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454727.1668230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsxy-0000rM-Dd; Mon, 19 Oct 2026 19:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454727.1668230; Mon, 19 Oct 2026 19:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsxy-0000rF-96; Mon, 19 Oct 2026 19:24:14 +0000
Received: by outflank-mailman (input) for mailman id 1454727;
 Mon, 19 Oct 2026 19:24:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xIsxw-0000r5-U5
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:24:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIsxw-00096B-B6
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:24:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66e3f-8faa-0a2a0a5109dd-0a2a4503e16e-36
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:24:12 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66e5b-fae8-0a2a45030019-4a68bc04fda8-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:24:12 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69JJNwjH053176
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2026 15:24:03 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69JJNwfx053175;
 Mon, 19 Oct 2026 12:23:58 -0700 (PDT) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <9771fce7e080b2d64fd9535b6e38d70781eb2de3.1792436534.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792436534.git.ehem+xen@m5p.com>
References: <cover.1792436534.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        "Roger Pau Monné" <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 19 Oct 2026 12:02:14 -0700
Subject: [PATCH 2/5] Config.mk: record hash of SeaBIOS tag
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-33051d/1792437852-758824E9-9CF16FA6/0/0
X-purgate-type: clean
X-purgate-size: 969
X-Archived-By: <archiver.kernel.org>

Date: Sun, 18 Oct 2026 14:12:43 -0700

Recording the tag as a comment, but directing git at the hash allows
bypassing downloading tags (git does not selectively download tags).
While remote branches get prefixed with the remote name.  The result is
identical, the tag is simply a reference to the hash.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 Config.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index b2dcc729f3d..db7d0299624 100644
--- a/Config.mk
+++ b/Config.mk
@@ -220,7 +220,8 @@ MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= 26ceb2daf95dd9e7fed9c83d36be3aaf1a0fa8a1
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
-SEABIOS_UPSTREAM_REVISION ?= rel-1.17.0
+# rel-1.17.0
+SEABIOS_UPSTREAM_REVISION ?= b52ca86e094d19b58e2304417787e96b940e39c6
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 
-- 
2.47.3


