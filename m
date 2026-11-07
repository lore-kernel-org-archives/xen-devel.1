Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0C2606A32C
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 22:15:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1478409.1683093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPog4-0004kC-Nz; Sat, 07 Nov 2026 22:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1478409.1683093; Sat, 07 Nov 2026 22:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPog4-0004k4-Jw; Sat, 07 Nov 2026 22:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1478409;
 Sat, 07 Nov 2026 22:14:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xPog2-0004jx-Vh
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 22:14:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPog2-009paw-9M
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 23:14:22 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6aefa21d-2eae-0a2a0a5409dd-0a2a4508cafa-38
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 23:14:22 +0100
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6aefa2b3-f659-0a2a45080019-4a68bc043991-5
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 23:14:22 +0100
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 6A7MDgxb094964
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 7 Nov 2026 17:14:08 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 6A7MDfxk094963;
 Sat, 7 Nov 2026 14:13:41 -0800 (PST) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Sat, 7 Nov 2026 14:13:41 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] make: add use of $(realpath ) in top and main
 Rules.mk files
Message-ID: <au-ilXUdOhZhlcAq@mattapan.m5p.com.>
References: <cover.1792436534.git.ehem+xen@m5p.com>
 <0b38e7ba64831575c2f2533c69e00da79c4bc958.1792436534.git.ehem+xen@m5p.com>
 <a7d5134b-aa9a-4f30-a58c-939f5cb7443b@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7d5134b-aa9a-4f30-a58c-939f5cb7443b@suse.com>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-c1860d/1794089662-CE14687B-F1479265/0/0
X-purgate-type: clean
X-purgate-size: 1431

On Mon, Oct 26, 2026 at 10:01:59AM +0100, Jan Beulich wrote:
> On 19.10.2026 21:02, Elliott Mitchell wrote:
> > Date: Sat, 17 Oct 2026 12:25:36 -0700
> > 
> > Without this "/.." tend to accumulate in $(XEN_ROOT) and eventually
> > things start breaking.
> 
> "breaking" as in what exactly happening?

This is a scar from a project I was involved in several years back.  One
issue is dependencies are computed/compared as strings.  In particular
if multiple parent directory references are made one part of a project
might end up depending on:

foo/../bar/../baz

While another might end up depending on:

bar/../foo/../bar

If building is done in parallel you can end up with two processes
entering the same directory at the same time and colliding.

I imagine other problems/manifestations can occur.  I have not observed
any of these occuring with Xen's build, but this is something I tend to
preemptively address.  Strings including "/../" do occur in Xen's build
so there is some concern issues could occur in the future.

Certainly not urgent, but something which could become an issue.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



