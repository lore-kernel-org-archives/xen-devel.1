Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FC1C5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:53:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392677.1631649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt6E-0003ZJ-7g; Mon, 17 Aug 2026 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392677.1631649; Mon, 17 Aug 2026 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt6E-0003ZC-41; Mon, 17 Aug 2026 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 1392677;
 Mon, 17 Aug 2026 08:53:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt6D-0003Z0-0w
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:53:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt6B-002rjM-Ox
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:53:39 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc03-bab6-0a2a0a5309dd-0a2a45018c1e-36
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:53:39 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc13-5984-0a2a45010019-d155802bf15e-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:53:39 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so36449895e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:53:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d063a68sm21461775e9.2.2026.08.17.01.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:53:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956819; x=1787561619; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tEmpas18PFX7DYvL8q0Gls2b5mj4VJSxRmZe4a/2YYU=;
        b=g5lNjz8PGPpAkSmHydPPNTtB8oBTtVUukxo1pAfiFXldLSHeK1NBIxg2WuPTJNdaOB
         4AMgaNiHAFHuMUEW+j9EAmqyBFJHtx5CoJ3HnR2aMuH0d53iLz1TLtWh++JMpix2EOG/
         SYoUp69KCZe6j7hyiY3fcx+nvf7F2gQWTqJiEedVIvr8Vg6np6kdkIs+UtQ50G98SeHl
         mJJBpnAaCQSZss+we5NXwCOVm1Pne58VJMlcI45d50SfMwwJ4HKj750Ho5tccOjj1ReZ
         8B1HA9ZPN/KChkDC2i4EwKTwwWfQlwLH10weRtpdn3BOpaI0/2lAAKGGhHA4jLcacosk
         bdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956819; x=1787561619;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tEmpas18PFX7DYvL8q0Gls2b5mj4VJSxRmZe4a/2YYU=;
        b=sdwHc2uLNoZ97EdMxHCcquj8Xa/xaGpkPd53bAi1AzgSBnHybeXtVB2cXlOnIy14Td
         bkjvrXvxYUl70DJhwOnqPF4o0NojOXI1Pmq7a8doRBCegQKXjGjvnphL/kW6DEviZ7ae
         IGSEhUXm8uLxR75h76MGeb+7wUA8Kwf5smSFJwsb7dlLsDSz086/dmkmkspdjpvdkF57
         HX3DEboXor/UEuO8701AprwZtizyLGOIeyVpXcoGab8T96sRgkNmVnKRp0j/FbAUBv0j
         UDq+hZNYGepmS2+pEqq7hJWVhAG33oXFRAenjA0q8mQSMnyDFw01sJOCDEd/inrr3YNT
         DItw==
X-Gm-Message-State: AOJu0YyNHMTFEQtPP1eMwveZa4teJHj2NQA1G+vuy54ceWP7fnbxhlR5
	YDRWB5gnRCsW6MXY6VruDRbQ6fD6bSuY61ygfniKVZy5yhfnltpg1PBKDK41Ir7/fF+wycF6XPG
	0QNO0dg==
X-Gm-Gg: AR+sD1250wEwWtHkY8vv+xv2riaSycMNEy0DCo+qju/6dqKgH3fNUfm8pXzwNJp6KGn
	l5zfuhMapKWcsFXX5Rtf6PmydKDtZRBjP8mYGTiEHqSrTLQqZDpZFA7N7QNP/lgFNMfxFp3lbW+
	ykiTGGOrWcF1j7JLKIYk1d9DroE8NM5dF/vo2z+qkChjOizreKEFeXJ996d9kK4AxbM8OOqpwOX
	RQn6l9/AMshUqgv+55JXAKxZYj/58yvhRplsq0Ftky+V8kyiH+T6xRrJYjV7YDmPQtizyxoDUzJ
	h6KTfzlSqsUjBFs1lHyG988Tf+1lnHsNBD9mDbs3V010iU3esVE6aYgB3M1Ae472SgQK7SzziOT
	8Qc63p6hfkRdOv92MC5GMiGEns4jE8aynhvEaRb4GTxQNwnNB1+Ddoc1KFqrWtsMYiC/ZvdvhBl
	bybuHJJ27C3iXoyBwOLYp/Mk7MSEs26mpBYG9LtSYjqgIopX0geSYAZBW67VvRbdB2JqChzVSEw
	x0T7EgM4OMzZVhepOKybfI3rkklnk9XM9MPC5f7lY3sHgggryl2
X-Received: by 2002:a05:600c:3b23:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-4998ae1bb69mr276680605e9.12.1786956819212;
        Mon, 17 Aug 2026 01:53:39 -0700 (PDT)
Message-ID: <236a8612-d431-4972-92b3-4d62e8f10bb4@suse.com>
Date: Mon, 17 Aug 2026 10:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 06/14] XSM: fold xsm_{,un}map_domain_pirq() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
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
In-Reply-To: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786956819-1F66C757-D5D940F0/0/0
X-purgate-type: clean
X-purgate-size: 2676

Like other resource management hooks they are different in just "add
resource" vs "remove resource". Hence like in other cases a single hook
can easily serve both purposes. Rename hook and functions to fit
xsm_io{mem,port}_mapping().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Rename hook, functions, and new parameter.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -109,7 +109,7 @@ int physdev_map_pirq(struct domain *d, i
         return physdev_hvm_map_pirq(d, type, index, pirq_p);
     }
 
-    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
+    ret = xsm_pirq_mapping(XSM_DM_PRIV, d, true);
     if ( ret )
         return ret;
 
@@ -142,7 +142,7 @@ int physdev_unmap_pirq(struct domain *d,
     int ret = 0;
 
     if ( d != current->domain || !is_hvm_domain(d) || !has_pirq(d) )
-        ret = xsm_unmap_domain_pirq(XSM_DM_PRIV, d);
+        ret = xsm_pirq_mapping(XSM_DM_PRIV, d, false);
     if ( ret )
         return ret;
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -460,15 +460,8 @@ static XSM_INLINE char *xsm_show_irq_sid
 
 #ifdef CONFIG_HAS_PIRQ
 
-static XSM_INLINE int xsm_map_domain_pirq(
-    XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unmap_domain_pirq(
-    XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int xsm_pirq_mapping(
+    XSM_DEFAULT_ARG struct domain *d, bool map)
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
+XSM_HOOK(int, pirq_mapping, struct domain *, bool)
 #endif
 
 XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1022,14 +1022,9 @@ static char *cf_check flask_show_irq_sid
 
 #ifdef CONFIG_HAS_PIRQ
 
-static int cf_check flask_map_domain_pirq(struct domain *d)
+static int cf_check flask_pirq_mapping(struct domain *d, bool map)
 {
-    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
-}
-
-static int cf_check flask_unmap_domain_pirq(struct domain *d)
-{
-    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
+    return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(map));
 }
 
 #endif /* CONFIG_HAS_PIRQ */


