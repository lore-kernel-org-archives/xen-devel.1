Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B58CA5FD9
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 08:31:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438923.1657445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCYg0-0002RB-1r; Fri, 02 Oct 2026 08:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438923.1657445; Fri, 02 Oct 2026 08:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCYfz-0002R4-VT; Fri, 02 Oct 2026 08:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1438923;
 Fri, 02 Oct 2026 08:31:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCYfy-0002Qy-32
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 08:31:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCYfx-004MGb-Fv
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:31:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fbbd5a1c0003f66@swg.vates.tech>)
 id 6abf6be0-2eae-0a2a0a5409dd-0a2a450999b0-2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:31:29 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fbbd5a1c0003f66@swg.vates.tech>)
 id 6abf6be0-be1a-0a2a45090019-b9ff1c22b5df-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:31:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0fbbd5a1c0003f66.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 02 Oct 2026 08:31:25 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id ECB4081E20
 for <xen-devel@lists.xenproject.org>; Fri,  2 Oct 2026 10:31:24 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=twKilgUD4v/y+COTK4YKEPJ7GAm3QgTdy1ysTdL3a6w=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=WFjjX7zPhiFrRieWpggPU761KIdgie2gCIea/8Jwwca76mE3I5OIGtxRXmslYDbL+alKig2EE
 vomBdYvURHBwyMyeTSSGhS3cFQBeZK+izAveg0m0u+LyxNq8ncz5kRZ0cb1OhohEAc9ZLLTolMq
 FdAB4j1kKj60E2d+MH3HJc6fLwrcHSg9wfX1DXERkOJpcU3Dwm3fiMCes1eLClbOiSvvLEg2Hf4
 ejsxnfA85HqQJaX7J7l/Er374B5IyGRww2SMNCv5NsKvxUkYSYNSEF0i0MrdNZbUvYrl048WVjW
 G+AJFST2zpU2OwUmGyNq/+KAZfsh67YvTl8knDacC5ng==
X-Zone-Loop: 827b38d0d8f3aad8936923eb5ab7fa9c5f36a6ff0203
x-campaign-type: default
x-transaction-id: d4523994-7390-4549-876a-f962665297b1
x-swg-uid: 01-519338c7-ce9e-4b8d-a203-454f2357a0db
X-Mailer: Sweego
Message-ID:
 <1790929885.8631fc262581453bbf619ec5b2062170.1a0fbbd5a1c0003f66@vates.tech>
x-swg-bid: 1790929885.8631fc262581453bbf619ec5b2062170.1a0fbbd5a1c0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 2 Oct 2026 10:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
To: xen-devel@lists.xenproject.org
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
 <1790845650.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@vates.tech>
 <1790846121.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@vates.tech>
 <2a9c133f-004b-4360-af53-2c8127f9a0bf@suse.com>
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
In-Reply-To: <2a9c133f-004b-4360-af53-2c8127f9a0bf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790929885017
X-purgate-ID: tlsNG-bad1c0/1790929889-BCCCF034-CAD344BC/10/73395122804
X-purgate-type: spam
X-purgate-size: 865

Ok so:
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

On 10/1/26 1:11 PM, Jan Beulich wrote:
> On 01.10.2026 11:15, Baptiste Le Duc wrote:
>> On 2026-10-01 11:07 +0200, Baptiste Le Duc wrote:
>>> Use pte_is_valid() instead of open-coding the PTE_VALID check.
>>>
>>> No functional change.
>>>
>>> Assisted-by: Claude:claude-opus-5
>>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>
>> I forgot the changelog for this patch:
>>
>> Changes since v3:
>> - Rebase on the pte_is_reserved() -> pte_has_reserved_rwx() rename in
>> patch 3, only the context line changes.
>>
>> Sorry for the noise, I didn't know if the reviewed-by
>> Oleksii gave applied here as I rebased the patch.
> 
> If it's a re-base which doesn't affect or alter the code change you're
> doing, I don't think an R-b needs dropping.
> 
> Jan


