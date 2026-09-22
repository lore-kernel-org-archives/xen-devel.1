Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AD1C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:21:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428948.1651872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Mu-00040Q-9i; Tue, 22 Sep 2026 14:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428948.1651872; Tue, 22 Sep 2026 14:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Mu-00040J-71; Tue, 22 Sep 2026 14:21:12 +0000
Received: by outflank-mailman (input) for mailman id 1428948;
 Tue, 22 Sep 2026 14:21:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x91Ms-00040D-TS
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:21:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91Ms-0062Ue-A4
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:21:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab28ecf-bab6-0a2a0a5309dd-0a2a4501d7e8-34
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:21:10 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab28ed5-5984-0a2a45010019-4a7de18ce5fd-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:21:09 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso28770955e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:21:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdaa544e5sm44041225e9.1.2026.09.22.07.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 07:21:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790086869; x=1790691669; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctZXYyHP1vY5uEl8z6mPKdIX7/CrxbY9+jI8Oqm6ke4=;
        b=P2mRqQNMSY58CkfaqKwW3mX2ClfxRoLKaz7kiX/9NgVSN4LjYtOstlRVX0w9V0h6VI
         E0JMSNrfSqHejCZy6/u3zlRfIrZWKjHLZxsu9UIb2Bw94zc7NeekvSjTmQNdMYyeXuXr
         SbZYmnYoHEndMO8sgAMXmur01iTe8shXw3pCG0A/hLVp/3GilL0PuOtFFh/4773BK/QU
         LYsSv9BgTmE1D2lU3q0fyVwae+R82/1D5y9yDynVoRSYlJxZ2tZbf+TF3db+97sAwtyb
         tyBEdjmbXmWCSQVhMYt2RjEXXeRm/Kw6amqScmKJs8Pr02QewVJNTRBnbtg8IGm9q1Jm
         NxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086869; x=1790691669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctZXYyHP1vY5uEl8z6mPKdIX7/CrxbY9+jI8Oqm6ke4=;
        b=FZWw+/fRo27LTOEKLWeyYNPyshi9CJhFS17MC50M7ezehzkZ3Z9vQ0BzAKKJynLys1
         Vo4wSj0Zjrx7hJAJBMnPLTCAuoMvWY/hhOOQRaJbx4AYCQmQtvHT9poIbjIfnAhX/0VF
         tbQ+9uuRVGOMBV5Cl7SmacQtiooqjWWdpndhHNdIRpfx4haX/5r7mSk/UMKOg2MnV+h9
         5me3NMkUUzyST0Cq+606r7RRrZqKQEGtF6aMNxNdsYCDVMd/ZVITJQOfad9MWVLaDMxD
         FAH0wjhMCL4h84IbkY+YsY9C9UMAjmE6pRXMxTucezDBp6oVjEFUDWk3JUbqR/7DKmud
         wxLg==
X-Gm-Message-State: AFuF++ltgw9O+Rr6qi8wSHT086oX6+k0fu9MIiop7F3ImXgQAZ3R6+oi
	4sOYHYZ4RQLZ5gaQd94bwklVt/VdbKVcCgGYw3ZBPP2J1hMLU9bM6yco
X-Gm-Gg: AYBFou2PJ+LW0TlAe58TKn94ExgNaFhL6md6mlndqZRgDLNSh+53OdwWb51S/uS811B
	2iFvsZJbG43EGAJKOHjz0lc202ihguOanf1D4uGJ2D59g7XoOQT/XalO40YfQwlrp/m5bdY3/kY
	/X6sVM0iaj/+Wly0X+M4EEG0sl6g2mUGI73DnU2/5o+Cn8v2OUzKnKwY83K9i/bdY8phPYPqaJ4
	i+7AfEB1XHtjGOMOYBKqjuOaKotshoS3dWpbfcuiBnIrlUNb7US5t9u37UN8MdIypVjuO/UKTFM
	iZPUmFgLz9rCIQ3ah3dWbSD/2tIPYJ6hwNXUOl1JYpIJLtto1p8A18yJv0JlKDRtEBhW0pYTBts
	cDcJvU2W2erOd/TVCKhCBHOj06NoBzmJDTysMDvBXSHY56vrYjhi+gqJkxg7yucJSNpRx+4cWla
	Jh4K5jXYagp9g12G+5F6KJkGJ4lk4Qd9maGrCF6og6uCLPKlpi+QyFhTy3l1P5A4kh638DFu3CL
	3mNJsFVwGHNCGvWLj6JUKnp+X+oXfhsOiotL/qvX1ZR8cbl32Ljazw9YSHa
X-Received: by 2002:a05:600c:474a:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49fc56713ebmr200706465e9.6.1790086869239;
        Tue, 22 Sep 2026 07:21:09 -0700 (PDT)
Message-ID: <6bb95b82-3ef0-4931-aa21-6794360d26b5@gmail.com>
Date: Tue, 22 Sep 2026 16:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] xen/riscv: fix level_map_mask truncation on
 load_start
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1790086870-1FC69757-F3CA23C1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2881



On 9/10/26 11:34 AM, Baptiste Le Duc wrote:
> check_pgtbl_mode_support() declares level_map_mask as bare `unsigned`, i.e.
> a 32-bit type while it derives from a paddr_t which is in both RV32/RV64 a
> 64-bit type. Storing that value into a 32-bit local silently drops any set
> bits above bit 31.
> 
> The mask is then used as:
> 
>      aligned_load_start = load_start & level_map_mask;
> 
> load_start is `unsigned long` (64-bit on riscv64) and if it requires more
> than 32 bits to represent, because load_start zero-extend to 64 bits, we
> would drop some load_start's bits during the AND.
> 
> Widen level_map_mask to `unsigned long`, matching the width of the physical
> address.
> 
> Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
> Reported-by: Zheng Zhang <zhangzheng@iscas.ac.cn>
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v1:
> - new patch
> ---
> Question:
> I would think replacing unsigned long by paddr_t would be better in this
> case but for consistency with other variables in the function I just kept
> unsigned long.
> 
> However, there are many variables in mm.c which are unsigned long while
> they are, in reality, physical addresses and could technically be paddr_t.
> Using paddr_t would also let us bypass the compiler's decision on what
> unsigned long extends to (u32 or u64, depending on the target), and
> therefore be more generic. I've seen similar code in Arm using this
> convention, and found nothing on the mailing list explaining the original
> choice of unsigned long over paddr_t.
> 
> Replacing every such field would be a fairly large change, so I'm asking
> for your opinion on whether it's worth doing.
> ---

I think if to do that it will better to do step by step where real use 
cases which lead to some problem will happen.

Specifically here it looks like `unsigned long` should be enough ...

>   xen/arch/riscv/mm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 53bebbcabf..e7f2491257 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -180,7 +180,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
>       bool is_mode_supported = false;
>       unsigned int index;
>       unsigned int page_table_level = (mmu_desc->num_levels - 1);
> -    unsigned level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
> +    unsigned long level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
>   
>       unsigned long aligned_load_start = load_start & level_map_mask;
>       unsigned long aligned_page_size = XEN_PT_LEVEL_SIZE(page_table_level);
>
... what you actually did.

LGTM: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks for the fix!

~ Oleksii




