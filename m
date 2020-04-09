Return-Path: <SRS0=5pkY=5Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D31EC2BB55
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2020 14:53:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28268206E9
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2020 14:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28268206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYY6-0007M4-9l; Thu, 09 Apr 2020 14:52:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMYY5-0007Lz-OE
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:52:57 +0000
X-Inumbo-ID: cc42c990-7a71-11ea-82df-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc42c990-7a71-11ea-82df-12813bfff9fa;
 Thu, 09 Apr 2020 14:52:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 02BAEAD10;
 Thu,  9 Apr 2020 14:52:54 +0000 (UTC)
Subject: Re: [PATCH] x86/xen: fix booting 32-bit pv guest
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20200409070001.16675-1-jgross@suse.com>
 <ee2aa0c4-b633-a5e6-436c-0776407c98ac@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cce1a59b-983f-85aa-95a4-f7b5bc82c39e@suse.com>
Date: Thu, 9 Apr 2020 16:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ee2aa0c4-b633-a5e6-436c-0776407c98ac@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.20 16:44, Boris Ostrovsky wrote:
> 
> On 4/9/20 3:00 AM, Juergen Gross wrote:
>> Commit 2f62f36e62daec ("x86/xen: Make the boot CPU idle task reliable")
>> introduced a regression for booting 32 bit Xen PV guests: the address
>> of the initial stack needs to be a virtual one.
>>
>> Fixes: 2f62f36e62daec ("x86/xen: Make the boot CPU idle task reliable")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> 
> 
>> ---
>>   arch/x86/xen/xen-head.S | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
>> index 7d1c4fcbe8f7..1ba601df3a37 100644
>> --- a/arch/x86/xen/xen-head.S
>> +++ b/arch/x86/xen/xen-head.S
>> @@ -38,7 +38,7 @@ SYM_CODE_START(startup_xen)
>>   #ifdef CONFIG_X86_64
> 
> 
> While at it, I'd swap the ifdefs and fold x86_64 case into the one below.

I wanted to remove 32-bit PV support from the kernel soon, so I think
this can wait until then. :-)


Juergen

