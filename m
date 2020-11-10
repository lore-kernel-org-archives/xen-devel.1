Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E32C388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 10:32:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1D220679
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 10:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="MMxGgVuv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1D220679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23220.49852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQwX-00039e-4J; Tue, 10 Nov 2020 10:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23220.49852; Tue, 10 Nov 2020 10:32:05 +0000
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
	id 1kcQwX-00039X-1E; Tue, 10 Nov 2020 10:32:05 +0000
Received: by outflank-mailman (input) for mailman id 23220;
 Tue, 10 Nov 2020 10:32:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcQwW-00039S-4R
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:32:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a9835cf-2743-4bbe-b8cb-932f69ab58f1;
 Tue, 10 Nov 2020 10:32:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90F2DABCC;
 Tue, 10 Nov 2020 10:32:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcQwW-00039S-4R
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:32:04 +0000
X-Inumbo-ID: 5a9835cf-2743-4bbe-b8cb-932f69ab58f1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5a9835cf-2743-4bbe-b8cb-932f69ab58f1;
	Tue, 10 Nov 2020 10:32:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605004322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=suPULunDBoceBK+KSIm9ml4LeFOfKA+UxEUDxa+REu8=;
	b=MMxGgVuvFeE5CNBX/QVvn85eBCqGYKx3okmH/ZxmEYahFuYH87MFlEMUFLZJDVr50BWdoX
	ElH7nGNrdu0EaACS4Bsqm1rzcOlEq9pcvRtF+LkEto9qEWng2C0P7L/Ru2v6bXTcB8LXML
	cdopS+sPSbERN9NHvFtA3cHJmoYZAbI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90F2DABCC;
	Tue, 10 Nov 2020 10:32:02 +0000 (UTC)
Subject: Re: [PATCH 1/5] x86/p2m: paging_write_p2m_entry() is a private
 function
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <1fab241b-3969-9ce5-2388-bcdbe3be6079@suse.com>
 <20201110102731.6eg6u7mxefoihmfq@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cc350f6-4b91-b56a-1891-cb60a5275af8@suse.com>
Date: Tue, 10 Nov 2020 11:32:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110102731.6eg6u7mxefoihmfq@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 11:27, Roger Pau Monné wrote:
> On Wed, Oct 28, 2020 at 10:22:04AM +0100, Jan Beulich wrote:
>> As it gets installed by p2m_pt_init(), it doesn't need to live in
>> paging.c. The function working in terms of l1_pgentry_t even further
>> indicates its non-paging-generic nature. Move it and drop its
>> paging_ prefix, not adding any new one now that it's static.
>>
>> This then also makes more obvious that in the EPT case we wouldn't
>> risk mistakenly calling through the NULL hook pointer.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/mm/p2m-pt.c
>> +++ b/xen/arch/x86/mm/p2m-pt.c
>> @@ -108,6 +108,31 @@ static unsigned long p2m_type_to_flags(c
>>      }
>>  }
>>  
>> +/*
>> + * Atomically write a P2M entry and update the paging-assistance state
>> + * appropriately.
>> + * Arguments: the domain in question, the GFN whose mapping is being updated,
>> + * a pointer to the entry to be written, the MFN in which the entry resides,
>> + * the new contents of the entry, and the level in the p2m tree at which
>> + * we are writing.
>> + */
>> +static int write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
>> +                           l1_pgentry_t *p, l1_pgentry_t new,
>> +                           unsigned int level)
>> +{
>> +    struct domain *d = p2m->domain;
>> +    struct vcpu *v = current;
> 
> I think you could constify both?

For v it looks like I could. For d a subsequent patch would then
need to undo it, so I'd prefer to keep it this way here.

Jan

