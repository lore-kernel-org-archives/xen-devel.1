Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D574C432BE
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:24:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B2C61A07
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7B2C61A07
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161172.295935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N4f-0005d3-A3; Tue, 27 Jul 2021 13:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161172.295935; Tue, 27 Jul 2021 13:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N4f-0005cw-70; Tue, 27 Jul 2021 13:24:45 +0000
Received: by outflank-mailman (input) for mailman id 161172;
 Tue, 27 Jul 2021 13:24:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N4e-0005cq-La
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:24:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N4e-00061M-Ki
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:24:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N4e-0007Zh-Jv
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:24:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8N4Z-0002V0-Vn; Tue, 27 Jul 2021 14:24:40 +0100
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
	bh=VarRAtG18t58DVXcDYuKoys7rlIDW8VvQ/T4wbJ0jIA=; b=Xpz5x94MXHw9GH3sffZqjY4Umn
	ORS1i2LMlxnl1hn39wZ4gX66C51E/MP+2GYnVkGhXnRem5EPy9fLaum10YYGCHLkmxG5Krl+ayP4e
	mfDYYQv/Mne62is6/r13RVOw/HysFE6AIAxWenxq+ZsoWmvP/XvSwzywt1NsxLOY9H84=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24832.2327.802741.325312@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:24:39 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Alan Robinson <Alan.Robinson@fujitsu.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/libxl: add missing blank in message
In-Reply-To: <6fd2eaf5-7434-58a3-2d98-47f87e0b9dd1@suse.com>
References: <20210723102308.5332-1-Alan.Robinson@fujitsu.com>
	<6fd2eaf5-7434-58a3-2d98-47f87e0b9dd1@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] tools/libxl: add missing blank in message"):
> On 23.07.21 12:23, Alan Robinson wrote:
> > From: Alan Robinson <alan.robinson@fujitsu.com>
> > 
> > Add trailing blank to first part of concatenated string giving
> > "an emulated" instead of "anemulated".

Alan, thanks:

Acked-by: Ian Jackson <iwj@xenproject.org>

and queued.

> > -                         "Disk will be available via PV drivers but not as an"
> > +                         "Disk will be available via PV drivers but not as an "
> >                            "emulated disk.",
> 
> I'd rather have a longer line without splitting the message (splitting
> after the '\n' is fine, of course). This will make it easier to find the
> coding emitting the message when searching for the whole printed line.

I would be fine with this, and I can see how it is an improvement.
However, Alan's patch is a step in the right direction so should go in
right away.

Ian.


