Return-Path: <SRS0=/1jQ=MV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1186C432BE
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jul 2021 15:23:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BFAF60F43
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jul 2021 15:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BFAF60F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161984.297211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m97sK-0003va-8a; Thu, 29 Jul 2021 15:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161984.297211; Thu, 29 Jul 2021 15:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m97sK-0003vT-4V; Thu, 29 Jul 2021 15:23:08 +0000
Received: by outflank-mailman (input) for mailman id 161984;
 Thu, 29 Jul 2021 15:23:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m97sJ-0003vN-00
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 15:23:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m97sF-0000Ke-Ny; Thu, 29 Jul 2021 15:23:03 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m97sF-00060j-Hd; Thu, 29 Jul 2021 15:23:03 +0000
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
	bh=4oYLqXu9qM5umKlMiN8kk9cvkLylv/S7RA/yT8wVoaw=; b=bbx0RS4zEDotLt8I7cGHPrP7+7
	DBYedWuJW9gAj88vz0hu+CbZWv6ZXnqtJZjJa7MDythmrM1UmvC6MWbIHQCW4CIVVDKC1cm7jme2p
	wFdzMXxTdLWMruv54F/VLfCmhjLzWUcow28VH1zXW385obUuJHJDg9lbOmGVQUm3Nf0s=;
Subject: Re: [PATCH] tools/xenstored: Don't assume errno will not be
 overwritten in lu_arch()
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210729110647.25500-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <bbdbc7a9-c82e-2656-6a03-553ff55a2101@xen.org>
Date: Thu, 29 Jul 2021 16:23:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729110647.25500-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 29/07/2021 12:06, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, do_control_lu() will set errno to 0 before calling
> lu_arch() and then check errno. The expectation is nothing in lu_arch()
> will change the value unless there is an error.
> 
> However, per errno(3), a function that succeeds is allowed to change
> errno. In fact, syslog() will overwrite errno if the logs are rotated
> at the time it is called.
> 
> To prevent any further issue, errno is now always set before
> returning NULL.
> 
> Additionally, errno is only checked when returning NULL so the client
> can see the error message if there is any.
> 
> Reported-by: Michael Kurth <mku@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   tools/xenstore/xenstored_control.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
> index 6b68b79faac7..6fcb42095b59 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -324,6 +324,7 @@ static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
>   	lu_status->kernel_size = size;
>   	lu_status->kernel_off = 0;
>   
> +	errno = 0;
>   	return NULL;
>   }
>   
> @@ -339,6 +340,7 @@ static const char *lu_binary_save(const void *ctx, struct connection *conn,
>   	memcpy(lu_status->kernel + lu_status->kernel_off, data, size);
>   	lu_status->kernel_off += size;
>   
> +	errno = 0;
>   	return NULL;
>   }
>   

I forgot to update lu_binary(). I will respin the patch once I get some 
feedback.

Cheers,

> @@ -798,9 +800,8 @@ static int do_control_lu(void *ctx, struct connection *conn,
>   		if (!ret)
>   			return errno;
>   	} else {
> -		errno = 0;
>   		ret = lu_arch(ctx, conn, vec, num);
> -		if (errno)
> +		if (!ret && errno)
>   			return errno;
>   	}
>   
> 

-- 
Julien Grall

