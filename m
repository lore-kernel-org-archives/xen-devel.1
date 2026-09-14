Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12511C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 12:12:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420881.1647100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65Xq-0000VG-Gc; Mon, 14 Sep 2026 12:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420881.1647100; Mon, 14 Sep 2026 12:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65Xq-0000V9-Df; Mon, 14 Sep 2026 12:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1420881;
 Mon, 14 Sep 2026 12:12:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x65Xo-0000V3-NB
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:12:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x65Xn-00DFHw-Qm
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 14:12:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e490-bab6-0a2a0a5309dd-0a2a450bd3da-28
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:12:19 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e4a3-b7e8-0a2a450b0019-d1558030eda2-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:12:19 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so35027805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 05:12:19 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e62231360sm216648425e9.4.2026.09.14.05.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 05:12:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789387939; x=1789992739; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3C7PP1zJhs71RIxzW2LS8GvnVQCNFJCxHXtKjFfjEE=;
        b=TaxXZbuUpElMCu7vIhorApUOtGT+0TwYE/FAIeQyMGghopk7JGVCXLsZs9PJVlJ8K9
         Ftm8wRsKYIAh3x1r2FXGbpFH3k84ohLoGTePja6B+ilc/VqvSn6scvueTI02rbZ7aFL9
         QrMjuRvpnvCOXyNtEXHi4G96TWXXz7ar/sW0wS3DpFkX8EZlk3s4bM5IhxW3ttTIgI36
         wFjux4EKuUOnRSBF/wFFEZ96vssM/YI/dMn8lCdAGjB9xK22EbuAhNJYZSk3ajtvT8f9
         jET42gBPacN2l1X158QhQ8q9+uNfpkCrFYekj0pXMPfnw/BOD4/b/Vk6KWUS4MjJU2JC
         7V2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387939; x=1789992739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3C7PP1zJhs71RIxzW2LS8GvnVQCNFJCxHXtKjFfjEE=;
        b=YYg8ISJreLVuxeTEDmw4kWCi5r+K+8kBNRxIc0teKlSwM6HhLWN2MCj2N+0kqvhQmJ
         P4BZW5U+CQErMdXkIVW2mQaryFJTN329SK5d2msStQaOFkPBXKLVquUkHeIMnOo6g8/C
         2CShWlaAHkhNL2Yd4sOxz6Gwmq1tSci5ezyrNUz+OQBL7Q/VjxKnzzXHwNDFWYqLFYM2
         aG/DspTQ5jlp/PrZWx0xTVGeXCHOWXvFf1GbvtglTM7B7YUQQtI+wmTVtYf0s7xleChm
         xMMebYUfVkMxm1lpmxAenL0kHsxLYZ6iWftitS8ObpH0qTF60VOm/xjzdcIFfxqTArfZ
         YPrw==
X-Forwarded-Encrypted: i=1; AKwUvByGDsG1Vm/zT7PuN6cuHbigyll2O5tlLqw38srVTznPI4KrIBaA4grv80fsZZy/Tfm511f0APKJF/Q=@lists.xenproject.org
X-Gm-Message-State: AFuF++kkVT0gN18oNfhVrPEL5ihQuYw7mW1wO8EvNt9RyrmzZy1jj5aD
	M7mSBehAa8GEcp5/C+TWpqG8HWprwd9jLSMYiFsrJ16Gaa0lPwPUkEudW/7pkfC/VA==
X-Gm-Gg: AYBFou2aSfzho89RuNS1q1LI/MKucJv3wuN4YYZJ868AXFufchThL1KonFmr48JHfo2
	BRX1H67gMplpewkymjHKVggx1v5JeFHlpz1YD+pijyC06HnXHnq6zl6QH/kKlv73MExgoRWNYLS
	YYUlIMH8fHn/xDWBUA43JV1qgtftNMdhIcMTlHOxFoiIxH2OKarDqb1pVCRrPucUWHy8Q86xbcx
	0AZEp8LUn1Cude8u+cyfRbqMugLQB5xC3qBrwp4WKjOZtb27pVA/1DKLYQF5IBwn0ewCfrCG8Re
	32YqJKSyPFvvF0m8LoDcyhppP53ZAPdD6Gww671tFZ/uzF/oA87nJbKQWOl6+FGcKeFzGvLkxoV
	71MmS1uPeGnakTEuQsjGi50Kt6YxoXkDFoMH82pc6c7eQ1mp16BXmd5MjBof7q2xCM7zr71Qd0W
	2RHqYGHS8MuaoDcYi1j49TmUY5GH6efSzKdwu4Z9n9yZgUC3pHvfRzKtiobnMDZyID/1KDD34XK
	9MWoUNnS8l6
X-Received: by 2002:a05:600c:3b1d:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49e7a685a5cmr25650815e9.17.1789387939221;
        Mon, 14 Sep 2026 05:12:19 -0700 (PDT)
Message-ID: <63eb5954-0c34-4cec-9037-b25724b68f47@suse.com>
Date: Mon, 14 Sep 2026 14:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/39] xen/riscv: handle the case when no vCPU
 migration is needed
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c4f78f50022bd7a75a4deb71199e979beafb4906.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c4f78f50022bd7a75a4deb71199e979beafb4906.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789387939-182F49EA-915F61F7/0/0
X-purgate-type: clean
X-purgate-size: 1509

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> The IMSIC vsfile mapping is performed in continue_new_vcpu(), since the
> target pCPU must be known at that point. It is therefore possible for
> imsic_migrate_vcpu() to be called before continue_new_vcpu() has
> executed, in which case v->arch.last_pcpu is NR_CPUS and there is nothing
> to migrate.
> 
> Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> against silent incorrect behaviour or unexpected panics in guest VMs until
> the function is fully implemented.

This doesn't adequately describe the change made: The BUG_ON() was already
there.

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>  
>  void imsic_migrate_vcpu(struct vcpu *v)
>  {
> +    /*
> +     * The scheduler can mark a freshly created vCPU's unit as migrated and
> +     * invoke this before the vCPU has ever run (see the migrated branch in
> +     * schedule()). No need to do migration for such vCPUs as they aren't fully
> +     * initialized (for example, context_switch() will be called after
> +     * imsic_migrate_vcpu()).
> +     */
> +    if ( v->arch.last_cpu == NR_CPUS )

May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
good sentinel. If we/you decided to switch to ~0, >= here would continue to
be correct.

Jan

> +        return;
> +
>      BUG_ON("unimplemented");
>  }


