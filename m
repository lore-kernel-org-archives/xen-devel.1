Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112BE606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=VDwg74rC
Received: from list by lists.xenproject.org with outflank-mailman.1491265.1692123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzmX-0005O2-MA; Mon, 16 Nov 2026 16:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491265.1692123; Mon, 16 Nov 2026 16:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzmX-0005Nu-Hk; Mon, 16 Nov 2026 16:42:13 +0000
Received: by outflank-mailman (input) for mailman id 1491265;
 Mon, 16 Nov 2026 16:42:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSzmW-0005Nh-5t
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:42:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSzmV-001Qz4-EP
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:42:11 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e53cc2430006d3f@swg.vates.tech>)
 id 6afb3250-8faa-0a2a0a5109dd-0a2a4508aa72-30
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:42:11 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e53cc2430006d3f@swg.vates.tech>)
 id 6afb3263-f659-0a2a45080019-b9ff1c228f39-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:42:11 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1e53cc2430006d3f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 16:42:06 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 297A2804C8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:42:06 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=wn/wQqltCpHWmlf/YOlOqI/vCmihFXZ+/6hv2C55lIA=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=VDwg74rC9ltW1dv2pQqy8VHgLcoWlet933tB8IzRxwYpYBaicoHl1/3jCRo6hm8yHOHQ31Oiw
 ULHB/O437p+2QNVt4IZTMKtBKgDXGwuOvD9qy2MJpkNWEp7sbyftutJrV0syrGU9YtP3gGYgXTI
 aG4USo62QIIrP5+z/iy54ZBddAEGUUj5pESeNS6XCAuPqsHZ/bBn1ZK6y8BmHPAsDLJCpw0anTv
 MG2IzVPIGQa2fjiq1DTCy6++vZKtePm24iDrNAzGkfFPyzDcS+Nj0KL0/dISbfT3g0T4y5QTD7Q
 2e3nIcfFhoQ6lZTQA177rDIqLAyHJLkVnWp3t6RWRsmA==
X-Zone-Loop: ed7d4256057baaac27978a4c2ff2f8ef3175631e0fb8
x-campaign-type: default
x-transaction-id: 9bce3dcd-a342-4fe2-8cf5-15ac8b83233d
x-swg-uid: 01-12cc93d8-825f-4a77-b670-8b9af0be0941
X-Mailer: Sweego
Message-ID:
 <1794847326.8631fc262581453bbf619ec5b2062170.1a1e53cc2430006d3f@vates.tech>
x-swg-bid: 1794847326.8631fc262581453bbf619ec5b2062170.1a1e53cc2430006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 16 Nov 2026 17:42:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: bound each IMSIC MMIO regset by the
 per-group hart slots
To: xen-devel@lists.xenproject.org
References: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
 <c9bbf2e0-9334-423a-ace9-9e50ee712986@gmail.com>
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
In-Reply-To: <c9bbf2e0-9334-423a-ace9-9e50ee712986@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794847326212
X-purgate-ID: tlsNG-c1860d/1794847331-D5D4887B-B534AC4D/10/73395122804
X-purgate-type: spam
X-purgate-size: 905
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/16/26 5:34 PM, Oleksii Kurochko wrote:

>> -        if ( mmios[i].size != expected_mmio_size )
>> +        /* A register set must not run past the end of its group. */
>> +        offset = mmios[i].base_addr & (group_size - 1);
>> +        if ( mmios[i].size + offset > group_size )
> 
> This can overflow for a bogus, huge size from the DT and then pass. As 
> offset is always below group_size,
Oh yeah, thanks.
> 
>          if ( mmios[i].size > group_size - offset )
> 
> can't.
Jan, do you think it needs a new version for this overflow?
> 
> 
> With the overflow addressed and fixing a length of the string like (took 
> from Baptiste response):
> 
>       printk(XENLOG_WARNING "%s: %lu hart slots for %u parent irqs\n",
>              node->name, nr_slots, nr_parent_irqs);
> 
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Thanks.
>
> ~ Oleksii

