Return-Path: <SRS0=L0Gu=IC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF47DC433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 11:40:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E42064EC4
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 11:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E42064EC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93216.175924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHmLA-0005yR-AM; Thu, 04 Mar 2021 11:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93216.175924; Thu, 04 Mar 2021 11:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHmLA-0005yK-7C; Thu, 04 Mar 2021 11:40:24 +0000
Received: by outflank-mailman (input) for mailman id 93216;
 Thu, 04 Mar 2021 11:40:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHmL9-0005yF-Ci
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:40:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHmL8-0001eJ-D6; Thu, 04 Mar 2021 11:40:22 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHmL7-0008Ga-TG; Thu, 04 Mar 2021 11:40:22 +0000
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
	bh=o0SMcl0QrVeTLwMwPJSNeX/vgFbrRmjMnl1DVxkGznI=; b=16eMAih6S92geEqU897DgP1VlE
	gr60zs0EI65z6CEo7RjPJ0Nt1/D3EBd7V3PeBYnkiPpz4BN0UweEtvftI2XDp94YTg36HkyU+gFKf
	VjQ0Bx3kOPPEs03cquGNBxS+XlPAbcV0EZb3awBlVHUCW9FwYc9Hq152pS4npdDrS/E0=;
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for
 gcc11
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: Charles Arnold <CARNOLD@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
 <7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
 <1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
 <24640.49856.639416.385729@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <027e1854-1500-306a-eac8-8571e09df71c@xen.org>
Date: Thu, 4 Mar 2021 11:40:20 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24640.49856.639416.385729@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 04/03/2021 11:21, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
>> On 03.03.2021 20:09, Julien Grall wrote:
>>> On 01/03/2021 07:57, Jan Beulich wrote:
>>>> The upcoming release complains, not entirely unreasonably:
>>>>
>>>> In file included from rijndael.c:33:
>>>> .../xen/include/crypto/rijndael.h:55:53: note: previously declared as 'const unsigned char[]'
>>>>      55 | void    rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
>>>>         |                                                     ^~~~~~~~~~~~~~~~~~~~~~
>>>> rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned char[16]'} with mismatched bound [-Werror=array-parameter=]
>>>>     865 |     u8 ct[16])
> 
> I think this is an erroneous compiler warning.
> 
> It has been idiomatic in some codebases for a long time to write
>      const unsigned char[]
> as a formal parameter for an array (of whatever size).
AFAICT, this is not what GCC is trying to warn about. It is complaining 
that the prototype and the declaration doesn't use the same signature.

Indeed, the former is using [] while the declaration is using [16].

So compiler is working as intended when -Warray-parameter is selected 
(see [1]).

[1] https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
-- 
Julien Grall

