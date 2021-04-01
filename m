Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04965C43460
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:26:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE3B610A5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FE3B610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104214.199047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtaa-0002RZ-5c; Thu, 01 Apr 2021 09:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104214.199047; Thu, 01 Apr 2021 09:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtaa-0002RS-1m; Thu, 01 Apr 2021 09:26:08 +0000
Received: by outflank-mailman (input) for mailman id 104214;
 Thu, 01 Apr 2021 09:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtaZ-0002RN-Ni
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:26:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 104cbf2f-9beb-464f-8526-1937eb753ffe;
 Thu, 01 Apr 2021 09:26:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C586DAE6D;
 Thu,  1 Apr 2021 09:26:03 +0000 (UTC)
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
X-Inumbo-ID: 104cbf2f-9beb-464f-8526-1937eb753ffe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617269163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lOjNU+svs0+TiXpKu5imyHz2geYNGSrUhOwv1fq+E=;
	b=OTbD65dcOzWEIPi7d81zK/m578CscN/JdVT+gZc7eVdyFDEZ7Ha86zeHjFxYdqlmhAB0sL
	BQW2z1U4GzCv1HexBvwEMr8+t3+Cx2a9UVmhEF5rzijiVS4jgSetevcQbkItlONkVlUdpA
	mxs24bGG/ml4GqGE7+F6qjXnkbvh5RU=
Subject: Re: Revert NR_CPUS=1 fix from 4.15 (was: Re: [PATCH] fix
 for_each_cpu() again for NR_CPUS=1)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
 <YGWLxey5nZeafUbB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59387a2d-e28d-4e12-6b91-5df464e8ab9a@suse.com>
Date: Thu, 1 Apr 2021 11:26:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGWLxey5nZeafUbB@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 11:00, Roger Pau Monné wrote:
> On Wed, Mar 31, 2021 at 04:52:47PM +0200, Jan Beulich wrote:
>> Unfortunately aa50f45332f1 ("xen: fix for_each_cpu when NR_CPUS=1") has
>> caused quite a bit of fallout with gcc10, e.g. (there are at least two
>> more similar ones, and I didn't bother trying to find them all):
>>
>> In file included from .../xen/include/xen/config.h:13,
>>                  from <command-line>:
>> core_parking.c: In function ‘core_parking_power’:
>> .../xen/include/asm/percpu.h:12:51: error: array subscript 1 is above array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds]
>>    12 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
>> .../xen/include/xen/compiler.h:141:29: note: in definition of macro ‘RELOC_HIDE’
>>   141 |     (typeof(ptr)) (__ptr + (off)); })
>>       |                             ^~~
>> core_parking.c:133:39: note: in expansion of macro ‘per_cpu’
>>   133 |             core_tmp = cpumask_weight(per_cpu(cpu_core_mask, cpu));
>>       |                                       ^~~~~~~
>> In file included from .../xen/include/xen/percpu.h:4,
>>                  from .../xen/include/asm/msr.h:7,
>>                  from .../xen/include/asm/time.h:5,
>>                  from .../xen/include/xen/time.h:76,
>>                  from .../xen/include/xen/spinlock.h:4,
>>                  from .../xen/include/xen/cpu.h:5,
>>                  from core_parking.c:19:
>> .../xen/include/asm/percpu.h:6:22: note: while referencing ‘__per_cpu_offset’
>>     6 | extern unsigned long __per_cpu_offset[NR_CPUS];
>>       |                      ^~~~~~~~~~~~~~~~
> 
> At this point, should be consider reverting the original fix from the
> 4.15 branch, so that we don't release something that's build broken
> with gcc 10?

Well, I didn't propose reverting (or taking this fix) because I think
build breakage is better than runtime breakage. But in the end, Ian,
it's up to you.

Jan

