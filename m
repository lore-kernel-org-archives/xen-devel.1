Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BC0606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Yx+gGX5P
Received: from list by lists.xenproject.org with outflank-mailman.1481526.1685421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjct-0000F6-S9; Tue, 10 Nov 2026 11:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481526.1685421; Tue, 10 Nov 2026 11:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjct-0000Ez-Pb; Tue, 10 Nov 2026 11:02:55 +0000
Received: by outflank-mailman (input) for mailman id 1481526;
 Tue, 10 Nov 2026 11:02:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQjcs-0000Et-KN
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:02:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQjcr-00078I-PH
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:02:53 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2f9dd-2eae-0a2a0a5409dd-0a2a45018186-2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:02:53 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2f9dd-5984-0a2a45010019-d1558034cdbf-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:02:53 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso19974525e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 03:02:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01ff3428sm67126715e9.15.2026.11.10.03.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 03:02:52 -0800 (PST)
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
        d=suse.com; s=google; t=1794308573; x=1794913373; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W3MnSLYWfQfsv2mizkN2KiSB/csCWpz+tJH2iF1nqM=;
        b=Yx+gGX5Pn/UuR9KgzbysIb62AR3lnmrrxa02rCkDLT8366+EnJD0EIjTEKgB9M3XDG
         9sH5WEUMs2CKZR/QAXjN6vzQIyw2tWSvRnnxd6k+SlrJhM2ZXL15un4n1hcemSHOXjsz
         XQcF/feaxE4pq+Ta+zvZVSkF+Ps8cLgeM0g6tWERPC+yqc3taygCs5T+bfrhiE5gPtvw
         seMAJj5YX/Jm+md4K4FTri3S1/RwPLqyWV8MTHIVByGiDrX6au8A7qYlonuVO5LH+M1O
         imS4GBt3qxb/h1tTJmDFTFzF1Dy5wHNGd+VkmR0EewkSBxx95DniToGkKyjU1WPuBoVf
         akwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308573; x=1794913373;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7W3MnSLYWfQfsv2mizkN2KiSB/csCWpz+tJH2iF1nqM=;
        b=NuiA9JCpSgz6aiq7mDaQxKymHtddffq/8AN3zF+vB71yiOIj8o6d304/jO1EQvErgZ
         qq6R5/ur4W23T+uscaoTabyijzAl41tRI3hQI0ZH9TGUoa+VuXSFqa1ojaCEa6iD0p9P
         cRHaZpMLCFqYD9u7cA61x37Elmx8rHC6j/JyW5KGr5niEKfBLS2jfsOU+OzUiyJj8DdI
         0P7fFiRthPzMIxA+oegrl0/F7gjFEge/n9vd3G/iRoLiv0knfVMM4Me8cOi4i9XEFLHl
         00hwmjttGLpHAjOJRAjeYaGx4U6bBf5ceR78egtpK41K5Ju3Ob7Um7KVn7hbea8VrRot
         Miww==
X-Forwarded-Encrypted: i=1; AL+hErE6ijI3Z9Mm07eOg/RBtB7r0/VHUltHL5u1nX7uhafn4l+iNLHBWt0AKfgQ7t+50G/GL7W3s7Sxs8Y=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/E5DX5f6B83XGZEhaiCYhavMDj0fDcfurPoOxVAr8VCslbEqNf
	zSqNASkM5lYP8+PCpVUiaRYJbiEP07D1eJmlHdyFb87FKXhpdSJimEZaRY6En1mnIw==
