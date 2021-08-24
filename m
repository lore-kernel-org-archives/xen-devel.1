Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C820C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 15:20:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564B06127B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 15:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 564B06127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171596.313108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYDp-0000D1-45; Tue, 24 Aug 2021 15:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171596.313108; Tue, 24 Aug 2021 15:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYDp-0000Cu-18; Tue, 24 Aug 2021 15:20:17 +0000
Received: by outflank-mailman (input) for mailman id 171596;
 Tue, 24 Aug 2021 15:20:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIYDo-0000Co-94
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:20:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIYDn-0006F5-Ao; Tue, 24 Aug 2021 15:20:15 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIYDn-0006y0-4X; Tue, 24 Aug 2021 15:20:15 +0000
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
	bh=Gn7NC3N9BTxuuzUMobnpnZFeXICUC3tZAsRm5h9BVLI=; b=C/GCCr4lkZIxi/mmqKFil0ruMy
	YNpJ65h5R3nfn8ojn0mA4zNakucXCSPAtdjjY+4HQ3VNwWWACx3Z11rV0siA/LY7L0r+4ljGh58ia
	/wZqUOnpnyEI0w5/vSzUeGu+QuZjRvX8q2fKwkKL2oGWsN/1umL7SE+57MUeH+ivyEqg=;
Subject: Re: [XEN PATCH v7 12/51] build: avoid building arm/arm/*/head.o twice
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-13-anthony.perard@citrix.com>
 <3152a1d5-3185-1d9c-8949-39015c73bbe4@xen.org> <YSUMWqAKtsbeTV3Z@perard>
From: Julien Grall <julien@xen.org>
Message-ID: <249a8757-41e4-cad6-b3eb-4720c1a579d4@xen.org>
Date: Tue, 24 Aug 2021 16:20:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSUMWqAKtsbeTV3Z@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 24/08/2021 16:12, Anthony PERARD wrote:
> On Tue, Aug 24, 2021 at 01:53:11PM +0100, Julien Grall wrote:
>> Hi Anthony,
>>
>> On 24/08/2021 11:49, Anthony PERARD wrote:
>>> head.o is been built twice, once because it is in $(ALL_OBJS) and a
>>> second time because it is in $(extra-y) and thus it is rebuilt when
>>> building "arch/arm/built_in.o".
>>>
>>> Fix this by adding a dependency of "head.o" on the directory
>>> "arch/arm/".
>>>
>>> Also, we should avoid building object that are in subdirectories, so
>>> move the declaration in there. This doesn't change anything as
>>> "arch/arm/built_in.o" depends on "arch/arm/$subarch/built_in.o" which
>>> depends on $(extra-y), so we still need to depend on
>>> "arch/arm/built_in.o".
>>
>> head.o as to be right at the beginning of the binary. Will this still be
>> guaranteed with this change?
> 
> I guess what you want to know is: no change to the final binary.
> 
> The layout of the final binary is defined by $(ALL_OBJS), which this
> patch doesn't change.
> 
> This patch only ask make that when it want to build "head.o", it need
> first to build "arm/built_in.o", then "head.o" exist so we ask make to
> not do anything in this Makefile.

Cool. Thanks for the confirmation! You can add:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

