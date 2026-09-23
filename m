Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B194C98302
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:16:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430871.1653286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Ohb-0002pz-Ms; Wed, 23 Sep 2026 15:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430871.1653286; Wed, 23 Sep 2026 15:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Ohb-0002ps-KC; Wed, 23 Sep 2026 15:16:07 +0000
Received: by outflank-mailman (input) for mailman id 1430871;
 Wed, 23 Sep 2026 15:16:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9Oha-0002pm-15
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:16:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9OhY-008IWv-L1
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:16:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ced6896200072c4@swg.vates.tech>)
 id 6ab3ed2d-2eae-0a2a0a5409dd-0a2a45049bf4-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:16:04 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ced6896200072c4@swg.vates.tech>)
 id 6ab3ed34-b57f-0a2a45040019-b9ff1c228045-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:16:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ced6896200072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 15:16:01 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id AE5E1822C9;
 Wed, 23 Sep 2026 17:16:00 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=eCkgDkD2MRwoqy8APPUc78laAAk/4X63XbFZDO3ee3U=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Bdl7wmV8Tz88WiZU6UNu5Xhwc4jj5MgypD0Avc65gPtBNIMQh71KfG6W7cZ+a4yevJEsqHTFf
 rY8GBi6YI5Jq/HMyQQtozhAgmYcJ+jgygArcs656B7rYDF8bRSRH0+1LVv8DYHXunc4SJRWLXwp
 i8fUTgiLq9Jlmydoas2dU5gJvoUYKtBsCelIuIopFx+ixNE11wkE8fE7IhJ+TdMSbCjQIlLati4
 lsTFHhESEDrBB0X//bs9L257AJQcPJr42dYb6cuGArIZYuDmoSt8RuoMekKkt6GMDDPCVlf5UCT
 yZy7N//MBmUFEkj0VFYjuxL0BdgmPc81BXsAd0Eyrm+Q==
X-Zone-Loop: 116d5c6887484a98e33ceeba1b0ed0d47cf885805f2f
x-campaign-type: default
x-transaction-id: 95def31e-6925-42cd-83a0-4bb8419b5e9a
x-swg-uid: 01-384ea436-d9b4-4e8b-a9f4-7333da706035
X-Mailer: Sweego
Message-ID:
 <1790176561.8631fc262581453bbf619ec5b2062170.1a0ced6896200072c4@vates.tech>
x-swg-bid: 1790176561.8631fc262581453bbf619ec5b2062170.1a0ced6896200072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 33/39] xen/riscv: dump old interrupt file to memory
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
Date: Wed, 23 Sep 2026 17:15:53 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176555; l=2913;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=fYzeUEWEhfCv4+Ymv9h8sEWhE7EOk0UljiQUNUMogws=;
 b=tj4pnjGtDo6GgIjIhkkGcDgWmB85wNR0cM9VVUz5sdtLKdZbwDytvYZirYrSU0qk+D7jDxi9d
 ZFtfEepGvifCBzqWMp+SPQlG5M0AFnbI1dqpsO2AKd48rCsMIfEMzxV
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790176560921
X-purgate-ID: tlsNG-ebf023/1790176564-52CCFB50-6D6F8907/10/73395122804
X-purgate-type: spam
X-purgate-size: 2913

> At the old interrupt file, dump to memory all the eip and eie arrays).
Typo `)`
> After this step is done, the old interrupt file is no longer in use so
> old intrrupt file VGEIN could be released.
> 
> Restoring of old interrupt file state will be done in follow-up
> patch.
> 


> There are cases where it is needed to specify on which cpu it is
> necessary to VGEIN should be released so update vgein_release() to

The sentence miss a verb, here is a proposal:
```
There are cases where the cpu on which the VGEIN is released needs to
be specified, so update vgein_release() to deal with that.
```
Moreover, could you explain me the cases you are talking about? It's not
clear by reading the commit message in the first place.


> deal with that.




> 


> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard


> against silent incorrect behaviour or unexpected panics in guest VMs until
> the function is fully implemented.
> 


> vgein_release() is stub for now and will be introduced later.


> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
> index 75c82bcfa1..be3901ec0c 100644
> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -30,3 +30,8 @@ unsigned int vgein_assign(struct vcpu *v)
>  
>      return 0;
>  }
> +
> +void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
> +{
> +    BUG_ON("unimplemented\n");
> +}
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 5e9f6995e4..3cba58e0c1 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -56,6 +56,24 @@ static unsigned int __ro_after_init guest_num_msis;
>   */
>  #define GUEST_IMSIC_MAX_MSIS 255U
>  
> +/*
> + * The interrupt identities an IMSIC interrupt file provides are 0 (which is
> + * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
> + * IMSIC_MAX_ID + 1 bits have to be covered.
> + */
> +#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, BITS_PER_TYPE(uint64_t))


> +
> +struct imsic_mrif_eix {
> +    unsigned long eip[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
> +    unsigned long eie[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];


> +};
> +
> +struct imsic_mrif {
> +    struct imsic_mrif_eix eix[IMSIC_MAX_EIX];
> +    unsigned long eithreshold;
> +    unsigned long eidelivery;
> +};
> +
Maybe I didn't get something but I couldn't find anything in the commit
message explaining why do we use mrif here.

Moreover, mrif, as described in aia spec (8.3 Memory-resident interrupt
files), seems to be only usable with IOMMU that Xen doesn't support.

If you want to have something in memory that could store some interrupt
file info, we should take another name to not be confusing.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

