Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4325DC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:15:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374045.1621000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woheI-0004HF-CZ; Tue, 28 Jul 2026 13:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374045.1621000; Tue, 28 Jul 2026 13:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woheI-0004H8-9q; Tue, 28 Jul 2026 13:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1374045;
 Tue, 28 Jul 2026 13:15:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woheG-0004DE-Ok
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:15:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woheG-002tTP-5F
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:15:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab5b-5cb7-0a2a0a5109dd-0a2a450794a2-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:15:08 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab5a-b4ea-0a2a45070019-d155dd2cd8b0-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:15:06 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f97d310caso2737405f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:15:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c52fa9sm60329966f8f.20.2026.07.28.06.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:15:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785244506; x=1785849306; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hfN4Ana84xKH4bZHnbxldP7VbRY/aTI5+X/yItg8+gc=;
        b=SMUcck84gjvUcakGCLyWlTw0xasshhOzbwBdvagj94tJ/kL2PRFhiQKsDpD33Nf5Q5
         Ro1xU/J1LjG7AA3UB6ZM9iVh+bRV8WSRGhc5pRZap0YHTXnJBLWOLTKFsm/4+bRIJsp9
         djGUn78+zUbEp4HLjEVtixo80sKJpfaVuzJ3/c58JHQNT5VCk39yO5RtjmbTpKyrTAWt
         gnE05ph5ItbeUM0MCOK1H5ex9O2dNVPcV9UZ+qvOY76y+VPlJoZ5XQIg1Zy18pTJ7q14
         98dw2C/iWlgxC/YJDWTLP/cX5laicGRvo3Oynf1XtdoZa2sj/2dZLM3FxU4/SyE9Ztyu
         kBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244506; x=1785849306;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hfN4Ana84xKH4bZHnbxldP7VbRY/aTI5+X/yItg8+gc=;
        b=ip7VFMxkpTcJilNVPZOrbmKS6AfK8JTZzoBTFy/kIBCITxiaX/fT3zbbwrOo+uGYRq
         XUt8COqv9kA7ZHO25QDpUfkpx0TOZdixKDKL0LxA/ZFVFXrQ3pmeiuDgzfB0kLjGe1m8
         oyO8rOfr2NU65vXvHkRc3FxhCNSQdt4wTWp2g25JZhcyloZM9+rma90Pi//o1ufP3r5s
         p212vTQbnoQedwZYSvO8jfMG01rXbZCujy2G2EEQSXgsxxGxvu0KyPSy0Q2/YtPuIDEr
         U14bQV0b/qyz1VdLrrFenyuRvp7aq+bgH7SmS8EGz+5TCQSvTLBraOA7bM6u/KZ7etI1
         YsIg==
X-Gm-Message-State: AOJu0YyFnbW2GWUvnGHPIJBVtfq6dWsmcxeR87uZZWD7IpHqGSZtA6oB
	Xz1TD3KiKEnc5gAb0QkGHjz4eL+VHM8FmEExt+oYdSVoWWMPYtmHLQ+l0Nl98MQDofG/JhMHc5W
	d0tiAjg==
X-Gm-Gg: AR+sD10kJhNudDJo7d/O7Jg1kT98kTDw9aNIOIdvb96cTEOd6FzVckn6da4pHlhvvZy
	TvzJyByQU/VcPOYrXGrW8D9k7lZ0YhN6P3+P5ovcsiaUR/0y1ISrILjVxnhJbHHMmzsTF2W8si6
	Rqz4TiF5K0gLywAZr1XFLzIL+J9sn9f/lzTfLFTYed5kOQ2qeedL5wjg7FmAalwNeQBBycHg2mW
	5K5RMJ3DwRZ5rQQzGlaNgtGN9taYw/WjqeGQR0qrP2A7mNPaGyOfv7sf2dzr9EJ7wY7MnFlmJv5
	mxfjuiO42rUhbGyig0iHM86dDhmBuqN1b5xG0Hy5aQuZ3Osc591hT3rcb8Tj60UZMPLXOEldJ/I
	0N6vvzFcGWo4zKf8g7YQh0+dUHqxgsatERm9bECz8U1I2Z3LHwuBngQX7eVR0iM1GSZEFiDonYz
	B6Q47czMRfyx8y68PhPMVOceqUjvFKvSw2uYsYF+EBXyIdFSdM/NA/mD3aIdOmKd2HDw==
X-Received: by 2002:a05:6000:5c5:b0:47f:8ac6:1b8d with SMTP id ffacd0b85a97d-47fb1e22423mr3240190f8f.0.1785244506148;
        Tue, 28 Jul 2026 06:15:06 -0700 (PDT)
Message-ID: <d466a04f-8151-4b83-972b-3525eaa39bd5@suse.com>
Date: Tue, 28 Jul 2026 15:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 05/24] XSM: make .iomem_mapping_vcpi() hook dependent upon
 HAS_VPCI=y
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
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
In-Reply-To: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785244506-364DBAE4-26D51F2F/0/0
X-purgate-type: clean
X-purgate-size: 1156

It's unreachable / dead otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -525,12 +525,14 @@ static XSM_INLINE int cf_check xsm_iomem
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_HAS_VPCI
 static XSM_INLINE int cf_check xsm_iomem_mapping_vpci(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif
 
 #ifdef CONFIG_HAS_PCI
 static XSM_INLINE int cf_check xsm_pci_config_permission(
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -79,7 +79,9 @@ XSM_HOOK(int, irq_permission, struct dom
 XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
 
 XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
+#ifdef CONFIG_HAS_VPCI
 XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
+#endif
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 XSM_HOOK(int, resource_plug_pci, uint32_t)


