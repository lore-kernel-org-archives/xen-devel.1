Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77322C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:20:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374120.1621091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohjL-0002Xe-2c; Tue, 28 Jul 2026 13:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374120.1621091; Tue, 28 Jul 2026 13:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohjK-0002XX-Vy; Tue, 28 Jul 2026 13:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1374120;
 Tue, 28 Jul 2026 13:20:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohjJ-0002Vy-Ig
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:20:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohjI-002uha-VS
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:20:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac93-2eae-0a2a0a5409dd-0a2a4502ea58-8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:20:20 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac94-6ca4-0a2a45020019-d1558030bc5f-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:20:20 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so26977315e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:20:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9ae5c3sm424174045e9.3.2026.07.28.06.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:20:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244820; x=1785849620; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TWHkG2xeRgNhqN/Mj6/qpIb3RG1kSl+PjY/er3+dPcU=;
        b=TKtFk6zfxNc7abTsf2vjSP/PjqRkTAamwAy+2KsWjgIv9F0HuvEesURpnwgXdFOHgd
         NQKYEwIuD5P7RY57VeFC6ROp/lHAoT8yORQbotfIDMx8uorLsIvX9WEuTrN+LUvVxNsg
         qT/qzf3ASDciSqybnLYCluSQ7jD3bF5fPTCVm7G0VGdBX9rN4ySkKI3P5nSoDkTlA5mP
         PBnifEmDADcF04qhFFxn4ALx0+tCvRlK5KBo+o/Etbsa6+AO98XDUBtoAX32L4sxauY9
         /mcO8S3/YyjPnAizwMyJbENBdgu19P1KiamTndEUauteOGUWBSMHwNQQ8dPXTVEOTeHM
         AnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244820; x=1785849620;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TWHkG2xeRgNhqN/Mj6/qpIb3RG1kSl+PjY/er3+dPcU=;
        b=eaDOcovgC+Lz6oaZgEPqK3b3hBEkfoXap0TcDEN9Pxv4Ga+kaj7Pg1bLFpdl1H9iSO
         iOs6KHNCrL+29hyQrEQaZqDj1eWXcD8OHLwxPqum3eqf6EMj1vaZxrX3rmmlZlWYn+/e
         Md0Ba7XMUk0F5aL/ZZRRyct1Nd5F1fB3luWFaRMrGqGSObIsKhkulvq63pFvU3+O/V2C
         ph25DauV0qWFF6tkgSimjOPG6ygVCV22X4p8uKxg3npObqxhg2iqP2R2if7bw/HEua5i
         6bfGaW4tbRt8AAeo8roqVzfGwkMh4WDDtBi5MS0yoOLVPTBY+xa5+evzqG9F96JIMZZd
         T7RA==
X-Gm-Message-State: AOJu0YwBqwOERhZ8U2Ie6djIMEEQzKONwz5BhXdYu/fbAI7XT0HzTiY6
	tweKwqIJmIEHsMR9wFE8rSQVagARD6xTsCL2SqU73DqUSNk8kllVoaUxxi4jqMMJsEKzmljtz/x
	Wq481Jw==
X-Gm-Gg: AR+sD12ARq423711ZZ5jDIYj4OyHtRgfP9kKp03EctZgpor6+Ngz60LPrLJ2vGTO/KC
	kP8NNbREcm/qsac3RIY8OcDs7Gp6XzJaqAh/sesBcYZGALEdwd9Se1jnqIUkeRBgv7hgb/gWIYC
	3AHKWzxOmTMlax9b63t3NOEEtcGxPGpsb60k4ZKAt8CWwBDpqQRV11y56AI6hFC8Ex0/PotQm+X
	VyfEPgipKZvpmMWkX2YgFRadxWiLJ3PU5OWl+GgObGbGKw+kzZD0MXsOLNBYfjxQcZnP9/uNc2Q
	3GOSlFF76g4lLZcBcmIRuxDvTIEz1af4P3YBUPoMLLudTyYcQUXRwkbNHfivXw3psfOpi4ykQzv
	lvNdLqF8yodzhbcOowJT78YO2L0t9sgMhcr9f+1LphqHVAl/HfipZko2xO4RGqmzPH0rWJ/dEbK
	pV+LmVTo085FPGV4x2QI4BaNnkEUSac6vSGGLH4LbZSt9WIGdAzVaVUJ6OUHpNBkY82w==
X-Received: by 2002:a05:600c:46ca:b0:495:6338:1453 with SMTP id 5b1f17b1804b1-496c653ec08mr24938355e9.16.1785244820125;
        Tue, 28 Jul 2026 06:20:20 -0700 (PDT)
Message-ID: <b2dfb144-b475-4a64-b71d-4566691a9deb@suse.com>
Date: Tue, 28 Jul 2026 15:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 15/24] XSM/dummy: drop redundant return statements
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
X-purgate-ID: tlsNG-720697/1785244820-66AB52AC-BF2F49C8/0/0
X-purgate-type: clean
X-purgate-size: 1231

They're meaningless when no value is returned.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -123,9 +123,7 @@ static XSM_INLINE int xsm_set_system_act
 
 static XSM_INLINE void xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
-{
-    return;
-}
+{}
 
 static XSM_INLINE int xsm_domain_create(
     XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
@@ -187,9 +185,7 @@ static XSM_INLINE int xsm_alloc_security
 }
 
 static XSM_INLINE void xsm_free_security_domain(struct domain *d)
-{
-    return;
-}
+{}
 
 #ifdef CONFIG_GRANT_TABLE
 
@@ -316,9 +312,7 @@ static XSM_INLINE int xsm_evtchn_interdo
 }
 
 static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
-{
-    return;
-}
+{}
 
 static XSM_INLINE int xsm_evtchn_send(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
@@ -349,9 +343,7 @@ static XSM_INLINE int xsm_alloc_security
 
 static XSM_INLINE void xsm_free_security_evtchns(
     struct evtchn chn[], unsigned int nr)
-{
-    return;
-}
+{}
 
 static XSM_INLINE char *xsm_show_security_evtchn(
     struct domain *d, const struct evtchn *chn)


