Return-Path: <SRS0=dDkt=OL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776DBC433F5
	for <xen-devel@archiver.kernel.org>; Tue, 21 Sep 2021 10:50:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339CF6112F
	for <xen-devel@archiver.kernel.org>; Tue, 21 Sep 2021 10:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 339CF6112F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.191675.341760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdLN-0001qu-Ed; Tue, 21 Sep 2021 10:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191675.341760; Tue, 21 Sep 2021 10:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdLN-0001qn-B7; Tue, 21 Sep 2021 10:49:45 +0000
Received: by outflank-mailman (input) for mailman id 191675;
 Tue, 21 Sep 2021 10:49:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSdLM-0001qh-0R
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 10:49:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSdLL-00058I-V6
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 10:49:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSdLL-0005fU-UI
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 10:49:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSdLG-0008WV-Hn; Tue, 21 Sep 2021 11:49:38 +0100
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
	bh=FDpYBi4xl1i7LGDy2Rlx9YN0f1CD//FY8aTJuUjZ+0Q=; b=rmGHQ+I8F5H5G2Z1joRRCuFEqa
	jpuqAvovuWjvovTMhqMBG0UdR8kh9Nvylcuwk6qqnSX+cQGp0fb5qClLrlhX3DPiCDqwHooIpqQY3
	dL+85l6SAzmv8Q52ji8cEQ28w4kttvqMqDZCro7p2LWPn790Gr9D4sOdBdmVPsLUDwnY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24905.47298.105494.711706@mariner.uk.xensource.com>
Date: Tue, 21 Sep 2021 11:49:38 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    "Andrew  Cooper" <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    "Stefano Stabellini" <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
In-Reply-To: <YUm3yLOfAfqrwgmH@MacBook-Air-de-Roger.local>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
	<YUmj3P3j6f5Gl/xh@MacBook-Air-de-Roger.local>
	<58e2e6e2-c154-f09f-193e-6bef2b42995f@suse.com>
	<YUm3yLOfAfqrwgmH@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH] common: guest_physmap_add_page()'s return value needs checking"):
> On Tue, Sep 21, 2021 at 12:28:12PM +0200, Jan Beulich wrote:
> > On 21.09.2021 11:20, Roger Pau Monné wrote:
> > > On Wed, Sep 01, 2021 at 06:06:37PM +0200, Jan Beulich wrote:
> > >> The function may fail; it is not correct to indicate "success" in this
> > >> case up the call stack. Mark the function must-check to prove all
> > >> cases have been caught (and no new ones will get introduced).
> > >>
> > >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > 
> > > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Thanks. Albeit strictly speaking an ack here isn't enough for the change
> > to go in, it would need to be R-b or come from a REST maintainer.
> 
> Oh, FE:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

