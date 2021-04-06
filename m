Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED791C433ED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 08:07:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85379613BE
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 08:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85379613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105679.202119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgjk-0003he-Ni; Tue, 06 Apr 2021 08:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105679.202119; Tue, 06 Apr 2021 08:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgjk-0003hX-JL; Tue, 06 Apr 2021 08:07:00 +0000
Received: by outflank-mailman (input) for mailman id 105679;
 Tue, 06 Apr 2021 08:06:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgji-0003hS-Ig
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 08:06:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ba5ffdd-a4ec-465a-8274-13cf2507fe51;
 Tue, 06 Apr 2021 08:06:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3DDCAFCB;
 Tue,  6 Apr 2021 08:06:56 +0000 (UTC)
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
X-Inumbo-ID: 3ba5ffdd-a4ec-465a-8274-13cf2507fe51
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617696417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIS3ZmqM+YwG/nmancgSNx2znAgMGmwMb0QdegUPzk8=;
	b=E+yPFAvWfithZm8M4A1hGR4ZBZ8OC4FPaUWBbn7yvtpEYu9x1zXFkDtaD8lwXyOPInTLdJ
	IZi44/27k5hsZiqAjlMYN0UwWXOY85MdUyD75OCRz0/+esgI5YKPLBc/LaLVTEDCIZTKHz
	5M10x5tea4NfY8Z/2yz+MfBSSkc/rLw=
Subject: Re: [PATCH 02/14] xen/sched: Constify name and opt_name in struct
 scheduler
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5618bed6-a213-d2c9-4cbf-d95cb4dc02b4@suse.com>
Date: Tue, 6 Apr 2021 10:07:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405155713.29754-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.04.2021 17:57, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Both name and opt_name are pointing to literal string. So mark both of
> the fields as const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -272,8 +272,8 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
>  }
>  
>  struct scheduler {
> -    char *name;             /* full name for this scheduler      */
> -    char *opt_name;         /* option name for this scheduler    */
> +    const char *name;       /* full name for this scheduler      */
> +    const char *opt_name;   /* option name for this scheduler    */

... I'd like to suggest considering at least the latter to become
an array instead of a pointer - there's little point wasting 8
bytes of storage for the pointer when the strings pointed to are
all at most 9 bytes long (right now; I don't expect much longer
ones to appear).

Jan

