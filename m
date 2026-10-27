Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA10606A9D3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=uIiQiJnF
Received: from list by lists.xenproject.org with outflank-mailman.1462174.1673226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhGA-0004vx-Hz; Tue, 27 Oct 2026 13:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462174.1673226; Tue, 27 Oct 2026 13:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhGA-0004vq-Eb; Tue, 27 Oct 2026 13:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1462174;
 Tue, 27 Oct 2026 13:30:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLhG9-0004vb-7B
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 13:30:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLhG8-006mZs-Gc
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 14:30:36 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17d8e2a00000f79f@swg.vates.tech>)
 id 6ae0a776-e002-0a2a0a5209dd-0a2a45029e88-32
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:30:36 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17d8e2a00000f79f@swg.vates.tech>)
 id 6ae0a77c-6ca4-0a2a45020019-b9ff1c12b587-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:30:36 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a17d8e2a00000f79f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Oct 2026 13:30:31 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5E55381AE5
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:30:30 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=coJyJBawLVcNXq76/JPzGF/XDQABCkKh8rlZBfRYcMM=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=uIiQiJnFJ9Q1jJcykYzZ99Yn8TVOKqFvY86IhuPY7M6te3UXtP27cXngj/XqED8/WEE/Rk/Pq
 /Qo4dn8wxN+ABGvOa4+iSe3n0hZ5WfDG8GLSydDdryhEBi0ksPaouZn7CwnpTtNkl7rqUqXkGrw
 Ib2idZh6E2cVzNzCpqnHhcL0kMC+W3xXJUnwvcdESk7gk8O8jX4s0dwCmUIBFQiaxn8RrAvWV/6
 LxIpIGYmcLGYNF1q8cha16zjJ0yhlP13wNDfP3PAOGuOyaXTmu5yWMb+/5yo96S2tIQNVSrlTwM
 zYAfPDYd1dVoIug3ehIBJg1uVOtxgYqQclusv+PVh5qg==
X-Zone-Loop: b835981ab4889636448c5d56c810a0f110a547c7fcf0
x-campaign-type: default
x-transaction-id: edbd1323-add0-4bcd-b627-f4f94b27200f
x-swg-uid: 01-4370e3ba-196d-48a3-905b-a792114768c4
X-Mailer: Sweego
Message-ID:
 <1793107831.8631fc262581453bbf619ec5b2062170.1a17d8e2a00000f79f@vates.tech>
x-swg-bid: 1793107831.8631fc262581453bbf619ec5b2062170.1a17d8e2a00000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 27 Oct 2026 14:30:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE: purge mce_amd.h
To: xen-devel@lists.xenproject.org
References: <fc12c368-d74e-483f-a17b-8503b3039c17@suse.com>
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
In-Reply-To: <fc12c368-d74e-483f-a17b-8503b3039c17@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793107830427
X-purgate-ID: tlsNG-720697/1793107836-672B12AC-4BCB21E8/10/78276251493
X-purgate-type: spam
X-purgate-size: 1734
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM:
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

On 10/27/26 2:28 PM, Jan Beulich wrote:
> The sole two declarations there aren't needed, as the functions aren't
> reference from outside of mce_amd.c. (This also addresses two Misra rule
> 8.7 violations, just that we apparently didn't accept that rule for some
> reason.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If it wouldn't result in more churn, I would have been inclined to also
> drop at least the mc_ prefixes of both functions.
> 
> --- a/xen/arch/x86/cpu/mcheck/mce_amd.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
> @@ -56,7 +56,6 @@
>   
>   #include "mce.h"
>   #include "x86_mca.h"
> -#include "mce_amd.h"
>   #include "mcaction.h"
>   #include "vmce.h"
>   
> @@ -101,7 +100,7 @@ mc_ec2type(uint16_t errorcode)
>       return 0;
>   }
>   
> -bool cf_check mc_amd_recoverable_scan(uint64_t status)
> +static bool cf_check mc_amd_recoverable_scan(uint64_t status)
>   {
>       bool ret = false;
>       enum mc_ec_type ectype;
> @@ -131,7 +130,8 @@ bool cf_check mc_amd_recoverable_scan(ui
>       return ret;
>   }
>   
> -bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype)
> +static bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc,
> +                                      int addrtype)
>   {
>       enum mc_ec_type ectype;
>       uint16_t errorcode;
> --- a/xen/arch/x86/cpu/mcheck/mce_amd.h
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#ifndef _MCHECK_AMD_H
> -#define _MCHECK_AMD_H
> -
> -bool cf_check mc_amd_recoverable_scan(uint64_t status);
> -bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype);
> -
> -#endif


