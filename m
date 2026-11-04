Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E485606A328
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=qXCHoc4J
Received: from list by lists.xenproject.org with outflank-mailman.1472014.1680083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOc7h-0002mL-IQ; Wed, 04 Nov 2026 14:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472014.1680083; Wed, 04 Nov 2026 14:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOc7h-0002mE-Fb; Wed, 04 Nov 2026 14:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1472014;
 Wed, 04 Nov 2026 14:37:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d@swg.vates.tech>)
 id 1xOc7f-0002m8-JH
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:37:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOc7e-006Zk7-Ox
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:37:54 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d@swg.vates.tech>)
 id 6aeb4339-8faa-0a2a0a5109dd-0a2a45019d24-28
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:37:54 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d@swg.vates.tech>)
 id 6aeb4341-5984-0a2a45010019-b9ff1c128025-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:37:54 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a6fea90d000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Nov 2026 14:37:49 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B24C681651;
 Wed,  4 Nov 2026 15:37:48 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=9OpyWEIyQp2Jx+57NWRUR/8fx0qobXOdmfVjys9TCoI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=qXCHoc4JV/D+czfXHUJ7WZy4S40+xrmRLyL1sjPQyMk5fwt8+Poz94ykP8OPO+WyKgcfoWqJp
 /EA4Laeu4MGTm+bl6ia8MsCcMEOpuL+e+LmHQRgNGPIKuS/SZI8aOUp01FdT7VOzJRhuGJ4wS2K
 BjA7S6ZSVZXKSW4rOHffkIiuCfKM4egNrs9IsPEXiZB49fz+/9qbeoKLZ+I9KKwguyZ9A8fzLd6
 DibVd+/VpT+RLIS/8p2AjjAwgXBJdrYXKdW4REWKZUGvNmmLxFa6r2fC3LxTsLhGhyNiIXTtHNc
 cw5C1v90WyNk5oaRnwMPrIoDcDoosIRv8CSy78tdpBdQ==
X-Zone-Loop: 49f7691744f65d734672d0a6e603ab92ef4f575485e6
x-campaign-type: default
x-transaction-id: 1fd07bc9-ffb3-4872-9a26-d677f741657c
x-swg-uid: 01-c7c42bef-17e3-42d8-bc69-e4a59a1f2b36
X-Mailer: Sweego
Message-ID:
 <1793803069.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d@vates.tech>
x-swg-bid: 1793803069.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 38/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
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
In-Reply-To: <0c65801cec7cdac1556abc610e076f33c1500d1f.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <0c65801cec7cdac1556abc610e076f33c1500d1f.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 04 Nov 2026 15:37:42 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793803063; l=2436;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=gh2qu5G612IP4ZMCdKZoH5G7A8y1YxQiIilN27WQ/Xk=;
 b=nOBcv9+8RgoWotQH17xxETg00XYikCVtAwSxi8EtOd3fhmvA71gmtsfuGtpuBShUSu35eEDeq
 37p6INFqcVmBhypgGFXAxvnJYoX0Ltef6RKpxg6/xTdCfUjahaWEltp
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793803068938
X-purgate-ID: tlsNG-d62444/1793803074-BE664757-CA094241/0/0
X-purgate-type: clean
X-purgate-size: 2436
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 97 lines skipped ... ]
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -51,6 +51,119 @@ static struct csr_masks __ro_after_init csr_masks;
>  #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
>  #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
>  
> +/*
> + * Return the hstatus.VSXL value encoding the guest's XLEN. Whether the
> + * hardware can actually provide that width is a separate question, answered
> + * by hstatus_vsxl_settable().
> + *
> + * The switch() deliberately has no default case, so that adding a new
> + * domain_type (a 128-bit one, in particular) fails to build until this
> + * mapping is updated.
> + */
> +unsigned int domain_vsxl(const struct domain *d)
> +{
> +    switch ( d->type )
> +    {
> +    case DOMAIN_32BIT:
> +        return XLEN_FIELD_32;
> +
> +    case DOMAIN_64BIT:
> +        return XLEN_FIELD_64;
Couldn't we add to avoid having to explain why there is no default in
the comment above, and to respect MISRA rules?
default:
    break
> +    }
> +
> +    ASSERT_UNREACHABLE();
> +
> +    /* A reserved encoding, which hstatus_vsxl_settable() never accepts. */
> +    return 0;
Could this get a name next to XLEN_FIELD_{32,64,128} in riscv_encoding.h,
e.g.:

#define XLEN_FIELD_RESERVED     _UL(0)
so the comment isn't the only thing explaining the 0?
> [ ... 88 lines skipped ... ]
> +
>  void __init init_csr_masks(void)
>  {
>      /*
> @@ -91,6 +204,10 @@ static void vcpu_csr_init(struct vcpu *v)
>  {
>      v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>  
> +    /*
> +     * hstatus.VSXL is left zero here: the domain's type, and hence the
> +     * guest's XLEN, is only known once its kernel image has been probed.
> +     */

"Probe" refers to two different things in this series: the hardware
probe of the settable hstatus.VSXL values (init_hstatus_vsxl_settable_mask())
and the guest kernel header parsing (kernel_probe()). This comment is
about the latter, but it is easy to read it as the former, which already
ran at boot. Could you name it explicitly and state the ordering that
actually matters? I'd suggest:

    /*
     * hstatus.VSXL is left zero here: vCPU0 is created before
     * kernel_probe() reads the guest kernel header, so the domain's type,
     * and hence the guest's XLEN, is not known yet.
     */

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