X-Gm-Gg: AYBFou3IL57wriESz0Ya5NFgt4PdRnzisNjWpLqGAGxjdmyomlUtBdyCoR/KgCpwdDx
	z/0gA898x+vY8/FvOg7RkbMkJfAINamW2izyLjOKmOYZpdZjxi4sDeOsKIBtpAapCQlXyt/VsnD
	98kcSyG51ej1+Kkt5VvcpvCyNG+/6CR5k3xSFog7ptD6BMfN1gTi5qDx9N84KYJejDfZyatNf1d
	KY9ltwc1vf096Ds9kkKrF1pyiCCP19x8jQzuIbihs8m9HcUyAGceDV1VTDPNgrgDTFWlXu7vt9p
	3TknqrBvAw72dw9VUwzLaLA4iJTQkzNd/FYsSYszpFwuy3Z8B51T5Rq//IhzNoOBw1A/vtwXEub
	wAKCGvRo2tGbNClFKa3g4dxYhFcIj0FSTVGfe6Z6303ngnu0eJ7B9cs3cN1A+TvJlUAz4eFGetP
	sO+uqQ3xfsHD3qM7yjcrPd8nSkb7GVg3mYebxBGSeM3it/G/iRltOp25+Sld1dYZ3C4bCI3bpUC
	4cBks5NtEDmIStaI2pIQdmaeF7K0ldYVBHATBXSwsAujncc7ufNpqULpY6btuJAdqf/a8bJ9Qtw
	/hmRaWZetrKGHVfdH/c8RqDGfJse2DcZZvkcnnf3wyvDz3C750aYJRCWzWgvgoH/4EDObt3qFJX
	8vAnn2rsngu0mHXHSS93SPrv8p0mlMXEHBBrXsTk=
X-Received: by 2002:a05:600c:4f86:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ba022c9c7dmr39870505e9.0.1794308572680;
        Tue, 10 Nov 2026 03:02:52 -0800 (PST)
Message-ID: <35bf81cf-594f-4fff-ad3f-13cccf559d72@suse.com>
Date: Tue, 10 Nov 2026 12:02:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 04/14] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Mykola Kvach <mykola_kvach@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <3f0239435a9013b5ea35dda4ddd0253ef42e26ee.1793129971.git.mykola_kvach@epam.com>
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
In-Reply-To: <3f0239435a9013b5ea35dda4ddd0253ef42e26ee.1793129971.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794308573-1F063757-8582848D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2023
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 22:05, Mykola Kvach wrote:
> When a CPU fails to come back during system resume, cpu_up() sends
> CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
> sends CPU_RESUME_FAILED for the same CPU.
> 
> On architectures which do not park offline CPUs, both notifications
> queue free_percpu_area(). The release metadata, including the rcu_head,
> is stored in that CPU's per-CPU area. The first callback may already
> have freed the area when the second notification arrives, or the same
> rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also need
> the area to clean up timers and CPU-pool state.

I think there's another change needed, for the change you presently do
to not cause a leak: If enable_nonboot_cpus() calls cpu_up() for a CPU
whose bit isn't set in frozen_cpus, and if that call fails, the CPU
later wouldn't have the CPU_RESUME_FAILED notification sent for it.
IOW the freeing would then not happen at all. Question is whether
simply setting the bit in frozen_cpus would be correct: Notify
handlers may not expect CPU_RESUME_FAILED for a CPU which wasn't
online at the point of suspend.

> --- a/xen/common/percpu.c
> +++ b/xen/common/percpu.c
> @@ -82,6 +82,15 @@ static int cf_check cpu_percpu_callback(
>          break;
>  
>      case CPU_UP_CANCELED:
> +        /*
> +         * On resume, CPU_RESUME_FAILED is sent after all CPUs have been
> +         * tried. Keep the area alive for its cleanup callbacks and let
> +         * that notification release it.
> +         */
> +        if ( system_state == SYS_STATE_resume )
> +            break;
> +        fallthrough;
> +
>      case CPU_DEAD:
>      case CPU_RESUME_FAILED:
>          if ( !park_offline_cpus && system_state != SYS_STATE_suspend )

Nit: While generally we want blank lines between non-fall-through
case blocks, imo between fall-through ones such blank lines would
better be omitted, to make the falling through visually easier to
notice.

Jan

