Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA24C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:14:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374036.1620992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohdw-0003da-2b; Tue, 28 Jul 2026 13:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374036.1620992; Tue, 28 Jul 2026 13:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohdv-0003dT-Vu; Tue, 28 Jul 2026 13:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1374036;
 Tue, 28 Jul 2026 13:14:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohdu-0003bp-CM
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:14:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohdt-004cTC-Le
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:14:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab40-e002-0a2a0a5209dd-0a2a4507cbd6-22
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:14:45 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab45-b4ea-0a2a45070019-d1558033edb9-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:14:45 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso47501085e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:14:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bd77a9sm55197678f8f.14.2026.07.28.06.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:14:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244485; x=1785849285; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zvHFuBowtfxuVEr3XoDvree7aX44NU2K8E9z5xVIjrk=;
        b=JjKk0XQQI7RT5uA8REnYeJA4zo8eleJzpW1Ps5wCxxngvvRZ5Xj6R8cUVPo7swuo3p
         igzfIhyOuDI1T9BymTfboOBIdibKeOPTS/Dz0eVCYQgGyjUUxNWEjKXDVC+cQWgIZi7s
         BPPrCxHpTAi1RI5clTm9FMWm5Ci5o2X60zIq4UuZRB34pmr87gRtHyAJe7Ufm+hXd2KQ
         UWOjunBZ9OwW87sOz1q9C490pcqLHwcxOhL+1yDCraYvKM+3KGzq2X2wtBhsEeDn/435
         AGwh/uBLMJaRbQXYJQ1oME2eYZN+nBDvUwnJNz7typ3d76rBzfVMXp9RLcPxGy0onvrh
         zWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244485; x=1785849285;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zvHFuBowtfxuVEr3XoDvree7aX44NU2K8E9z5xVIjrk=;
        b=bsloJlA07c8Xghv3ALm8fOTrPKaxUSkrDrAlEAiemdPqSG5Mzqz4wnTTUNoLXTH+sx
         SdCR933UL4kwzl35tlqy09WfbJcEhTMsIYFvclC5U+88MNq0hSWZKmaBUYdiGQF92poz
         R+nmjL1qnifNGhKU0CSGR3ZMiMUfOJiEgJ2mdW2z1JMvkzLeGRvLEgsZEKFe7jRCwej0
         Hhm1M0PvUYXsTWvwKmJ2NMhsoJBIdrBaQzd2EpVXULvbRb9Rcg8FtSS50HXurGmydHZv
         mcAcnC6J7zRoz1C3coe7hQPDWAgXlNlSh40qvmpAySVMtI+xswJtJHO0VEgosRM7sBUx
         jlfQ==
X-Gm-Message-State: AOJu0YwCA7DcZcedFOyVFYU85cTgIqyceawFFPSyD0qbrhPixRWULkEe
	R6MfoH1xYCb2iN4aNfMub9Ho0mRC1CM9ncix7WFkhT2oAD/dSbr2aElSMf7KHhk6gqSADSrl6mj
	fLQpXCg==
X-Gm-Gg: AR+sD114vyOaRHIm0uWSQIoY+VtHw+TP+BZrZhlpLcrQEveC0bb/8/ifpOcQZXjwY42
	K+73s2tBcxtBOhdFZDRkdEPcUzQTHZhTl3Rr5AXRXmsN1hpPNzfeYL55xEy08a49/p6QoyYkjzS
	nCd+nTQr5CEvcJ7A0sSmRZof2EjuRlrg8UPpUUkhfvdWKiDYWbjExcNIMHcYGYq/LLZer1DakvW
	QualRl/qyZaqY2Z90p+QBjvfsH9l7xOrr//HTbiuu2QK7qye1DXzfIRXOYhoexADaR2B7zNzpBl
	05yLKF5+5ikWC6vc0NmX0d6O8z/MVC/T53tRwiIOifEWwhFA7pop99tylKsiizgSZiVjYS83vj2
	NgddWr8Vr9sAs2rryZF3TKymULBDknUnt8IOhj21oEAYxcMRGY/E6YO86bHigGdEcdSqNk32DzB
	hGZrcwKUjEtYfaLwMMl5p6ptC89lF0zDFCRxzNFVJ+nxKM8mYV8hMkMbXOi5zb0YYXoQ==
X-Received: by 2002:a05:600c:1395:b0:495:7538:d4ea with SMTP id 5b1f17b1804b1-496c60b1896mr25373525e9.0.1785244484996;
        Tue, 28 Jul 2026 06:14:44 -0700 (PDT)
