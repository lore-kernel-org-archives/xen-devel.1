Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8782560A262F
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=icEKVm0B
Received: from list by lists.xenproject.org with outflank-mailman.1461013.1671936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHGI-0001DZ-Bg; Mon, 26 Oct 2026 09:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461013.1671936; Mon, 26 Oct 2026 09:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHGI-0001DS-8v; Mon, 26 Oct 2026 09:45:02 +0000
Received: by outflank-mailman (input) for mailman id 1461013;
 Mon, 26 Oct 2026 09:45:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLHGH-0001DI-8c
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:45:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLHGF-006S9P-33
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:44:59 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a177994ca9000f79f@swg.vates.tech>)
 id 6adf210b-bab6-0a2a0a5309dd-0a2a4509a38e-38
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:44:59 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a177994ca9000f79f@swg.vates.tech>)
 id 6adf211a-be1a-0a2a45090019-b9ff1c23ac83-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:44:58 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a177994ca9000f79f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 09:44:57 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2692081E10
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:44:57 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=7QvpdUDrZdrwMQVG3ZRT7tn1V+A7P6A5DqfERLNesiI=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=icEKVm0B1+wnPUGLLguLfKF8VjeVoDHKHzOQGYpaHV7oB0RoOXI3zQ1yBaHrrVtfe0tfb0Uoz
 crdsC2eAQxJUyzM+hgsoNZ9M9ACrOpVa6F4rZ/I2yKaN65H3szVAeYbTqVzL5AJT5X/DFOYt7GT
 nzmign3HB1FHh0RpnbKtV1C7d6++koNZuNkxTBv9WomlsQNC6ndX/zyDqUxAjiUhR7AyGiXBqAC
 idw5kKNaCfZO2wpEaCHQkVlBmI8o7YSslWhQkl2GLSg7/XXDPxLtszZhuEpkNgU7HUP0FCtuupn
 gF22QOLeE9E6ZsPKoCse27BPJ0hXiRqEBBFuk9Nsrr/g==
X-Zone-Loop: d06c2ff08f76a6c7c7c12966eff2d75f6aef98129d22
x-campaign-type: default
x-transaction-id: 61a27c6d-5ca9-4e80-9928-06e963b05895
x-swg-uid: 01-b373ea8e-0d90-40af-8fd7-ab88e4b3c80a
X-Mailer: Sweego
Message-ID:
 <1793007897.8631fc262581453bbf619ec5b2062170.1a177994ca9000f79f@vates.tech>
x-swg-bid: 1793007897.8631fc262581453bbf619ec5b2062170.1a177994ca9000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 26 Oct 2026 10:44:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] xen/riscv: panic if the device tree advertises
 neither Svade nor Svadu
To: xen-devel@lists.xenproject.org
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
 <4526ac23-ca7c-40e2-a9d6-9d366369d3bb@suse.com>
Content-Language: en-US
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
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
In-Reply-To: <4526ac23-ca7c-40e2-a9d6-9d366369d3bb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793007897196
X-purgate-ID: tlsNG-bad1c0/1793007899-FD26A034-D393E72E/10/78276251493
X-purgate-type: spam
X-purgate-size: 1435
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26.10.2026 10:32, Jan Beulich wrote:
> On 16.10.2026 17:34, Baptiste Le Duc wrote:
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> 
> Did I, really? Iirc I left open whether to go the panic() route or the
> alternative one. Based on Andrew's clarification as to pre-Svad{e,u}
> behavior, I think I further tried to indicate that synthesizing the
> correct extension may be preferable, to allow older systems' DTs to be
> used as-is. In any event ...

No, you didn't, sorry. I misread your "The outlier is when DT lacks any
information" as "panic when DT lacks any information", while you had just
agreed to probing in exactly that case. I'll drop the tag.

For v8 I plan to:
- trust the DT whenever it advertises Svade and/or Svadu, without probing.
- probe only when it advertises neither, set the probed extension in
   riscv_isa, and print a warning asking for the DT to be updated.

Does that match what you had in mind?

>> +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
>> +         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>> +        panic("Device tree advertises neither Svade nor Svadu, A/D bits update scheme unknown\n");
> 
> ... this message leaves the observer to figure out what to do about the
> situation.

Agreed. With the above the panic() goes away, and the warning will name
the extension to add to "riscv,isa".

Thanks,
Baptiste

