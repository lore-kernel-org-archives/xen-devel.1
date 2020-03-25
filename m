Return-Path: <SRS0=jAzW=5K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CAFC1975A
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2020 15:54:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B27492073E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2020 15:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B27492073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hygon.cn
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8M5-0007QF-Gm; Wed, 25 Mar 2020 15:54:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QfP3=5K=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jH8M4-0007QA-Ga
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:54:08 +0000
X-Inumbo-ID: c34d537c-6eb0-11ea-a6c1-bc764e2007e4
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c34d537c-6eb0-11ea-a6c1-bc764e2007e4;
 Wed, 25 Mar 2020 15:53:30 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam2.hygon.cn with ESMTP id 02PFjQPn016039;
 Wed, 25 Mar 2020 23:45:26 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-DB.hygon.cn with ESMTP id 02PFjB1w047376;
 Wed, 25 Mar 2020 23:45:16 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from [192.168.1.193] (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 25 Mar
 2020 23:44:53 +0800
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200324103726.3406-1-puwen@hygon.cn>
 <20200325103054.GA28601@Air-de-Roger>
From: Pu Wen <puwen@hygon.cn>
Message-ID: <772e041d-a91a-e67c-1243-530065b2f628@hygon.cn>
Date: Wed, 25 Mar 2020 23:23:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200325103054.GA28601@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex01.Hygon.cn (172.23.18.10) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn 02PFjQPn016039
X-DNSRBL: 
Subject: Re: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h
 in vmcb struct
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020/3/25 18:30, Roger Pau Monné wrote:
> On Tue, Mar 24, 2020 at 06:37:26PM +0800, Pu Wen wrote:
>> diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
>> index b9e389d481..d8a3285752 100644
>> --- a/xen/include/asm-x86/hvm/svm/vmcb.h
>> +++ b/xen/include/asm-x86/hvm/svm/vmcb.h
>> @@ -316,6 +316,17 @@ typedef union
>>       uint64_t raw;
>>   } intinfo_t;
>>   
>> +typedef union
>> +{
>> +    struct
>> +    {
>> +        u64 intr_shadow:    1;
>> +        u64 guest_intr_mask:1;
>> +        u64 resvd:          62;
> 
> Could you also use uint64_t for the fields, like you do below for
> raw?

Ok, thanks. Maybe bool for intr_shadow and guest_intr_mask is better?

-- 
Regards,
Pu Wen

