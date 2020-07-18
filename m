Return-Path: <SRS0=FqNL=A5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A4DC433E2
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2020 18:21:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C782076A
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2020 18:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7C782076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwrT5-0003Fh-Qn; Sat, 18 Jul 2020 18:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=++/D=A5=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jwrT4-0003EY-Qf
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 18:21:50 +0000
X-Inumbo-ID: 8acb993c-c923-11ea-b7bb-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8acb993c-c923-11ea-b7bb-bc764e2007e4;
 Sat, 18 Jul 2020 18:21:48 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jwrT1-000CpL-IE; Sat, 18 Jul 2020 18:21:47 +0000
Date: Sat, 18 Jul 2020 19:21:47 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/5] x86: mostly shadow related XSA-319 follow-up
Message-ID: <20200718182147.GB48915@deinos.phlegethon.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 11:56 +0200 on 15 Jul (1594814214), Jan Beulich wrote:
> This in particular goes a few small steps further towards proper
> !HVM and !PV config handling (i.e. no carrying of unnecessary
> baggage).
> 
> 1: x86/shadow: dirty VRAM tracking is needed for HVM only
> 2: x86/shadow: shadow_table[] needs only one entry for PV-only configs
> 3: x86/PV: drop a few misleading paging_mode_refcounts() checks
> 4: x86/shadow: have just a single instance of sh_set_toplevel_shadow()
> 5: x86/shadow: l3table[] and gl3e[] are HVM only

I sent a question on #5 separatly; otherwise these all seem good to
me, thank you!

Acked-by: Tim Deegan <tim@xen.org>

