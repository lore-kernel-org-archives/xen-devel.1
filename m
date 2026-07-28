Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3633EC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:17:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374079.1621037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohgE-0006S0-DN; Tue, 28 Jul 2026 13:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374079.1621037; Tue, 28 Jul 2026 13:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohgE-0006Rr-AM; Tue, 28 Jul 2026 13:17:10 +0000
Received: by outflank-mailman (input) for mailman id 1374079;
 Tue, 28 Jul 2026 13:17:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohgD-0006Rh-HH
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:17:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohgC-004cso-UC
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:17:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68abd2-e002-0a2a0a5209dd-0a2a4504c8be-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:17:08 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68abd4-b57f-0a2a45040019-d155802dedc1-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:17:08 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso47543815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:17:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bdac28sm56348963f8f.16.2026.07.28.06.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:17:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244628; x=1785849428; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WFTGwAO/jWijw2cBrXOLfG+sKxJS+HJkR11e/wlol9E=;
        b=HlUYvbyuJZTLehkMduc/OAicUNe7KUuoqLt8L8hnwuF94hKHA+LTKFhKpJZee2J4Dp
         lNKJ/BqMwolIBQfza4FjGYuHcBzKbO1EzYcagYuivfaHL5DAZjoDORyX3RkS2ekIp1k4
         6cTFhMIKI8yHZfQUvzVFu2Ehcxe9ImIS3lafv96uqjvANe5jHOuxA1X3ZlHVrg1C/3an
         HxDW0EbKnu5ZCzyIcr5HiMMCwYDjfJEWG1cL6I0dh6Y6uKK67KSJRMEH+bTt+KHdh4QA
         cau0dfJ3i/5acr3iB9gRG3rhlO1ZgML6yarTXsPU+fDclhQv09nlmEIQeZtNcF1t+WUa
         1pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244628; x=1785849428;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WFTGwAO/jWijw2cBrXOLfG+sKxJS+HJkR11e/wlol9E=;
        b=TD2yGPhGA5QUuv6+W5lQ7plH3htxi9X+/hHG43cG/rY4U95uCAcxLaQK1MXibQYOhv
         GKM9oN0LnuZcwsImIIoipskcEK7nhfuPdCP/CFgpZaFnCvGAKb2Mcj6emm2njyd5+T8Q
         KtIVtj5y+cy3RPI70O9XD2dgkCUaSU69tzMjilXfT0JkfG6/iA+KAFS1U4kGBcpObwxu
         1J+M/vl9uTvePGTAWdNYscbWSq6KQBL1B1N+90LPIRO1j1bgY2QgPtYZCWphSHMcWo94
         jwYvydQTncyVWya3rulyNSX0ueWa7Rl6RfzF7QVrg5FNH89Gp0+UDP98/ElpPjW+Pggs
         pZNg==
X-Gm-Message-State: AOJu0YydutTO7qIZsocWrLpax1AJ65SAVwx2qfqwhWpdY6dhIGLA4tm+
	VBGeyWc+MpDMd7ZY8QL33gW1v1LETXyy/qnFQjuW2GBcGbN7y+z46T3+bmX6p59d8QC5CVXVsVg
	tveTj7Q==
X-Gm-Gg: AR+sD11W/EzPTiQ38A8Gk9Hict/M7fEaFtkG6a02WwrHA4wyPNblrbZKAOzGismrcBL
	/XkJQ3Iq6ku+cCgxkbRZafgmOrv0crMQvXxhNYC5cO9qml+RqPOhquzq7+zmG9CGbDEh16IBF6d
	Ou7RlfXz6zijawSOTkNivofNKKA8BfJFah6DVUGbcWY24woancAL67/smzXWsdkvwd80meZZfWE
	8fQ6F4kcf9HPNA5MQLlZSNj+7dnMcYYxE3gtp5/fEFEjxiGXpEicRjl5no5T/PMlJI5wH+W34wj
	qS/qMLz+6CL0uKcM7hSXJCEKBIb+pR9K6bF/7SU5vcrzNlm/Rbez0roQ+siU2/UWQ884s+h3p8k
	VpzuAb327W5p7h66oMJssUwPbLWbAg3iqlabAnxd79d6hAHyuhcKw03FB86mv43Rx3KCmDzcteQ
	67A7OM0LwfL9gahttadf6CuEKUm53TYG+yUxrRv4Py6GnJWZoqu1gUBZFBM6A4Cuv3Ig==
X-Received: by 2002:a05:600c:34c2:b0:493:aab3:c09c with SMTP id 5b1f17b1804b1-496c657ec5cmr27684955e9.28.1785244628159;
        Tue, 28 Jul 2026 06:17:08 -0700 (PDT)
Message-ID: <7947b62f-6763-4561-b3aa-c451cfa3dacb@suse.com>
Date: Tue, 28 Jul 2026 15:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 09/24] XSM: make .hvm_param*() hooks dependent upon HVM=y
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
X-purgate-ID: tlsNG-ebf023/1785244628-502E4B50-F1A6BBC9/0/0
X-purgate-type: clean
X-purgate-size: 1847

They're unreachable / dead otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking .hvm_param_altp2mhvm() is dependent upon X86=y as well
(but oddly not dependent upon ALTP2M=y).

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -569,6 +569,8 @@ static XSM_INLINE int cf_check xsm_map_g
     return xsm_default_action(action, d, t);
 }
 
+#ifdef CONFIG_HVM
+
 static XSM_INLINE int cf_check xsm_hvm_param(
     XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
@@ -583,6 +585,8 @@ static XSM_INLINE int cf_check xsm_hvm_p
     return xsm_default_action(action, current->domain, d);
 }
 
+#endif /* CONFIG_HVM */
+
 #ifdef CONFIG_ALTP2M
 static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
     XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -104,8 +104,10 @@ XSM_HOOK(int, pci_config_permission, str
 XSM_HOOK(int, hypfs_op)
 #endif
 
+#ifdef CONFIG_HVM
 XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
 XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
+#endif
 
 #ifdef CONFIG_ALTP2M
 XSM_HOOK(int, hvm_altp2mhvm_op, struct domain *, uint64_t, uint32_t)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1368,6 +1368,8 @@ static int cf_check flask_map_gmfn_forei
     return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
 }
 
+#ifdef CONFIG_HVM
+
 static int cf_check flask_hvm_param(struct domain *d, unsigned long op)
 {
     uint32_t perm;
@@ -1393,6 +1395,8 @@ static int cf_check flask_hvm_param_altp
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM);
 }
 
+#endif /* CONFIG_HVM */
+
 #ifdef CONFIG_ALTP2M
 static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint32_t op)
 {


