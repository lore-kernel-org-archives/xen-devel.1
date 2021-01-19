Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B8AC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668F322241
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668F322241
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70451.126444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sSo-0001k4-PW; Tue, 19 Jan 2021 14:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70451.126444; Tue, 19 Jan 2021 14:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sSo-0001jw-MN; Tue, 19 Jan 2021 14:58:34 +0000
Received: by outflank-mailman (input) for mailman id 70451;
 Tue, 19 Jan 2021 14:58:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l1sSm-0001jM-RH
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:58:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l1sSm-0002m8-Os
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:58:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l1sSm-0004Mj-Ne
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:58:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l1sSi-0003Ad-Iw; Tue, 19 Jan 2021 14:58:28 +0000
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
	bh=8hkNMQRfShv8jpiXh8ORW4wDysG3Jiql29031sEr6/4=; b=6wTJrkvog37xxH3mIJuasdTkWC
	vbmlX2OwIu08L+U/8W94jjtZ3Rf8TcER22rtxFiEzH/z/Hix65E0JtGyL9Vd/ofJSJ5IxbBPqLs1I
	qfbXMwJblqKNLBJd0Wc4PqbDXnU8ObW/uc1Vi70ohLFKkkZ1v0t62kiwmjAsuMe+OUfw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24582.62356.361386.407920@mariner.uk.xensource.com>
Date: Tue, 19 Jan 2021 14:58:28 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/decompress: make helper symbols static
In-Reply-To: <9d77a189-de10-b4e2-c118-580121d797a9@suse.com>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
	<24581.45760.653861.613333@mariner.uk.xensource.com>
	<9d77a189-de10-b4e2-c118-580121d797a9@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] xen/decompress: make helper symbols static"):
> On 18.01.2021 17:09, Ian Jackson wrote:
> > AFAICT, this patch
> > 
> > * was first posted after the last posting date for Xen 4.15.
> > * is not a bugfix.
> > 
> > In which case it has missed 4.15.
> > 
> > Please correct me if you think I am wrong.
> 
> You aren't, and I don't view this as a big problem - its more of
> an aid to be sure no bad (unintended) references exist (Arm's
> unhelpful re-use of xz's CRC32 function triggered the change).

Ah I see.  Thanks for that explanation.  Well, I might be inclined to
grant a freeze exception on the basis that the point of this is to
remove rather than add risk.

If you think that might be sensible, would you care to provide a frank
assessment of the risks to 4.15 of taking this patch, vs. the risks to
4.15 of postponing it ?

> I can surely hold this back until 4.16 opens, hoping it won't
> collide with the zstd decompression work I'm now doing on the DomU
> side (lack which, if you agree with Andrew's assessment, is more a
> bug fix than a feature addition).

I agree that zstd is a blocker for 4.15.

> But yes - I will need to remind myself to filter what is eligible
> for committing, from now on until the branch point.

If there are edge cases, or things that would warrant an exception,
please do ask me explicitly.

In general my objective for the freeze policy is to try to minimise
the number and severity of bugs in 4.15 :-) and if I think a freeze
exception is the best way of doing that, I will grant one.

Ian.

