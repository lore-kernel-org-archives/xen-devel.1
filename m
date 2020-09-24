Return-Path: <SRS0=okQV=DB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E21C4363D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 21:49:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD8921D20
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 21:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD8921D20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLZ6i-0004P7-CW; Thu, 24 Sep 2020 21:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jxTb=DB=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kLZ6h-0004P2-Kj
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 21:48:51 +0000
X-Inumbo-ID: 4b0f7b94-ab0b-4520-b57c-f4722c3ed1ee
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b0f7b94-ab0b-4520-b57c-f4722c3ed1ee;
 Thu, 24 Sep 2020 21:48:50 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08OLmV0D059737
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 24 Sep 2020 17:48:36 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08OLmT2k059736;
 Thu, 24 Sep 2020 14:48:29 -0700 (PDT) (envelope-from ehem)
Date: Thu, 24 Sep 2020 14:48:29 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 03/11 RFC] gitignore: Add/Generalize entries
Message-ID: <20200924214829.GA58232@mattapan.m5p.com>
References: <202009092153.089LrA2R039188@m5p.com>
 <afe1939c-01b9-b6c6-a4d7-9762664b9447@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afe1939c-01b9-b6c6-a4d7-9762664b9447@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 24, 2020 at 05:44:09PM +0200, Jan Beulich wrote:
> On 02.09.2020 03:08, Elliott Mitchell wrote:
> > @@ -33,12 +38,12 @@ cscope.po.out
> >  .vscode
> >  
> >  dist
> > -stubdom/*.tar.gz
> >  
> >  autom4te.cache/
> >  config.log
> >  config.status
> >  config.cache
> > +config.h
> >  config/Toplevel.mk
> >  config/Paths.mk
> 
> While in userland config.h may indeed be a typically generated file,
> there are three source files by this name under xen/. Patch 6 also
> doesn't look to override this in any way for xen/. I think this wants
> to move a level down, into tools/ and wherever else it may be
> applicable.

Another possibility is Git isn't as aggressive with enforcing ignores as
some other version control software is.  A file which matches a
.gitignore pattern will not show up under "Untracked files" in
`git status`; however, /modifying/ a file which is already under control,
but matches an ignore pattern *will* cause it to show up under
"Changes not staged for commit".  Git will also allow you to use
`git add -f` on a file which matches an ignore pattern.

There are already a few files in Git which have targetted matches pointed
at them, yet are still present.  Perhaps these were added by mistaken use
of `add -f`, perhaps they were deliberately added and the author missed
removing the .gitignore entry.

As such perhaps the generalized "config.h" pattern is appropriate and
move towards removing the few examples which currently exist?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



