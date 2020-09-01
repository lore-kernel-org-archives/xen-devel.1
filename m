Return-Path: <SRS0=dV6x=CK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD120C433E2
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 06:33:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871B72098B
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 06:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871B72098B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCzrD-0007e5-FU; Tue, 01 Sep 2020 06:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ojrl=CK=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kCzrB-0007e0-Tv
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 06:33:25 +0000
X-Inumbo-ID: a98d851b-eebd-49b8-8b62-f9397efc71c9
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a98d851b-eebd-49b8-8b62-f9397efc71c9;
 Tue, 01 Sep 2020 06:33:24 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0816XBAu018237
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 1 Sep 2020 02:33:17 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0816XA1q018236;
 Mon, 31 Aug 2020 23:33:10 -0700 (PDT) (envelope-from ehem)
Date: Mon, 31 Aug 2020 23:33:10 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
Message-ID: <20200901063310.GA18093@mattapan.m5p.com>
References: <20200828025747.GA25246@mattapan.m5p.com>
 <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
 <20200831063748.GB1522@mattapan.m5p.com>
 <ccab621e-9962-6715-896d-30e6bb8b9520@suse.com>
 <20200831225517.GA11156@mattapan.m5p.com>
 <67853b32-6aab-378b-556f-a96cd8dd950d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67853b32-6aab-378b-556f-a96cd8dd950d@suse.com>
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

On Tue, Sep 01, 2020 at 08:01:30AM +0200, Jan Beulich wrote:
> On 01.09.2020 00:55, Elliott Mitchell wrote:
> > On Mon, Aug 31, 2020 at 08:52:45AM +0200, Jan Beulich wrote:
> >> On 31.08.2020 08:37, Elliott Mitchell wrote:
> >>> Preferences in sorting?
> >>
> >> Alphabetical sorting is what we generally aim for here.
> > 
> > Going into specific example since those best demonstrate what I
> > observed.
> > 
> > Before this patch the top-level .gitignore included the lines:
> > @@
> > -tools/misc/cpuperf/cpuperf-perfcntr
> > -tools/misc/cpuperf/cpuperf-xen
> > -tools/misc/xc_shadow
> > -tools/misc/xen_cpuperf
> > -tools/misc/xen-cpuid
> > @@
> > -xen/xsm/flask/policy.*
> > -xen/xsm/flask/xenpolicy-*
> >  tools/flask/policy/policy.conf
> >  tools/flask/policy/xenpolicy-*
> >  xen/xen
> > @@
> > 
> > tools/misc/.gitignore had the single line:
> > xen-ucode
> > 
> > xen/xsm/flask/.gitignore had the single line:
> > /policy.c
> > 
> > 
> > You'll note from the second batch, .gitignore isn't consistently sorted.
> 
> I'm aware, and hence I said "aim for". In cases like this what we
> often do is adjust things incrementally, as lines get touched anyway.
> Of course if you want to clean it up all in one go ...

I may, though right now I'm having the experience of reading
documentation several times to double-check and discovering I
misinterpreted when testing.  There is also the difficulty of trying to
figure out why some things were done the way they were.

Really starts to look like everyone (including myself) tries to intuit
how .gitignore files work and doesn't /quite/ get it right 9 times out
of 10.

*Definitely* going to need that v2...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



