Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5352C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:19:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374101.1621064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohhy-00007c-4E; Tue, 28 Jul 2026 13:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374101.1621064; Tue, 28 Jul 2026 13:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohhy-00007V-1e; Tue, 28 Jul 2026 13:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1374101;
 Tue, 28 Jul 2026 13:18:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohhw-00007B-LF
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:18:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohhw-007BE9-1N
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:18:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac38-e002-0a2a0a5209dd-0a2a4503ba9c-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:18:56 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac3f-fae8-0a2a45030019-d1558029d50d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:18:55 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so27671485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:18:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c4443396sm88368515e9.0.2026.07.28.06.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:18:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244735; x=1785849535; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/SmIo6yz+LIUfvr2Dg1NtjOiEKrdqFZFi0UTFgUzEZo=;
        b=fnDNVkhhuk67RghCEks7LI27raNe4MAbGBzmWpFTpHURK+9P2xesyI+8QoOjs8EAH7
         FTOBG+cUt/Sq3B72h2+2eNA60z8Vdf0vtiuJKyRIMCdiGzk8GelzTIQNSvv9wsfLM4oj
         EBR4aTqJ4tPaQJuNb1N3Mgw9AhnM2YdKEMDmKC5RL+6kWvoUJ2zDBNWFcIib2xqpH6Qw
         WEGMygayS8kga7aSnEzOqBImadNM5PxggKKrL1WngcsLiZsrGT62QDXTfIlTgpF+2y2j
         8aQy+WcR8rXfoi82Iq8edbmm+P5OV8cF4eGiIs7dc4ncb+819r9ZCnsiEFe9pn4H+v8o
         TuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244735; x=1785849535;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/SmIo6yz+LIUfvr2Dg1NtjOiEKrdqFZFi0UTFgUzEZo=;
        b=HVKqynQ2kQwCDWmOnFUwtetZEZ4fFAFAEdDQj0ytvkFjSA9Hde02vkqmlZrJHJfks2
         +U81oo8LX/qX/Exae4yzNmmSnQfsMSukazyHAaqhStzRtNt/AwwkzNbH6+WB5AwN3dlA
         Ajh7RO3QUMAdPP302jGInof3X7YDcVoYOIoq9vLypcrxxtlSt42UJ4a6tvZfCcM4D+3n
         41nr/Z7vDUgIXAjdU6W9YEkU1TZi/t1Y99s9nW+Axe6u1Y8+L6UrFELP7Yh+Q7BFB9Qm
         Q9pwuXet6/VSbG+b33fVKQmLgID3nrXhAyrJ+2aWnm2gi+voCo4qotq9hxVyfLQqnlQo
         fncA==
X-Gm-Message-State: AOJu0Yw9TqubpC4PgFD5Z6PLXQlQIkPUiUFd/ff60dpGFDe4kXA38CMH
	1oWc/1QHJ7yUMgBcjXgwtdCcJwZk2iXt4/9ECqcON9Pm38kw6Ehm6A2m6SMpxeCgO8gaWfZOHiF
	oSOQduA==
X-Gm-Gg: AR+sD13+SN+2cCA0HAypURnyEwX0V76mRPp6DOXPOD8JdiYWW9KCSDhMeXzUvXmnQ4Q
	XXNWV7ipZQgzjSNqUsjBu+EeEle6k3oUpbfNwoTRIsED9Ugu4Ix4i4jfTwfW0IRA2WZwy/ramgU
	q6c7u1+11yFXk6Lng/+iv9m9Q6gELDMiVC/Q8n0oA9IAfNv+N9fSSSo+7uHAniJy6xqy9RXiaf1
	QIcqjqf88KQ+HQJUrVWysCKvCTkeoIEfnCL60ppwJ1h+gXPZacenF7XTPf6m1K4H3bCqoX8/uVB
	KhPzmcaSFIlwaPNH9IqLs1CaktxtdfgJk+AM5Jqr7yOA5xBU6PUdtds8epvqe07JEXZnXd5CZsD
	e6M6xB1SVre++kj7qXZ+rNaCS3+psJHCAKo09Oz6q/subDo+gCLzc5Neo4M/5qgrIM2tZcJQEly
	SplXg4vDb2SNMeYqFsf5xm9ftWwz6MGf3Wkx+mtqxIS0ctn9ulCRaHR3XNYl3Ln/cGew==
X-Received: by 2002:a05:600c:4f8a:b0:495:78ea:2687 with SMTP id 5b1f17b1804b1-496c6571c93mr24784265e9.29.1785244735437;
        Tue, 28 Jul 2026 06:18:55 -0700 (PDT)
Message-ID: <07e90200-95b5-413f-9259-7f0481d36521@suse.com>
Date: Tue, 28 Jul 2026 15:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 12/24] x86/mm: get_page_from_l1e() is PV-or-shadow-only
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
X-purgate-ID: tlsNG-33051d/1785244736-6FCC34E9-E282CBDA/0/0
X-purgate-type: clean
X-purgate-size: 2574

Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
With the function compiled out, its dedicated XSM hook also becomes
unreachable, so it is similarly guarded.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It feels suspicious that the .priv_mapping() check is used for HVM guests
in shadow mode, but not for ones in HAP mode.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -837,6 +837,8 @@ static int cf_check print_mmio_emul_rang
 }
 #endif
 
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
+
 /*
  * get_page_from_l1e returns:
  *   0  => success (page not present also counts as such)
@@ -1038,6 +1040,8 @@ get_page_from_l1e(
     return -EBUSY;
 }
 
+#endif /* CONFIG_PV || CONFIG_SHADOW_PAGING */
+
 /*
  * The following flags are used to specify behavior of various get and
  * put commands.  The first is also stored in page->partial_flags to
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -705,12 +705,14 @@ static XSM_INLINE int cf_check xsm_updat
 
 #endif /* CONFIG_PV */
 
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 static XSM_INLINE int cf_check xsm_priv_mapping(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
+#endif
 
 static XSM_INLINE int cf_check xsm_ioport_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -141,7 +141,9 @@ XSM_HOOK(int, mmu_update, struct domain
 XSM_HOOK(int, mmuext_op, struct domain *, struct domain *)
 XSM_HOOK(int, update_va_mapping, struct domain *, struct domain *, l1_pgentry_t)
 #endif /* CONFIG_PV */
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
+#endif
 XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, uint8_t)
 XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, uint8_t)
 XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1828,10 +1828,12 @@ static int cf_check flask_update_va_mapp
 
 #endif /* CONFIG_PV */
 
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 static int cf_check flask_priv_mapping(struct domain *d, struct domain *t)
 {
     return domain_has_perm(d, t, SECCLASS_MMU, MMU__TARGET_HACK);
 }
+#endif
 
 static int cf_check flask_pmu_op(struct domain *d, unsigned int op)
 {


