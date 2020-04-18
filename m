Return-Path: <SRS0=dngF=6C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB64CC2D0EF
	for <xen-devel@archiver.kernel.org>; Sat, 18 Apr 2020 10:54:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8C122240
	for <xen-devel@archiver.kernel.org>; Sat, 18 Apr 2020 10:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="paZ1Fyuh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8C122240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPl7N-00053p-5g; Sat, 18 Apr 2020 10:54:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8kJB=6C=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPl7L-00053k-VW
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 10:54:36 +0000
X-Inumbo-ID: fd8c1b8a-8162-11ea-8e3b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd8c1b8a-8162-11ea-8e3b-12813bfff9fa;
 Sat, 18 Apr 2020 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HSDBAEvJ7RUlXDXP2H48sMA6xVahTxTlM0FI7E2eZyE=; b=paZ1Fyuh8aotQMdB3iF+9wnzkg
 cR2Q+yNseUUff9F/3ucYG21KugeFSxEvafCXEeKdXW/qTqdM7WZHJOU2kyyHcACbJOYLbcg0ebs/f
 rlltHPwWc+GoQqCEWgq+nYMlQt/TvsxdS2VY8KCx8ENGuunNeMnpQcbgoFlh+Afxo81E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPl7I-0007GG-N9; Sat, 18 Apr 2020 10:54:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPl7I-0005Mp-Fq; Sat, 18 Apr 2020 10:54:32 +0000
Subject: Re: [PATCH 06/17] xen/x86: mm: Fix the comment on top
 put_page_from_l2e() to use 'mfn'
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-7-julien@xen.org>
 <4f6d47dd-997d-977e-690d-7f21be2617a0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <09bf5a4a-e60f-3f98-1a3d-00e4777665fa@xen.org>
Date: Sat, 18 Apr 2020 11:54:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4f6d47dd-997d-977e-690d-7f21be2617a0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 26/03/2020 15:51, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> We are using the 'mfn' to refer to machine frame. As this function deal
>> with 'mfn', replace 'pfn' with 'mfn'.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> I am not entirely sure to understand the comment on top of the
>> function, so this change may be wrong.
> 
> Looking at the history of the function, ...
> 
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -1321,7 +1321,7 @@ static int put_data_pages(struct page_info *page, bool writeable, int pt_shift)
>>   }
>>   
>>   /*
>> - * NB. Virtual address 'l2e' maps to a machine address within frame 'pfn'.
>> + * NB. Virtual address 'l2e' maps to a machine address within frame 'mfn'.
>>    * Note also that this automatically deals correctly with linear p.t.'s.
>>    */
>>   static int put_page_from_l2e(l2_pgentry_t l2e, mfn_t l2mfn, unsigned int flags)
> 
> ... it used to be
> 
> static int put_page_from_l2e(l2_pgentry_t l2e, unsigned long pfn)
> 
> When the rename occurred (in the context of or as a follow-up to an
> XSA iirc), the comment adjustment was apparently missed. With the
> referenced name matching that of the function argument (l2mfn)
> Acked-by: Jan Beulich <jbeulich@suse.com>

I will update the reference to use 'l2mfn' and also add a word that the 
comment was adjusted in ea51977a7aa5e645680a7194550fbceb59004ccf.

Cheers,

-- 
Julien Grall

