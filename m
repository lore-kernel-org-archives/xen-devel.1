Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F50CA5FC5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 07:34:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437987.1656868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCBJP-0002JA-Lb; Thu, 01 Oct 2026 07:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437987.1656868; Thu, 01 Oct 2026 07:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCBJP-0002J3-IW; Thu, 01 Oct 2026 07:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1437987;
 Thu, 01 Oct 2026 07:34:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCBJO-0002Iv-7b
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 07:34:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCBJN-000pwd-Gm
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:34:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe0d0c-2eae-0a2a0a5409dd-0a2a45029532-2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:34:37 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe0d0d-6ca4-0a2a45020019-4a7de18cd0c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:34:37 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so49787225e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 00:34:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01f99b113sm55016935e9.14.2026.10.01.00.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 00:34:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790840077; x=1791444877; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxEOhvYbGWasqHNN4kSw+sfo3fhK1ol662qvyK0BRIg=;
        b=bII2L9uOfU1PprB65DG5ODpEozQG76/+aN8Ng3RtyaSPSuk0dFia5Z1hnr0Qr8SFVc
         HcyAC7Is36CxP5bZh5AjB3xWPFXxzvcX5sZ8ZyelAIGV3AGehk348QxhXvSw+jBvEh+C
         ZYK3VNwYVEqm+4pz8kPQ3fUEh2fburbYRjU7C9T9/gI/A/Xi76rq9ywE20lHOenp+792
         fN3Rki+xVOw212ps7nT9IsygzMSJIrHou+hothvWtc8YkGDONEOSVsbfbWEdhCUE3sA8
         1ygvVuP6VNyi7QJIC4unXxUxf7LSMuAvpYl2asALZd0Kj56SygM7Boa2R7al54iLddtM
         aq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840077; x=1791444877;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxEOhvYbGWasqHNN4kSw+sfo3fhK1ol662qvyK0BRIg=;
        b=DuLoJs/lDUyi37Qwh596fYiZfdhGrZ5EKevLeyQmW2touUsq7Bidf9uhbQb7RirROY
         oipK8AlLU4Po/yBj6gzyMG5qKkGeIXfqtAWarYh+vAH//wFsY1mOkx3NDp8eB5FDd2Di
         nRcnpht/MHQFLweHACyBIafG9h/7cnwC+L//SbjUlqV5li6q3GngcXU7QuktLboFmLH3
         njKNd09eAgZy3BrRR4U9YzmaTeFbqp8NenJntudroUxjcd+5KlsvW0kkwwk4f4GGCYgr
         hNhVYPr7f6Qhcdb8wjCimIbmaJDXnJy9iubLUPplXj/sVDOV0AxssCugjq5n9D8Vb1Yn
         rHmA==
X-Forwarded-Encrypted: i=1; AKwUvBxeCV1tkGHh9nvgRYc8qChq0bY4bfkUpval8GiqtJQVyNzmF1+HbjrFED51Erfs6u34qgww5ddhz54=@lists.xenproject.org
X-Gm-Message-State: AFuF++kiEQHB3SC4dO/WKx5h4GGS5eY1Fcj+DCM8JAPOR29Mwf5z3l+J
	YJgBKY1tnyk7pdHIlGzAFDfaYf5NDdsIC2vrr60g/pHRC8E14GiLKnXHkzSlvDqpog==
X-Gm-Gg: AYBFou0OiEkd9xYDo4h3dcMPENKSZeWT5nlTQ2+HHYNTE6gz7yVh28vMuJHQi+y5PQd
	h9ySL1xy+4s41mCkjYC4E1FlMjDR4hHxCYrPAJW990at8ONBLUZxwDMSyzAX6sbIZrkK1+Z7LLR
	DqqnsHBHNPFkOuMRk5P7TttHAJ8FoTnWxZ1RbdZ/l2uBCPzvRhElx1bawjncPM/ScHqe6y1E80+
	uAcXZZcMef5KU+QkoJS378NsgHtGbMevOKkvD7Ryz+1zt/VUb+vVv0W2IZ2rHDSsSxWLIyQbz7t
	m0MTpCi+F4A7uNdHREji+YxOY9gNTUSG23oOLvoFMdMM1uZQByFdZ0wS2vqhM756KhVZChYi+Do
	ER/0miexkKzR+enA8Sgh6AM7uA+xYRYnAVkByV40ZA73zkDDqTABiUzuI4j+EZdaNFsTV8Cwn+J
	f8F03eurASB+0e37Mj5ssS2N/gVpk+DPT059Mg1Bbq2PBs0m4kiTDgL6LjdyP0IA1X7qSNyOfbd
	uwhVF7hK1PTUt39ei4ZHoJAtWsvdcPiVBP3OxlbH8nrxbhwYSk18vfRVms6/lQ=
X-Received: by 2002:a05:600c:8b88:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a01addebd5mr56197735e9.8.1790840075908;
        Thu, 01 Oct 2026 00:34:35 -0700 (PDT)
Message-ID: <a9d59bc1-6e21-4a8b-84e5-6daac02997c3@suse.com>
Date: Thu, 1 Oct 2026 09:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to
 PV guests
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260930191104.78141-1-roger@xenproject.org>
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
In-Reply-To: <20260930191104.78141-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1790840077-317CA2AC-6949FF58/10/78276251493
X-purgate-type: spam
X-purgate-size: 1269

On 30.09.2026 21:11, Roger Pau Monne wrote:
> @@ -692,7 +690,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>              if ( is_pv_domain(d) )
>                  fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
>                               (1U << XENFEAT_highmem_assist) |
> -                             (1U << XENFEAT_gnttab_map_avail_bits);
> +                             (1U << XENFEAT_gnttab_map_avail_bits) |
> +                             (VM_ASSIST(d, pae_extended_cr3) ?
> +                              (1U << XENFEAT_pae_pgdir_above_4gb) : 0);

Nit: Unlike binary operators, which we want to have placed at the end of
wrapped lines, we generally prefer the ternary operator to be wrapped
differently. E.g.

                             (VM_ASSIST(d, pae_extended_cr3)
                              ? (1U << XENFEAT_pae_pgdir_above_4gb) : 0);

or 

                             (VM_ASSIST(d, pae_extended_cr3)
                              ? (1U << XENFEAT_pae_pgdir_above_4gb)
                              : 0);

This isn't written down anywhere, so I'm not going to insist.

Furthermore, wouldn't it be plausible to also add IS_ENABLED(CONFIG_PV32)
(or, imo less desirably, opt_pv32)?

Jan

