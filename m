Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD9606A330
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=pwTIvm1n
Received: from list by lists.xenproject.org with outflank-mailman.1480224.1684187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQqg-0006Do-R8; Mon, 09 Nov 2026 14:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480224.1684187; Mon, 09 Nov 2026 14:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQqg-0006Dh-Nh; Mon, 09 Nov 2026 14:59:54 +0000
Received: by outflank-mailman (input) for mailman id 1480224;
 Mon, 09 Nov 2026 14:59:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0d29c61000403d@swg.vates.tech>)
 id 1xQQqf-0006DU-KR
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:59:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQqf-003Biw-1C
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:59:53 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0d29c61000403d@swg.vates.tech>)
 id 6af1dfe4-8faa-0a2a0a5109dd-0a2a450bb474-6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:59:52 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0d29c61000403d@swg.vates.tech>)
 id 6af1dfe8-b7e8-0a2a450b0019-b9ff1c238425-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:59:52 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c0d29c61000403d.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Nov 2026 14:59:50 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A524D81FBB;
 Mon,  9 Nov 2026 15:59:49 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=2aXD1mWuZKOOVJkRBdyVRF4SXZGOkvKWJOssClgep3o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=pwTIvm1nWzu5xl5MthbaevJRZPauCuFhuJkB+nASrqt/lwx0PrZVnnbUlyDVMtld5qrTP7SKA
 8dlKrj8QOgr2zV/VH5fMMJNFwb/MryPfmgAQ/a0HZ/bfefTSFUy06eajn9I2BSLJc3jAEajOLhO
 S/1uzwuAPHZr2RmqPQOoKp3nrXbshZwtG+DiaxOunlgR4aA6zW9xNYBmpi7rmc3bQFjxozjYdu/
 B2SG2oC66ecLsBvWrpQ4xYoqitz3RYS0hOHKrmJFB3OfQlNF2qTVEuOe8xjeYAvk7vdI+vjn1w9
 EWrDoylKIRdWB0Y9IQlSoKHLT0RPu9CJrmv4SJZN8Jug==
X-Zone-Loop: 75a4e56549b8f458bdaa799b795583a81108de7e8b2c
x-campaign-type: default
x-transaction-id: 6d401c6b-9cd7-48d7-a641-6a7ddaef551f
x-swg-uid: 01-8f2751f0-ae94-4794-9f91-0131d4fcb218
X-Mailer: Sweego
Message-ID:
 <1794236390.8631fc262581453bbf619ec5b2062170.1a1c0d29c61000403d@vates.tech>
x-swg-bid: 1794236390.8631fc262581453bbf619ec5b2062170.1a1c0d29c61000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 9 Nov 2026 15:59:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/riscv: skip disabled CPU nodes when probing
 ISA extensions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
 <1794230641.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d@vates.tech>
 <2622fdc9-8242-4088-b0b9-c78d43ee8f1b@gmail.com>
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
In-Reply-To: <2622fdc9-8242-4088-b0b9-c78d43ee8f1b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794236389878
X-purgate-ID: tlsNG-42698a/1794236392-19EC69EA-7A5C331B/0/0
X-purgate-type: clean
X-purgate-size: 1973
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 3:40 PM, Oleksii Kurochko wrote:
> 
> 
> On 11/9/26 2:23 PM, Baptiste Le Duc wrote:
>>> riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
>>> node under /cpus, including the ones with status = "disabled". Such a
>>> hart is never used by Xen, yet it can still remove extensions from the
>>> host ISA: e.g. a disabled hart without the H extension makes Xen panic
>>> with "Xen requires extension: h", even though every hart Xen runs on
>>> implements it.
>>>
>>> Skip CPU nodes which aren't available.
>>
>> has_isa_extensions_property() still walks the disabled nodes, so the two
>> loops over /cpus now disagree on which harts count. Rather than adding
>> the check loop by loop, can we filter them in one place, e.g. with a
>> dt_for_each_available_child_node() iterator, so no /cpus walk sees a 
>> disabled
>> hart?
>>
> 
> I missed updating has_isa_extensions_property() because I had Cristian 
> Andrei's patch in mind, which adds support for the riscv,isa-extensions 
> property (the patch isn't published to ML). This function will be 
> completely dropped as part of that work.
Oh okay I didn't know that.
> So, until that patch is published, it would probably be better to add an 
> additional check to has_isa_extensions_property().
> 
> Regarding the question of whether to use 
> dt_for_each_available_child_node(), I don't see many use cases for it 
> beyond this particular one. There are also plenty of cases where it's 
> perfectly fine for a node to be disabled and still parsed, so I'm not 
> entirely convinced that we need this change now.
> 
> Let's just add an explicit check to has_isa_extensions_property() for 
> now. Are you okay with that or still think it'll be better to introduce 
> dt_for_each_available_child_node() specifically for this case?
Fine with me. If more cases show up later, we can introduce
dt_for_each_available_child_node() then.
> 
> ~ Oleksii

