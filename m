Return-Path: <SRS0=X+fC=A7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB73C433E4
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 16:27:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B90BE2073A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 16:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B90BE2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxYd8-0000nb-Qf; Mon, 20 Jul 2020 16:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxYd7-0000nW-O6
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 16:27:05 +0000
X-Inumbo-ID: d8c650fe-caa5-11ea-84a5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8c650fe-caa5-11ea-84a5-bc764e2007e4;
 Mon, 20 Jul 2020 16:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 515B8B662;
 Mon, 20 Jul 2020 16:27:10 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
 <20200715133217.GZ7191@Air-de-Roger>
 <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
 <20200715145144.GA7191@Air-de-Roger>
 <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
 <01509d7d-4cf3-7f3f-4aa1-eaa3b1d3b95b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e15eb2d0-800f-4fbd-6d58-8bceb408593f@suse.com>
Date: Mon, 20 Jul 2020 18:27:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <01509d7d-4cf3-7f3f-4aa1-eaa3b1d3b95b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.07.2020 17:28, Andrew Cooper wrote:
> On 16/07/2020 11:06, Jan Beulich wrote:
>> ACCESS_ONCE() guarantees single access, but doesn't guarantee that
>> the compiler wouldn't split this single access into multiple insns.
> 
> ACCESS_ONCE() does guarantee single accesses for any natural integer size.
> 
> There is a section about this specifically in Linux's
> memory-barriers.txt, and this isn't the first time I've pointed it out...

There indeed is text stating this, but I can't find any word on
why they believe this is the case. My understanding of volatile
is that it guarantees no more (and also no less) accesses to
any single storage location than indicated by the source. But
it doesn't prevent "tearing" of accesses. And really, how could
it, considering that volatile can also be applied to types that
aren't basic ones, and hence in particular to ones that can't
possibly be accessed by a single insn?

I'd be glad to see you point out the aspect I'm missing here.

Jan

