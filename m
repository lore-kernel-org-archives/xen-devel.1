Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29A5C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:21:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374357.1621513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woifv-0001PW-M4; Tue, 28 Jul 2026 14:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374357.1621513; Tue, 28 Jul 2026 14:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woifv-0001PP-Ib; Tue, 28 Jul 2026 14:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1374357;
 Tue, 28 Jul 2026 14:20:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woifu-0001Nv-81
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:20:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woift-004wIj-Cz
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:20:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68babd-bab6-0a2a0a5309dd-0a2a45098546-16
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:20:53 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bac5-be1a-0a2a45090019-d1558029c9fd-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:20:53 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so24556855e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:20:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957d41ed1bsm267580865e9.2.2026.07.28.07.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:20:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248453; x=1785853253; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZTRJOiX4KZgYvcy+AGnnd1X5rKWWENr2//PiRreu6o4=;
        b=YCZPaELsVwtbY/rdmSe1OQZ0wb6v1McG8ctdla4tlf/mNq029OzucSn1VZOL+8iZQH
         mQaPOIXVLUwKRt/onYvhrtak6V5I6VFIY9nzGvKvsO9XHQzZ8BQJsoMC0/KGVkd6a2Fp
         BxTG6bCA+ct+TeyiAwD2GvzLnBo2611qIgVC2/MsqAudmAertHJs0sAO9WtHQeoVNi4b
         VPqwkPWlfvwuz2XNWfXeA0grIA/vogj8pYMggWUmA1+HE+O/yLPons28f3xY+OlGDMWi
         t1d+OcWLu4Xz+4O1sadCshilS4OpUkaia825FyMivjG9jzqFlM7sV/SVQoIAB3G9o2oP
         +/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248453; x=1785853253;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZTRJOiX4KZgYvcy+AGnnd1X5rKWWENr2//PiRreu6o4=;
        b=H7sPlbsVrNhF2jlIsRsZz1f0F+TSfd+8aKpUuBqE9buunONBG3l8uc8u/3EulfokWx
         FDN/shC9/Gk2qSXsu62LDPckn/UZyzDSra0eyUojGKiX18ivDoeQw0KnFxrKaR5dwbkQ
         OqiQ+wgUg3OgNAoMuCuEtNneTJANf9r7lLeDr0+DFf4pxzhEzQP0lrU6qyboqs9iUHcQ
         O4lklG03QuFiwFa/JnpTKzcXFXveZSIv5zgogM6EnJXyMAwDnjQQ9at3ZuxapCeY7jpD
         who3r+DpXx+z7MVroweYomj+IziaIam66FnrHsD2/Oqc5pBTj1aE8AF+9SFVDCVu7/1D
         G/gw==
X-Gm-Message-State: AOJu0Yx1ouqi5URLRcFweBHw1ifb/3LBqBQK1gYgBrcwgef4p5puOcgK
	RkRtTBmcy4MPgRhly93hJqm33PAjL3FqJsnNrxMnx8oEQn8aXp2Co9r+mJq8XSuzKWJMljX08ki
	AKOUZjg==
X-Gm-Gg: AR+sD12d/BbogeAES3wOaOercuLKICmzUpGemoOBtHx57E7NUE8iqaR2I4Vj0h9H8Xz
	2j68RJZby4wjHza2u0hRo+4Q5VEQd9m6D8HMvngzfA2cCxH5yHVNl4k6FDWLy/BpHH3+uVWBwsj
	LhY8DP/zEQtFh8Si1ueEdQ256iDTlJxUA6RiTVGM2RBWpdqjXF4IQQgRVsZhmyOKf0szh+o3D97
	cBYXzSl+s6z7MgKj7H7ydP0IThPJTNOJiiLgPocGznntsp6oSYpdd5p/9X3edXbE1zv/ZZyu+56
	PJdCOsjLfANwew2zIvBh6U7dF9lBXPMNMV+6S0lrjd+4xO1bJTK6EQil5LljJZGBZFIeKnPq6uC
	GLWQ9xMZLh6lr910t2cCx+eNZ0LnPUSYUjBvt3R6XpZakiowzVu+dOTB5BKfCarhBrCH/qFQR8m
	+qmelKV9Ye+/LnNRp1lJtYO4v4bv7nlRyEPgSm6XfvAG2JIT6FruY1Ge6+hsEjjP3b5Q==
X-Received: by 2002:a05:600c:1c27:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-496c643c6f9mr29533425e9.16.1785248452602;
        Tue, 28 Jul 2026 07:20:52 -0700 (PDT)
Message-ID: <75dede35-643c-4deb-a50f-f0291b96aa2c@suse.com>
Date: Tue, 28 Jul 2026 16:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 02/10] x86/shadow: blow away tables first when tearing
 down
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
References: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
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
In-Reply-To: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785248453-FC817034-6B0A6AA9/0/0
X-purgate-type: clean
X-purgate-size: 1670

With shadow_blow_tables() but not sh_detach_old_tables() (called by
shadow_vcpu_teardown()) being preemptable, move the invocation of the
former ahead. This way future finer grained preemption checks applied
to shadow_blow_tables() will further benefit teardown behavior.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v13: New.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2279,6 +2279,17 @@ void shadow_teardown(struct domain *d, b
     ASSERT(d->is_dying);
     ASSERT(d != current->domain);
 
+    /*
+     * Reclaim all shadow memory so that shadow_set_allocation() doesn't find
+     * in-use pages, as _shadow_prealloc() will no longer try to reclaim pages
+     * because the domain is dying.
+     */
+    paging_lock(d);
+    shadow_blow_tables(d, preempted);
+    paging_unlock(d);
+    if ( preempted && *preempted )
+        return;
+
     /* TODO - Remove when the teardown path is better structured. */
     for_each_vcpu ( d, v )
         shadow_vcpu_teardown(v);
@@ -2289,15 +2300,6 @@ void shadow_teardown(struct domain *d, b
 
     paging_lock(d);
 
-    /*
-     * Reclaim all shadow memory so that shadow_set_allocation() doesn't find
-     * in-use pages, as _shadow_prealloc() will no longer try to reclaim pages
-     * because the domain is dying.
-     */
-    shadow_blow_tables(d, preempted);
-    if ( preempted && *preempted )
-        goto out;
-
 #if (SHADOW_OPTIMIZATIONS & (SHOPT_VIRTUAL_TLB|SHOPT_OUT_OF_SYNC))
     /* Free the virtual-TLB array attached to each vcpu */
     for_each_vcpu(d, v)


