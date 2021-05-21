Return-Path: <SRS0=XOLk=KQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B04C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 21 May 2021 13:15:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BD861244
	for <xen-devel@archiver.kernel.org>; Fri, 21 May 2021 13:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BD861244
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.131256.245407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk50C-0004TK-48; Fri, 21 May 2021 13:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131256.245407; Fri, 21 May 2021 13:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk50C-0004TD-08; Fri, 21 May 2021 13:15:44 +0000
Received: by outflank-mailman (input) for mailman id 131256;
 Fri, 21 May 2021 13:15:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qZ6I=KQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lk50A-0004T7-LW
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 13:15:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a2a318c-baf8-4cc2-882c-334c911da0da;
 Fri, 21 May 2021 13:15:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1657DACB1;
 Fri, 21 May 2021 13:15:41 +0000 (UTC)
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
X-Inumbo-ID: 4a2a318c-baf8-4cc2-882c-334c911da0da
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621602941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWFhObEmM365zZvigirQaG6yDJLonTUk6shsrryPPLo=;
	b=MdCAKm9KwqBxjvolZ/p8gvCZ2dV+mIVqJjgO0udEYEWk1hlrMJ8D/x8XnzsDxE84p/NLjJ
	JwwohHKBH52lSNr4Afh/5TEBLr3Z4t/TwueLKL1eTGZ1ykPxpI5xUzZs3L7jDsdDTvoZAl
	7Z15CtM9EwnU3BfI1cicDbbDdrhp3J8=
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
 <3953076f-c2fa-2e2a-4b07-fb610046a27d@suse.com>
 <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>
 <2d019c04-415b-293b-052b-26b1ea3be189@suse.com>
 <0103d46f-4feb-e49d-f738-a2bf3d38c216@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2733c58-4514-6df0-3f0b-0f8b65132017@suse.com>
Date: Fri, 21 May 2021 15:15:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <0103d46f-4feb-e49d-f738-a2bf3d38c216@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.05.2021 15:12, Boris Ostrovsky wrote:
> 
> On 5/21/21 3:45 AM, Juergen Gross wrote:
>> On 21.05.21 09:26, Jan Beulich wrote:
>>> On 21.05.2021 09:18, Juergen Gross wrote:
>>>> On 20.05.21 14:08, Jan Beulich wrote:
>>>>> On 20.05.2021 13:57, Juergen Gross wrote:
>>>>>> On 20.05.21 13:42, Jan Beulich wrote:
>>>>>>> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
>>>>>>> For this to work when NX is not available, x86_configure_nx() needs 
>> to
>>>>>>> be called first.
>>>>>>>
>>>>>>> Reported-by: Olaf Hering <olaf@aepfle.de>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>>>>
>>>>> Thanks. I guess I forgot
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>>
>>>>> If you agree, can you please add this before pushing to Linus?
>>>>
>>>> Uh, just had a look why x86_configure_nx() was called after
>>>> xen_setup_gdt().
>>>>
>>>> Upstream your patch will be fine, but before kernel 5.9 it will
>>>> break running as 32-bit PV guest (see commit 36104cb9012a82e7).
>>>
>>> Oh, indeed. That commit then actually introduced the issue here,
>>> and hence a Fixes: tag may be warranted.
>>
>> Added it already. :-)
>>
>> And I've limited the backport to happen not for 5.8 and older, of
>> course.
> 
> 
> Did something changed recently that this became a problem? That commit has been there for 3 years.

He happened to try on a system where NX was turned off in the BIOS. That's
not a setting you would usually find in use.


> Didn't Olaf report this to be a problem only on SLES kernels?

Which I assume have backports of the problematic change.

Jan

