Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E200DC433E0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 14:46:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C0064FD3
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 14:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C0064FD3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93788.177093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBik-0008S1-6Z; Fri, 05 Mar 2021 14:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93788.177093; Fri, 05 Mar 2021 14:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBik-0008Ru-3g; Fri, 05 Mar 2021 14:46:26 +0000
Received: by outflank-mailman (input) for mailman id 93788;
 Fri, 05 Mar 2021 14:46:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBii-0008Rm-Ty
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:46:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBii-0008Ff-TK
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:46:24 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIBii-0008NL-SX
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:46:24 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIBid-0000Fj-LR; Fri, 05 Mar 2021 14:46:19 +0000
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
	bh=BNuckCE/o0CrtmCmA33TR6XmxlAEzePgEuzuc6i1otc=; b=wueXlo0KZ3Qi5kVmBR28pBSMVQ
	0CgymVuhmam86mTw13g3JQZ3sl0MJI7054DFZSNM3ZN1NF3xTTl47UfyQwmMErCjlGpvIjTo6qskw
	jgNxd07NO3G83+WBzecJchHgNTaO1tP0RwkoTmKpu/hcJbpMLhnVpcg6xhnd33wzA2GI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24642.17467.425438.233285@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 14:46:19 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the
 maximum number of parameters
In-Reply-To: <817a49d7-5f11-e53f-5bf5-55d22b157bec@suse.com>
References: <20210305121029.7047-1-julien@xen.org>
	<24642.12417.651929.972294@mariner.uk.xensource.com>
	<eb65580f-0b6b-717c-f599-73dc32d790cf@suse.com>
	<24642.16967.563767.105312@mariner.uk.xensource.com>
	<817a49d7-5f11-e53f-5bf5-55d22b157bec@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jürgen Groß writes ("Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters"):
> On 05.03.21 15:37, Ian Jackson wrote:
> > Jürgen Groß writes ("Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters"):
> >> This is the max number of 0 delimited string parameters. Especially the
> >> stubdom case needs a binary blob (with length, of course) as parameter,
> >> and the number of 0 bytes in this data is just limited by the allowed
> >> payload length.
> >>
> >> See the comment in line 111 of xenstored_control.c.
> > 
> > AFAICT this "live-update" command is variadic.  So why is this
> > parameter set here it all then ?
> 
> In order to avoid allocating an array for 4000 arguments when there
> are only 5 which need to be treated as strings.

So this parameter is doing two jobs: 1. enabling non-variadic commands
to take binary input; 2. preventing variadic commands from allocating
unbounded memory.

The problem with this is that in case 1 exceeding the value is normal
and the final argument is binary data; whereas in case 2 glomming
together the arguments together with zeroes is wrong and potentially
hazrdous.

I suggest we solve problem 2 by imposing a higher fixed (for all
commands, variadic or not) limit (20 or something) which causes errors
when exceeded, rather than silent argument misinterpretation.

Ian.

