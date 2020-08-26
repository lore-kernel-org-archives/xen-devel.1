Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671FDC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 09:37:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2BE2087D
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 09:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="N+bzL8hi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2BE2087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kArrh-0003Ou-9D; Wed, 26 Aug 2020 09:37:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbNg=CE=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kArrf-0003Op-Ur
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 09:37:08 +0000
X-Inumbo-ID: f5d7578e-53df-4766-a473-bf3009bbd5ba
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d7578e-53df-4766-a473-bf3009bbd5ba;
 Wed, 26 Aug 2020 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=2FA0A3IlUGAcG/PqjJ2uNW34u6DxgRG5OLlK8rMoPEk=; b=N+bzL8hif+T+nPF4bP9+eWKrQ3
 Q9gNuuOB02xDcTXKAYOdAzxOQEWL9LfDWi4CWLQZxmt3ERXLROxyAP+i//wrdApTOJ0RPVqdy4Ucf
 vnct/svmX2HfTsbCwEbAxUEx7oj3h4X6TR8ECECc2pc8uQy0/DGxygy57DvUk0gPT4y0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kArrc-0006fh-1q; Wed, 26 Aug 2020 09:37:04 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kArrb-0000zn-P7; Wed, 26 Aug 2020 09:37:03 +0000
Subject: Re: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200825174208.11070-1-julien@xen.org>
 <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c38ad53f-0a95-cb89-1a1a-c896ecb10ff0@xen.org>
Date: Wed, 26 Aug 2020 10:37:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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



On 26/08/2020 08:46, Bertrand Marquis wrote:
> 
> 
>> On 25 Aug 2020, at 18:42, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
>> added a new erratum but forgot to update silicon-errata.txt.
>>
>> Update the file accordingly to keep track of errata workaround in Xen.
> 
> Oh i should have done that as part of my patch.
> Nice catch.
> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> docs/misc/arm/silicon-errata.txt | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
>> index 11e5a9dcec2c..ee070e723a5f 100644
>> --- a/docs/misc/arm/silicon-errata.txt
>> +++ b/docs/misc/arm/silicon-errata.txt
>> @@ -51,4 +51,5 @@ stable hypervisors.
>> | ARM            | Cortex-A57      | #1319537        | N/A                     |
>> | ARM            | Cortex-A72      | #1319367        | N/A                     |
>> | ARM            | Cortex-A76      | #1165522        | N/A                     |
>> +| ARM            | Neoverse        | #1165522        | N/A
> 
> Should be Neoverse-N1 here (E1 for example is not impacted by this errata)

Ah, right. Would you be happy if I do the change on commit?

Cheers,

-- 
Julien Grall

