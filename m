Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD57606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MKLiPG3t
Received: from list by lists.xenproject.org with outflank-mailman.1471427.1679804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUYP-0000jI-DP; Wed, 04 Nov 2026 06:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471427.1679804; Wed, 04 Nov 2026 06:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUYP-0000jB-A9; Wed, 04 Nov 2026 06:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1471427;
 Wed, 04 Nov 2026 06:33:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOUYO-0000j5-KY
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 06:33:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOUYO-0094eY-0w
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 07:33:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aead186-bab6-0a2a0a5309dd-0a2a4505816c-38
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:32:59 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aead19b-4cb1-0a2a45050019-d155dd31dcc1-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:32:59 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so263458f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 22:32:59 -0800 (PST)
Received: from ?IPV6:2003:ca:b725:cdd3:6826:c9b1:b0c4:292e?
 (p200300cab725cdd36826c9b1b0c4292e.dip0.t-ipconnect.de.
 [2003:ca:b725:cdd3:6826:c9b1:b0c4:292e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed45d7f7sm2031098f8f.38.2026.11.03.22.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 22:32:58 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793773979; x=1794378779; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2Z0FGgbycCNZtYGy3QAW8z3RKcD8L5wekjeHqw95lU=;
        b=MKLiPG3ty/V73sBnEqhZHH1DNAVgYoCf6mlLolz7DvFqQCBLABN6mYJjTk0S9jXSQW
         yC/Erya/kB3ffnuqMMSWzkjOfXxIs2WmE5xCZrPLNB4YtDPeQWppyN4rcfDqyKLRL2fI
         q/3MNhqdGeB0esyUeVLwT8guExEfOjF47463S+W9jiKijT+JwkhvZTqtAyqHGv4ePK4g
         Dq2fFDY6F67Ao7sJah1vw1WYIm7ZDk2q8FOQ5zwvvnVsZ/XasbKmdcFKQpeaiZ56ImwJ
         /Ehk11GTb4nICWT2F/QdhLHu0acTGXA9qmD6WBQo1Se/o0kJTnBFC9oXyc/gmN+roemr
         b8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773979; x=1794378779;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2Z0FGgbycCNZtYGy3QAW8z3RKcD8L5wekjeHqw95lU=;
        b=nlpeAQLv55t62hYAEqwGvqA22LZ483NJ0+wh81uivVEivTKcOcDFETo7IIbFLo8264
         9Y4K3nrtP9rmF2HK1vI6SbUGIizH8EhZ/63IXmFLiV5PqiIItTnWlsnc7fzfzWbhgzEo
         w4gRpGQmygeo2QszdhOqMVEPpV4ml1a2wPYRuk/QUBW/8NK9ur9/bwDNKUB2T3J77EQ5
         ISQhhPJmOmg27z4PLoxWYszNvNhghtsnj9Hf8XdJoC//I5mTe1nFZFkce27/YDdj/dto
         3vNTf97nLr9SUE3T6fnbacf5ygsnY2FvczThGtBCPy7/6bCjDUQ2cg3n2WWnHUqEDjw+
         95tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKOxiYxtNOhgBlOtOd+UW/A0IBStcqX64lswAGSEcfImSvQ+zgW+/8Ij3/KT7dvqJwwYoMdWnKaxE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9tqFdjNWrlZFl8R7E6wJaAqytcNX+wF1iK25GNsvSaH8UmGinw
	pah1FuhEtov/SUDuEtcE8lrHP2/cCvz7bKO0bAAWnhj1tho+DMpQepcfVu/Zn9MrbQ==
X-Gm-Gg: AYBFou2dHGqFgP439j8MbztF5rd+y2Rt5dyWEF5iumntMaaCy2eC0mwICrnM+3KKH78
	jARlU3sFPYWwLrf5OSvErfakeRclbh01fZ2EaIZgitBgBlayYCGLVZA/0JLl77zfo87XWuR4a7A
	X+s1gh/HfJYg884HRjYQ71D7ACA1KPazal99Tog/iF+UwQ+xlG4uchQnC0hpDIGUP3VTEudnhg0
	1x19jRhP1iEeVvf6nZlRK2O8u4G9kQ/iSUvZwSblnt1XHak1etFriwm8Qbwwrzw30/EWw/fOk5k
	QxqlMiUpWueyY3b11dkgitwUXJ0nB41Lmz3tjCwDBd9GyJCmDBH5uQFNQ8EZa7UjC3v/zV0xM69
	GVFOD4qbKN2x6x0yaVAjAgYJFmdwTowhILC815q7bz06punBuEYcoC8eUIZ0rkeailAqu3f1XGS
	CVGfeseqB6oceP6TCHxMDrIhkHBNKokefLoCM1XdaJE7fazvabUfKfpp3k/TiWwbwRrNfQXCm/x
	7MhDWva9LSqvmaYZ+ddsb2bUfcUxm0hpUBsqAS80zzAkHwypj7S6jDXLhLwrR7zygRQQ08yslk9
	utzjqy0m/vaZ5PzWaiasEa+xECGKkvF69nowEMbb3A6+7anzXhvh+9aXxDtHY5raZDiA8J7uDg8
	fvC7+teZE6UUK0+Sytw6wVblKaQ/My5fWYpvat7tKOobEHOrOI3ZIvk9Hd855
X-Received: by 2002:a05:6000:184b:b0:48d:deaa:4dbb with SMTP id ffacd0b85a97d-48e6e2fc210mr33608354f8f.40.1793773979193;
        Tue, 03 Nov 2026 22:32:59 -0800 (PST)
Message-ID: <17601420-778b-4b68-983b-656edf3124cc@suse.com>
Date: Wed, 4 Nov 2026 07:32:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/22] libxl/arm: Introduce domctl command for IOMMU
 vSID mapping
To: Milan Djokic <milan_djokic@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793726692.git.milan_djokic@epam.com>
 <ee5fcdb5f74ab0c367e3006310b556bc4f5250da.1793726692.git.milan_djokic@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ee5fcdb5f74ab0c367e3006310b556bc4f5250da.1793726692.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793773979-736BD2A1-A6BC3E70/10/78276251493
X-purgate-type: spam
X-purgate-size: 2082
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 18:30, Milan Djokic wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1279,6 +1279,26 @@ struct xen_domctl_get_domain_state {
>      uint64_t unique_id;      /* Unique domain identifier. */
>  };
>  
> +/*
> + * XEN_DOMCTL_viommu_alloc_vsid_range
> + *
> + * Allocate guest vSID range and
> + * establish pSID->vSID mapping for target range and physical IOMMU (phandle).
> + * Allocated range is continous
> + */
> +struct xen_domctl_viommu_alloc_vsid_range {
> +    /* IN: Range first pSID  */
> +    uint32_t first_psid;
> +    /* IN: Physical IOMMU phandle behind which the target device streams are configured */
> +    uint32_t phandle;
> +    /* IN: Number of vSIDs to allocate */
> +    uint16_t nr_sids;
> +    /* padding, must be 0 */
> +    uint16_t pad;
> +    /* OUT: Mapped range first vSID */
> +    uint32_t first_vsid;
> +};
> +
>  struct xen_domctl {
>  /* Stable domctl ops: interface_version is required to be 0.  */
>      uint32_t cmd;
> @@ -1371,6 +1391,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_gsi_permission                88
>  #define XEN_DOMCTL_set_llc_colors                89
>  #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
> +#define XEN_DOMCTL_viommu_alloc_vsid_range       91
>  #define XEN_DOMCTL_gdbsx_guestmemio            1000
>  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1439,6 +1460,7 @@ struct xen_domctl {
>  #endif
>          struct xen_domctl_set_llc_colors    set_llc_colors;
>          struct xen_domctl_get_domain_state  get_domain_state;
> +        struct xen_domctl_viommu_alloc_vsid_range viommu_alloc_vsid_range;
>          uint8_t                             pad[128];
>      } u;
>  };

One way or another this new sub-op wants explicitly marking as Arm-only.
The specific interface doesn't look like it might be meant to be arch-
independent, i.e. it's not just the fact that only Arm implements the
sub-op for now.

Jan

