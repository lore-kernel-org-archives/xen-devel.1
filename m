Return-Path: <SRS0=mBg9=KX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025C4C4708C
	for <xen-devel@archiver.kernel.org>; Fri, 28 May 2021 09:59:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AF596113E
	for <xen-devel@archiver.kernel.org>; Fri, 28 May 2021 09:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AF596113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bugseng.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133855.249327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmZH4-00050u-Cl; Fri, 28 May 2021 09:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133855.249327; Fri, 28 May 2021 09:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmZH4-00050n-93; Fri, 28 May 2021 09:59:26 +0000
Received: by outflank-mailman (input) for mailman id 133855;
 Fri, 28 May 2021 09:59:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymrK=KX=bugseng.com=roberto.bagnara@srs-us1.protection.inumbo.net>)
 id 1lmZH3-00050h-OZ
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 09:59:25 +0000
Received: from spartacus.cs.unipr.it (unknown [160.78.167.140])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdd7dd18-0484-4648-9303-58af12f09001;
 Fri, 28 May 2021 09:59:23 +0000 (UTC)
Received: from [192.168.43.199] (unknown [151.38.82.198])
 by spartacus.cs.unipr.it (Postfix) with ESMTPSA id EB6854E0ACB
 for <xen-devel@lists.xenproject.org>; Fri, 28 May 2021 11:59:21 +0200 (CEST)
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
X-Inumbo-ID: fdd7dd18-0484-4648-9303-58af12f09001
Subject: Re: Invalid _Static_assert expanded from HASH_CALLBACKS_CHECK
To: xen-devel@lists.xenproject.org
References: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
 <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
Message-ID: <88f2f029-ad2b-4f0d-c683-7ae9d7c92dc6@bugseng.com>
Date: Fri, 28 May 2021 11:59:13 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
MIME-Version: 1.0
In-Reply-To: <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Jan.

Please see below.

On 25/05/21 10:58, Jan Beulich wrote:
> On 24.05.2021 06:29, Roberto Bagnara wrote:
>> I stumbled upon parsing errors due to invalid uses of
>> _Static_assert expanded from HASH_CALLBACKS_CHECK where
>> the tested expression is not constant, as mandated by
>> the C standard.
>>
>> Judging from the following comment, there is partial awareness
>> of the fact this is an issue:
>>
>> #ifndef __clang__ /* At least some versions dislike some of the uses. */
>> #define HASH_CALLBACKS_CHECK(mask) \
>>       BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
>>
>> Indeed, this is not a fault of Clang: the point is that some
>> of the expansions of this macro are not C.  Moreover,
>> the fact that GCC sometimes accepts them is not
>> something we can rely upon:
>>
>> $ cat p.c
>> void f() {
>> static const int x = 3;
>> _Static_assert(x < 4, "");
>> }
>> $ gcc -c -O p.c
>> $ gcc -c p.c
>> p.c: In function ‘f’:
>> p.c:3:20: error: expression in static assertion is not constant
>> 3 | _Static_assert(x < 4, "");
>> | ~^~
>> $
> 
> I'd nevertheless like to stick to this as long as not proven
> otherwise by future gcc.

Just two observations:

1) Violating the C standard makes MISRA complicance significantly
    more difficult.  In addition, it complicates also compiler
    qualification, for those who are required to do it.

2) GCC is already proving otherwise: if you try compiling
    without optimization, compilation fails.

Kind regards,

    Roberto

