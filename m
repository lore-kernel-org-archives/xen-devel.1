Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069E1606A32D
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Mj79ShiY
Received: from list by lists.xenproject.org with outflank-mailman.1474176.1681357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOslZ-0006jN-Ie; Thu, 05 Nov 2026 08:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474176.1681357; Thu, 05 Nov 2026 08:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOslZ-0006jG-Eo; Thu, 05 Nov 2026 08:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1474176;
 Thu, 05 Nov 2026 08:24:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOslY-0006j5-CL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:24:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOslX-002uZU-LP
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:24:11 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3d1b-bab6-0a2a0a5309dd-0a2a45029982-32
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:24:11 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3d2b-6ca4-0a2a45020019-d155802bc06a-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:24:11 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so11797255e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:24:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b572bba207sm43981975e9.10.2026.11.05.00.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:24:10 -0800 (PST)
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
        d=suse.com; s=google; t=1793867051; x=1794471851; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsadRY9VxgZWlLeK0MYQmFI9+6Mc+MVXbOcw/PP301k=;
        b=Mj79ShiYbaS+EFLRU5+Oh0zwCnR5Xz/AObnmMRqpj7cLuaU5VDe8GTKbOCWVrtc1vv
         7rikJGbp+YkOSNgQIWCwpq3r5lTd+K8duFRkyEyPuqguKElHpT6A5SyM3hLdpD4bmIK1
         tRyJi5GOUQi8PBWw5gw03VyXupKHOamYIzYb1HwY47OlssnnI/8ftp4oQohlLdQKqt4w
         Kh+uBu5UjtD6pSvXxKPkloCT6/NS6LnxvIaMWeZ9sMjfXwwanCMnhFFLKYRzWN6ZC+ST
         AJR6akZb+dR9/yEjPxL4RS4Ep2rRAy6pnlXI9nV9LkLxipdIYG0OHVB8yS6XkdNXU2EZ
         DkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867051; x=1794471851;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsadRY9VxgZWlLeK0MYQmFI9+6Mc+MVXbOcw/PP301k=;
        b=HzUt4d0Nz5U7LY+4B7I1cg/omsTW+ndRbXGy+TquvlcpSc6zCiIFWAbDxCEuX6ECC8
         VpfuN1IOxPL/Ss1qDh2eSHFwSrb5GLfgAaF4WDddHw7LafiZkFnyG2ZiPngj46rX3FN4
         meFZgDF5QD9J0hfwBT0Tya0Z/QPbLkVjKlNX2GxZL5RH2961gwWN2QPMaUhe0jAheH3C
         HortQC9TZsgcjnsqYojgwQuBgrKgDdDBMDlNUgGZTzecjTLx17eY2I5ZgG2SP1B2WkWR
         T1C57KN8IRPp3fcl3C8z5IjL1XzZ0JoXIenmpGs4dX+cdI37AL7Vvb9N9I/y/MHyTpny
         g1Uw==
X-Forwarded-Encrypted: i=1; AKwUvBw39zFX7zEG+8PmDoi2AdT4dfZ4HgE0i8g+dW1tUjz5oxdtJdV7Qc7DOPF7ZFPtstxJeqkUZ593lVo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+bt9SiEBcJm7PnwsQIZRbK/fZgYtOa7iGWidIm5J9YeDY9zBTM
	DblTK/5egfU1YOiEPYrsp1PQFP/qSYL9FltNaJHqnDhLCc/51VcKbjwCuohs8t7V+IMFTZlekH9
	KGC/z7Q==
X-Gm-Gg: AYBFou03d3sTgCel9b5tozJAM+Mq2dFNA3P7wB4pIA2CMqeLyb7fUBve3kzA0+lBTHc
	dtKpC6CosddyMfCAcxuMASGYNgvwhwTo72Eyu1Lp4k1dv3BFYABS0A7uc03vpjkGYtvvB8rZfCx
	FjGFr674r/pGLTTNRZLmIywS57aaK++kWfWsS7CHT7Angk7mpeMvJPU37NPGaIMXjmHLWU3Oqaw
	/KFlOTjmpMDs+1Xp8bujrGFXZm5PNo7/tS3Vx3wUPmB+xT2a6xCnsxw4IEDsp40fPaU9NPEuFme
	LEHa2wf639bc8olXLjLuvjSFhlh5Ia28eYe1c7udFpsCtRXY8P7Syf3gcXjwhzs6fiKSS6VXP89
	59Gbt9nbs7t9SXMLgKP/sCcjp1RrJmsqXieawcM8Tbkv7Y8EH5VHIU3uviDosJjxw662z0BEXVh
	EgB3D8dTTgyMRBrsVB1baZh0LmQ8jsR18f4V1D1N3Pxw36a4B3O7npvX2gbHNFmzWdbcqC5mIRh
	FwwFjxkSV3Onjylc6YlZndVllP/CBV5ZhdUG97y8+zvloTMVtEJbRd9DO8lk3q0B+hmvGzXLXum
	GGupEFu17mlbm2GX7l328tPpKJpWyG3hJXPDt8gDwZ7KVHvN4YhqsFzoiVmch5+oqR/yh5HfHhw
	kDJQrmmkii+bj42uZ
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr407523485e9.0.1793867050916;
        Thu, 05 Nov 2026 00:24:10 -0800 (PST)
Message-ID: <70db6d7a-5e48-4a39-8553-4718f7ccdf73@suse.com>
Date: Thu, 5 Nov 2026 09:24:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 26/28] docs: add coverage for svm_avic=
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-27-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-27-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793867051-F30B02AC-32C43C5C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1336
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> @@ -2673,6 +2673,27 @@ On Sappire and Emerald Rapids CPUs with May 2025 microcode or later, the
>  `ibpb-alt=` option can be used to switch to the alternative mitigation for
>  Intel SA-00982.  Intel suggest that some workloads will benefit from this.
>  
> +### svm_avic (x86)
> +> `= true | false | nodoorbell`
> +
> +This option configures Advanced Virtual Interrupt Controller (AVIC), which
> +is an extension of AMD Secure Virtual Machine (SVM) to virtualize local APIC
> +for guest VM.
> +
> +This parameter is experimental and for expert configuration only.
> +
> +Xen has mitigatations for the following AVIC hardware flaws:

Nit: mitigations

> + * AMD Erratum 1235. A hardware flaw affecting certain AMD Family 17h and
> +   Hygon Family 18h processors where the CPU hardware reads a stale
> +   `IsRunning=1` bit during Interrupt Control Register (ICR) write emulation.
> +
> +Limitations:
> +
> + * AVIC in x2APIC mode is not supported.
> +
> + * AVIC in nested virtualization setup is not supported.
> +
>  ### sync_console
>  > `= <boolean>`

This wants to be part of the patch where the option is introduced. New options
also want to use dashes in favor of underscores. Plus the default setting of
this option wants making explicit.

Jan

