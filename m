Return-Path: <SRS0=Caab=K5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF83DC47082
	for <xen-devel@archiver.kernel.org>; Thu,  3 Jun 2021 09:10:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 883C8613AC
	for <xen-devel@archiver.kernel.org>; Thu,  3 Jun 2021 09:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 883C8613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.136384.252885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lojMW-0001Pq-VV; Thu, 03 Jun 2021 09:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136384.252885; Thu, 03 Jun 2021 09:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lojMW-0001Pj-SQ; Thu, 03 Jun 2021 09:10:00 +0000
Received: by outflank-mailman (input) for mailman id 136384;
 Thu, 03 Jun 2021 09:09:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lojMU-0001Pd-Qs
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 09:09:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lojMU-00023b-Kz; Thu, 03 Jun 2021 09:09:58 +0000
Received: from home.octic.net ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lojMU-00061A-Fu; Thu, 03 Jun 2021 09:09:58 +0000
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
	bh=Y8S49lXGsy9W6T8C2T08VS2kS485sSmT1TwgfDt1xlY=; b=fYaMa8W6T1cr0MQBNPjUSKpPDz
	6gfQ9DinRQqQhD+jlm0f2bFnhnoYAlqql5IV4nvHV3GSTChiIRN+EbQvaplvsiV69cQgeK2COyzyw
	a4CqTIhgAe3044sb1l1+IahMnSE0OXPTXvCJ7ygcSGaGykpuh1vcVBdSiLHrt2kX0dwE=;
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
 <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
Date: Thu, 3 Jun 2021 10:09:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2021 11:09, Penny Zheng wrote:
> Hi Julien
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, May 20, 2021 4:51 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>> Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
>>
>> Hi,
>>
>> On 20/05/2021 07:07, Penny Zheng wrote:
>>>>> It will be consistent with the ones defined in the parent node, domUx.
>>>> Hmmm... To take the example you provided, the parent would be chosen.
>>>> However, from the example, I would expect the property #{address,
>>>> size}-cells in domU1 to be used. What did I miss?
>>>>
>>>
>>> Yeah, the property #{address, size}-cells in domU1 will be used. And
>>> the parent node will be domU1.
>>
>> You may have misunderstood what I meant. "domU1" is the node that
>> contains the property "xen,static-mem". The parent node would be the one
>> above (in our case "chosen").
>>
> 
> I re-re-reconsider what you meant here, hope this time I get what you mean, correct me if I'm wrong,
> List an example here:
> 
>      / {
>          reserved-memory {
>              #address-cells = <2>;
>              #size-cells = <2>;
> 
>              staticmemdomU1: static-memory@0x30000000 {
>                  compatible = "xen,static-memory-domain";
>                  reg = <0x0 0x30000000 0x0 0x20000000>;
>              };
>          };
> 
>          chosen {
>              domU1 {
>                  compatible = "xen,domain";
>                  #address-cells = <0x1>;
>                  #size-cells = <0x1>;
>                  cpus = <2>;
>                  xen,static-mem = <&staticmemdomU1>;
> 
>                 ...
>              };
>          };
>      };
> 
> If user gives two different #address-cells and #size-cells in reserved-memory and domU1, Then when parsing it
> through `xen,static-mem`, it may have unexpected answers.

Why are you using the #address-cells and #size-cells from the node domU1 
to parse staticmemdomU1?

> I could not think a way to fix it properly in codes, do you have any suggestion? Or we just put a warning in doc/commits.

The correct approach is to find the parent of staticmemdomU1 (i.e. 
reserved-memory) and use the #address-cells and #size-cells from there.

Cheers,

-- 
Julien Grall

