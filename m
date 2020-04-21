Return-Path: <SRS0=TXFR=6F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E92C2BA19
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2020 05:32:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 654292084D
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2020 05:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 654292084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQlVh-00051y-8F; Tue, 21 Apr 2020 05:31:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=twDm=6F=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jQlVg-00051t-Ef
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 05:31:52 +0000
X-Inumbo-ID: 66f1941c-8391-11ea-b4f4-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66f1941c-8391-11ea-b4f4-bc764e2007e4;
 Tue, 21 Apr 2020 05:31:51 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jQlVb-0007iE-JA; Tue, 21 Apr 2020 05:31:47 +0000
Date: Tue, 21 Apr 2020 06:31:47 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 07/10] x86/shadow: the guess_wrmap() hook is needed for
 HVM only
Message-ID: <20200421053147.GA29592@deinos.phlegethon.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <1e221192-7899-b60d-0280-b77ab5877772@suse.com>
 <20200418090317.GD92478@deinos.phlegethon.org>
 <43a8e15c-e739-0cb3-4ad9-23def4e24709@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <43a8e15c-e739-0cb3-4ad9-23def4e24709@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 15:06 +0200 on 20 Apr (1587395210), Jan Beulich wrote:
> On 18.04.2020 11:03, Tim Deegan wrote:
> > At 16:28 +0200 on 17 Apr (1587140897), Jan Beulich wrote:
> >> sh_remove_write_access() bails early for !external guests, and hence its
> >> building and thus the need for the hook can be suppressed altogether in
> >> !HVM configs.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> >> @@ -366,6 +367,14 @@ int sh_validate_guest_entry(struct vcpu
> >>  extern int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
> >>                                    unsigned int level,
> >>                                    unsigned long fault_addr);
> >> +#else
> >> +static inline int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
> >> +                                         unsigned int level,
> >> +                                         unsigned long fault_addr)
> >> +{
> > 
> > Can we have an ASSERT(!shadow_mode_refcounts(d)) here, please,
> > matching the check that would have made it a noop before?
> 
> I've added one, but I find this quite odd in a !HVM build, where
> 
> #define PG_refcounts   0
> 
> and
> 
> #define paging_mode_refcounts(_d) (!!((_d)->arch.paging.mode & PG_refcounts))
> 
> Perhaps you're wanting this mainly for documentation purposes?


Yeah, that and future-proofing.  If !HVM builds ever start using
paging_mode_refcounts then this assertion will forcibly remind us that
we need changes here.  I'm glad that it compiles away to nothing in
the meantime.

Cheers,

Tim.

