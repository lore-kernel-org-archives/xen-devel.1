Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0052D606A32C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=SG5D/TY7
Received: from list by lists.xenproject.org with outflank-mailman.1492862.1693110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTLd2-0000rb-BR; Tue, 17 Nov 2026 16:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492862.1693110; Tue, 17 Nov 2026 16:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTLd2-0000rT-7P; Tue, 17 Nov 2026 16:01:52 +0000
Received: by outflank-mailman (input) for mailman id 1492862;
 Tue, 17 Nov 2026 16:01:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ea3e29060006d3f@swg.vates.tech>)
 id 1xTLd0-0000rN-Hn
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 16:01:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTLcz-001eA2-NS
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:01:49 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ea3e29060006d3f@swg.vates.tech>)
 id 6afc7a67-bab6-0a2a0a5309dd-0a2a4505e23c-16
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 17:01:49 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ea3e29060006d3f@swg.vates.tech>)
 id 6afc7a6c-4cb1-0a2a45050019-b9ff1c238b19-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 17:01:49 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ea3e29060006d3f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 17 Nov 2026 16:01:44 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 030AF80A39
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 17:01:43 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=vxqcjKMo4hpA0S37DUP4N+mY0v3Ab2sYYiFEJW2if7w=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=SG5D/TY72mfgi3Mo0b5hGOT5+dvt8UU0n9MIsJ+PyBv+d+Zhm1tswfo18QOphNKBUUw9sLKe5
 Obw7eRr47Um92QlIXmNbcLmPQCWFYjxMUtH6tW0U1/FrVh6l3NT5iHXwJkBQzp69oYvLnuxTwCA
 J2UcqmIQkF8qJOBocYWusNo8BiDGx+uiahzvSU/eT2c18Qz/MBkQ0fYQGsY3xbwDVJsBJJwDvHh
 Yu98fCpHnsicAlpN/k3fWCbsqrp0Ews1GUTpLxSG9/rKdZHQ+6tewltn6Qhivok7geu6lgbP50c
 g5CWT3nxDEcTytlOQbfzc2y7ovqcnLiEf73WPc8SSP7w==
X-Zone-Loop: 103598a72081e4bb43f45b756cf22867516fac7b731a
x-campaign-type: default
x-transaction-id: 38bb769d-4794-4174-95c1-45ce15403429
x-swg-uid: 01-399ecc24-24ef-4522-b1da-ac87ac25cf9a
X-Mailer: Sweego
Message-ID:
 <1794931304.8631fc262581453bbf619ec5b2062170.1a1ea3e29060006d3f@vates.tech>
x-swg-bid: 1794931304.8631fc262581453bbf619ec5b2062170.1a1ea3e29060006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 17 Nov 2026 17:01:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: sbi: fix kernel-doc parameter annotations
To: xen-devel@lists.xenproject.org
References: <20261117-riscv-kernel-doc-fix-v1-1-bc0a19f24cfa@baylibre.com>
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
In-Reply-To: <20261117-riscv-kernel-doc-fix-v1-1-bc0a19f24cfa@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794931304056
X-purgate-ID: tlsNG-c201ff/1794931309-F62AB2A1-CFB3CA82/0/0
X-purgate-type: clean
X-purgate-size: 2279
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lgtm, thanks!
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

On 11/17/26 2:52 PM, Hiago De Franco wrote:
> sbi_remote_sfence_vma() uses @hart_mask, while sbi_remote_hfence_gvma()
> and sbi_remote_hfence_gvma_vmid() uses @cpu_mask without the @param
> prefix. Fix and make all three consistent.
> 
> No functional change.
> 
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
>   xen/arch/riscv/include/asm/sbi.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
> index 2a245d0b42..c585845907 100644
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -99,7 +99,7 @@ bool sbi_has_rfence(void);
>    * Returns 0 if IPI was sent to all the targeted harts successfully
>    * or negative value if start_addr or size is not valid.
>    *
> - * @hart_mask a cpu mask containing all the target harts.
> + * @param cpu_mask a cpu mask containing all the target CPUs (in Xen space).
>    * @param start virtual address start
>    * @param size virtual address range size
>    */
> @@ -118,7 +118,7 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>    *  - start_addr and size are both 0, or
>    *  - size is equal to 2^XLEN-1.
>    *
> - * @cpu_mask a cpu mask containing all the target CPUs (in Xen space).
> + * @param cpu_mask a cpu mask containing all the target CPUs (in Xen space).
>    * @param start virtual address start
>    * @param size virtual address range size
>    */
> @@ -130,7 +130,7 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>    * instructions, covering the range of guest physical addresses
>    * in [start_addr, start_addr + size) only for the given VMID.
>    *
> - * @cpu_mask a cpu mask containing all the target CPUs (in Xen space).
> + * @param cpu_mask a cpu mask containing all the target CPUs (in Xen space).
>    * @param start virtual address start
>    * @param size virtual address range size
>    * @param vmid virtual machine id
> 
> ---
> base-commit: aa6070d2c840301bceae28763d20a32c48f0d3e4
> change-id: 20261117-riscv-kernel-doc-fix-39926007bff4
> 
> Best regards,
> --
> Hiago


