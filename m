Return-Path: <SRS0=B7AJ=FS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BECC4361B
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 09:22:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F51E20771
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 09:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F51E20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.52021.91015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok4A-0004bB-Kq; Mon, 14 Dec 2020 09:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52021.91015; Mon, 14 Dec 2020 09:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok4A-0004b4-Hi; Mon, 14 Dec 2020 09:22:50 +0000
Received: by outflank-mailman (input) for mailman id 52021;
 Mon, 14 Dec 2020 09:22:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kok49-0004au-D6
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:22:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88c464d9-8590-4f3e-824c-51b1cc544db9;
 Mon, 14 Dec 2020 09:22:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3CFEAC90;
 Mon, 14 Dec 2020 09:22:47 +0000 (UTC)
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
X-Inumbo-ID: 88c464d9-8590-4f3e-824c-51b1cc544db9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607937767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USPPtQ3wjrCuNULsOnxyw+Dzmy/4ZrEJCVU/Ny1Y/M4=;
	b=nzDXZLXYqWRNIRBiyRPKbZ+E/HnzTdPoDROekfseIhcxp5C1scDCTqyAoA14X50HtabvML
	tSjzmyiNZu2Ijzlsffl9SJjiRFow51kw0WUZ1e6O5NIikpgyKfLen2MU3wNRT3RrRCoUrl
	ud8AKDU6PHhT79oV+TtpQt2Aqgc14/I=
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
 <74be05c2-375e-6b7e-ef87-31d4f7338a03@suse.com>
 <9a6a397d-2c4c-acdc-d3ff-b286e522c9bc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c86ccf6-0384-f91f-1fd5-6a179158d91e@suse.com>
Date: Mon, 14 Dec 2020 10:22:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <9a6a397d-2c4c-acdc-d3ff-b286e522c9bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.12.2020 10:15, Jürgen Groß wrote:
> On 14.12.20 10:03, Jan Beulich wrote:
>> On 14.12.2020 08:56, Juergen Gross wrote:
>>> Add support to run a function in an exception handler for Arm. Do it
>>> the same way as on x86 via a bug_frame.
>>>
>>> Unfortunately inline assembly on Arm seems to be less capable than on
>>> x86, leading to functions called via run_in_exception_handler() having
>>> to be globally visible.
>>
>> Could you extend on this? I don't understand what the relevant
>> difference is, from just looking at the changes.
> 
> The problem seems to be that a static symbol referenced from the inline
> asm seems not to silence the error that this static symbol isn't being
> used. On x86 the bug_frame is constructed using the %c modifier, which
> is not supported for Arm (at least gcc 7 used in my compile test
> complained), but seems to be enough for gcc on x86 to not complain.

But this isn't tied to %c not working on older gcc, is it? It looks
instead to be tied to you not specifying the function pointer as an
input in the asm(). The compiler would know the symbol is referenced
even if the input wasn't used at all in any of the asm()'s operands
(but of course it would be better to use the operand once you have
it, if it can be used in some way despite %c not being possible to
use).

Jan

