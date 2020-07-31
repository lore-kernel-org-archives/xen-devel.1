Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03781C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 13:02:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E7121D95
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 13:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="a5DrfBRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3E7121D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UgL-0003LN-CN; Fri, 31 Jul 2020 13:02:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrDm=BK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k1UgJ-0003LI-KV
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:02:39 +0000
X-Inumbo-ID: 1bfed4ab-d32e-11ea-8e30-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bfed4ab-d32e-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596200559;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8+Apex/05OziTwQ96raHXebZalhR41lpWEOv9w28wcE=;
 b=a5DrfBRy1ox94m+FmVwoQGbvkONB+aY5Z9H7SPZ2rcVRIbx3QngWKMrj
 TbsdQxeNN8p2OE14RrcA1fMgvVK+3JJm4nzTddIz04g6A2LifI1rIS3zn
 P5CaH5uMR2+lcaZnyFTv5YLAp49gK1LPOaFwTRvHZ9Ox3yJ2SchD5cdTK 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VhKDc1nssWaHK07zJyr8fZXuKnKq5k5LtTanFhFZWZvlhToQUVd7+jYQaUQkO7ySH+q1Su29sg
 PKoZZre+53oMUa1pCZSyueL8JAVDm8kcU8M5PMPNjmaPkJDgzye5+B2xpG6SJ46Oqk8lA0mako
 DatncznEtdeBd6qvpPUReyfy6v/5bYiOjRkl26LTrOo+wmyMtXwzxL/q1vHL0/c0XDKrlK33FV
 FDTZ8jtc3lwh2fcO9Xpagj0jeojdsM3VWMbUP4w8zCHfPjpPDSRtCQ7Nyr1M0YPDoraEEhIWYj
 BSs=
X-SBRS: 3.7
X-MesageID: 23956842
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23956842"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24356.5736.297234.341867@mariner.uk.xensource.com>
Date: Fri, 31 Jul 2020 14:02:32 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] tools/configure: drop BASH configure variable [and 1 more
 messages]
In-Reply-To: <2c202733-cbff-74e0-30c6-4cba227e7969@suse.com>,
 <20200722113258.3673-1-andrew.cooper3@citrix.com>
References: <20200722113258.3673-1-andrew.cooper3@citrix.com>
 <20200626170038.27650-1-andrew.cooper3@citrix.com>
 <880fcc83-875c-c030-bfac-c64477aa3254@suse.com>
 <24313.55588.61431.336617@mariner.uk.xensource.com>
 <2c202733-cbff-74e0-30c6-4cba227e7969@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
> On 29.06.2020 14:05, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
> >> On 26.06.2020 19:00, Andrew Cooper wrote:
> >> ... this may or may not take effect on the file system the sources
> >> are stored on.
> > 
> > In what circumstances might this not take effect ?
> 
> When the file system is incapable of recording execute permissions?
> It has been a common workaround for this in various projects that
> I've worked with to use $(SHELL) to account for that, so the actual
> permissions from the fs don't matter. (There may be mount options
> to make everything executable on such file systems, but people may
> be hesitant to use them.)

I don't think we support building from sources which have been
unpacked onto such filesystems.  Other projects which might actually
need to build on Windows or something do do this $(SHELL) thing or an
equivalent, but I don't think that's us.

But obviously that opinion of mine is not a blocker for Andy's patch
since Andy is going in the right direction, regardless.

Andrew Cooper writes ("[PATCH v2] tools/configure: drop BASH configure variable"):
> This is a weird variable to have in the first place.  The only user of it is
> XSM's CONFIG_SHELL, which opencodes a fallback to sh, and the only two scripts
> run with this are shebang sh anyway, so don't need bash in the first place.
> 
> Make the mkflask.sh and mkaccess_vector.sh scripts executable, drop the
> CONFIG_SHELL, and drop the $BASH variable to prevent further use.

In response to this commit message, I wrote:

> > Andrew Cooper writes ("[PATCH] tools/configure: drop BASH configure variable"):
> > Thanks for this cleanup.  I agree with the basic idea.
> >
> > However, did you run these scripts with dash, or review them, to check
> > for bashisms ?

And you replied:

> Yes, to all of the above.
> 
> They are both very thin wrappers (doing some argument shuffling) around
> large AWK scripts.

Can you please put this information in the commit message where it
belongs ?  As a rule we should know in future what we were thinking
when a change was made, and as I say "are shebang sh anyway, so don't
need bash in the first place" is weak evidence.

With that change,

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

