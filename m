Return-Path: <SRS0=MtyD=NY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4DAC83028
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 16:58:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DB861051
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 16:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00DB861051
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177579.323095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLq2J-0005CL-Vx; Thu, 02 Sep 2021 16:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177579.323095; Thu, 02 Sep 2021 16:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLq2J-0005CE-T3; Thu, 02 Sep 2021 16:57:59 +0000
Received: by outflank-mailman (input) for mailman id 177579;
 Thu, 02 Sep 2021 16:57:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLq2I-0005C6-Me
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:57:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLq2I-00015Y-Ku
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:57:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLq2I-00076K-Jq
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:57:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLq27-0003Vy-UT; Thu, 02 Sep 2021 17:57:47 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=VQ/pDRqduhH2wpfMLbgaHgM/4ZpTVM/+CEGro1GEMXk=; b=IB5fOPYC0qJdZkqXx8UfY1j0yU
	aXGHWedIpnm+dgMlrCkTqpOa1R4Wwi1mg0l1ZsB4HNXKdie85Zommd03YJgtweWsONI+XQiucADZI
	ZCK+KiF9lwpCFCNYee6QGBtJpBZREeY3/8AjuqAxQRZBQxQfggK4sLIfLojIZRQr0054=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24881.651.565806.53730@mariner.uk.xensource.com>
Date: Thu, 2 Sep 2021 17:57:47 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
In-Reply-To: <6d8b3104-f7e6-494c-30e1-1c06419fbfb0@suse.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
	<668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
	<f69e5a2b-cd8c-3534-ab7b-427fb1fc1cdc@suse.com>
	<f0e9c8ad-dfa2-77ac-b3db-02cba59e843c@suse.com>
	<347edc1f-a104-1bc3-0cb2-2cfffcb6214a@suse.com>
	<a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>
	<6d8b3104-f7e6-494c-30e1-1c06419fbfb0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats overflow"):
> And - just to make it very explicit - even if I went this route to
> address a controversial point, I'd still like to understand the
> reason for the original objection - if only for my own education.

I agree with this position.

I have reread the discussions with this patch title in the Subject
line.  I am still unclear on the precise nature of Andrew's objection.

All I could find was this from Andrew:

  >      ctx->save.stats = (struct precopy_stats){
  > -        .dirty_count = ctx->save.p2m_size,
  > +        .dirty_count = -1,

  This is an external interface, and I'm not sure it will tolerate finding
  more than p2m_size allegedly dirty.

and then the later comment by Andrew:

  I've already explained why [various things]

Unfortunately that message did not contain any links to these previous
explanations.  Andrew, where were they ?  If we are not to go round
in circles, we need to write these things down and then refer to them
when relevant.

We had a conversation on irc today.  I found today's IRC conversation
rather unsatisfactory.  I gleaned from Andrew's comments that this he
was saying this callback is used by something in Citrix's product to
do with nVidia migration.  Obviously we do not wish to break a
downstream.  But this interface is badly documented and clear
explanations are lacking.

While I recognise Andrew's expertise in this area, I think that as
tools maintainer I need to go with the information I have.
The overflow issue is real and Jan has proposed a fix.

Andrew: do you have time to engage with Jan here on these API
questions ?  If not, does anyone else have enough familiarity with
Citrix's use of this API to engage in a proper discussion about how
the overflow problem can be addressed ?

If effort is not available for this, that is of course fine.  But as
an Open Source project we need to be able to move forwsrd with the
available input and contributions.  So if no-one is able to explain
how this rather poor API is to be used, and help develop a solution to
the overflow problem, I should probably ack Jan's patch here.

Ian.

