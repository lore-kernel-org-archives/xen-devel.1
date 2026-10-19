Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F25606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:22:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454714.1668210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIswP-0008FM-PW; Mon, 19 Oct 2026 19:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454714.1668210; Mon, 19 Oct 2026 19:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIswP-0008FF-Mv; Mon, 19 Oct 2026 19:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1454714;
 Mon, 19 Oct 2026 19:22:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xIswP-0008F8-13
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:22:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIswO-00FObN-7L
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:22:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66dfb-e002-0a2a0a5209dd-0a2a4505a560-0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:22:35 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66dfa-4cb1-0a2a45050019-4a68bc0476a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:22:35 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69JJMEkF053145
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2026 15:22:19 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69JJME2C053144;
 Mon, 19 Oct 2026 12:22:14 -0700 (PDT) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <cover.1792436534.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        "Roger Pau Monné" <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 19 Oct 2026 12:02:14 -0700
Subject: [RFC PATCH 0/5] Fun with git
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-c201ff/1792437755-720AA2A1-4ED1896E/0/0
X-purgate-type: clean
X-purgate-size: 3659
X-Archived-By: <archiver.kernel.org>

I ended up looking at the use of git in the build system.  There is some
inconsistency in use/behavior and I really dislike how certain pieces of
it have evolved.  Most of what I'm sending is RFC since I've got too many
questions, but the first two are appropriate right now.

I find it unsurprising the script predates Xen's conversion to git.
Likely the script made it rather more obvious git was winning, then it
finally came time to officially convert Xen to using git.

Of the four uses of the `git-checkout.sh` script 1 gives a full path and
3 give only the subdirectory.  I'm unsure which is appropriate, but
inconsistency is a Bad Thing(tm).

What is with the naming of the subproject repository directories?  Why
the "-dir" for "qemu-xen-dir", "ovmf-dir" and "seabios-dir"?  Whereas
for mini-os it is "extras/mini-os".  I imagine there was some good
reason at some point, but now it simply seems odd.

Then there is the issue of all the duplicated project subdirectory
variants.  If the `git-checkout.sh` script is used it creates
<repo>-remote, than a symbolic link <repo> -> <repo>-remote.  Then for
most (all?) of these the directory <repo>-build is created where the
actual build is done.


Then there are the problems with factors related to the existence of the
script and the way it works.

One problem with the script is is breaks cleaning the repository.
"Hmm, `git status --ignored` still shows directories, okay let me
`rm -rf tools/firmware/*-dir tools/qemu-xen-dir extras/mini-os`"   Then
the next build you end up redownloading those repositories from scratch.
Perhaps the Xen Project's git server can handle the load, but it
certainly adds some.

Then there is a major slowdown in the build process.  Clone the git
repository, then move to your fast build machine with lots of processors.
Suddenly you're waiting on your Internet link.  Then it gets worse if
that is the moment when the git server is down.  Just to make it worse
this also functions as a tracker for finding people building Xen.

Yet another issue is, is it still possible to build Xen 4.0?  Nominally
most/all of the repository histories reach back that far, but you'll have
no idea which versions were in use.  The combination of outside
repository versions needed for a given Xen version build might be quite
hard to figure out in the future.


I'm including some patches I created while looking into this situation.
I think the first is worthwhile no matter what choices are made.  The
rest are simply resolving issues I found.  The last is a proposed
adjustment to the script.  The script adjustment is unfinished, it is
somehow breaking Qemu's build process.  It also only successfully
addresses the issue of needing to redownload full repositories.

A better option might be using `git subtree`.  This would address all my
concerns in regards to the handling of external project repositories.
Does seem a largish step though.


Elliott Mitchell (5):
  make: add use of $(realpath ) in top and main Rules.mk files
  Config.mk: record hash of SeaBIOS tag
  scripts/git-checkout.sh: add standard scripting safety steps
  tools/build: use full path when checking out git repositories
  scripts/git-checkout.sh: store repositories with Xen, use worktrees

 Config.mk               |  3 ++-
 Makefile                | 12 +++++++----
 scripts/git-checkout.sh | 44 ++++++++++++++++++++++++-----------------
 tools/Makefile          | 12 ++++-------
 tools/Rules.mk          |  2 ++
 tools/firmware/Makefile | 14 ++++++-------
 6 files changed, 48 insertions(+), 39 deletions(-)

-- 
2.47.3


