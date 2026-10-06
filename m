Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457F8CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 11:26:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441427.1659029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3JG-0006zF-Ls; Tue, 06 Oct 2026 11:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441427.1659029; Tue, 06 Oct 2026 11:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3JG-0006z8-Iw; Tue, 06 Oct 2026 11:26:14 +0000
Received: by outflank-mailman (input) for mailman id 1441427;
 Tue, 06 Oct 2026 11:26:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE3JF-0006z2-KZ
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 11:26:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE3JD-005bC7-6p
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:26:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4dac9-e002-0a2a0a5209dd-0a2a450a974e-30
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:26:10 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4dad2-f2d2-0a2a450a0019-d1558034c193-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:26:10 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a02753c04fso3599845e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 04:26:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c53997sm100215505e9.12.2026.10.06.04.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 04:26:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1791285970; x=1791890770; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z95tJ6WLbM1DPP+yQ8pzflSDnL9xaj0PQek9EAn+SM=;
        b=d7h3DPStgDZN0chLFD+WfvC1x+4OSGqc7qDTtr/NKNuqf1EG4/m/RdXP/IfOIF4LXu
         aRaPzI6hfBunzV99evKsoMttd0CtBBX46E1cp2CEypGE3AXhmz3poNRFc29FNU5ShsZY
         2ULBpFcs+rizJnTZUeYSeQ1j/eEg5acvi4k4t0zrwH/lvZ5ZMwDEmPFiKlgc6F9j6m2L
         YdYKgivqM5M3RrIB1Ql4ulqeBIceoMaZFJQ34q9nTYY7CeIhHjjnlMNqcnMzxZMD0U4v
         Uin1QAqXuNIseJBuamxm6lZ8jvQBynvZmccJT+YCkCh6kEcuE8GohGH92Oz7CEamBoOO
         z8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285970; x=1791890770;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z95tJ6WLbM1DPP+yQ8pzflSDnL9xaj0PQek9EAn+SM=;
        b=gCGyR2ypvyc24ueqlzJ74s/lSJhKkni2cfV0JIOyrX2aG2waKanVrw/J563K/XEHRz
         khjn6mMsCpyjNoyBd1lZgjOCuU1lthIXil8uBFzsBgbwkxPk07w0+fQQkKxrneZMugOu
         4Z9OnaGESkmlmUVmW+FJ8MLr4mjqOIkdGJoaum7J57/wctL846zKklXiTpFwUVAB9jRt
         fi8v8ZEV+fpAjl7/6zaI/uwj1TfhewNMZmCIOPYxDBnCYUJl2Ln52zQiCCGWi5PKEKAn
         XGZ35b1yuWMmXmBXUkgl3X4bDhjlGkkR08X/pYWqVMgr/XxfW2GyxfUU2Kg3NgpoO1jT
         8HGg==
X-Forwarded-Encrypted: i=1; AKwUvBzP/bVfAc6Ckjju06pzG3+d1XucWWg8ZIGBTLbZbiO/eXIarWhnKbSbZf9i2hq5eCRTi9Q8DcXXf2w=@lists.xenproject.org
X-Gm-Message-State: AFuF++kSKrI/CP9GEaEC7Vpil1lbmpsdWx2uaaMmNb/0juX7VxsF74Nz
	55i4aH0ACHctl7H2ui+uU25FARvrW0Jr/9BpkNVy201X3ORVZOOrhJxPx8pDvb1yxg==
X-Gm-Gg: AYBFou0ilBhOsl7R9FxNeU1csiXBr+hUnkTM+CSVUh7hYACcgTu8x0pcmBbxjH28oPh
	NxsTUeh7WEtieR/TlnjbmfQRLPx6jFHt8AdHGbb/qHt3yqbJHJzuNw5VJ3xjEImcnity3hGC3m1
	BD6CLkG1PW/vXl7raTjeRnwsrv6r/cJEc+DlpINqxLVJTXu/EzK2TisBtHtqVa0qRLOIHtFbG80
	NxVOeqdzL+Ij9nEPHba6O/M/8ahLawgti9cdLLmoFwniHVMnH7nT2VjqPWRUHPwyukU0r/I2Tu9
	4ZRgFHpCU4gUxsjhGCFnj43zHsMQYsArOT8snB7b9YS+XZrBbOA37SBMOI40LvNxa+MxjkKUNpD
	BvIiRfgLzCuNyBdT9r18YflPHOaZccqsrs5uT5rZiryLGnzwdgEj2ugNZO/qXdHsybqDEp+IcyH
	dXe97Vd7xZBaUCI+HEkLo+lewf4HngXdVy2gX0sMGxanK7oRBnNRToKqKTvrpznbxSbWPR8PDEj
	Hnksy0CbKYknTY/kCJ3Iy65CPKdqt9pdEyzLPmFP3/qJBg3HHL9Igg2z8lxHsA=
X-Received: by 2002:a05:600c:1f83:b0:4a0:1b15:8852 with SMTP id 5b1f17b1804b1-4a17b5359c9mr18418825e9.16.1791285970251;
        Tue, 06 Oct 2026 04:26:10 -0700 (PDT)
Message-ID: <3bade5ec-e91d-4181-89d9-de35bd42ce62@suse.com>
Date: Tue, 6 Oct 2026 13:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kexec: Annotate more noreturns
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261006105445.511099-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261006105445.511099-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791285970-52EDACFC-CD2B200A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1797

On 06.10.2026 12:54, Andrew Cooper wrote:
> kexec_reloc() does not return.  Plumbing this property upwards lets us mark
> machine_kexec() and machine_reboot_kexec() noreturn too.

The latter already is annotated such (see also next remark) as of 4d2ed2f88a0c.

> --- a/xen/arch/x86/machine_kexec.c
> +++ b/xen/arch/x86/machine_kexec.c
> @@ -142,15 +142,14 @@ void machine_kexec_unload(struct kexec_image *image)
>      /* no-op. kimage_free() frees all control pages. */
>  }
>  
> -void machine_reboot_kexec(struct kexec_image *image)
> +void noreturn machine_reboot_kexec(struct kexec_image *image)
>  {
>      BUG_ON(smp_processor_id() != 0);
>      smp_send_stop();
>      machine_kexec(image);
> -    BUG();
>  }
>  
> -void machine_kexec(struct kexec_image *image)
> +void noreturn machine_kexec(struct kexec_image *image)
>  {
>      int i;
>      unsigned long reloc_flags = 0;

The annotations here aren't needed, are they? I.e. this hunk can shrink
to just the removal of the BUG() invocation.

> --- a/xen/include/xen/kexec.h
> +++ b/xen/include/xen/kexec.h
> @@ -49,7 +49,7 @@ int machine_kexec_load(struct kexec_image *image);
>  void machine_kexec_unload(struct kexec_image *image);
>  void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
>  void noreturn machine_reboot_kexec(struct kexec_image *image);
> -void machine_kexec(struct kexec_image *image);
> +void noreturn machine_kexec(struct kexec_image *image);

The annotations on the declarations are sufficient, with another Misra
rule making sure we don't omit the inclusion of the header in the CU
having the definitions.

Preferably with the redundant annotations omitted, and with the description
slightly adjusted:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

