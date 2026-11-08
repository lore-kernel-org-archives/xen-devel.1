Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2262A606A31A
	for <xen-devel@archiver.kernel.org>; Sun,  8 Nov 2026 03:01:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1478609.1683103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPt9S-0006dv-Pz; Sun, 08 Nov 2026 03:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1478609.1683103; Sun, 08 Nov 2026 03:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPt9S-0006dk-Kd; Sun, 08 Nov 2026 03:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1478609;
 Sun, 08 Nov 2026 03:01:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xPt9R-0006de-ME
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 03:01:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPt9R-003iU5-1b
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 04:01:01 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6aefe5b2-bab6-0a2a0a5309dd-0a2a450b814a-22
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 04:01:01 +0100
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6aefe5e7-b7e8-0a2a450b0019-4a68bc043901-5
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 04:01:00 +0100
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 6A830R0k095764
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 7 Nov 2026 22:00:53 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 6A830QxV095763;
 Sat, 7 Nov 2026 19:00:26 -0800 (PST) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Sat, 7 Nov 2026 19:00:26 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] Config.mk: record hash of SeaBIOS tag
Message-ID: <au_lyioQRMuKkoqJ@mattapan.m5p.com.>
References: <cover.1792436534.git.ehem+xen@m5p.com>
 <9771fce7e080b2d64fd9535b6e38d70781eb2de3.1792436534.git.ehem+xen@m5p.com>
 <0fc3eb31-1aac-4b0e-8f9a-ae947dabe81d@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fc3eb31-1aac-4b0e-8f9a-ae947dabe81d@suse.com>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-42698a/1794106861-A90CD9EA-AAE50CB3/0/0
X-purgate-type: clean
X-purgate-size: 2666

On Mon, Oct 26, 2026 at 10:05:45AM +0100, Jan Beulich wrote:
> On 19.10.2026 21:02, Elliott Mitchell wrote:
> > Date: Sun, 18 Oct 2026 14:12:43 -0700
> > 
> > Recording the tag as a comment, but directing git at the hash allows
> > bypassing downloading tags (git does not selectively download tags).
> > While remote branches get prefixed with the remote name.  The result is
> > identical, the tag is simply a reference to the hash.
> 
> I don't quite get what the win is. The middle sentence also feels, to
> me, unrelated to anything else here. The fact that ...
> 
> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -220,7 +220,8 @@ MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
> >  MINIOS_UPSTREAM_REVISION ?= 26ceb2daf95dd9e7fed9c83d36be3aaf1a0fa8a1
> 
> ... we use a hash here, for example, doesn't warrant ...
> 
> >  SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
> > -SEABIOS_UPSTREAM_REVISION ?= rel-1.17.0
> > +# rel-1.17.0
> > +SEABIOS_UPSTREAM_REVISION ?= b52ca86e094d19b58e2304417787e96b940e39c6
> 
> ... the use here. IOW if this is to be pursued, more explanation is
> going to be necessary.

Issue is git's handling of tags isn't very good.  In particular it really
wants to either get all tags or no tags.  I've found it quite difficult
(read: I've yet to suceed) trying to get it retrieve a single tag.
Instead what it does is resolve the tag to the commit hash (by asking the
server) and then only saving the commit to persistent storage.

If you have git save all tags, it will download nearly everything.  Not
just the branch/tag you need, but any branch which has a tag.  This means
somewhere 2-10x the storage, 2-10x the download bandwidth, 2-10x the time
spent waiting for the download.



The situation with Qemu is far more concerning.  Since
$(QEMU_UPSTREAM_REVISION) points at a branch on Xen's git server, every
time that branch moves you get a different build.  Since different
versions will have different bugs/features unless there is a public
record of where the branch was over time, older builds become impossible
to reproduce.  

The favored solution to these problems would be to switch to using
`git subtree`.  This though would be a pretty major move.  I was hoping
this series would get a discussion started about option.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



