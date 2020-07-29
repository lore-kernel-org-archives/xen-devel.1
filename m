Return-Path: <SRS0=CN9G=BI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA642C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2020 14:57:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E75420829
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2020 14:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="1WOxbrDc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E75420829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0nWG-00077B-EK; Wed, 29 Jul 2020 14:57:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQvr=BI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k0nWE-000774-Na
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 14:57:22 +0000
X-Inumbo-ID: ce2fe8be-d1ab-11ea-aa05-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce2fe8be-d1ab-11ea-aa05-12813bfff9fa;
 Wed, 29 Jul 2020 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QhHEaHPkW4uhDh2CPLU4RGxx9scYOzNumVO2pU8mGGw=; b=1WOxbrDcGnX1WwsrimygZXLZvZ
 VtFZkOJnD5z3bXkaz/vBK37BiCKEA1LEGVogG4T385YwjvS5INB/Y2aT5AS6RORdCF/qGmBM+RNfT
 eSgqshUfzZEDvp9E6G2YwdX9Y7Z4HrC29UF6E8sReTz2EnRU5vrnFp/uuEPnK8Aa1L1Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0nWB-0002Pm-6n; Wed, 29 Jul 2020 14:57:19 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0nWA-0003s2-V0; Wed, 29 Jul 2020 14:57:19 +0000
Subject: Re: [PATCH] xen/spinlock: move debug helpers inside the locked regions
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200729111330.64549-1-roger.pau@citrix.com>
 <16dd0f04-598b-8b84-8a25-6b89af9214d7@xen.org>
 <20200729135045.GD7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <bf6cdb76-e4ca-da72-182f-d61de3e92ccf@xen.org>
Date: Wed, 29 Jul 2020 15:57:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729135045.GD7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 29/07/2020 14:50, Roger Pau Monné wrote:
> On Wed, Jul 29, 2020 at 02:37:44PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 29/07/2020 12:13, Roger Pau Monne wrote:
>>> Debug helpers such as lock profiling or the invariant pCPU assertions
>>> must strictly be performed inside the exclusive locked region, or else
>>> races might happen.
>>>
>>> Note the issue was not strictly introduced by the pointed commit in
>>> the Fixes tag, since lock stats where already incremented before the
>>> barrier, but that commit made it more apparent as manipulating the cpu
>>> field could happen outside of the locked regions and thus trigger the
>>> BUG_ON.
>>
>>  From the wording, it is not entirely clear which BUG_ON() you are referring
>> to. I am guessing, it is the one in rel_lock(). Am I correct?
> 
> Yes, that's right. Expanding to:
> 
> "...  and thus trigger the BUG_ON in rel_lock()." would be better.

Looks good to me. With that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

I am happy to do the update on commit if there is no more comments.

Cheers,

-- 
Julien Grall

