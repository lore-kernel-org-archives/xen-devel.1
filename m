Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD99C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:17:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374087.1621046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohgh-00078E-Ki; Tue, 28 Jul 2026 13:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374087.1621046; Tue, 28 Jul 2026 13:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohgh-000785-Hu; Tue, 28 Jul 2026 13:17:39 +0000
Received: by outflank-mailman (input) for mailman id 1374087;
 Tue, 28 Jul 2026 13:17:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohgf-00075g-PF
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:17:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohgf-004lo6-5v
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:17:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68aba9-2eae-0a2a0a5409dd-0a2a4506d66a-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:17:37 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68abf0-195a-0a2a45060019-d155dd35ec99-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:17:37 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-476a130c138so3722768f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:17:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a60asm62190630f8f.3.2026.07.28.06.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:17:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244656; x=1785849456; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fqt4cS55CIS90Qxati5UX2foFynqjLHgo/j+EI9SP4A=;
        b=WESs0aCbS3uL4y8zbzXy7X+qmBRE6tNUCkeCJnCfLcv8vTTDh8Kh1EuyFvgxaazC3d
         AY5swW1wHt2vQVHsHOHJ93b3+5KcHRu1btb99edM7Tgmnlpx1Vgn7PuvUXwp6lCoRRz/
         58FWKesP7xOTfOq1btIcjX80EEFd5fAEpV5ajsXkPJSbi/cq4IpCdqP+EaYK5qK8fD+3
         v4SMPp8uccYtLZqyZbECcOxOQWX/IEjx594dEqG5Iljh1LT+vBuWzGv1a+PeRhxeUR/v
         vNTo6A4+OqlVz0vXfFSvr08fIvWjGXNgw0xb7x88jkJzZD6H5JBwSOPqXtoMHaQgQWH0
         XVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244656; x=1785849456;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fqt4cS55CIS90Qxati5UX2foFynqjLHgo/j+EI9SP4A=;
        b=CT5w/nEDR6N8kKgFJ7AbI5+COmI3flO64/qDFnC/7wg9A4APc2XOpmGEzM3M2xKgSh
         VwZ4bOaoDsJk9NfxHNJG0tFSWbV9ycIAlG+X/aJ1g0f8eswT88u10i0FS9+n9h+i0wRR
         kJjP6Zq1k6zjGaEp9AgsOxamY8rw5DA3zYtSgmFEsAkEh9uahTStqpczlc6tRZtpfyBq
         wNzMUJOpaAu6qNRplAdV8nwc9EmxwRjoEYwTiTBQ7eGA77o2yNlHC0TJ/viMQb2AHPfS
         lEpa3nFQ2rxxjTSWD9G3t3T3eMZUwblT80iEognFSWEVy2gRh0fnoQ+N4NOleDAxJ6aI
         Ul+g==
X-Gm-Message-State: AOJu0YxOkVOrT2GbDcJgjRGzxF+SokzzQxTlBDPcZfckxRDFz332vGNa
	r4bFgnKBeBJ4PzFF1k18B1FcRfMJPGYUUsM2YMsNcXsULmjsE7bhEkDtBi2ceecxziwr8vSxCya
	psroX4A==
X-Gm-Gg: AR+sD137tPt/qhFMtseR+QBlTXEUpk6iZs3Qp37Js0wbRggC9iqTiuRa5zL3n8KO0CL
	ELqcMvpFrNtEkMIxT7i5yj1mvaKUHRbhkP2LEH+ozeh1M4aWmUmEW77bRU+7qs4yy/3cWulpeR7
	CyV2RizRDSRBMmWPrkl/hGXb+TdI6R41L84I0KVjgdmoneCLAFiCk2lcx3fGEeWkQHIXVfFvmuU
	fIjSMJFkYmNl3ZMzxAO/UqLLeeONe2CrSsw4Gcu6vV1Toc1S4aTRiepriJZJwbmbKUIYUdbPY0e
	1bzrGipczcOHctnVqbmdVbKa1bPcAAjOAP9SGjpzhXiGyIUvWjUleVq46rd2xDbOluvE3dmoxoC
	fP4FDbilaVWTVWatFAVbYu20u+nR5uiNaltj6MtxnH7OvpUft2Sfw17g+6YZOO+7nPVK3K1YiA7
	VIdYjtde/8UYECU+wMSSoyee9VthjO7C49aDV0/5W6QHmYVkzaCZq7BbWCbO/UDx4glQ==
X-Received: by 2002:a05:6000:2505:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fb1e95112mr2749352f8f.24.1785244656639;
        Tue, 28 Jul 2026 06:17:36 -0700 (PDT)
Message-ID: <9ecda750-f0b5-49ad-9f6b-892a045b3b66@suse.com>
Date: Tue, 28 Jul 2026 15:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/24] XSM: make .dm_op() hook dependent upon IOREQ_SERVER=y
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
X-purgate-ID: tlsNG-16d1c6/1785244657-F420077B-B756D22C/0/0
X-purgate-type: clean
X-purgate-size: 1324

It's unreachable / dead otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -739,11 +739,13 @@ static XSM_INLINE int cf_check xsm_pmu_o
 
 #endif /* CONFIG_X86 */
 
+#ifdef CONFIG_IOREQ_SERVER
 static XSM_INLINE int cf_check xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
+#endif
 
 #ifdef CONFIG_ARGO
 static XSM_INLINE int cf_check xsm_argo_enable(const struct domain *d)
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -145,7 +145,10 @@ XSM_HOOK(int, ioport_mapping, struct dom
 XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
 #endif /* CONFIG_X86 */
 
+#ifdef CONFIG_IOREQ_SERVER
 XSM_HOOK(int, dm_op, struct domain *)
+#endif
+
 XSM_HOOK(int, xen_version, uint32_t)
 XSM_HOOK(int, domain_resource_map, struct domain *)
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1852,10 +1852,12 @@ static int cf_check flask_pmu_op(struct
 }
 #endif /* CONFIG_X86 */
 
+#ifdef CONFIG_IOREQ_SERVER
 static int cf_check flask_dm_op(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_HVM, HVM__DM);
 }
+#endif
 
 static int cf_check flask_xen_version(uint32_t op)
 {


