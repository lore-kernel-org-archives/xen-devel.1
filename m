Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D12C433EF
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 10:14:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D08E6103D
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 10:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D08E6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184217.332780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdXm-0004Wd-TC; Fri, 10 Sep 2021 10:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184217.332780; Fri, 10 Sep 2021 10:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdXm-0004WW-QK; Fri, 10 Sep 2021 10:14:02 +0000
Received: by outflank-mailman (input) for mailman id 184217;
 Fri, 10 Sep 2021 10:14:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyUy=OA=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOdXl-0004WQ-6k
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:14:01 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0afe5e8-121f-11ec-b222-12813bfff9fa;
 Fri, 10 Sep 2021 10:14:00 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631268831562445.8523312716843;
 Fri, 10 Sep 2021 03:13:51 -0700 (PDT)
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
X-Inumbo-ID: d0afe5e8-121f-11ec-b222-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631268835; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NO1dgVFE0PlIzP6RH4i10RLvbMjb8BWwy4SNWUXDmA+/7IWrM4IPg9bWk7LGcFHo0kET5I0Y1mZL9jfS2iC1KbWpqXP13Rn6xsR49v8GdqlK+jxeMB/llC2EX9noacs+bYg9ynM+8SdaqR/Y/npMZZGshDt6NlnoKUt+7QKbS0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631268835; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=c6pHtHfkmhfXA1VtjahOIFe4JoDeuAHfh41/EsW2tqk=; 
	b=DyTjr4x3Z8waaymBMMx1DfOJBX5hnIE0y24Jl0B8hNj/iodkFYHgQIDjiTwAHAjWxiEzaBwP5xFkY139Y61hFjUa2p05dQJ7SSowHf2sGOucr+VgTe89gg33HUEhw+9Cj2netG1Oadf+eOgt5+EFYuuIFw68bTIUW+h5xLRIFoA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631268835;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=c6pHtHfkmhfXA1VtjahOIFe4JoDeuAHfh41/EsW2tqk=;
	b=JPO4yAVm8GxI5EKFUOwutSqAGr4Wy2byAMwt9sJlwMRToDfHaP7n/Yc3pdNNTRq7
	thUkosKASCXADv7exf8drYymOCnf6aDdQrQKpaSqxDexRcU4caTpgBUoEmqeecE9ccw
	/NAGZ9Xp8vjPM4VsNIpJZhrBZHrHUh4Uqe4dN3jw=
Subject: Re: [PATCH v5 01/10] xen: Implement xen/alternative-call.h for use in
 common code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
 <20210910021236.15082-2-dpsmith@apertussolutions.com>
 <ac8670c3-a7d2-cc33-5043-22474567ed11@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <61cb35c6-f657-fe14-1258-799184c76145@apertussolutions.com>
Date: Fri, 10 Sep 2021 06:12:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ac8670c3-a7d2-cc33-5043-22474567ed11@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 9/10/21 2:10 AM, Jan Beulich wrote:
> On 10.09.2021 04:12, Daniel P. Smith wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> The alternative call infrastructure is x86-only for now, but the common iommu
>> code has a variant and more common code wants to use the infrastructure.
>>
>> Introduce CONFIG_ALTERNATIVE_CALL and a conditional implemetnation so common
>> code can use the optimisation when available, without requiring all
>> architectures to implement no-op stubs.
>>
>> Write some documentation, which was thus far entirely absent, covering the
>> requirements for an architecture to implement this optimsiation, and how to
>> use the infrastructure in general code.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> I did offer an A-b on v4, dependent upon two small adjustments. Was it
> deliberate to neither make these adjustments nor add the ack? (At that
> point I did offer making the adjustments while committing, but I think
> it goes without saying that upon re-submission the changes should be
> made. Unless of course there's disagreement about making them in the
> first place. Yet such disagreement would be worth making explicit then,
> imo.)
> 
> Jan
> 

Yes you did, perhaps I did not follow the thread correctly. Re-reading 
it you mentioned they could be addressed during committing. Since I am 
going to have to respin this because the hard-tab foul up, I can pick up 
those to adjustments and add your Ack-by.

v/r,
dps

