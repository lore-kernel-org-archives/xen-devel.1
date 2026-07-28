Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1E8C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:24:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374163.1621135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohmu-00055x-Er; Tue, 28 Jul 2026 13:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374163.1621135; Tue, 28 Jul 2026 13:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohmu-00055q-C8; Tue, 28 Jul 2026 13:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1374163;
 Tue, 28 Jul 2026 13:24:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohms-00055Y-NH
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:24:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohms-00ET9U-43
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:24:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad72-5cb7-0a2a0a5109dd-0a2a45029d7a-0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:24:02 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad71-6ca4-0a2a45020019-d155dd2adca8-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:24:02 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso3470097f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:24:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f96b9abc0sm37655516f8f.32.2026.07.28.06.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:24:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1785245041; x=1785849841; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UbHOO48bxllxTgePghgzdylwCnZvEEGiTmisl0RNAjk=;
        b=V0VJWrEeQzZ8V0lAInWhk61Ys4kaEywpcupcpe02f2QcNmr09hgVnlVojijSUDmkGl
         RwJsw9zX0UquyKh1RFJWqU2PdqTCYen3hdMAQEEbEwt8pQwo/Pg62r4lOfK6wz1k2fQd
         Pa+RK8UQoJG9cDfTwP8lxVY2jRDhdPP0ZNCOrHurANdlqe10QSW0yce2bVjJDPkKEdXw
         7fYpuxeG4Oo5RRhqicwLEzNoa2QLrFAjGqdfxa5jOj/oV1MQz9elxwsbSJ/6uSuqmlnp
         MwBaps3RZ13ak92CumkPNWY6ixCasTNNFato/YMb6WmMG6UlizaUF7VnmkY8OuxVO4WI
         5++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245041; x=1785849841;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UbHOO48bxllxTgePghgzdylwCnZvEEGiTmisl0RNAjk=;
        b=nR64FZM59oRpQYgCQGgDkLviiqUczxu97avEL/edyG2FXNc3Q9m63fyW7nZ0gpvAWl
         k14YWg8U6IF9b2ZlVmK+YhguzTkOEctZxr6rWwaTSF0J6LnlRllF3EaYN+5Meog9x6Ka
         X2ZM8xpn8ul6I6Lsez9fsQcPcUOi059Vu7qxVTvmRxjHxisoJEPdvRB9vPS+gXebjbx7
         BSgVJGqfwtN3YaGyvhgicF6zPzTswon2PCTGKWd1CYwbfBhV+seHKqlC/EGiYFk0TPtt
         msZqBc5E0f2rYodBiUMuI2YsV37xi9kkiOCgGVlryEK8uMRSrgjSrzQAvaa4+HfqJ2B7
         TOxA==
X-Gm-Message-State: AOJu0YyT4yyqmG3k6faIWBnKkkAIKvMeZcGNmSVFzQPCMJ1KwIAbwTOz
	ZE5myf398Hi1n38zQm7I5t2BKimL9bxsctOjTAA9x1CSrArXAHBpA9ri9LZVBb7xFwT7/yIxUb6
	sKm+bNQ==
X-Gm-Gg: AR+sD11ObgxhKS8Ax2jNlv46wHa4i4yL+wwqIRANg8gSYDZUUhF2TiDKJYk66cxr6Km
	TbDL3j0SBSdpDG8ieutJnVO4xxiO9Lu+fEuQ8QBUjicfnpwIelSL4O0zaPOokjtJErMPKBlF4gT
	tib1XVHD2nIEWRZgoSv4MAoZy8Lz5/djy3ZOmBwef2eHK5nYf1JiOzS5pzUeKonxRTowwWdNZ2u
	v8iazOkJQH28YBXPhzHq60hCCg1ThYqI0/qkyBQ/lUPWsPH30OtSWsuPjsbc+rL8DkC0L1dnzh7
	hDAwQDS8mtDBnjyjwAblkGKZNMK8j1X6YbBzXGDbBpbsMyzgKM5TQqoJmy48zrfh6ALzG9W6LE0
	h0PZe5F2XXy0Mc4/CEM5bYz3chzFNOHtlTm8xUBTvngWF+GhlgOoa4PHLBwAFRltROb7bsMCEPd
	TR4afO3pKcmx1vXDllQCBsFz6JoA3ymuhZb181sHLLAkIu7SLjCKtXQ3wtgeudOakglQ==
X-Received: by 2002:a05:6000:2403:b0:47f:9661:6766 with SMTP id ffacd0b85a97d-47fb1ec4d77mr2993788f8f.61.1785245041294;
        Tue, 28 Jul 2026 06:24:01 -0700 (PDT)
Message-ID: <c973c612-153d-413b-a6c8-aeacd25f28a8@suse.com>
Date: Tue, 28 Jul 2026 15:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 20/24] XSM: fold xsm_{,un}map_domain_pirq() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
X-purgate-ID: tlsNG-720697/1785245042-319CB2AC-6E26CAA7/0/0
X-purgate-type: clean
X-purgate-size: 2536

Like other resource management hooks they are different in just "add
resource" vs "remove resource". Hence like in other cases a single hook
can easily serve both purposes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -109,7 +109,7 @@ int physdev_map_pirq(struct domain *d, i
         return physdev_hvm_map_pirq(d, type, index, pirq_p);
     }
 
-    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
+    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d, true);
     if ( ret )
         return ret;
 
@@ -142,7 +142,7 @@ int physdev_unmap_pirq(struct domain *d,
     int ret = 0;
 
     if ( d != current->domain || !is_hvm_domain(d) || !has_pirq(d) )
-        ret = xsm_unmap_domain_pirq(XSM_DM_PRIV, d);
+        ret = xsm_map_domain_pirq(XSM_DM_PRIV, d, false);
     if ( ret )
         return ret;
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -461,14 +461,7 @@ static XSM_INLINE char *xsm_show_irq_sid
 #ifdef CONFIG_HAS_PIRQ
 
 static XSM_INLINE int xsm_map_domain_pirq(
-    XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unmap_domain_pirq(
-    XSM_DEFAULT_ARG struct domain *d)
+    XSM_DEFAULT_ARG struct domain *d, bool allow)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -68,8 +68,7 @@ XSM_HOOK(int, kexec)
 XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
 
 #ifdef CONFIG_HAS_PIRQ
-XSM_HOOK(int, map_domain_pirq, struct domain *)
-XSM_HOOK(int, unmap_domain_pirq, struct domain *)
+XSM_HOOK(int, map_domain_pirq, struct domain *, bool)
 #endif
 
 XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1022,14 +1022,9 @@ static char *cf_check flask_show_irq_sid
 
 #ifdef CONFIG_HAS_PIRQ
 
-static int cf_check flask_map_domain_pirq(struct domain *d)
+static int cf_check flask_map_domain_pirq(struct domain *d, bool access)
 {
-    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
-}
-
-static int cf_check flask_unmap_domain_pirq(struct domain *d)
-{
-    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
+    return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
 }
 
 #endif /* CONFIG_HAS_PIRQ */


