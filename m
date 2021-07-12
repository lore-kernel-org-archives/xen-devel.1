Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6933CC07E99
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 14:35:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F52961106
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 14:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F52961106
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154581.285607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2x1r-00075Q-BH; Mon, 12 Jul 2021 14:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154581.285607; Mon, 12 Jul 2021 14:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2x1r-00075J-7w; Mon, 12 Jul 2021 14:35:27 +0000
Received: by outflank-mailman (input) for mailman id 154581;
 Mon, 12 Jul 2021 14:35:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2x1p-00075A-PB
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 14:35:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 647a1cf2-e31e-11eb-86ee-12813bfff9fa;
 Mon, 12 Jul 2021 14:35:24 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 647a1cf2-e31e-11eb-86ee-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626100524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IkPkydloPVJe8qtxGhVv8kkIxThqfSTkhZ5cBVnB4MQ=;
  b=BoaBMUlOySEYgQmriAMnJXh89iYFhz8O8jqTJdro0DSlCwojCn8Vq4Jg
   k2XmWBcdGBK4J7VpoUNKYjvmKmZ15aRL934YnYfo3/FN1I6xk7/zMoKt5
   IW5YFDJp88KAfJfUb5A+a5J8lXkf9lw0JdC/h/9EE344gKCHDGNvdOYeu
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /H15ZIHrqPax3rtyH9+BJF5cIyPNLlOHesyC2rXS18ZSh1YUG31MVA8GtNDBEmiwMRVp9JkncT
 9lnY4bvcj/kwXfmjIR9R95AwwyrjFhd+T/lbRqsV+XpewcCVhOjOp6pkHpgMq8meyK8b3kVNEI
 7Rtmwu4gYb6NzFz+0+ipn6KsjbL8olEAXPBIok2dj94qYbjh1G7WvBgyo+n8BLw5fVRylzUCAw
 G/ZKAX2CQsNmPGZ7J4sXA2XQm8Hla2M4CEMOMEvejXAsu83js0KpGA/UtUXR+n8imnAg6OVqoy
 jXY=
X-SBRS: 5.1
X-MesageID: 47771900
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cxwA46sR2UW2DmtSTiIOCifV7skDZdV00zEX/kB9WHVpm6uj5q
 KTdZUgpHzJYVkqNU3I9ertBEDiexPhHPxOj7X5VI3KNGKNhILBFvAH0WKI+Vzd8kPFmdK1rp
 0QFpRDNA==
X-IronPort-AV: E=Sophos;i="5.84,234,1620705600"; 
   d="scan'208";a="47771900"
Date: Mon, 12 Jul 2021 15:35:20 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 07/31] build,include: rework compat-build-source.py
Message-ID: <YOxTKHCQDSs2mHG8@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-8-anthony.perard@citrix.com>
 <3b7b6366-c138-3e92-3a9b-640fcf949b15@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3b7b6366-c138-3e92-3a9b-640fcf949b15@suse.com>

On Wed, Jul 07, 2021 at 04:58:29PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > Improvement are:
> > - give the path to xlat.lst as argument
> > - include `grep -v` in compat-build-source.py script, we don't need to
> >   write this in several scripted language.
> > 
> > Also remove dependency on Makefile as the file generation doesn't
> > depend on it anymore.
> 
> Did it before any more?

Kind of, yes, there is "grep -v" that makes the Makefile part of the
script that generates the target.

> In the subsequent patch I can see more of
> a reason to drop the dependency, but neither there nor here I'm
> really convinced: In general I think every generate file would
> better depend on the makefile containing the rule used for its
> building, as a change to that rule means the target wants
> rebuilding.

Does that mean that nearly every single targets should depends on a
"Makefile" or on "Rules.mk" ? :-)

As for the current target "compat/%.c", with this patch applied, the
only few things that the content of the file depends on is the script,
the first dependency, and "xlat.lst" (also a dependency). So the
Makefile doesn't play a role into what get's into the target, the
"mkdir" and the "mv" don't really matter. If the rule where to be
changed in a way that changed the content of the target, that would be
wrong in my opinion, the change should be done in the script.
If someone wanted to rewrite the script in a different language and thus
renaming the script, that would be fine too as make would notice that
the new script is newer that the target (as the file for the script as
just been created).

But, I guess we could start to use the "if_changed" macro here to
detected rule changes.

I really don't like when a target depends on a "Makefile" because that
means the target gets rebuilt for unrelated reason so I'd like to avoid
dependency on it when possible.

> Therefore for the moment ...
>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> ... this holds only with the dependency kept in place. But I'll
> be happy to get convinced otherwise.

Thanks,

-- 
Anthony PERARD

