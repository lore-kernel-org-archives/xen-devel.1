Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31923606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=R4fcIIlS
Received: from list by lists.xenproject.org with outflank-mailman.1491176.1692069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSytG-0007Q1-8T; Mon, 16 Nov 2026 15:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491176.1692069; Mon, 16 Nov 2026 15:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSytG-0007Pu-58; Mon, 16 Nov 2026 15:45:06 +0000
Received: by outflank-mailman (input) for mailman id 1491176;
 Mon, 16 Nov 2026 15:45:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e50881df0006d3f@swg.vates.tech>)
 id 1xSytE-0007Po-NS
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:45:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSytD-001Hrs-SV
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:45:03 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e50881df0006d3f@swg.vates.tech>)
 id 6afb24f6-bab6-0a2a0a5309dd-0a2a450aab30-20
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:45:03 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e50881df0006d3f@swg.vates.tech>)
 id 6afb24ff-f2d2-0a2a450a0019-b9ff1c23ad81-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:45:03 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1e50881df0006d3f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 15:45:02 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id BF3B080AF1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:45:01 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Xw95Gfm0+f2m6IrHZwMkIBhZbnYrUR6fUqU/SjX5uS8=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=R4fcIIlSulfQGMV++gUPyAwx/xLd2VdiKu5QWDT4YE2GBEP0uQpAawV6FRHN6uLCrrEsdGK2l
 mabGjp4mVHiN71B4PUtCUruXY+imC3/eUmCco7z+IrUZ+5+/V8j7sC27e+LnUU9lvckJhzlMhaA
 1s1yvl5a70T4gEAeVlLgVhmGU2+hvYx1whnF5+bnrN2TesfQ539EZvMSaqCJi7YmJxOxrzXb90v
 F4ZlX5VUoeUd5mSePwZPSahpuBjdqPCFyiiTNcysv2+d5dcR1SNITcrLFhwHT/AzWtizgMDhizZ
 9SzkHG+lyxoTV7bL5IJOvU5JrbeMkHsMzu8gqns/M5Lw==
X-Zone-Loop: 1217174af7797d26348c9932c4f800e43f2899e5281b
x-campaign-type: default
x-transaction-id: 74815774-11ed-4152-8b84-608f30b34155
x-swg-uid: 01-8a3fb02e-e35c-44d2-8df3-9b0482cdf7a5
X-Mailer: Sweego
Message-ID:
 <1794843902.8631fc262581453bbf619ec5b2062170.1a1e50881df0006d3f@vates.tech>
x-swg-bid: 1794843902.8631fc262581453bbf619ec5b2062170.1a1e50881df0006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 16 Nov 2026 16:45:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: bound each IMSIC MMIO regset by the
 per-group hart slots
To: xen-devel@lists.xenproject.org
References: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
 <d37e0e49-3822-4088-9016-31178facac0c@suse.com>
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
In-Reply-To: <d37e0e49-3822-4088-9016-31178facac0c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794843901835
X-purgate-ID: tlsNG-4011c0/1794843903-4AEDACFC-03233D12/0/0
X-purgate-type: clean
X-purgate-size: 1391
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> +    /*
>> +     * Parent irq i is given hart slot i, counting slots across the register
>> +     * sets in order. A slot with no hart behind it therefore shifts every
>> +     * later irq one slot early, onto the previous hart's interrupt file.
>> +     * Counting can't tell that from harmless unused slots at the end, hence
>> +     * only a warning.
>> +     */
>> +    if ( nr_slots > nr_parent_irqs )
>> +        printk(XENLOG_WARNING
>> +               "%s: %lu hart slots in IMSIC MMIO regsets for %u parent irqs, unused slots must only be at the end of the last regset\n",
> 
> I'll leave full review to Oleksii, just a remark here: This wants shortening some.
> Not only for source line length (we allow going past 80 cols, but please not this
> much), but also for what actually ends up on a serial console. For example, I
> wonder whether what follows after the comma really needs to go to the log. If the
> message appears, context info can be obtained by consulting the source.
> 
I kept the literal on one line so it can be grepped, as CODING_STYLE
asks, but I see the point is rather to keep the message itself short.
I'll drop the part after the comma, the comment above already explains
it:

     printk(XENLOG_WARNING "%s: %lu hart slots for %u parent irqs\n",
            node->name, nr_slots, nr_parent_irqs);
Thanks for highlighting that.