Message-ID: <03267655-2c62-459a-abef-6a0a85a9fa44@suse.com>
Date: Tue, 28 Jul 2026 15:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 04/24] XSM: make PCI hooks dependent upon HAS_PCI=y
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
X-purgate-ID: tlsNG-ef75cf/1785244485-364DBAE4-2339DE74/0/0
X-purgate-type: clean
X-purgate-size: 4548

They're unreachable / dead otherwise. Really resource_{,un}plug_pci() is
further limited to PCI pass-through.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -394,6 +394,8 @@ static XSM_INLINE int cf_check xsm_get_d
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
 
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+
 static XSM_INLINE int cf_check xsm_resource_plug_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
@@ -408,6 +410,10 @@ static XSM_INLINE int cf_check xsm_resou
     return xsm_default_action(action, current->domain, NULL);
 }
 
+#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_HAS_PCI */
+
+#ifdef CONFIG_HAS_PCI
+
 static XSM_INLINE int cf_check xsm_resource_setup_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
@@ -421,6 +427,8 @@ static XSM_INLINE int cf_check xsm_resou
     return xsm_default_action(action, current->domain, NULL);
 }
 
+#endif /* CONFIG_HAS_PCI */
+
 static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -524,6 +532,7 @@ static XSM_INLINE int cf_check xsm_iomem
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_HAS_PCI
 static XSM_INLINE int cf_check xsm_pci_config_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
     uint16_t end, uint8_t access)
@@ -531,6 +540,7 @@ static XSM_INLINE int cf_check xsm_pci_c
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
+#endif /* CONFIG_HAS_PCI */
 
 static XSM_INLINE int cf_check xsm_add_to_physmap(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -77,21 +77,24 @@ XSM_HOOK(int, unbind_pt_irq, struct doma
 
 XSM_HOOK(int, irq_permission, struct domain *, int, uint8_t)
 XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
-XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
-                                     uint16_t, uint8_t)
 
 XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
 XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+XSM_HOOK(int, resource_plug_pci, uint32_t)
+XSM_HOOK(int, resource_unplug_pci, uint32_t)
 XSM_HOOK(int, get_device_group, uint32_t)
 #endif
 
-XSM_HOOK(int, resource_plug_pci, uint32_t)
-XSM_HOOK(int, resource_unplug_pci, uint32_t)
+XSM_HOOK(int, resource_setup_misc)
+
+#ifdef CONFIG_HAS_PCI
 XSM_HOOK(int, resource_setup_pci, uint32_t)
 XSM_HOOK(int, resource_setup_gsi, int)
-XSM_HOOK(int, resource_setup_misc)
+XSM_HOOK(int, pci_config_permission, struct domain *, uint32_t, uint16_t,
+                                     uint16_t, uint8_t)
+#endif
 
 XSM_HOOK(int, hypfs_op)
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1225,6 +1225,7 @@ static int cf_check flask_iomem_mapping(
 }
 #define flask_iomem_mapping_vpci flask_iomem_mapping
 
+#ifdef CONFIG_HAS_PCI
 static int cf_check flask_pci_config_permission(
     struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
     uint8_t access)
@@ -1250,6 +1251,7 @@ static int cf_check flask_pci_config_per
     return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, perm, &ad);
 
 }
+#endif /* CONFIG_HAS_PCI */
 
 #if defined(CONFIG_SYSCTL) || defined(CONFIG_X86)
 static int flask_resource_plug_core(void)
@@ -1270,6 +1272,8 @@ static int flask_resource_use_core(void)
 }
 #endif /* CONFIG_SYSCTL */
 
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+
 static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
 {
     uint32_t rsid;
@@ -1300,6 +1304,10 @@ static int cf_check flask_resource_unplu
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__UNPLUG, &ad);
 }
 
+#endif /* CONFIG_HAS_PASSTHROUGH && CONFIG_HAS_PCI */
+
+#ifdef CONFIG_HAS_PCI
+
 static int cf_check flask_resource_setup_pci(uint32_t machine_bdf)
 {
     uint32_t rsid;
@@ -1328,6 +1336,8 @@ static int cf_check flask_resource_setup
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__SETUP, &ad);
 }
 
+#endif /* CONFIG_HAS_PCI */
+
 static int cf_check flask_resource_setup_misc(void)
 {
     return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);


