Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57154C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 14:57:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57B364DE5
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 14:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57B364DE5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77153.139573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58jT-0001Rw-Bq; Thu, 28 Jan 2021 14:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77153.139573; Thu, 28 Jan 2021 14:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58jT-0001Rp-8E; Thu, 28 Jan 2021 14:57:15 +0000
Received: by outflank-mailman (input) for mailman id 77153;
 Thu, 28 Jan 2021 14:57:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58jR-0001Rk-6G
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:57:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58jR-0007wp-4c
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:57:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58jR-0001Np-32
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:57:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l58jJ-0004dB-6r; Thu, 28 Jan 2021 14:57:05 +0000
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
	bh=Sqy/D0+GqTINvq2roXBe3t5Qyt3i0NF2ANL2IyKFPcY=; b=c4EzQ57xBOiViSi22Jcljd3BOj
	WAX/pGv7hO+UeFV/Srk/3yT+k/6Ds/0cvC/0QZHXcQrXJk1W19IF5zzBLEUaOgxm3zbGhHRgdhQVQ
	zy4v2/BmA8lgqIObrWr1UyytilyQumOCOjUVRRiYOPZuYubftVjABq1o40V7X3IydMuo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24594.53440.970539.475825@mariner.uk.xensource.com>
Date: Thu, 28 Jan 2021 14:57:04 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from
 check_timer()
In-Reply-To: <38cf4cb4-c0d3-d880-a0b4-eb21af447cad@suse.com>
References: <20210127194904.9922-1-andrew.cooper3@citrix.com>
	<38cf4cb4-c0d3-d880-a0b4-eb21af447cad@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from check_timer()"):
> On 27.01.2021 20:49, Andrew Cooper wrote:
> > In practice, there is no such thing as a real 64bit system without
> > APICs.  (PVH style virtual environments, sure, but they don't end up here).
> > 
> > The suggestion to try and use noapic only makes a bad situation worse.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Not sure if this is a bugfix but it is a change to a message so fine.

Ian.

