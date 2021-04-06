Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA636C433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 13:44:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6975961165
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 13:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6975961165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105960.202601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTlzy-00030e-Ru; Tue, 06 Apr 2021 13:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105960.202601; Tue, 06 Apr 2021 13:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTlzy-00030X-OB; Tue, 06 Apr 2021 13:44:06 +0000
Received: by outflank-mailman (input) for mailman id 105960;
 Tue, 06 Apr 2021 13:44:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTlzx-00030Q-Pm
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 13:44:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTlzv-0007eJ-M6; Tue, 06 Apr 2021 13:44:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTlzv-0007NQ-Cg; Tue, 06 Apr 2021 13:44:03 +0000
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
	bh=gJN23I4Q/wriX+nEdwGqDDRW8Vt/TNXMrjMBXOvWcX4=; b=rU27z10f8DuT5vT0o0gZYUOMHF
	NmGcaY07UTJol6aBl1ASMlb3Xv1iCmH+pO5Uvrp4nezZFXVB9ubYJsQKXCHbZyBG8rncBtTZQKreL
	8mk2tH8+iEz/cbqOR4JsuLGPtH1d5c+9zP7Ed5iHWmwF0N0Ras5ILYv1JCXCdm9rHCOA=;
Subject: Re: [PATCH] rangeset: no need to use snprintf()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2338703b-3613-41c6-8ae6-387ba2869408@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <80d625d8-6812-7d02-c946-a3905cbc306d@xen.org>
Date: Tue, 6 Apr 2021 14:44:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2338703b-3613-41c6-8ae6-387ba2869408@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/04/2021 09:50, Jan Beulich wrote:
> As of the conversion to safe_strcpy() years ago there has been no need
> anymore to use snprintf() to prevent storing a not-nul-terminated string.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -436,14 +436,7 @@ struct rangeset *rangeset_new(
>       BUG_ON(flags & ~RANGESETF_prettyprint_hex);
>       r->flags = flags;
>   
> -    if ( name != NULL )
> -    {
> -        safe_strcpy(r->name, name);
> -    }
> -    else
> -    {
> -        snprintf(r->name, sizeof(r->name), "(no name)");
> -    }
> +    safe_strcpy(r->name, name ?: "(no name)");

I realize the current code is not checking the return, but I wonder we 
should rather than silently truncating the string.

This is not a new issue, so it can dealt separately if we decide to 
check the return.

Cheers,

-- 
Julien Grall

