Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90E4C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:16:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374070.1621029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohfO-0005nD-2s; Tue, 28 Jul 2026 13:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374070.1621029; Tue, 28 Jul 2026 13:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohfN-0005n6-VC; Tue, 28 Jul 2026 13:16:17 +0000
Received: by outflank-mailman (input) for mailman id 1374070;
 Tue, 28 Jul 2026 13:16:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohfM-0005ms-VK
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:16:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohfM-00EpXl-8X
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:16:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab98-e002-0a2a0a5209dd-0a2a45018de0-42
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:16:16 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab9f-5984-0a2a45010019-d1558034d5bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:16:16 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so27646635e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:16:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bd9e980sm306652945e9.0.2026.07.28.06.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:16:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244575; x=1785849375; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zetRrDWUxrCa7/9hdGwxlCdEe6eXsmxWFslnNICnQn8=;
        b=eRkjOq2hJ6JQrfCRlVepoWNeKeJbQHQavqQJEY1l707q0LLJBzfeH5H4jjZH00KD1a
         PiQodM6oEVZh5LcTftdmunxvwDYIxTnnILugy7SdEC73JYbVuUlnkrULPwOzH+6U59h8
         0Zjl9MlVYNkGjJTcF4AFwb67E8VS2+vTK0AFHPGE1HjMg4oskBDxCYPrPBmpDmUrpM/S
         VgcWANEsk4hUrY11nJuXeXUHPTYyshX0XFnC7vFEe7nO2pIMuxmWcxJbagLy0oindjTI
         7+MbX6TYtISTeFIR2nw3Ah9lXSYkCxRU4WNKYcgXonqdqTDFp1Z5umHfhxmmpKTBVQNf
         e+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244575; x=1785849375;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zetRrDWUxrCa7/9hdGwxlCdEe6eXsmxWFslnNICnQn8=;
        b=Rq7IcgthbIavIKzhmyn5rQQnwTsdmfT72QcYMyWF4bjH6JGmsfcRTFIwUlkgJdqJgu
         POy6ZKe7rh9XYV9SeVlsHRkJRkSRzc11Bnm6GeW58hLCdVVH+YpYeXO0OXb05QkB/Y8H
         Xys1vCOUSjlVB+LESq7tT74vbT23Yz7CWJ1mOMrw5UKcLN19Ui+rlJcubruM409LxreO
         DxffYAOjnXxfNA7j8I64jismd88ilPsNXRS4YbZltJe905PVz+5us993+4h+fZM+zWP+
         JaYcV/WccXrk5vcSmr9gzqOKg3DGN6wu5yLdf049JCNH5/pBtQ0ETb3XwXTLmDGr5v9D
         i1EQ==
X-Gm-Message-State: AOJu0Yy2R6xUm7RPeTimZz2EfzoWtA9fYtC/f1Ia2ZTWoEhyBAEmehHy
	xPush3ry+KkRatA/6PBC0rQJDxmWEBM/nlKCqdEmD/9aYPm2vMN+ZXS7AAo1aywmJHHMnXL3xV6
	7EWxzDg==
X-Gm-Gg: AR+sD13dZUsvNl+XAeyMzUP8hRyUIjiNcyNJTvZbWUtPuKjaTCXjXFZ59Sinj1gRir4
	GcITLdqJimZumDKy/VTcSKXXzg159GbyYQYW6u3D5NzGbDonzfQC5v2EME9CyBJ4FDqDxO5m+MA
	pzXW3P56J/rkOLA/t+r5R6PR6Sg8bntotRlw5DchD+EkSwGSWdncj1NbgdSsosIxmGyqIqV62AU
	KFuzfZB6hDrvpFIJli/pM/dAoLhhW2N7Wcx26065dEuYnToPLA6BL2njFoUdtCmKTbZRtl6aY8d
	e0gXRzVNqSzutMllwJ3/4kdc0u2hXfhCuZmrptdanmpo33MVQU1Ol0r62hjy0NtJgAfhp+FoIw1
	LyR3ky0JN+1lHKievpJJLG0Gqm9UkLtCtVVyvn8dAeNRyeaScD4MAzpXk23zYCOsMfgxZfTchrk
	fzjc4N6mfKeyNLioO4kQa/dyAqgUnfU2gwj8elYO4CzNLXZvwldP/SLtjPeMnIUrsrOA==
X-Received: by 2002:a05:600c:698d:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-496c6586a23mr25150305e9.39.1785244575383;
        Tue, 28 Jul 2026 06:16:15 -0700 (PDT)
Message-ID: <5250093e-174f-4d2d-b19b-95a314b38469@suse.com>
Date: Tue, 28 Jul 2026 15:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/24] XSM: make .hvm_altp2mhvm_op() hook dependent upon
 ALTP2M=y
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
X-purgate-ID: tlsNG-d62444/1785244576-BDA7E757-CF311A0A/0/0
X-purgate-type: clean
X-purgate-size: 1651

It's unreachable / dead otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -583,6 +583,7 @@ static XSM_INLINE int cf_check xsm_hvm_p
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_ALTP2M
 static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
     XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
 {
@@ -602,6 +603,7 @@ static XSM_INLINE int cf_check xsm_hvm_a
         return -EPERM;
     }
 }
+#endif /* CONFIG_ALTP2M */
 
 #ifdef CONFIG_VM_EVENT
 static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -106,7 +106,11 @@ XSM_HOOK(int, hypfs_op)
 
 XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
 XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
+
+#ifdef CONFIG_ALTP2M
 XSM_HOOK(int, hvm_altp2mhvm_op, struct domain *, uint64_t, uint32_t)
+#endif
+
 XSM_HOOK(int, get_vnumainfo, struct domain *)
 
 #ifdef CONFIG_VM_EVENT
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1393,6 +1393,7 @@ static int cf_check flask_hvm_param_altp
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM);
 }
 
+#ifdef CONFIG_ALTP2M
 static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint32_t op)
 {
     /*
@@ -1416,6 +1417,7 @@ static int cf_check flask_hvm_altp2mhvm_
 
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
 }
+#endif /* CONFIG_ALTP2M */
 
 #ifdef CONFIG_VM_EVENT
 static int cf_check flask_mem_access(struct domain *d)


