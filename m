Return-Path: <SRS0=uOBw=KO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF37C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 19 May 2021 12:37:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54505610A1
	for <xen-devel@archiver.kernel.org>; Wed, 19 May 2021 12:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54505610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.130057.243844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLRg-00009H-Ck; Wed, 19 May 2021 12:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130057.243844; Wed, 19 May 2021 12:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLRg-00009A-9T; Wed, 19 May 2021 12:37:04 +0000
Received: by outflank-mailman (input) for mailman id 130057;
 Wed, 19 May 2021 12:37:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljLRf-000092-LM
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 12:37:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljLRd-0001UU-R9; Wed, 19 May 2021 12:37:01 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljLRd-0001OZ-Lc; Wed, 19 May 2021 12:37:01 +0000
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
	bh=i0JrGOKKtE5fuHn0dNGcL+2YqLV56zteMLqCjUw10Kw=; b=5XgRdbRqu9tox0AZoqdgtADnDY
	Vs547cZegxiwwv3iyZcDq2xq4tpYigkM2tPWlygEud1A1xmcOgCI9ujf1a5k/sixh80A0Inum4vy2
	eFFZHanP2H0LRMQi5aAFVSYbDyUYSt5BJ1QeDLEs4MleXsckGe23Kgg89WTdzjsXG830=;
Subject: Re: [PATCH] tools/libs: guest: Fix Arm build after 8fc4916daf2a
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210518170339.29706-1-julien@xen.org>
 <6d77f58a-06d6-aadf-0451-b46020169004@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8f2513b6-57a7-692d-8211-213a41ef7af6@xen.org>
Date: Wed, 19 May 2021 13:36:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <6d77f58a-06d6-aadf-0451-b46020169004@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 18/05/2021 18:05, Andrew Cooper wrote:
> On 18/05/2021 18:03, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Gitlab CI spotted an issue when building the tools Arm:
>>
>> xg_dom_arm.c: In function 'meminit':
>> xg_dom_arm.c:401:50: error: passing argument 3 of 'set_mode' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>>    401 |     rc = set_mode(dom->xch, dom->guest_domid, dom->guest_type);
>>        |                                               ~~~^~~~~~~~~~~~
>>
>> This is because the const was not propagated in the Arm code. Fix it
>> by constifying the 3rd parameter of set_mode().
>>
>> Fixes: 8fc4916daf2a ("tools/libs: guest: Use const whenever we point to literal strings")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks! I have committed with just your ack to unblock the build.

CHeers,

-- 
Julien Grall

