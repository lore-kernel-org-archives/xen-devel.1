Return-Path: <SRS0=g3ET=HL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CD8C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 17:17:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E92564EA6
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 17:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E92564EA6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83356.154918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Wdu-0003Od-US; Tue, 09 Feb 2021 17:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83356.154918; Tue, 09 Feb 2021 17:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Wdu-0003OW-Qi; Tue, 09 Feb 2021 17:17:38 +0000
Received: by outflank-mailman (input) for mailman id 83356;
 Tue, 09 Feb 2021 17:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Wdu-0003ON-57
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Wdu-0003JV-4E
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:17:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Wdu-0001kj-3J
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:17:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9Wdm-000606-8W; Tue, 09 Feb 2021 17:17:30 +0000
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
	bh=n/QNOK4FXGJY30IVGQZNniqQAODGoWX7ALyzPpeKOHs=; b=0aUvnpk9P5oZgMr/kLcgVLLm1m
	Dph1tepo/1Dpbz9eQupguUUJEeO1eZylBhc7z26QwSSHkmDakoY6X5xU4ZcFn72a6Fu7Y/YYj+jVk
	/H19RO06pS2pjX+wijARaL63tQWDmnSki8eammfsdD9BeDK40psqmnTiF1ZwGa9RnsT0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.50089.887907.573064@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 17:17:29 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19
 processors
In-Reply-To: <c09110f7-6459-e1f7-2175-09d535ad03ce@suse.com>
References: <20210209153336.4016-1-andrew.cooper3@citrix.com>
	<c09110f7-6459-e1f7-2175-09d535ad03ce@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19 processors"):
> On 09.02.2021 16:33, Andrew Cooper wrote:
> > The original limit provided wasn't accurate.  Blobs are in fact rather larger.
> > 
> > Fixes: fe36a173d1 ("x86/amd: Initial support for Fam19h processors")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/xen/arch/x86/cpu/microcode/amd.c
> > +++ b/xen/arch/x86/cpu/microcode/amd.c
> > @@ -111,7 +111,7 @@ static bool verify_patch_size(uint32_t patch_size)
> >  #define F15H_MPB_MAX_SIZE 4096
> >  #define F16H_MPB_MAX_SIZE 3458
> >  #define F17H_MPB_MAX_SIZE 3200
> > -#define F19H_MPB_MAX_SIZE 4800
> > +#define F19H_MPB_MAX_SIZE 5568
> 
> How certain is it that there's not going to be another increase?
> And in comparison, how bad would it be if we pulled this upper
> limit to something that's at least slightly less of an "odd"
> number, e.g. 0x1800, and thus provide some headroom?

5568 does seem really an excessively magic number...

Ian.

