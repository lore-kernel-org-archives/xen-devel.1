Return-Path: <SRS0=atsh=K3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE128C47080
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 15:36:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578EA610C8
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 15:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 578EA610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.134926.250906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6Qs-0005sd-4G; Tue, 01 Jun 2021 15:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134926.250906; Tue, 01 Jun 2021 15:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6Qs-0005sW-1D; Tue, 01 Jun 2021 15:35:54 +0000
Received: by outflank-mailman (input) for mailman id 134926;
 Tue, 01 Jun 2021 15:35:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lo6Qq-0005sP-Ak
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 15:35:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lo6Qp-0008Iz-2k; Tue, 01 Jun 2021 15:35:51 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lo6Qo-0006Vg-S2; Tue, 01 Jun 2021 15:35:50 +0000
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
	bh=/ihpCauTQfpifvAgMLpv/b08tZHMMzbgGergYeq+Oek=; b=j6rA5m4vcJVgXEZgDrhrcIaZPF
	UFylu8WNmz4EiereD2ZEfrIwovISBBMSph2M0zCRFRcUsH4ZVKS9zuqqx1QL6B8tlFL8bN9qSf3/1
	9p4mDvIqelH4ttHkspkXwgCV5wy7FMc06tVmjquU7ykskYyF3xbD06+ugXN6WpHP4F14=;
Subject: Re: [PATCH v2] xen/page_alloc: Remove dead code in
 alloc_domheap_pages()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210526161129.28572-1-julien@xen.org>
 <b449be48-cded-b1a2-5086-d4d6856ed5dc@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dc3777a7-e28e-5323-bfa8-95c6bfe2f8f4@xen.org>
Date: Tue, 1 Jun 2021 16:35:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <b449be48-cded-b1a2-5086-d4d6856ed5dc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/05/2021 08:15, Jan Beulich wrote:
> On 26.05.2021 18:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 1aac966e24e9 "xen: support RAM at addresses 0 and 4096",
>> bits_to_zone() will never return 0 and it is expected that we have
>> minimum 2 zones.
>>
>> Therefore the check in alloc_domheap_pages() is unnecessary and can
>> be removed. However, for sanity, it is replaced with an ASSERT().
>>
>> Also take the opportunity to switch from min_t() to min() as
>> bits_to_zone() cannot return a negative value. The macro is tweaked
>> to make it clearer.
>>
>> This bug was discovered and resolved using Coverity Static Analysis
>> Security Testing (SAST) by Synopsys, Inc.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - Remove BUILD_BUG_ON()
>>          - Switch from min_t() to min()
> 
> Since this fulfills the dependencies put in place at the time, the
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> continues to apply here. Thanks for making the adjustments.

Thanks for the review. It is now committed.

Cheers,

-- 
Julien Grall

