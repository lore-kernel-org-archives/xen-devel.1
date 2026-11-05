Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10087606A60C
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=HuKUy/EO
Received: from list by lists.xenproject.org with outflank-mailman.1475193.1682064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzsA-0008J3-9H; Thu, 05 Nov 2026 15:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475193.1682064; Thu, 05 Nov 2026 15:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzsA-0008Iw-6T; Thu, 05 Nov 2026 15:59:30 +0000
Received: by outflank-mailman (input) for mailman id 1475193;
 Thu, 05 Nov 2026 15:59:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac6fbbf5000403d@swg.vates.tech>)
 id 1xOzs8-0008Iq-3u
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:59:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzs7-004Oeo-Gm
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:59:27 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac6fbbf5000403d@swg.vates.tech>)
 id 6aeca7bd-bab6-0a2a0a5309dd-0a2a450be546-34
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:59:27 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac6fbbf5000403d@swg.vates.tech>)
 id 6aeca7df-b7e8-0a2a450b0019-b9ff1c129aa3-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:59:27 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ac6fbbf5000403d.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Nov 2026 15:59:26 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7D06B823F4
 for <xen-devel@lists.xenproject.org>; Thu,  5 Nov 2026 16:59:25 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=v3pNtB1EAJfftu/oN6OZwk6BrgOe3HU1/3qAGLaEzxE=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=HuKUy/EO0q7/4Fo5maXmUtKOK6F4QdRpUrHoSHk93wzRc3g5+1Ivc2ojuyQhulSByJa2WeOK/
 7rl01yOvWk6mAD9Uh0F6/76RezJUQTrlrQP9o8apMgOAqaBY2zbB6wj/U+m86k45fwuJIm6yh7N
 wsrM29sdmzTdrE9Tq0L0rTUzPE1OAY57KPkXkhcj3NnIlTGGDteLz+1fFyiJ8qY2KRpE/0rbL3w
 I7siTsLtcSuYZHytdOUaqHgPgEj9CdS6VYQdRgLqmRDsqYrN9yuauO0M/3IsZuUCb30bxSmhHCM
 KgQR0yBsV5uf7YTYDzrNUO9ovWGw4WG4mMAhxN3uzhGA==
X-Zone-Loop: acf0734f203e638d955b6a48e111b941ee50e486ffe9
x-campaign-type: default
x-transaction-id: 4676f543-2aa1-4a67-a186-ef04117629bf
x-swg-uid: 01-e5aa996b-b282-4646-8008-36a7e8831cde
X-Mailer: Sweego
Message-ID:
 <1793894366.8631fc262581453bbf619ec5b2062170.1a1ac6fbbf5000403d@vates.tech>
x-swg-bid: 1793894366.8631fc262581453bbf619ec5b2062170.1a1ac6fbbf5000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Thu, 5 Nov 2026 16:59:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/39] xen/riscv: implement APLIC-IMSIC-hart sync
 barrier for vCPU migration
To: xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <2075cb10e5f6df787b29f2f087632c82b787a007.1790779209.git.oleksii.kurochko@gmail.com>
 <c77101fe-2505-4cdb-8520-52f92a1c668d@gmail.com>
 <1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@vates.tech>
 <cf206b92-88df-4f51-b10b-960e0c141d9e@gmail.com>
 <1793892730.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@vates.tech>
 <1ff766a5-3d49-45fb-9c46-d781cfaf4b6d@gmail.com>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
