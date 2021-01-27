Return-Path: <SRS0=2Mj5=G6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31522C433E6
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 12:53:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B7320771
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 12:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B7320771
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76094.137176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4kJX-00039g-6K; Wed, 27 Jan 2021 12:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76094.137176; Wed, 27 Jan 2021 12:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4kJX-00039Z-24; Wed, 27 Jan 2021 12:52:51 +0000
Received: by outflank-mailman (input) for mailman id 76094;
 Wed, 27 Jan 2021 12:52:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4kJW-00039U-2P
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 12:52:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 890f91c3-7de2-4851-8202-2ce76484b47f;
 Wed, 27 Jan 2021 12:52:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3E03ABDA;
 Wed, 27 Jan 2021 12:52:42 +0000 (UTC)
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
X-Inumbo-ID: 890f91c3-7de2-4851-8202-2ce76484b47f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611751963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40EGBYVQzQy/CJYgjOd/avRCZXefzPG90Wp86ILC+/Y=;
	b=OIV1E0qJaasb4XLfIFimJhdDj1YKiMp1Bh9k3HkIjO6An+muYvW4TcuEzwfgzZ778f1K/u
	/WYSXJTFEFlM/iPcKqBG3yRr2ZGK2YnJByRV1qnCCemm+inlfHAYlE9Oh5VYeDQ7/r1lQO
	r38dwjyR6nhQlEz9KGfY0L1otClUsgs=
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
 <57d95c18-5215-03e7-7849-73c9fe968e75@xen.org>
 <e0bc7f80-974e-945d-4605-173bd05302af@gmail.com>
 <9aa563c1-de53-cafc-f7e7-c3da49b6ef6e@suse.com>
 <7d49becb-8774-5756-f2ed-ddba544231cc@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <254baa33-2427-ffeb-b4ee-9ceadd213f25@suse.com>
Date: Wed, 27 Jan 2021 13:52:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7d49becb-8774-5756-f2ed-ddba544231cc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.01.2021 13:22, Oleksandr wrote:
> On 27.01.21 12:24, Jan Beulich wrote:
>> On 21.01.2021 09:50, Oleksandr wrote:
>>> On 20.01.21 17:50, Julien Grall wrote:
>>>> On 17/01/2021 18:52, Oleksandr wrote:
>>>>> error2.txt - when add #include <public/hvm/dm_op.h> to xen/ioreq.h
>>>> It looks like the error is happening in dm.c rather than xen/dm.h. Any
>>>> reason to not include <public/hvm/dm_op.h> in dm.c directly?
>>> Including it directly doesn't solve build issue.
>>> If I am not mistaken in order to follow requirements how to include
>>> headers (alphabetic order, public* should be included after xen* and
>>> asm* ones, etc)
>>> the dm.h gets included the first in dm.c, and dm_op.h gets included the
>>> last. We can avoid build issue if we change inclusion order a bit,
>>> what I mean is to include dm.h after hypercall.h at least (because
>>> hypercall.h already includes dm_op.h). But this breaks the requirements
>>> and is not way to go.
>>> Now I am in doubt how to overcome this.
>> First, violating the alphabetic ordering rule is perhaps less
>> of a problem than putting seemingly stray #include-s anywhere.
>> However, as soon as ordering starts mattering, this is
>> indicative of problems with the headers: Either the (seemingly)
>> too early included one lacks some #include-s, or you've run
>> into a circular dependency. In the former case the needed
>> #include-s should be added, and all ought to be fine. In the
>> latter case, however, disentangling may be a significant
>> effort, and hence it may be sensible and acceptable to instead
>> use unusual ordering of #include-s in the one place where it
>> matters (suitably justified in the description). Ideally such
>> would come with a promise to try to sort this later on, when
>> time is less constrained.
> Thank you for the explanation. I think, I am facing the former case (too 
> early included one lacks some #include-s),
> actually both common/dm.c and arch/arm/dm.c suffer from that.
> It works for me if I add the following to both files (violating the 
> alphabetic ordering rule):
> 
> +#include <xen/types.h>
> +#include <public/hvm/dm_op.h>
> +
>   #include <xen/dm.h>
> 
> 
> So, if I got your point correctly, we could include these both headers 
> by dm.h) Would it be appropriate (with suitable justification of course)?

Perhaps - this is a header you introduce aiui, so it's up to
you to arrange for it to include all further headers it
depends upon. In such a case (new header) you don't need to
explicitly justify what you include, but of course you don't
want to include excessive ones, or you risk getting back
"Why?" from reviewers.

Jan

