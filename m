Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B27C433E7
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 08:42:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C8820878
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 08:42:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="UMleSRYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C8820878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7826.20598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLIz-0001Ds-V0; Fri, 16 Oct 2020 08:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7826.20598; Fri, 16 Oct 2020 08:41:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLIz-0001Dl-SF; Fri, 16 Oct 2020 08:41:41 +0000
Received: by outflank-mailman (input) for mailman id 7826;
 Fri, 16 Oct 2020 08:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kTLIy-0001Dg-CY
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:41:40 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aefffed1-0d7c-48ad-9a0f-16b40f0ad5c2;
 Fri, 16 Oct 2020 08:41:39 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTLIu-0007C6-AZ; Fri, 16 Oct 2020 08:41:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTLIu-0006iG-1B; Fri, 16 Oct 2020 08:41:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kTLIy-0001Dg-CY
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:41:40 +0000
X-Inumbo-ID: aefffed1-0d7c-48ad-9a0f-16b40f0ad5c2
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aefffed1-0d7c-48ad-9a0f-16b40f0ad5c2;
	Fri, 16 Oct 2020 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JpUiGdpfcAUeQqezoyt1HraKe6cWV7EVmDIsmsuBiDE=; b=UMleSRYaRYRE3e0gk5mEwBlPrO
	SLrdxwq3IAM7cHiFiQ9o19Ou48axAyx0Z4rVgUd0e6fd5ZS1mrugs6wc4reBaH0Un+FU2grc7YJu4
	N8eNqE/EGhd0yz3WtcNW4vE0gkuqJRD8ShBNkb2HG8Ma5pUp85uRbNrN6YXteIo2oir8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTLIu-0007C6-AZ; Fri, 16 Oct 2020 08:41:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTLIu-0006iG-1B; Fri, 16 Oct 2020 08:41:36 +0000
Subject: Re: [PATCH V2 21/23] xen/arm: Add mapcache invalidation handling
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
 <cad29fdb-089a-541b-6c5b-538d96441714@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b074eb70-a770-1f96-3d68-b06476b963ca@xen.org>
Date: Fri, 16 Oct 2020 09:41:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <cad29fdb-089a-541b-6c5b-538d96441714@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/10/2020 07:29, Jan Beulich wrote:
> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> @@ -1067,7 +1068,14 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>>        */
>>       if ( p2m_is_valid(orig_pte) &&
>>            !mfn_eq(lpae_get_mfn(*entry), lpae_get_mfn(orig_pte)) )
>> +    {
>> +#ifdef CONFIG_IOREQ_SERVER
>> +        if ( domain_has_ioreq_server(p2m->domain) &&
>> +             (p2m->domain == current->domain) && p2m_is_ram(orig_pte.p2m.type) )
>> +            p2m->domain->qemu_mapcache_invalidate = true;
>> +#endif
>>           p2m_free_entry(p2m, orig_pte, level);
>> +    }
> 
> For all I have to say here, please bear in mind that I don't know
> the internals of Arm memory management.
> 
> The first odd thing here the merely MFN-based condition. It may
> well be that's sufficient, if there's no way to get a "not present"
> entry with an MFN matching any valid MFN. (This isn't just with
> your addition, but even before.
Invalid entries are always zeroed. So in theory the problem could arise 
if MFN 0 used in the guest. It should not be possible on staging, but I 
agree this should be fixed.

> 
> Given how p2m_free_entry() works (or is supposed to work in the
> long run), is the new code you add guaranteed to only alter leaf
> entries?

This path may also be called with tables. I think we want to move the 
check in p2m_free_entry() so we can find the correct leaf type.

> If not, the freeing of page tables needs deferring until
> after qemu has dropped its mappings.

Freeing the page tables doesn't release a page. So may I ask why we 
would need to defer it?

> 
> And with there being refcounting only for foreign pages, how do
> you prevent the freeing of the page just unmapped before qemu has
> dropped its possible mapping?
QEMU mappings can only be done using the foreign mapping interface. This 
means that page reference count will be incremented for each QEMU 
mappings. Therefore the page cannot disappear until QEMU dropped the 
last reference.

> On the x86 side this problem is one
> of the reasons why PVH Dom0 isn't "supported", yet. At least a
> respective code comment would seem advisable, so the issue to be
> addressed won't be forgotten.

Are you sure? Isn't because you don't take a reference on foreign pages 
while mapping it?

Anyway, Arm has supported foreign mapping since its inception. So if 
there is a bug, then it should be fixed.

Cheers,

-- 
Julien Grall

