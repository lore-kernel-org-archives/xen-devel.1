Return-Path: <SRS0=Rlng=F3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABEFC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 15:01:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81EBF2335A
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 15:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81EBF2335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.58424.102716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5d4-0007FI-C3; Wed, 23 Dec 2020 15:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58424.102716; Wed, 23 Dec 2020 15:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5d4-0007FB-90; Wed, 23 Dec 2020 15:00:42 +0000
Received: by outflank-mailman (input) for mailman id 58424;
 Wed, 23 Dec 2020 15:00:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks5d3-0007F6-GB
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 15:00:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fecfb620-1ff5-4294-9c87-422eff58cbba;
 Wed, 23 Dec 2020 15:00:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A713EACBA;
 Wed, 23 Dec 2020 15:00:39 +0000 (UTC)
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
X-Inumbo-ID: fecfb620-1ff5-4294-9c87-422eff58cbba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608735639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLGlKqxjqShMYThO4kOZ0yk7rC0zmMl3vfcvbrku7gs=;
	b=X5HWsfk+dWUj10totkHVf+rJAowTRuNl8y30yF/bhKteolkyBDwmng1UDHIDS9ZhBLhjIh
	1GqKXgZf/Z42GhocZeStDLcljgWMFt0uWsuQKiwe8KC4haPAGELM/ByGJ12p0CbnF4Fn9E
	HY94GBeU1NVSrek4KwZQRdJyZvipNns=
Subject: Re: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-4-julien@xen.org>
 <499e6d5a-e8ac-56db-1af9-70469b6a06b9@suse.com>
 <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19e92d90-ed9a-4bd6-79f4-b761b5a039c6@suse.com>
Date: Wed, 23 Dec 2020 16:00:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 15:56, Julien Grall wrote:
> On 23/12/2020 14:12, Jan Beulich wrote:
>> On 22.12.2020 16:43, Julien Grall wrote:
>>> This is an RFC because it would break AMD IOMMU driver. One option would
>>> be to move the call to the teardown callback earlier on. Any opinions?
>>
>> We already have
>>
>> static void amd_iommu_domain_destroy(struct domain *d)
>> {
>>      dom_iommu(d)->arch.amd.root_table = NULL;
>> }
>>
>> and this function is AMD's teardown handler. Hence I suppose
>> doing the same for VT-d would be quite reasonable. And really
>> VT-d's iommu_domain_teardown() also already has
>>
>>      hd->arch.vtd.pgd_maddr = 0;
> 
> Let me have a look if that works.
> 
>>
>> I guess what's missing is prevention of the root table
>> getting re-setup. 
> 
> This is taken care in the follow-up patch by forbidding page-table 
> allocation. I can mention it in the commit message.

My expectation is that with that subsequent change the change here
(or any variant of it) would become unnecessary.

Jan

