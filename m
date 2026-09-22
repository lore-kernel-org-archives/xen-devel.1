Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE950C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:06:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428812.1651746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90Cn-0002oV-1D; Tue, 22 Sep 2026 13:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428812.1651746; Tue, 22 Sep 2026 13:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90Cm-0002oO-UO; Tue, 22 Sep 2026 13:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1428812;
 Tue, 22 Sep 2026 13:06:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x90Cl-0002oC-EL
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:06:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x90Ck-00A0xG-BO
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:06:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab27d58-8faa-0a2a0a5109dd-0a2a4507a6a6-36
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:06:38 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab27d5e-b4ea-0a2a45070019-4a7de18dd5ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:06:38 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912e2406so21496995e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:06:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fd8b97385sm81301225e9.2.2026.09.22.06.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 06:06:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1790082398; x=1790687198; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2n3wz7G08GTlWfh01lt1v39ZqHI/IUXS8V3S9RLV6/I=;
        b=XjRRy18zPmk8W0DUD9gtupx/iMzef9FUz/7uXEo9iCfZ023ERt21o2iw5UT7b1sU3c
         lWykhawnIWjCtvjgOhyFL9wyvM7nbGjhGguIBbYyJIRVuDRAbXf9iI+idLFuk5xi7AMF
         5yl1y5ZpVk7aLflutQ/pV9jTgz5bFT+YIYCTmZ1NAOTocyZ+H35maszNm/X+nDGi7Nxq
         TU4HDM9THkxEt2RtDwFImJA1zWdfwtS7Sbvo9c1Xdx0EsT1G8gc9epNucoyfgYeBvzEa
         B4okDXF2qrYnSX08RUhOte1BEBmzpA8n9zfW4BnBE+Izm3FCgfLzrOyJX90fEuM26RAJ
         KmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082398; x=1790687198;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2n3wz7G08GTlWfh01lt1v39ZqHI/IUXS8V3S9RLV6/I=;
        b=Msv3Jc3zeFK49BIadw3qagr5wQap2L3+msz9HphDWewHpbe/aaE1g2Fa245o53NUxL
         ojvVqu7yXEaexp0SZZqQWF2w8ZQC2t5Z5Nz1mUdFkLt7S0LeRlsjZdiEvchQTt50tYjp
         /HmOmMxr1FplqaFXUC4hJjnrS0TDFKRCDet6rvBQzwnkPxuuCn5Qo6KLt5KUQCiwmGvH
         1uivp13P9Hj/DMG2MXavVQGqeQxJaDCP9aZTkJ7AYMplJ25zZXlT4vC1kzYhdI6Sew6/
         UKBCFOkFOSZ82QuykMytO6z6aobc6ckLHL7rh/V6n0QQhxU5/fHG30Fj2WsUL4wSAE3x
         3BJA==
X-Forwarded-Encrypted: i=1; AKwUvBwo8DT/e1+mBpXTH7IxlutGUkDDSO1dprAoTab4DgNPcl/ZZXCGA3oLXimaUTXS/OyKlC52DCzshkM=@lists.xenproject.org
X-Gm-Message-State: AFuF++m8AhexsBUhZyv9iFi62pkxHvHgcpjdSPYngigEJb/44PjtiuS0
	QTY9AZmmUIfd6/b2HqQJbvuw32H1UQAJk6jtg5SOtH3NM8kpXVKVa1r+N5jiqRsj4g==
X-Gm-Gg: AYBFou2YLh7MP08+dWA670K2Cwmu7NMNqAnPYyksGsv029CwLqU1mbeAxrL3EOcX93C
	hB1n12h/b0ZmX4HW9qwUi7cjKCAPkb0Dbm4H3TctRuAATf0KiNbEJwi9blXQbCfEM2J+MezU3xe
	0ftCjZrinOUTrE29pgcU9gY6EkeUu/sIU7BEmQOf4UYQUk0a56qsrq6vqGGYJNrmuKq4rpPCpU+
	lS+b+PFra/wzYPjfp9TmlNAbRpCRuRh4dAsRqxfBtkNdnHr0n4V7otFX0AcwqXwU/cmFB+02062
	lOHUN5U7eDNdJATWIp6v/g7qU4bVpeL/+J0x4j438CVous8wJd/IyGtBFbxIP6Pqb46CCXXOx7O
	GQeuz5wNOEicrAPgUG7RrV0GIwvqKlYdAq8VYL35YgPZaISZ8nr0QNoOWvbmQnUix0AWuPTW0I2
	76shb7n4gmK78ObaIbh4Bacgme14s/HeRLuXfGNOUIJ4hpJ9pK3GBAoVqWzX+hhpJDVkokKwsuZ
	Vy50bJE0nse8cBh9zyH7HdnetlBDIPwNEQjlxa8WigXL8QHfuHOj/uHQnGci7Q=
X-Received: by 2002:a05:600d:8642:10b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49fd8a65f21mr30545025e9.12.1790082397037;
        Tue, 22 Sep 2026 06:06:37 -0700 (PDT)
Message-ID: <acdf64df-240a-4186-bf92-ccaf1f83dc60@suse.com>
Date: Tue, 22 Sep 2026 15:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790082398-A54C3AE4-9B19C9BC/0/0
X-purgate-type: clean
X-purgate-size: 1816

On 04.09.2025 13:41, Marek Marczykowski-Górecki wrote:
> Use -fdebug-prefix-map in preference to -ffile-prefix-map, as it's
> available in earlier toolchain versions. But use it together with
> -fmacro-prefix-map (if available) for hypervisor build, otherwise it
> still contains some paths in out-of-tree builds.
> 
> The out of tree build requires -fdebug-prefix-map mapping for both source
> dir and object dir - otherwise the latter is included (2 occurrences) in
> xen-syms. Note the ./xen path for out of tree builds may not be strictly
> correct choice, but it's consistent across the tree, and just require
> starting debugger from the source, not object, directory.
> 
> Ensure to have a realpath for XEN_ROOT else it fails to substitute
> properly paths in strings sections.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Coming back to this, as it was also mentioned at the summit.

> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -1,4 +1,4 @@
> -XEN_ROOT = $(CURDIR)/..
> +XEN_ROOT = $(realpath $(CURDIR)/..)

$(realpath ...) may not be available (with older make), it wants to be
$(call realpath, ...), allowing use of the fallback in ./Config.mk.

I'm further not really sure if $(realpath ...) is actually meant here;
to me $(abspath ...) would seem more logical (as we don't want to
resolve symlinks in the path, but rather keep it as specified / seen).

And finally - isn't the above rendering redundant ...

> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -166,6 +166,8 @@ endif
>  CFLAGS-$(CONFIG_X86_32) += $(call cc-option,$(CC),-mno-tls-direct-seg-refs)
>  CFLAGS += $(CFLAGS-y)
>  
> +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)

... the use of $(realpath ...) here?

Jan

