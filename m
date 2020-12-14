Return-Path: <SRS0=B7AJ=FS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D8AC4361B
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 09:04:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287CF2076A
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 09:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 287CF2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.51984.90935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojlV-0007lM-IW; Mon, 14 Dec 2020 09:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51984.90935; Mon, 14 Dec 2020 09:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojlV-0007lF-Dn; Mon, 14 Dec 2020 09:03:33 +0000
Received: by outflank-mailman (input) for mailman id 51984;
 Mon, 14 Dec 2020 09:03:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kojlT-0007lA-JP
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:03:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b7e670b-fad6-473f-b56a-93f25bab5c0f;
 Mon, 14 Dec 2020 09:03:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09240AC10;
 Mon, 14 Dec 2020 09:03:30 +0000 (UTC)
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
X-Inumbo-ID: 8b7e670b-fad6-473f-b56a-93f25bab5c0f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607936610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NgiftfljNLjlF2FZgtFopk9t52PfwgGAjN3ponFFHQ=;
	b=PKsWk1tWU3PV/r61wFreN0yf8jSgRvOd5srjlYx3/w1HGoIODIYpNwjSRfC6XzTcs76M18
	0HRmLVYZXu+R+OR1LqR+sUySL4DGVOaEFC+Zd8O45MiDqqllmiZQzkvtwxRotFyy5Tzmb1
	mJZ6oBesDP4OIyDRYdptOk0THP9wgOY=
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74be05c2-375e-6b7e-ef87-31d4f7338a03@suse.com>
Date: Mon, 14 Dec 2020 10:03:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214075615.25038-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.12.2020 08:56, Juergen Gross wrote:
> Add support to run a function in an exception handler for Arm. Do it
> the same way as on x86 via a bug_frame.
> 
> Unfortunately inline assembly on Arm seems to be less capable than on
> x86, leading to functions called via run_in_exception_handler() having
> to be globally visible.

Could you extend on this? I don't understand what the relevant
difference is, from just looking at the changes.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - new patch
> 
> I have verified the created bugframe is correct by inspecting the
> created binary.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/arch/arm/traps.c       | 10 +++++++++-
>  xen/drivers/char/ns16550.c |  3 ++-
>  xen/include/asm-arm/bug.h  | 32 +++++++++++++++++++++-----------
>  3 files changed, 32 insertions(+), 13 deletions(-)

Aiui you also need to modify xen.lds.S to cover the new (or really
the last renamed) section.

Jan

