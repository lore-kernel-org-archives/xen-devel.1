Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC6606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 23:13:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1504231.1699724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWieo-0007Dm-R5; Thu, 26 Nov 2026 23:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504231.1699724; Thu, 26 Nov 2026 23:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWieo-0007Df-OC; Thu, 26 Nov 2026 23:13:38 +0000
Received: by outflank-mailman (input) for mailman id 1504231;
 Thu, 26 Nov 2026 23:13:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xWien-0007DZ-TY
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 23:13:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWien-007v3T-A0
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 00:13:37 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6b08bcc4-8faa-0a2a0a5109dd-0a2a45049bf8-36
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 00:13:37 +0100
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6b08bd12-b57f-0a2a45040019-4a68bc04aef2-5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 00:13:36 +0100
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 6AQNCsl7025382
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 26 Nov 2026 18:13:20 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 6AQNCsBa025381;
 Thu, 26 Nov 2026 15:12:54 -0800 (PST) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Thu, 26 Nov 2026 15:12:54 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] Config.mk: record hash of SeaBIOS tag
Message-ID: <awi89iXunY2yujX5@mattapan.m5p.com.>
References: <cover.1792436534.git.ehem+xen@m5p.com>
 <9771fce7e080b2d64fd9535b6e38d70781eb2de3.1792436534.git.ehem+xen@m5p.com>
 <0fc3eb31-1aac-4b0e-8f9a-ae947dabe81d@suse.com>
 <au_lyioQRMuKkoqJ@mattapan.m5p.com.>
 <6b07617a.985e8776.145007.9be0SMTPIN_ADDED_BROKEN@mx.google.com>
 <b5f7029f-13d7-484e-93a6-eec873882901@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5f7029f-13d7-484e-93a6-eec873882901@suse.com>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-ebf023/1795734817-C2AC8B50-3C9F72F7/0/0
X-purgate-type: clean
X-purgate-size: 2799

On Thu, Nov 26, 2026 at 08:24:40AM +0100, Jan Beulich wrote:
> On 25.11.2026 23:29, Elliott Mitchell wrote:
> > On Sat, Nov 07, 2026 at 07:00:26PM -0800, Elliott Mitchell wrote:
> >>
> >> The situation with Qemu is far more concerning.  Since
> >> $(QEMU_UPSTREAM_REVISION) points at a branch on Xen's git server, every
> >> time that branch moves you get a different build.  Since different
> >> versions will have different bugs/features unless there is a public
> >> record of where the branch was over time, older builds become impossible
> >> to reproduce.  
> >>
> >> The favored solution to these problems would be to switch to using
> >> `git subtree`.  This though would be a pretty major move.  I was hoping
> >> this series would get a discussion started about option.
> > 
> > I suppose I should ask given lack of response to this statement.  Do you
> > feel this is something which should be brought up during the Community
> > Call?
> 
> I fear I'm the wrong one to ask, not the least because I wasn't even aware
> of a "subtree" sub-command. Whether that's (meaningfully) better than
> "submodule" I have no idea. One aspect which may matter is that in the git
> version I'm using, for example, the sub-command isn't known.

An example usage might be:

git remote add qemu-xen https://xenbits.xen.org/git-http/qemu-xen.git
git fetch -n qemu master
git subtree -P tools/qemu-xen-dir add qemu-xen master


If you really have a version of git old enough not to have the subtree
command or are wondering what this does behind the scenes below has an
equivalent effect (assuming the remote and fetch from above have already
been done):

git git merge --no-commit --allow-unrelated-histories -s ours qemu-xen/master
mkdir tools/qemu-xen-dir
git read-tree --prefix=tools/qemu-xen-dir qemu-xen/master
git commit
git checkout -- tools/qemu-xen-dir

This results in having the full history all together.  No need for an
extra script during build.  If you've seen FreeBSD's repository this is
pretty similar to what they've been doing.

I recommend creating an extra worktree (`git worktree add ../xen-test`)
before trying this.  Easier to recover a garbled worktree than your main
worktree ending up in an unfamiliar situation.


One problem I noticed is some step Qemu does using `meson` tries to do
things with `git` during their build process.  Problem is they're
assuming a specific `git` setup too which was causing trouble.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



