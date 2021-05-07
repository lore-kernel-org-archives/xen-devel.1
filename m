Return-Path: <SRS0=TJt3=KC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E959CC433B4
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 08:30:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70FD61451
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 08:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70FD61451
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123830.233655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levsA-0004Vd-UK; Fri, 07 May 2021 08:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123830.233655; Fri, 07 May 2021 08:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levsA-0004VW-QL; Fri, 07 May 2021 08:30:10 +0000
Received: by outflank-mailman (input) for mailman id 123830;
 Fri, 07 May 2021 08:30:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1levsA-0004VQ-0t
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:30:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c1f5e22-b35c-4624-8df6-b4e645a3b469;
 Fri, 07 May 2021 08:30:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 435D4AD21;
 Fri,  7 May 2021 08:30:08 +0000 (UTC)
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
X-Inumbo-ID: 2c1f5e22-b35c-4624-8df6-b4e645a3b469
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620376208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRIk+UB+w/f1mAxF+tpHlmcPAWvTPnhSeyrW5cMHe4M=;
	b=nQ0W2tGh1H15+TdXQsFFCrjei5sINpQrP1Il9CKJEI9xL4ASAxVcPj3dT9kmbPZzu20PDC
	QNTGEe3goYhteuOHIkNOMSvkJVhRdG+L8VfFkV3Y10iKg9AUQlMxyCHQQfxczUeuaoCy5k
	aXsT58Oah85jjNgrT9Rz4gqdXGYfN0c=
Subject: Re: [PATCH RFC 2/2] xen/kexec: Reserve KEXEC_TYPE_LIVEUPDATE and
 KEXEC_RANGE_MA_LIVEUPDATE
To: Hongyan Xia <hx242@xen.org>
Cc: dwmw2@infradead.org, paul@xen.org, raphning@amazon.com,
 maghul@amazon.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20210506104259.16928-1-julien@xen.org>
 <20210506104259.16928-3-julien@xen.org>
 <8773723448ea05a6ea0c843e408f6f05a04c2fd6.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b66d3a3-e4cd-f154-c8a4-05adef518733@suse.com>
Date: Fri, 7 May 2021 10:30:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8773723448ea05a6ea0c843e408f6f05a04c2fd6.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.05.2021 10:24, Hongyan Xia wrote:
> On Thu, 2021-05-06 at 11:42 +0100, Julien Grall wrote:
>> @@ -150,6 +155,8 @@ typedef struct xen_kexec_load_v1 {
>>  #define KEXEC_RANGE_MA_EFI_MEMMAP 5 /* machine address and size of
>>                                       * of the EFI Memory Map */
>>  #define KEXEC_RANGE_MA_VMCOREINFO 6 /* machine address and size of
>> vmcoreinfo */
>> +/* machine address and size of the Live Update area below Xen */
>> +#define KEXEC_RANGE_MA_LIVEUPDATE 7
> 
> Very nit: I tend to say "right below" Xen, since below sounds like it
> could be anywhere. In the design doc we also said "just below".

But is this a hard requirement, i.e. something that needs specifying
here?

Jan

