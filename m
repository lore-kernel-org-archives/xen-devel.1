Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CD9C433E6
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:41:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C24A64F8C
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C24A64F8C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81006.148853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M98-0001VA-Kq; Wed, 03 Feb 2021 17:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81006.148853; Wed, 03 Feb 2021 17:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M98-0001V3-Hk; Wed, 03 Feb 2021 17:40:54 +0000
Received: by outflank-mailman (input) for mailman id 81006;
 Wed, 03 Feb 2021 17:40:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M97-0001Uy-0A
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:40:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M96-00054g-VX
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:40:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M96-0001bU-Un
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:40:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7M93-0005cv-ON; Wed, 03 Feb 2021 17:40:49 +0000
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
	bh=+pPG7fWcaxATMKgpOrR36TfBtaqoEQHGcUgT6kBeq6A=; b=IIHMTnrtd4B4U+fqcRI6PXl+11
	ZfW97+uwemjhHi9IorbRZZSK+BTYW4lEcqzzb6WAlPE1Hs8f4/cIakuziCazIDadH92m2FegqxtuW
	mzXyNmaMiEcsq5F+SQ5bdkFtzfhz23X+8GWFwTnL60/57dcknqMd94HxCqXvUETbny6U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24602.57377.524847.811116@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:40:49 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Edwin =?iso-8859-1?Q?T=F6r=F6k?= <edvin.torok@citrix.com>,
    "Christian  Lindig" <christian.lindig@citrix.com>,
    "Wei  Liu" <wl@xen.org>
Subject: Re: [PATCH 1/3] tools/oxenstored: Fix quota calculation for mkdir EEXIST
In-Reply-To: <20210203173549.21159-2-andrew.cooper3@citrix.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>
	<20210203173549.21159-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 1/3] tools/oxenstored: Fix quota calculation for mkdir EEXIST"):
> From: Edwin Török <edvin.torok@citrix.com>
> 
> We increment the domain's quota on mkdir even when the node already exists.
> This results in a quota inconsistency after live update, where reconstructing
> the tree from scratch results in a different quota.
> 
> Not a security issue because the domain uses up quota faster, so it will only
> get a Quota error sooner than it should.
> 
> Found by the structured fuzzer.

Thanks for these.  They look like straightforward bugfixes, so they
don't need a release ack, but FTR

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I don't feel qualified to give a maintainer-ack...

Ian.

