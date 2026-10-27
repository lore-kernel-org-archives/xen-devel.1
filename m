Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECE8606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=V1sBpF+P
Received: from list by lists.xenproject.org with outflank-mailman.1461954.1672967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdFG-0007B8-5B; Tue, 27 Oct 2026 09:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461954.1672967; Tue, 27 Oct 2026 09:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdFG-0007B1-24; Tue, 27 Oct 2026 09:13:26 +0000
Received: by outflank-mailman (input) for mailman id 1461954;
 Tue, 27 Oct 2026 09:13:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLdFE-0007Av-M9
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:13:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLdFD-005sJn-VT
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:13:23 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17ca29f29000f79f@swg.vates.tech>)
 id 6ae06b31-2eae-0a2a0a5409dd-0a2a4508c8b2-0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:13:21 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17ca29f29000f79f@swg.vates.tech>)
 id 6ae06b30-f659-0a2a45080019-b9ff1c12956d-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:13:21 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a17ca29f29000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Oct 2026 09:13:14 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D66B181AA4;
 Tue, 27 Oct 2026 10:13:13 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=s81T04xv/lgrEsv7kGYqY0NyshC4bxFPb0CsU3Jb5TY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=V1sBpF+PYiLclLo3Cmkxxcsh8G9zjrn8V0nBhmlBfzqEhfQzu0naUoWQs/rL8ySV2NcAXGHTB
 cxrMHwXZ21ijTPpPbBQbYaC+gsh76dFI4X3nFwsNshDc8EJskI7IVO2xUUlUscgaid/YcF+5gdc
 R+X9WsB3uRsJOc40WoYHGxuCQlT9bteFIvSfYBV6I5uiIjdcHWn5mc3t1W2RpoznxQhk08SK0GG
 f2eLiNgCj4f9UuSvi2gT7yJVuf2dGYtRv+xRK6GFhjQZLD8Hjmd8JExGT+lfj6QFq1KQFkqhKOQ
 +c3F+GiaCPJ5PDk4j427eOYFuZ4yOwintnsp+IQdH0HQ==
X-Zone-Loop: e18cba564b67b2882393d7e2eff66ee061de2d761204
x-campaign-type: default
x-transaction-id: 92650ad0-e08e-42e2-9398-b9193ab18e84
x-swg-uid: 01-00fe84fa-15ef-4463-9a5c-9d4a876a88ac
X-Mailer: Sweego
Message-ID:
 <1793092394.8631fc262581453bbf619ec5b2062170.1a17ca29f29000f79f@vates.tech>
x-swg-bid: 1793092394.8631fc262581453bbf619ec5b2062170.1a17ca29f29000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 27 Oct 2026 10:13:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
 <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
 <462a149d-9a4a-49c7-8db4-96e99463a47b@suse.com>
 <6c0d9aa3-fb6e-4916-bea2-033f3f9dad96@gmail.com>
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
In-Reply-To: <6c0d9aa3-fb6e-4916-bea2-033f3f9dad96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793092394081
X-purgate-ID: tlsNG-c1860d/1793092401-D6F5F87B-94CA2F81/10/78276251493
X-purgate-type: spam
X-purgate-size: 1986
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/27/26 10:03 AM, Oleksii Kurochko wrote:
> 
> 
> On 10/26/26 5:59 PM, Jan Beulich wrote:
>> On 26.10.2026 16:35, Oleksii Kurochko wrote:
>>> On 10/26/26 4:14 PM, Baptiste Le Duc wrote:
>>>> +/*
>>>> + * Probe whether hardware updates the PTE A/D bits by writing to a 
>>>> local
>>>> + * variable through an alias mapping whose A and D bits are clear.
>>>> + *
>>>> + * Check the D bit rather than the A bit, as the A bit may be set
>>>> + * speculatively while the D bit can't.
>>
>> Following Andrew's clarification, I don't think this is relevant anymore
>> (but I also don't mind it to stay the way it is): If we observed the A
>> bit set (and no fault), we can still deduce Svadu, no matter whether the
>> update was due to an architectural or a speculative access. Svade would
>> implicitly disallow speculative updates of A, as exceptions may only be
>> raised for architectural accesses (unless there are provisions in the
>> spec that I'm unaware of).
>>
>> Both of you: Please clarify whether you want this change to go in as-is,
>> or whether this wants updating again.
> 
> I'd prefer to update it: the statement itself is true, but it isn't a 
> reason to check D rather than A, since, as you say, observing A set 
> without a fault would equally imply Svadu.
> 
> If you're fine adjusting it while committing, the second paragraph could 
> become:
>    Check the D bit, as it is set only once the store through the alias
>    has been performed.
> 
> (or just be dropped), with the matching sentence in the description 
> ("The D bit is checked rather than the A bit, as the A bit may be set 
> speculatively.") dropped as well. Otherwise Baptiste, please send an 
> updated version.
I prefer to change it too, I will send the patch today.
> ~ Oleksii
> 
>>
>>> Generally, looks good to me:
>>>
>>> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks!>

