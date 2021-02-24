Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39752C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 16:00:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B776864EC8
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 16:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B776864EC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89411.168384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEwac-000239-Ko; Wed, 24 Feb 2021 16:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89411.168384; Wed, 24 Feb 2021 16:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEwac-000232-Hk; Wed, 24 Feb 2021 16:00:38 +0000
Received: by outflank-mailman (input) for mailman id 89411;
 Wed, 24 Feb 2021 16:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEwab-00022x-74
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 16:00:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bee6f5cc-e43c-456d-88aa-dab923ecd10f;
 Wed, 24 Feb 2021 16:00:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AFFDAFC1;
 Wed, 24 Feb 2021 16:00:35 +0000 (UTC)
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
X-Inumbo-ID: bee6f5cc-e43c-456d-88aa-dab923ecd10f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614182435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HR035oIw42/hVgYurHuseBmclxN8kLLPkiQCO6LBgg=;
	b=eQDjL/WQtad5E2u6fr+LbW+CPaogaNpj1jeUWPvMbjcC3NYfmWhnbRM2/PmnFDa+zAL7L1
	i/Z0wkslez51+8bue6JPAealU3UdCOBI08l5IC04KISR1vtg1jroSt5/WHyfY9O6JrAXO/
	XsWEVGfny7KabP1su0ndcvSLVJS+lX4=
Subject: Re: [for-4.15][RESEND PATCH v4 2/2] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224094356.7606-1-julien@xen.org>
 <20210224094356.7606-3-julien@xen.org>
 <c666bf75-451d-fbc1-7fb1-600c4f014f05@suse.com>
Message-ID: <64de5c8f-83ed-23af-b24f-3c8dde50e226@suse.com>
Date: Wed, 24 Feb 2021 17:00:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c666bf75-451d-fbc1-7fb1-600c4f014f05@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.02.2021 16:58, Jan Beulich wrote:
> On 24.02.2021 10:43, Julien Grall wrote:
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
>>  
>>  void arch_iommu_domain_destroy(struct domain *d)
>>  {
>> +    /*
>> +     * There should be not page-tables left allocated by the time the
>> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
>> +     * called unconditionally, so pgtables may be unitialized.
>> +     */
>> +    ASSERT(dom_iommu(d)->platform_ops == NULL ||
> 
> Since you've used the preferred ! instead of "== 0" /
> "== NULL" in the ASSERT()s you add further up, may I ask that
> you do so here as well?

Oh, and I meant to provide
Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with that cosmetic adjustment (and ideally also with
"uninitialized" in the comment, as I notice only now).

Jan

