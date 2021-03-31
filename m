Return-Path: <SRS0=azK0=I5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A5AC433B4
	for <xen-devel@archiver.kernel.org>; Wed, 31 Mar 2021 14:03:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A8D60FD9
	for <xen-devel@archiver.kernel.org>; Wed, 31 Mar 2021 14:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A8D60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103977.198348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbR5-0000T7-AM; Wed, 31 Mar 2021 14:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103977.198348; Wed, 31 Mar 2021 14:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbR5-0000T0-7B; Wed, 31 Mar 2021 14:03:07 +0000
Received: by outflank-mailman (input) for mailman id 103977;
 Wed, 31 Mar 2021 14:03:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRbR3-0000St-JM
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 14:03:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 647a201c-3ea3-4352-a043-4d5398091e99;
 Wed, 31 Mar 2021 14:03:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB6F6B270;
 Wed, 31 Mar 2021 14:03:03 +0000 (UTC)
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
X-Inumbo-ID: 647a201c-3ea3-4352-a043-4d5398091e99
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617199384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0wEriq9iFOnD68mNAtBmUmWQ3lCURXb3bswRldYuXA=;
	b=qJLs5/OeacrcPiBDOXO/+WgHXcGWhLXtt7DYv951+W88Y1xrSqyWGNKGby7e9cn6GFdjN3
	cMIh2o6Nkc+PaOnOlWlZD+jT0il8PsvOkpY4LeAjyEyPxRU/caD1jU9gnJnuLqNvPWoHIL
	NfcubHBPAWHhE46X5adFHg3w5S8Zgd0=
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95d8688b-2e54-ae02-09ce-45203959e08a@suse.com>
Date: Wed, 31 Mar 2021 16:03:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331133125.7072-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 15:31, Andrew Cooper wrote:
> vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the error
> path from __map_domain_page_global() failing would doubly free
> vlapic->regs_page.

I'm having difficulty seeing this. What I find at present is

    rc = vlapic_init(v);
    if ( rc != 0 ) /* teardown: vlapic_destroy */
        goto fail2;

and then

 fail3:
    vlapic_destroy(v);
 fail2:

Am I missing some important aspect?

> Rework vlapic_destroy() to be properly idempotent, introducing the necessary
> UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.
> 
> Rearrange vlapic_init() to group all trivial initialisation, and leave all
> cleanup to the caller, in line with our longer term plans.

Cleanup functions becoming idempotent is what I understand is the
longer term plan. I didn't think this necessarily included leaving
cleanup after failure in a function to it caller(s). At least in the
general case I think it would be quite a bit better if functions
cleaned up after themselves - perhaps (using the example here) by
vlapic_init() calling vlapic_destroy() in such a case.

Jan

