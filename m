Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0F606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=dHJdCENc
Received: from list by lists.xenproject.org with outflank-mailman.1485861.1688909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVGY-0002fU-AG; Thu, 12 Nov 2026 13:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485861.1688909; Thu, 12 Nov 2026 13:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVGY-0002fN-7h; Thu, 12 Nov 2026 13:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1485861;
 Thu, 12 Nov 2026 13:55:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRVGV-0002fH-Vc
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 13:55:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVGV-003N1c-97
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:54:59 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1d00a3bb2000403d@swg.vates.tech>)
 id 6af5c52f-2eae-0a2a0a5409dd-0a2a4501a712-6
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:54:58 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1d00a3bb2000403d@swg.vates.tech>)
 id 6af5c532-5984-0a2a45010019-b9ff1c12b011-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:54:58 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1d00a3bb2000403d.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 12 Nov 2026 13:54:54 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 541E680971
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:54:53 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=d2iDtNeVRl4JjsRizbvq0yjK+umYtYZZJrJi/lbKPvs=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=dHJdCENc71gJb6xn6r1Az2/AdJr+XxsQdm37ZwyhRV07LFD4fmSwohCaJcYZ9Sm8EvMw4R6Gk
 hMQ+fL6OK7EP2zVUzqmM75hFAEbLKtPsPmwsWXU788A7JRctC2PIRyvX24gctYRuyAxGhgQLodW
 X9P8utF5buIJSbIUMelM9TdMWySo2ICL5PY0qo14VWil4vTRMshHAYrIHEba/mVjJU+rjw0xzb2
 avNHEzdM5IrxnOO5z+CiTa7tYKw3AONiPTIp/0o2nosCbwm9VEel1Hz3ppdxGtJJfSHPboz2knP
 k2163wYJVjdfhdiVjDMUEg0AQliH/oQQiT+VpsHAfEfw==
X-Zone-Loop: e1fd8162e5316636f62a0a33d1889e6856f636987f4d
x-campaign-type: default
x-transaction-id: b37f3d13-5f60-4a99-b255-fd2adda19010
x-swg-uid: 01-573d15ef-14f6-4652-aae4-974ceb0f4931
X-Mailer: Sweego
Message-ID:
 <1794491694.8631fc262581453bbf619ec5b2062170.1a1d00a3bb2000403d@vates.tech>
x-swg-bid: 1794491694.8631fc262581453bbf619ec5b2062170.1a1d00a3bb2000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Thu, 12 Nov 2026 14:54:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: add cf_check to vcpu_imsic_{init,deinit}()
 declarations
To: xen-devel@lists.xenproject.org
References: <20261112114647.229806-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261112114647.229806-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794491693396
X-purgate-ID: tlsNG-d62444/1794491698-BEC61757-89FC1761/10/73395122804
X-purgate-type: spam
X-purgate-size: 1437
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

On 11/12/26 12:48 PM, Oleksii Kurochko wrote:
> vcpu_imsic_init() and vcpu_imsic_deinit() are indirect call targets, as
> vAPLIC's vcpu_init and vcpu_deinit callbacks, and are defined cf_check
> accordingly. Their declarations in asm/imsic.h lack the attribute,
> though, while cf_check is to be present on the declarations as well.
> 
> Add cf_check to the declarations, so that they match the definitions.
> 
> Fixes: 9164a97efbeb ("xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/include/asm/imsic.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
> index 639ee327dc67..217fc3d49b25 100644
> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -90,8 +90,8 @@ void imsic_irq_disable(unsigned int hwirq);
>   
>   void imsic_ids_local_delivery(bool enable);
>   
> -int vcpu_imsic_init(struct vcpu *v);
> -void vcpu_imsic_deinit(struct vcpu *v);
> +int cf_check vcpu_imsic_init(struct vcpu *v);
> +void cf_check vcpu_imsic_deinit(struct vcpu *v);
>   unsigned int vcpu_guest_file_id(const struct vcpu *v);
>   
>   int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);


