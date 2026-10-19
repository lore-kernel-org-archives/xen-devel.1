Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D229A606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:25:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454731.1668238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsyo-0001Kr-Kn; Mon, 19 Oct 2026 19:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454731.1668238; Mon, 19 Oct 2026 19:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsyo-0001Ki-Hl; Mon, 19 Oct 2026 19:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1454731;
 Mon, 19 Oct 2026 19:25:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xIsym-0001KX-Te
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:25:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIsym-002UQ4-A2
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:25:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66e3d-e002-0a2a0a5209dd-0a2a450b8f5a-46
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:25:04 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66e8e-b7e8-0a2a450b0019-4a68bc0440e6-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:25:04 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69JJOo8x053186
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2026 15:24:55 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69JJOoMh053185;
 Mon, 19 Oct 2026 12:24:50 -0700 (PDT) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <87285fe79868156edabf49fa5e8398a8a8f3494d.1792436534.git.ehem+xen@m5p.com>
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
Subject: [RFC PATCH 3/5] scripts/git-checkout.sh: add standard scripting safety
 steps
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-42698a/1792437904-A9EC69EA-260986E5/0/0
X-purgate-type: clean
X-purgate-size: 1873
X-Archived-By: <archiver.kernel.org>

Date: Fri, 16 Oct 2026 19:11:11 -0700

Add doublequotes to all variable references.  This ensures building
doesn't fail if the full build directory has spaces in it.  Also move
the `set -e` to the front of the script.

Add a default value for $GIT.

Rename $TREE to $REPO.  These are generally called "repositories", the
checked out directory is a tree.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 scripts/git-checkout.sh | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
index 56a60193a73..7dde6702b6c 100755
--- a/scripts/git-checkout.sh
+++ b/scripts/git-checkout.sh
@@ -1,28 +1,30 @@
 #!/bin/sh
 
+set -e
+
 if test $# -lt 3; then
-	echo "Usage: $0 <tree> <committish> <dir>"
+	echo "Usage: $0 <repo> <committish> <dir>"
 	exit 1
 fi
 
-TREE=$1
-COMMITTISH=$2
-DIR=$3
+GIT="${GIT:-git}"
 
-set -e
+REPO="$1"
+COMMITTISH="$2"
+DIR="$3"
 
-if test \! -d $DIR-remote; then
-	rm -rf $DIR-remote $DIR-remote.tmp
-	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
-	$GIT clone $TREE $DIR-remote.tmp
+if test \! -d "$DIR-remote"; then
+	rm -rf "$DIR-remote" "$DIR-remote.tmp"
+	mkdir -p "$DIR-remote.tmp"; rmdir "$DIR-remote.tmp"
+	"$GIT" clone "$REPO" "$DIR-remote.tmp"
 	if test "$COMMITTISH" ; then
-		cd $DIR-remote.tmp
-		$GIT fetch origin "$COMMITTISH"
-		$GIT branch -D dummy >/dev/null 2>&1 ||:
-		$GIT checkout -b dummy FETCH_HEAD
+		cd "$DIR-remote.tmp"
+		"$GIT" fetch origin "$COMMITTISH"
+		"$GIT" branch -D dummy >/dev/null 2>&1 ||:
+		"$GIT" checkout -b dummy FETCH_HEAD
 		cd -
 	fi
-	mv $DIR-remote.tmp $DIR-remote
+	mv "$DIR-remote.tmp" "$DIR-remote"
 fi
-rm -f $DIR
-ln -sf $(basename $DIR-remote) $DIR
+rm -f "$DIR"
+ln -sf $(basename "$DIR-remote") "$DIR"
-- 
2.47.3


