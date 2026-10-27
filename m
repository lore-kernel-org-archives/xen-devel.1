Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62912606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fmiPbS8U
Received: from list by lists.xenproject.org with outflank-mailman.1461970.1672984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdON-0001Tp-8m; Tue, 27 Oct 2026 09:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461970.1672984; Tue, 27 Oct 2026 09:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdON-0001Ti-5p; Tue, 27 Oct 2026 09:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1461970;
 Tue, 27 Oct 2026 09:22:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLdOM-0001Tc-9i
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:22:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLdOK-002yUr-Vv
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:22:48 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae06d65-2eae-0a2a0a5409dd-0a2a4508ad64-14
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:22:48 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae06d68-f659-0a2a45080019-d155802be8d4-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:22:48 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so26739575e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 02:22:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a359f3e00asm439124475e9.0.2026.10.27.02.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 02:22:47 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793092968; x=1793697768; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wIjBBo79S2AMMUpc5vtcnZ3n4BdrhlDOoBz1xVGUElg=;
        b=fmiPbS8U12e/iSVhMWgHWgSAJpUIi6+b02YF/L+TR0mACMBaG2ZtjOx1w3hZmZmWUh
         UmWJCBQ1sNLrq25itIDBsETlDdA3wisEduFdVRD4RXXn9mpV3wDChZL84/3fcwKtlZDo
         5CiMhymaWHE7AXl09nqNYDg3VdvCyWybGf/+44HAYHTa2yKQ+PO4bTbDfE2+kRivaFtj
         k2uT1mCQTFK4o271CXKbpgTcgP/Of81hk3P/XYmCYXHfEclGxmTYXxAMa4cnH/2QYvcH
         Wnj2RaEPpQBCZZqinb+oOy9tc5fHYsQ1kNPimLULhjZ/5JrYCJcSkOk7QbhvVfLEyVTB
         84MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092968; x=1793697768;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wIjBBo79S2AMMUpc5vtcnZ3n4BdrhlDOoBz1xVGUElg=;
        b=LEb3yHHI0yRyvEdActQydS4dDpY2IK2pLy4f3/XRty8llbCQQ7uAaFBYHyMrMXTqRr
         F5C9tGG24c+mmm4Ec5GAGyo0U8gA9yTy97dUzl3LH3sCMeyzWwO8j8St7Pcr/I7rp4RD
         FuIhi5+XE74ijxepT3/cdNj14wrJ7PefhJEe/FgRIAbAHC8o1SFb9t9uJGk9UigrmVNa
         8bgPESJ3KWNPqzwzq1cqJP86AD53AL9PeH2ZC3xkulcHUsQqtV4ACh4w/7rBwrwfWtYk
         hpk5/4lba6owAoJ6ABpYqZARf1ErZaVGi8nPjDBW6MRBBA2wgLzl5APW1QmIyrymGgmu
         KYlA==
X-Forwarded-Encrypted: i=1; AKwUvBwWdVUznVc5R86Zznse3Xp467pgkb+qigLcyE2inCTSl6YGXRP4O4eOFtwA5LfXNRn3OLqG2JkquL8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJBCcCMW/bO6VOW3xb0MMIK+cu3oTOhIWUqQZDpkaDnNDxywO5R
	H75+AhBK9ZbbFnya6xPiARSnAMOIO3tlBEkzjr2iTTyY08EHruzlhkGHFzMFlAl8fDZkLwvHmRg
	XHFDWVg==
X-Gm-Gg: AYBFou3093T6e+sGrNcpHLsezPk3FUQkcLBxRb3QVkwY7zSXE+pUW3Ip6hbGIR+otkB
	K/KIbzTi5pSAnr7bZZmyjvHqS4frW2lA024uTTK2hA6aDJzv5Y47Z9+L3g4BqvziedDb2uXXnT9
	bi36SfHLU2z7bJyPwn754NgulFwJBXIBxTfev4fWgVtgi2ZqQTQp0EieNJmzGVgkj9gmS4+GMS7
	yBTvfBgCiyzIlDe8sDqxePSf83sJ+CqaS0kg7huEsPsMGp9Z7WUbpsf8AooTifYETQ5fgm9zCIt
	wf8IsY/qwp7bQHDKfbQ//4EjnNNaQQL52hJFYrKwxi+IEchTSLETpjw1z8pra2kn8WPX2Q5Kwan
	b8tFo254tPG1hiS3WDOgema7LFyXjf/uGW3Otsr3+hMZbs8L2lKeFZ3Wo0307btAzQHL2FasnXC
	Ys9/YajbzGYS+Q9dPTNdLFof0QrmsV/HzvvPksVO93dl16WJCI6nYz2tNN7t8i5QsfNEBrk9E4E
	gho7/0vWCOTGvH2/aQJ+uBipoNKzFM/DBR/NySAgPGj6Vfp420Vxqxv76S45gakqF80eKJlq6cz
	+Y3LM8Ok5OG3NzG/Od0RMLvJeeytC9wDbnQs5ba10cU=
X-Received: by 2002:a05:600c:4ece:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a35ac9d116mr177942045e9.9.1793092967824;
        Tue, 27 Oct 2026 02:22:47 -0700 (PDT)
Message-ID: <a8fac9fb-5dd3-4b37-9f5e-f1a4ddd65d79@suse.com>
Date: Tue, 27 Oct 2026 10:22:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH 4/4] x86/kexec: address Misra rule 11.1 violation in
 machine_kexec_load()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <b30f9a03-ebbc-4ff6-8c3d-c9becbca6406@suse.com>
Content-Language: en-US
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
In-Reply-To: <b30f9a03-ebbc-4ff6-8c3d-c9becbca6406@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793092968-CE74387B-E0CFD134/10/78276251493
X-purgate-type: spam
X-purgate-size: 1023
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.09.2026 13:44, Jan Beulich wrote:
> Misra rule 11.1 demands no conversion to different types at all. We
> deviate conversions to long, unsigned long, and void *, though - leverage
> that deviation here.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is now the only violation left for this rule, after "automation/eclair:
generalize the noreturn function-pointer deviation" has gone in. Can we
please get this one sorted as well, to then also mark the rule as clean?

Thanks, Jan

> --- a/xen/arch/x86/machine_kexec.c
> +++ b/xen/arch/x86/machine_kexec.c
> @@ -121,7 +121,8 @@ int machine_kexec_load(struct kexec_imag
>      }
>  
>      code_page = __map_domain_page(image->control_code_page);
> -    memcpy(code_page, kexec_reloc, kexec_reloc_end - (char *)kexec_reloc);
> +    memcpy(code_page, kexec_reloc,
> +           kexec_reloc_end - (const char *)(unsigned long)kexec_reloc);
>      unmap_domain_page(code_page);
>  
>      /*
> 


