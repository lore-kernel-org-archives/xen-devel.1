Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3E606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=LVu0c3Fg
Received: from list by lists.xenproject.org with outflank-mailman.1503255.1699047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWWFX-0000tI-PB; Thu, 26 Nov 2026 09:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503255.1699047; Thu, 26 Nov 2026 09:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWWFX-0000tB-MW; Thu, 26 Nov 2026 09:58:43 +0000
Received: by outflank-mailman (input) for mailman id 1503255;
 Thu, 26 Nov 2026 09:58:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWWFV-0000t4-Eu
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 09:58:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWWFU-00BimV-K7
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 10:58:40 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a2174ae9fb00099bd@swg.vates.tech>)
 id 6b0802c4-bab6-0a2a0a5309dd-0a2a4501ce0c-32
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 10:58:40 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a2174ae9fb00099bd@swg.vates.tech>)
 id 6b0802cf-5bcc-0a2a45010019-b9ff1c2394ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 10:58:40 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a2174ae9fb00099bd.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Nov 2026 09:58:35 +0000
Received: from [192.168.1.37] (lfbn-gre-1-56-253.w92-157.abo.wanadoo.fr
 [92.157.33.253]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 81F3681EFD
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 10:58:34 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=SpQUtnsl9xsQqBHZ9sqIBNTykZnYw2hH55DFApUwBiA=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=LVu0c3Fg/XwDIpFI+X+wIFA6fUgqlZjWCArspN/O/suQckpb66NkOQOibwgkEXjl+SK9fFeGA
 zyxkxbWB3ZaHJJGCcLCe5aMYsOy6TdJFILXReHYJp1Et3m114Cp41YL+lNMZ/YDe5VqbRhPgZUk
 CEOD7o1nvdHQJAP0Jj/XaD4A0ZdMtLsG9iWyS351ZtvpL9ogxOTH49DK1KQ5eGe47dbkYo0c0Cj
 SipsGMGO7fJf0RJURS++3wJoryKSFUTAjlRLm7gUK8MgRT8nt7IkxEJrP9th0XS3Y44lHDjnxp9
 24zCovLG0+GCigBu2dQh4WeAmfrH5g8GfWYi+FKa+0+w==
X-Zone-Loop: 7a042db2f8c5c83b1ccd2d631ad375dd167f4f3449d2
x-campaign-type: default
x-transaction-id: 581cdd0f-a86d-4327-9b4c-822076d6b6e3
x-swg-uid: 01-651e502b-81d2-4ff6-805c-22d71f4cac1c
X-Mailer: Sweego
Message-ID:
 <1795687115.8631fc262581453bbf619ec5b2062170.1a2174ae9fb00099bd@vates.tech>
x-swg-bid: 1795687115.8631fc262581453bbf619ec5b2062170.1a2174ae9fb00099bd
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Thu, 26 Nov 2026 10:58:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: don't decrement total_pages on failed
 paging_alloc_page()
To: xen-devel@lists.xenproject.org
References: <20261126083130.32791-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261126083130.32791-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795687114572
X-purgate-ID: tlsNG-d62444/1795687120-BD2EC5FD-61514CBB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1298
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

On 11/26/26 9:33 AM, Oleksii Kurochko wrote:
> paging_alloc_page() unconditionally decrements d->arch.paging.total_pages,
> even when the freelist is empty and page_list_remove_head() returns NULL.
> In that case the counter underflows, so arch_get_paging_mempool_size()
> reports a bogus pool size and subsequent paging_freelist_adjust() calls
> operate on a wrong page count.
> 
> Only decrement the counter when a page was actually taken from the
> freelist.
> 
> Fixes: af87a609c79d ("xen/riscv: implement p2m_next_level()")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/paging.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
> index 35f572689a7c..6464c7ce68a6 100644
> --- a/xen/arch/riscv/paging.c
> +++ b/xen/arch/riscv/paging.c
> @@ -120,7 +120,8 @@ struct page_info *paging_alloc_page(struct domain *d)
>   
>       spin_lock(&d->arch.paging.lock);
>       pg = page_list_remove_head(&d->arch.paging.freelist);
> -    d->arch.paging.total_pages--;
> +    if ( pg )
> +        d->arch.paging.total_pages--;
>       spin_unlock(&d->arch.paging.lock);
>   
>       return pg;


