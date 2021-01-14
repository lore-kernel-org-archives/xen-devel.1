Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD347C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 09:19:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0782242A
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 09:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0782242A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66900.119023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzymF-0003M3-20; Thu, 14 Jan 2021 09:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66900.119023; Thu, 14 Jan 2021 09:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzymE-0003Lw-Ul; Thu, 14 Jan 2021 09:18:46 +0000
Received: by outflank-mailman (input) for mailman id 66900;
 Thu, 14 Jan 2021 09:18:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzymD-0003Lr-KB
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 09:18:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzymD-0008Av-1k; Thu, 14 Jan 2021 09:18:45 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzymC-0005Xr-Q0; Thu, 14 Jan 2021 09:18:44 +0000
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
	bh=TrjXGX6pPsOMv0CIweHQ52KVZVtaW8GXwlpyJUMsMm0=; b=NlCcxLnwE6G6aqm+LZUW7nwhGT
	tKbNzagXsp6701osLgs8H7ZusbtJ/D6IOV/SBqCXmytqWPGRb+PIFxL3FoMIX6FXM4mbKU34vd7bl
	pcnhP0jHKXvldxl72uAq8Aq5kCQnk75VOaGGWIGOxGQX1tZiCeLGvESfl7yhcSB/hWlQ=;
Subject: Re: [PING] Re: [PATCH v2] xen/irq: Propagate the error from
 init_one_desc_irq() in init_*_irq_data()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20201128113642.8265-1-julien@xen.org>
 <b4d95397-3d01-7fd6-968c-2b82e3b2e95c@xen.org>
 <c9c1733d-4cae-a57a-27b0-8ff5d923ceaa@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7b825e1a-9bb6-2beb-e6d2-dd9caadd3858@xen.org>
Date: Thu, 14 Jan 2021 09:18:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <c9c1733d-4cae-a57a-27b0-8ff5d923ceaa@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 14/01/2021 09:15, Jan Beulich wrote:
> On 13.01.2021 20:05, Julien Grall wrote:
>> On 28/11/2020 11:36, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> init_one_desc_irq() can return an error if it is unable to allocate
>>> memory. While this is unlikely to happen during boot (called from
>>> init_{,local_}irq_data()), it is better to harden the code by
>>> propagting the return value.
>>>
>>> Spotted by coverity.
>>>
>>> CID: 106529
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Roger Paul Monné <roger.pau@citrix.com>
>>
>>   From my understanding of MAINTAINERS rule, I still need an ack from x86
>> maintainers.
> 
> Roger _is_ an x86 maintainer, so why would you need another ack?

Because I didn't realize that Roger became an x86 Maintainer...

I will commit the patch then.

Cheers,

-- 
Julien Grall

