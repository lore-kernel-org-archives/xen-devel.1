Return-Path: <SRS0=oC9Q=C6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192AAC43463
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 10:06:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EBFB20EDD
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 10:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="pTT9KUiz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EBFB20EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKIhn-0007pI-He; Mon, 21 Sep 2020 10:05:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKIhm-0007pD-CG
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 10:05:54 +0000
X-Inumbo-ID: 7d79d3a9-a3af-4041-8815-42cc507ef4cd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d79d3a9-a3af-4041-8815-42cc507ef4cd;
 Mon, 21 Sep 2020 10:05:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600682752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljT8C5t4yTGuaJ2RxIjcqxdS7GJK+ZijcbgkZl1TrP4=;
 b=pTT9KUizWD58BMAjY2wpVjRTMDV6ck4weG5HDJO1cygsqJG4666ZE0604d5aFnd5B597EB
 fAuto3EkiDUJfQw2fGAdjU+19T0OmOAB8Ho8SSPkzVOmHnRnGPhBOX8kuwbddeZ4C9bRg9
 aZNveneoV4johx+NrgOs6Sk6OGKlNSo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7224AB46F;
 Mon, 21 Sep 2020 10:06:28 +0000 (UTC)
Subject: Ping: [PATCH 2/2] x86/vpic: also execute dpci callback for
 non-specific EOI
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-3-roger.pau@citrix.com>
 <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
 <4ac81e8f-f6e5-7226-49c7-135aa88a7b12@suse.com>
Message-ID: <8e21a5fc-6c76-171f-8493-4a084ac1a779@suse.com>
Date: Mon, 21 Sep 2020 12:05:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4ac81e8f-f6e5-7226-49c7-135aa88a7b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.08.2020 09:45, Jan Beulich wrote:
> On 20.08.2020 18:28, Andrew Cooper wrote:
>> On 20/08/2020 16:34, Roger Pau Monne wrote:
>>> Currently the dpci EOI callback is only executed for specific EOIs.
>>> This is wrong as non-specific EOIs will also clear the ISR bit and
>>> thus end the interrupt. Re-arrange the code a bit so that the common
>>> EOI handling path can be shared between all EOI modes.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/hvm/vpic.c | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
>>> index feb1db2ee3..3cf12581e9 100644
>>> --- a/xen/arch/x86/hvm/vpic.c
>>> +++ b/xen/arch/x86/hvm/vpic.c
>>> @@ -249,15 +249,15 @@ static void vpic_ioport_write(
>>>                  if ( priority == VPIC_PRIO_NONE )
>>>                      break;
>>>                  pin = (priority + vpic->priority_add) & 7;
>>> -                vpic->isr &= ~(1 << pin);
>>> -                if ( cmd == 5 )
>>> -                    vpic->priority_add = (pin + 1) & 7;
>>> -                break;
>>> +                goto common_eoi;
>>> +
>>>              case 3: /* Specific EOI                */
>>>              case 7: /* Specific EOI & Rotate       */
>>>                  pin = val & 7;
>>
>> You'll need a /* Fallthrough */ here to keep various things happy.
> 
> Are you sure? There's ...
> 
>> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Can fix on commit if you're happy.
>>
>>> +
>>> +            common_eoi:
> 
> ... an ordinary label here, not a case one.

I would have wanted to commit this, but it's still not clear to me
whether the adjustment you ask for is really needed.

Thanks for following up,
Jan

