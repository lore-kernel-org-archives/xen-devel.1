Return-Path: <SRS0=Dhlx=NZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77FCC433F5
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 16:32:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A5460249
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 16:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66A5460249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.178246.324137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMC6V-00076K-1T; Fri, 03 Sep 2021 16:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178246.324137; Fri, 03 Sep 2021 16:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMC6U-00076D-Ul; Fri, 03 Sep 2021 16:31:46 +0000
Received: by outflank-mailman (input) for mailman id 178246;
 Fri, 03 Sep 2021 16:31:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mMC6U-000767-0P
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 16:31:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mMC6R-0000Qk-Ot; Fri, 03 Sep 2021 16:31:43 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mMC6R-000422-I3; Fri, 03 Sep 2021 16:31:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=L890QpMZCiO1y4oZR4rTouOouMUVodQHVV5GineFeIA=; b=UQ0wpUazcNWDt94uph65luMvXT
	mUTkmLzPCdA6yLy6TQwFKq6nWFU/FF7hRMAz+QTx1SnP6sZQvJfls+wy0Jf5TlcjVQn+q8uoRpkZp
	2sSSotRocqXtWs89UhmqShvLTtRJTKqWhxOnjG0WEI4x6jlkOwhFfQnUzuQ0fp90gENM=;
Subject: Re: [PATCH] domain: try to address Coverity pointing out a missing
 "break" in domain_teardown()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9db57ad3-ce25-c753-4f24-ff8396ad5d18@xen.org>
Date: Fri, 3 Sep 2021 17:31:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/09/2021 09:45, Jan Beulich wrote:
> Commit 806448806264 ("xen/domain: Fix label position in
> domain_teardown()" has caused Coverity to report a _new_ supposedly
> un-annotated fall-through in a switch(). I find this (once again)
> puzzling; I'm having an increasingly hard time figuring what patterns
> the tool is actually after. I would have expected that the tool would
> either have spotted an issue also before this change, or not at all. Yet
> if it had spotted one before, the statistics report should have included
> an eliminated instance alongside the new one (because then the issue
> would simply have moved by a few lines).
> 
> Hence the only thing I could guess is that the treatment of comments in
> macro expansions might be subtly different. Therefore try whether
> switching the comments to the still relatively new "fallthrough" pseudo
> keyword actually helps.
> 
> Coverity-ID: 1490865
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> If this doesn't help, I'm afraid I'm lost as to what Coverity means us
> to do to silence the reporting.
> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -401,13 +401,13 @@ static int domain_teardown(struct domain
>            */
>   #define PROGRESS(x)                             \
>           d->teardown.val = PROG_ ## x;           \
> -        /* Fallthrough */                       \
> +        fallthrough;                            \
>       case PROG_ ## x
>   
>   #define PROGRESS_VCPU(x)                        \
>           d->teardown.val = PROG_vcpu_ ## x;      \
>           d->teardown.vcpu = v;                   \
> -        /* Fallthrough */                       \
> +        fallthrough;                            \
>       case PROG_vcpu_ ## x:                       \
>           v = d->teardown.vcpu
>   
> 

Cheers,

-- 
Julien Grall