Autocrypt: addr=baptiste.le-duc@vates.tech; keydata=
 xsBNBGoPSX8BCADSuTikqW3FD4mscQugY1thRaKlIhcJ2G9YCWYXAlp+xosvTlzfIftOZZim
 750MLvyKtLPkQzB6TZtFZBiexSraaF/MdDKRTT5DcVa3r7ZnHgqMclWlPa4ioysS4yFcJanL
 cyNOT7HUFvIdirMMqiViedfYtS0GORPBBPVISD6ClMz3ecHIxqllfq9CHYQn4amKEfHmh6tm
 Rufo4Gjl6x8cUFZZlRQf+aCmUzdSPA0P5u3sueYH1uEz4w/jbD53MlKqzCvxUeOsfS2swTQA
 6mS9jIgOjNadpUTOzKfDHMgFirtG+HFpm45Nwp6KQizxgDVOfTnOfVHm5Gwqm3ETl9y5ABEB
 AAHNPEJhcHRpc3RlIExlIER1YyAoVmF0ZXMgWXViaWtleSkgPGJhcHRpc3RlLmxlLWR1Y0B2
 YXRlcy50ZWNoPsLAjgQTAQoAOBYhBGiSJ6HgW88MgT/gfu2Cu2XL9M6QBQJqD0l/AhsDBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO2Cu2XL9M6QuMcH/ihiy/Nrxp919AmY0ENnc0NK
 r/2LDvW/hrX4FfbpxAmrGmQ7MU1aQTk0JDbfcsG8OYH6wO5sqnXb1gz50YrEdpfVSbHz5YTZ
 EhDIxE4g7NrvJZh3Qc0m0CAyjYTNHen7J6olVaCMjrOH7uRHUYZ7Pl3am9mZosfLmez/aWJO
 a6ihQxBXHI75brlk1teIURkep2kP7P0Flmfl4cA//saREoTF7GXCtjOSQk/xg8PP0Sswqp5G
 TdJptn3FQn6lAzfz0eFSYqkaoX2c2k1MDa7o+UX9cfGPL8ybMKnYkasLxck6eOWGJWf+YTrm
 ga/r0kBaftmqNDgt5nI2jNTDwZcT9g3OwE0Eag9JfwEIAM6IWbuBSvz+erv27oGDDpo8M6Fp
 dGUvft7v+WceHUfxiXpYFx9qgIU6XGy6y+3lJMAvNcltS8DuhioqMlfKRSYGKZlpliY65dNP
 557IuM4ctVJ+I9CVclvv9eahARQKgF5auLJAAlvGSmU+ufNvlwTUmLIRcrPviTmB6X5jJYc+
 fiNeyI0HcsgcN21C0r62tUCypuZ+vgEJXw2bx1V8mVGZKxdGJPh58QF6kRK+xmd4kEComLGV
 BeM6BcVOtEjDcGNC0tLhXb0p9g1Ys55iA8sd6s4WacyolW2J6rwmcOkjiWexWw1caYgIWAV1
 004M3gwUaOz0dGq2i7HQ0AiVfVkAEQEAAcLAdgQYAQoAIBYhBGiSJ6HgW88MgT/gfu2Cu2XL
 9M6QBQJqD0l/AhsMAAoJEO2Cu2XL9M6QovYH/RjstyL5o/V5K74ylBtz0j5t3pLX5JKbwApi
 656rGgDdqElImyvvZppNMl/mgHNzvxmfFAhJXnSX9f1fqVEQKOGEhLUastnl/ssBiE5x7btM
 V0GAffxXbXJZbVv4b/DI+gVrOPc2YXlVwruapvTZNtD3hqPrkjrmq5WTtGR2loIVSe62hmh0
 BGD2Fy79b/hYWyBqhayPBEjwGW75u4/yn+Yqy1PgG3hIcvg7GSuT3akhHZSB2Mbguzcoyf9Q
 DJl6t33JxPRkkNrEdkPPmRlQCTSiUkVjKqMDF3jlINWsJ5t4jKFsNF91ksdw7aQgiX+tQIpE
 ugMC1NuNi5dDGip66bw=
In-Reply-To: <1ff766a5-3d49-45fb-9c46-d781cfaf4b6d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793894365557
X-purgate-ID: tlsNG-42698a/1793894367-AAEDE9EA-8C363F8C/0/0
X-purgate-type: clean
X-purgate-size: 1402
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 4:51 PM, Oleksii Kurochko wrote:
> 
> 
> On 11/5/26 4:32 PM, Baptiste Le Duc wrote:
>> On 2026-11-05 15:21 +0100, Oleksii Kurochko wrote:
>>> [ ... 348 lines skipped ... ]
>>>> LGTM, but I wonder why, as I said in the original patch, sync_id is
>>>> really needed.
>>>>
>>>
>>> I think that I am not understand your response. Could you please
>>> re-phrase it?
>> I'm questionning the need of the sync_id field as it will always be
>> equal to imsic_cfg.nr_ids, couldn't we drop it?
>>
> 
> It's equal to nr_ids by choice rather than by necessity: which identity
> gets reserved is decided in a single place, imsic_parse_node(), and all
> the users (the genmsi write, the pending bit the barrier spins on, the
> limit on the APLIC sources and the ASSERT() in imsic_irq_enable()) refer
> to it by its role rather than as "the last identity".
> 
> Basically if one day someone will decide to come up with EIID allocator 
> instead of using static allocation then it will be harder to find a 
> places where to change.
> 
> So yes, it could be drooped but at the moment I think it is useful to 
> have separate field or ,at least, as an option in asm/imsic.h:
> 
> static inline unsigned int imsic_sync_id(const struct imsic_config *cfg)
> {
>      return cfg->nr_ids;
> }

I prefer this as it would save space in imsic_config struct.

> ~ Oleksii


