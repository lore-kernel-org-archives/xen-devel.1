Return-Path: <SRS0=1JDs=B6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C636DC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 09:35:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F8B207DE
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 09:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="lG9jRKG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F8B207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8gyE-0006wg-1X; Thu, 20 Aug 2020 09:34:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8gyC-0006wa-RR
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 09:34:52 +0000
X-Inumbo-ID: 18a15336-c0f4-491d-b416-47ed95396f9a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18a15336-c0f4-491d-b416-47ed95396f9a;
 Thu, 20 Aug 2020 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=DIk7aDgBORonPkW2B3FxAe671TJ60KMahkum99U05ik=; b=lG9jRKG8AHd6qhbidBDV9w4OA4
 up6JfBMs/5gwskOX1CsIiS8qMoAfEqJgVTJBDdfg2k+yl5/2m7udSdcSfarJzFIGx02MRvl14gYb4
 hbi5lT5is2jV12hGp4u8tiaP0nRdvAThon2dueZBiTqg7BTK0x8ENDBvOhEwNnyMBBeQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8gy9-0007TQ-SO; Thu, 20 Aug 2020 09:34:49 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8gy9-0004JJ-G2; Thu, 20 Aug 2020 09:34:49 +0000
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
 <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
 <20200817103306.GA828@Air-de-Roger>
 <f8b9a884-79e3-bd9d-d7bc-94fb9ee9906d@xen.org>
 <20200817114730.GB828@Air-de-Roger>
 <67e0c0f1-d85f-ad4d-d6bb-cee3603962f4@xen.org>
 <0fc30c51-9a7b-6421-ecdf-dbdbb76480f7@suse.com>
 <7f37a386-d758-ac3e-c32b-f7bb1b523f52@xen.org>
 <7998876a-d909-6987-8edf-542798f7eee8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e2ec7dc5-49a6-ba3f-d3b0-a22bbbf411dc@xen.org>
Date: Thu, 20 Aug 2020 10:34:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7998876a-d909-6987-8edf-542798f7eee8@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 20/08/2020 10:25, Jan Beulich wrote:
> On 20.08.2020 11:14, Julien Grall wrote:
>>
>>
>> On 19/08/2020 10:22, Jan Beulich wrote:
>>> On 17.08.2020 15:03, Julien Grall wrote:
>>>> On 17/08/2020 12:50, Roger Pau Monné wrote:
>>>>> On Mon, Aug 17, 2020 at 12:05:54PM +0100, Julien Grall wrote:
>>>>>> The only way I could see to make it work would be to use the same trick as
>>>>>> we do for {read, write}_atomic() (see asm-arm/atomic.h). We are using union
>>>>>> and void pointer to prevent explicit cast.
>>>>>
>>>>> I'm mostly worried about common code having assumed that cmpxchg
>>>>> does also handle 64bit sized parameters, and thus failing to use
>>>>> cmpxchg64 when required. I assume this is not much of a deal as then
>>>>> the Arm 32 build would fail, so it should be fairly easy to catch
>>>>> those.
>>>> FWIW, this is not very different to the existing approach. If one would
>>>> use cmpxchg() with 64-bit, then it would fail to compile.
>>>
>>> A somewhat related question then: Do you really need both the
>>> guest_* and the non-guest variants? Limiting things to plain
>>> cmpxchg() would further reduce the risk of someone picking the
>>> wrong one without right away noticing the build issue on Arm32.
>>> For guest_cmpxchg{,64}() I think there's less of a risk.
>>
>> For the IOREQ code, we will need the guest_* version that is built on
>> top of the non-guest variant.
>>
>> I would like at least consistency between the two variants. IOW, if we
>> decide to use the name guest_cmpxchg64(), then I would like to use
>> cmpxchg64().
> 
> On Arm, that is. There wouldn't be any need to expose cmpxchg64()
> for use in common code, and hence not at all on x86, I guess?

Right, we would only need to introduce guest_cmpxchg64() for common code.

Cheers,

-- 
Julien Grall

