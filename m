Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53A606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=kb2F3rKZ
Received: from list by lists.xenproject.org with outflank-mailman.1456013.1669609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBid-0007Rk-0k; Tue, 20 Oct 2026 15:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456013.1669609; Tue, 20 Oct 2026 15:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBic-0007Rd-UA; Tue, 20 Oct 2026 15:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1456013;
 Tue, 20 Oct 2026 15:25:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159eafd67000f79f@swg.vates.tech>)
 id 1xJBib-0007RW-Q8
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:25:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJBib-000eg8-6w
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 17:25:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159eafd67000f79f@swg.vates.tech>)
 id 6ad787e9-e002-0a2a0a5209dd-0a2a4509ebae-12
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:25:37 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159eafd67000f79f@swg.vates.tech>)
 id 6ad787f0-be1a-0a2a45090019-b9ff1c23abb3-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:25:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a159eafd67000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 15:25:34 +0000
Received: from [10.235.238.14] (149.173.185.81.rev.sfr.net [81.185.173.149])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8A22581B42;
 Tue, 20 Oct 2026 17:25:33 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=iMNbXnQojxE3RDP3NV+8nCNWDfjppYbWdupluVqSX84=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=kb2F3rKZRnnciG6l0Dj6rt/xHXK1RMhNfEJjBMOTZY3p+E788gb0i5FJnYYd4dNr9n+NLXhBL
 IwzHolI3kQcEDPIvmddV+mMam0VOIIFrbinIVxRU94gmAnJLyzisYAjuFJ4w+MpVUdkQ7pR0tOd
 HLQFSv8XyZW2Ewee79y2yl14+rsInIuIuJgZ5Kyg3Jo5p7pj846ozJ00pHOAKS/iFNDLs33IXJp
 iSXDRzwuEueh/uaE2LEBVHBjswQvSIXBZsyoR3Abuc2RedXxZsudx3QGf0xGwIeVu04YOGdadyU
 WGSwcHwHlA4GyF+LY9+qi3AgWOlhtad6kOm+z2PMzLrQ==
X-Zone-Loop: bbeb4a0e07162980e2072ffaaf1d53ed534f2bd2a041
x-campaign-type: default
x-transaction-id: 4c5e3e1e-aa5a-4356-818a-86202c327b7e
x-swg-uid: 01-10db777d-4c53-4b5f-9762-48d391950c53
X-Mailer: Sweego
Message-ID:
 <1792509935.8631fc262581453bbf619ec5b2062170.1a159eafd67000f79f@vates.tech>
x-swg-bid: 1792509935.8631fc262581453bbf619ec5b2062170.1a159eafd67000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 20 Oct 2026 17:25:32 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/39] xen/riscv: implement trap redirection to a guest
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <109f3a920a2f5e58de5889ac2bcb834cc7ce967a.1790779209.git.oleksii.kurochko@gmail.com>
 <179250973602.489973.14893581320042795275.b4-review@b4>
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
In-Reply-To: <179250973602.489973.14893581320042795275.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792509934324
X-purgate-ID: tlsNG-bad1c0/1792509937-BE2C4034-E64F752A/0/0
X-purgate-type: clean
X-purgate-size: 613
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/26 5:22 PM, Baptiste Le Duc wrote:
>> [ ... 54 lines skipped ... ]
>> @@ -107,6 +107,11 @@
>>   #define SIP_SSIP			MIP_SSIP
>>   #define SIP_STIP			MIP_STIP
>>   
>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
>> +#define STVEC_MODE_MASK		_UL(0x3)
>> +#define STVEC_MODE_DIRECT		_UL(0x0)
>> +#define STVEC_MODE_VECTORED		_UL(0x1)
> 
> Nit: STVEC_MODE_MASK needs a third tab for its value to line up with the
> other two (and with the surrounding #define-s).
> 
Instead of this small Nit, everything LGTM:
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

