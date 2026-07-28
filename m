Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C4BC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:20:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374117.1621081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohiz-00019e-Nq; Tue, 28 Jul 2026 13:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374117.1621081; Tue, 28 Jul 2026 13:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohiz-00019X-Ky; Tue, 28 Jul 2026 13:20:01 +0000
Received: by outflank-mailman (input) for mailman id 1374117;
 Tue, 28 Jul 2026 13:20:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohiy-00019R-Oh
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:20:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohiy-00HAue-2H
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:20:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac7f-bab6-0a2a0a5309dd-0a2a4503ed30-8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:20:00 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac7f-fae8-0a2a45030019-d155dd2ba42b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:19:59 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso896861f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:19:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c531afsm64886299f8f.24.2026.07.28.06.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:19:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244799; x=1785849599; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FRU2aVDELQY8gXnVCRj1wv0Vi1aEpN9TA8YS+W2T4aI=;
        b=C7qA2+0fP0gsv514A6xhK/zrjhv1huZ6xd2u/P1krkp7oi7kILBW6WzqxmfFEubCJP
         qDD9eWfQADzhL7QIDhUqRHwtmzKZLn+RefCQTfBMsGbgVMRqH2EOj+LBkMkBySS3NgzA
         20X95VAyRy4066UkCwWmCpzkN9IlDpBB1RbboepbD2jhZfrj1ku582y4s/CAXmxFjMMA
         2o1oabm8kLPnzezS0ipQk5WXMa4cE+39mXDJNttRxQkh+N+oZSPFXHEKYAQHVMLUqG1N
         59a/3l8sp7jL2zKhfmh4dwgxj4shIbgCuXPfjZsscxNWzQ4JtqmlA/eCxT32VSvldowd
         V5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244799; x=1785849599;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FRU2aVDELQY8gXnVCRj1wv0Vi1aEpN9TA8YS+W2T4aI=;
        b=BpGzN2hoq5tfymX8XQ9CIO23IC43STNDZuDB1rArUOhh1N17R6UIWgsbbnoWTVL+jY
         Fs5VDKatte9A0c/bkqHzw38x4G1sXnSIn8D8nNECnjg+yttuCutZJqiLiba5If74jVXy
         LkcWaiWlWDYn9vsW6fp9Yq3P1TVijAXOTckUcaLoc102zx58nx8mYtfafLoDJdGr/z7v
         yYbvvW7aW3Kk9eD2JCD4q/5SPxoS1AKrrV8VIPxdSY9BSjfrWHRtwTbMrsaj1EvXER/A
         KkyMkuF7jHm3H2AvzqvluHCgLPBeHiFa+fptihZTAHf1HppcbHeAYAuAIGcOtvXS8jSb
         B+Kw==
X-Gm-Message-State: AOJu0Yy0Ncm9wZNoJFgYtVaFw2Q7ac5WHQKfdEQaxzw8dgPGXuHxDYab
	i6FUL7ubnX+G8dAkrx0p/sD70DWPTMcBGXv3ZWLa4MdCnEc5kHzxmzhr5qvGeAREneaZwPTND0i
	gcWgS3g==
X-Gm-Gg: AR+sD1058QyV2zSj21jKv3g8VZe+6V3KO96kuXjCabUe3NrT148xyi01X3XX30HADt0
	d8PmA0igHWNhVH/4I1AUQ95OhwwnNFWYB3/Rtwfmk7iHLA6KitMD4VXY3rGKYiMtlwDf83rbj9k
	m8+3LrdY8HHJ+T6oA/DNnpnPUaY+Fj4XLQ0PcNFmO8P7i5DuoRFrvvrp/h5+uUk1QvO1iDEBy3k
	OgwlYjmte49P0oI/XxXHl9qwPIY9HEltVCplpqkAyQ5FmfDEuElT8AT+c2yWl/eZLRjbe4ecTsp
	Poo0CHLG5aoq9Y8kYdx6IwQCyaiohMpvp8xeJS2aYPet/qUV1FuD76LXag97z0ViGK+XVfO+FXw
	yVB3cFPkkTo1QThfLcfcqdzefsRukvw/fm//D7MtdRBs74itvr/2I7RFo+jxDNYvl+demc0vcbK
	/obZbPbu3g46J2C9TXNOHgiGBVg4UDg3kJOB2JrzfT9mNSoW0i4s+CviUn++CXZmVCKw==
X-Received: by 2002:a05:6000:41ed:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-47fb1e8547cmr3083059f8f.5.1785244799194;
        Tue, 28 Jul 2026 06:19:59 -0700 (PDT)
Message-ID: <6c8f1317-5dd0-4f91-b1b1-820fb43b5c39@suse.com>
Date: Tue, 28 Jul 2026 15:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 14/24] XSM/dummy: fold cf_check into XSM_INLINE
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
X-purgate-ID: tlsNG-33051d/1785244799-6CADC4E9-F1AFB2AF/0/0
X-purgate-type: clean
X-purgate-size: 23552

Use of cf_check together with always_inline is pretty pointless, and with
XSM=n none of the dummy handlers are supposed to have their address taken.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -54,7 +54,7 @@ void __xsm_action_mismatch_detected(void
  * There is no xsm_default_t argument available, so the value from the assertion
  * is used to initialize the variable.
  */
-#define XSM_INLINE __maybe_unused
+#define XSM_INLINE __maybe_unused cf_check
 
 #define XSM_DEFAULT_ARG /* */
 #define XSM_DEFAULT_VOID void
@@ -104,7 +104,7 @@ static always_inline int xsm_default_act
     }
 }
 
-static XSM_INLINE int cf_check xsm_set_system_active(void)
+static XSM_INLINE int xsm_set_system_active(void)
 {
     struct domain *d = current->domain;
 
@@ -121,34 +121,34 @@ static XSM_INLINE int cf_check xsm_set_s
     return 0;
 }
 
-static XSM_INLINE void cf_check xsm_security_domaininfo(
+static XSM_INLINE void xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     return;
 }
 
-static XSM_INLINE int cf_check xsm_domain_create(
+static XSM_INLINE int xsm_domain_create(
     XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_getdomaininfo(
+static XSM_INLINE int xsm_getdomaininfo(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_XS_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_set_target(
+static XSM_INLINE int xsm_set_target(
     XSM_DEFAULT_ARG struct domain *d, struct domain *e)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_domctl(
+static XSM_INLINE int xsm_domctl(
     XSM_DEFAULT_ARG struct domain *d, struct xen_domctl *op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -174,61 +174,61 @@ static XSM_INLINE int cf_check xsm_domct
     }
 }
 
-static XSM_INLINE int cf_check xsm_sysctl(
+static XSM_INLINE int xsm_sysctl(
     XSM_DEFAULT_ARG const struct xen_sysctl *op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_alloc_security_domain(struct domain *d)
+static XSM_INLINE int xsm_alloc_security_domain(struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE void cf_check xsm_free_security_domain(struct domain *d)
+static XSM_INLINE void xsm_free_security_domain(struct domain *d)
 {
     return;
 }
 
 #ifdef CONFIG_GRANT_TABLE
 
-static XSM_INLINE int cf_check xsm_grant_mapref(
+static XSM_INLINE int xsm_grant_mapref(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2, uint32_t flags)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_grant_unmapref(
+static XSM_INLINE int xsm_grant_unmapref(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_grant_setup(
+static XSM_INLINE int xsm_grant_setup(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_grant_transfer(
+static XSM_INLINE int xsm_grant_transfer(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_grant_copy(
+static XSM_INLINE int xsm_grant_copy(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_grant_query_size(
+static XSM_INLINE int xsm_grant_query_size(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -237,28 +237,28 @@ static XSM_INLINE int cf_check xsm_grant
 
 #endif /* CONFIG_GRANT_TABLE */
 
-static XSM_INLINE int cf_check xsm_memory_exchange(
+static XSM_INLINE int xsm_memory_exchange(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_memory_adjust_reservation(
+static XSM_INLINE int xsm_memory_adjust_reservation(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_memory_stat_reservation(
+static XSM_INLINE int xsm_memory_stat_reservation(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_console_io(
+static XSM_INLINE int xsm_console_io(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
@@ -272,21 +272,21 @@ static XSM_INLINE int cf_check xsm_conso
 }
 
 #ifdef CONFIG_KEXEC
-static XSM_INLINE int cf_check xsm_kexec(XSM_DEFAULT_VOID)
+static XSM_INLINE int xsm_kexec(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 #endif
 
-static XSM_INLINE int cf_check xsm_schedop_shutdown(
+static XSM_INLINE int xsm_schedop_shutdown(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_memory_pin_page(
+static XSM_INLINE int xsm_memory_pin_page(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
     struct page_info *page)
 {
@@ -294,20 +294,20 @@ static XSM_INLINE int cf_check xsm_memor
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_evtchn_unbound(
+static XSM_INLINE int xsm_evtchn_unbound(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_evtchn_interdomain(
+static XSM_INLINE int xsm_evtchn_interdomain(
     XSM_DEFAULT_ARG struct domain *d1, struct evtchn *chan1, struct domain *d2,
     struct evtchn *chan2)
 {
@@ -315,72 +315,72 @@ static XSM_INLINE int cf_check xsm_evtch
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE void cf_check xsm_evtchn_close_post(struct evtchn *chn)
+static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
 {
     return;
 }
 
-static XSM_INLINE int cf_check xsm_evtchn_send(
+static XSM_INLINE int xsm_evtchn_send(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_evtchn_status(
+static XSM_INLINE int xsm_evtchn_status(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_evtchn_reset(
+static XSM_INLINE int xsm_evtchn_reset(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_alloc_security_evtchns(
+static XSM_INLINE int xsm_alloc_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
     return 0;
 }
 
-static XSM_INLINE void cf_check xsm_free_security_evtchns(
+static XSM_INLINE void xsm_free_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
     return;
 }
 
-static XSM_INLINE char *cf_check xsm_show_security_evtchn(
+static XSM_INLINE char *xsm_show_security_evtchn(
     struct domain *d, const struct evtchn *chn)
 {
     return NULL;
 }
 
-static XSM_INLINE int cf_check xsm_init_hardware_domain(
+static XSM_INLINE int xsm_init_hardware_domain(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_get_pod_target(
+static XSM_INLINE int xsm_get_pod_target(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_set_pod_target(
+static XSM_INLINE int xsm_set_pod_target(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_get_vnumainfo(
+static XSM_INLINE int xsm_get_vnumainfo(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -388,7 +388,7 @@ static XSM_INLINE int cf_check xsm_get_v
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static XSM_INLINE int cf_check xsm_get_device_group(
+static XSM_INLINE int xsm_get_device_group(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -398,14 +398,14 @@ static XSM_INLINE int cf_check xsm_get_d
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 
-static XSM_INLINE int cf_check xsm_resource_plug_pci(
+static XSM_INLINE int xsm_resource_plug_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_resource_unplug_pci(
+static XSM_INLINE int xsm_resource_unplug_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -416,14 +416,14 @@ static XSM_INLINE int cf_check xsm_resou
 
 #ifdef CONFIG_HAS_PCI
 
-static XSM_INLINE int cf_check xsm_resource_setup_pci(
+static XSM_INLINE int xsm_resource_setup_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
+static XSM_INLINE int xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
@@ -431,47 +431,47 @@ static XSM_INLINE int cf_check xsm_resou
 
 #endif /* CONFIG_HAS_PCI */
 
-static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
+static XSM_INLINE int xsm_resource_setup_misc(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 #ifdef CONFIG_HYPFS
-static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
+static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 #endif
 
-static XSM_INLINE long cf_check xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
 }
 
 #ifdef CONFIG_COMPAT
-static XSM_INLINE int cf_check xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
+static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
 }
 #endif
 
-static XSM_INLINE char *cf_check xsm_show_irq_sid(int irq)
+static XSM_INLINE char *xsm_show_irq_sid(int irq)
 {
     return NULL;
 }
 
 #ifdef CONFIG_HAS_PIRQ
 
-static XSM_INLINE int cf_check xsm_map_domain_pirq(
+static XSM_INLINE int xsm_map_domain_pirq(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_unmap_domain_pirq(
+static XSM_INLINE int xsm_unmap_domain_pirq(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
@@ -480,49 +480,49 @@ static XSM_INLINE int cf_check xsm_unmap
 
 #endif /* CONFIG_HAS_PIRQ */
 
-static XSM_INLINE int cf_check xsm_map_domain_irq(
+static XSM_INLINE int xsm_map_domain_irq(
     XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_bind_pt_irq(
+static XSM_INLINE int xsm_bind_pt_irq(
     XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_unbind_pt_irq(
+static XSM_INLINE int xsm_unbind_pt_irq(
     XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_unmap_domain_irq(
+static XSM_INLINE int xsm_unmap_domain_irq(
     XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_irq_permission(
+static XSM_INLINE int xsm_irq_permission(
     XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_iomem_permission(
+static XSM_INLINE int xsm_iomem_permission(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_iomem_mapping(
+static XSM_INLINE int xsm_iomem_mapping(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
@@ -530,7 +530,7 @@ static XSM_INLINE int cf_check xsm_iomem
 }
 
 #ifdef CONFIG_HAS_VPCI
-static XSM_INLINE int cf_check xsm_iomem_mapping_vpci(
+static XSM_INLINE int xsm_iomem_mapping_vpci(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
@@ -539,7 +539,7 @@ static XSM_INLINE int cf_check xsm_iomem
 #endif
 
 #ifdef CONFIG_HAS_PCI
-static XSM_INLINE int cf_check xsm_pci_config_permission(
+static XSM_INLINE int xsm_pci_config_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
     uint16_t end, uint8_t access)
 {
@@ -548,21 +548,21 @@ static XSM_INLINE int cf_check xsm_pci_c
 }
 #endif /* CONFIG_HAS_PCI */
 
-static XSM_INLINE int cf_check xsm_add_to_physmap(
+static XSM_INLINE int xsm_add_to_physmap(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_remove_from_physmap(
+static XSM_INLINE int xsm_remove_from_physmap(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
+static XSM_INLINE int xsm_map_gmfn_foreign(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -571,14 +571,14 @@ static XSM_INLINE int cf_check xsm_map_g
 
 #ifdef CONFIG_HVM
 
-static XSM_INLINE int cf_check xsm_hvm_param(
+static XSM_INLINE int xsm_hvm_param(
     XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_hvm_param_altp2mhvm(
+static XSM_INLINE int xsm_hvm_param_altp2mhvm(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -588,7 +588,7 @@ static XSM_INLINE int cf_check xsm_hvm_p
 #endif /* CONFIG_HVM */
 
 #ifdef CONFIG_ALTP2M
-static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
+static XSM_INLINE int xsm_hvm_altp2mhvm_op(
     XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
@@ -610,7 +610,7 @@ static XSM_INLINE int cf_check xsm_hvm_a
 #endif /* CONFIG_ALTP2M */
 
 #ifdef CONFIG_VM_EVENT
-static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -618,7 +618,7 @@ static XSM_INLINE int cf_check xsm_mem_a
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static XSM_INLINE int cf_check xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -626,14 +626,14 @@ static XSM_INLINE int cf_check xsm_mem_p
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static XSM_INLINE int cf_check xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 #endif
 
-static XSM_INLINE int cf_check xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
+static XSM_INLINE int xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
@@ -641,20 +641,20 @@ static XSM_INLINE int cf_check xsm_platf
 
 #ifdef CONFIG_X86
 
-static XSM_INLINE int cf_check xsm_mem_sharing_op(
+static XSM_INLINE int xsm_mem_sharing_op(
     XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, cd);
 }
 
-static XSM_INLINE int cf_check xsm_machine_memory_map(XSM_DEFAULT_VOID)
+static XSM_INLINE int xsm_machine_memory_map(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_domain_memory_map(
+static XSM_INLINE int xsm_domain_memory_map(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -663,20 +663,20 @@ static XSM_INLINE int cf_check xsm_domai
 
 #ifdef CONFIG_PV
 
-static XSM_INLINE int cf_check xsm_apic(
+static XSM_INLINE int xsm_apic(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_do_mca(XSM_DEFAULT_VOID)
+static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int cf_check xsm_mmu_update(
+static XSM_INLINE int xsm_mmu_update(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t, struct domain *f,
     uint32_t flags)
 {
@@ -689,14 +689,14 @@ static XSM_INLINE int cf_check xsm_mmu_u
     return rc;
 }
 
-static XSM_INLINE int cf_check xsm_mmuext_op(
+static XSM_INLINE int xsm_mmuext_op(
     XSM_DEFAULT_ARG struct domain *d, struct domain *f)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int cf_check xsm_update_va_mapping(
+static XSM_INLINE int xsm_update_va_mapping(
     XSM_DEFAULT_ARG struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -706,7 +706,7 @@ static XSM_INLINE int cf_check xsm_updat
 #endif /* CONFIG_PV */
 
 #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
-static XSM_INLINE int cf_check xsm_priv_mapping(
+static XSM_INLINE int xsm_priv_mapping(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -714,21 +714,21 @@ static XSM_INLINE int cf_check xsm_priv_
 }
 #endif
 
-static XSM_INLINE int cf_check xsm_ioport_permission(
+static XSM_INLINE int xsm_ioport_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_ioport_mapping(
+static XSM_INLINE int xsm_ioport_mapping(
     XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_pmu_op(
+static XSM_INLINE int xsm_pmu_op(
     XSM_DEFAULT_ARG struct domain *d, unsigned int op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
@@ -747,7 +747,7 @@ static XSM_INLINE int cf_check xsm_pmu_o
 #endif /* CONFIG_X86 */
 
 #ifdef CONFIG_IOREQ_SERVER
-static XSM_INLINE int cf_check xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -755,24 +755,24 @@ static XSM_INLINE int cf_check xsm_dm_op
 #endif
 
 #ifdef CONFIG_ARGO
-static XSM_INLINE int cf_check xsm_argo_enable(const struct domain *d)
+static XSM_INLINE int xsm_argo_enable(const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int cf_check xsm_argo_register_single_source(
+static XSM_INLINE int xsm_argo_register_single_source(
     const struct domain *d, const struct domain *t)
 {
     return 0;
 }
 
-static XSM_INLINE int cf_check xsm_argo_register_any_source(
+static XSM_INLINE int xsm_argo_register_any_source(
     const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int cf_check xsm_argo_send(
+static XSM_INLINE int xsm_argo_send(
     const struct domain *d, const struct domain *t)
 {
     return 0;
@@ -780,7 +780,7 @@ static XSM_INLINE int cf_check xsm_argo_
 
 #endif /* CONFIG_ARGO */
 
-static XSM_INLINE int cf_check xsm_get_domain_state(
+static XSM_INLINE int xsm_get_domain_state(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_XS_PRIV);
@@ -788,7 +788,7 @@ static XSM_INLINE int cf_check xsm_get_d
 }
 
 #include <public/version.h>
-static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
+static XSM_INLINE int xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
@@ -815,7 +815,7 @@ static XSM_INLINE int cf_check xsm_xen_v
     }
 }
 
-static XSM_INLINE int cf_check xsm_domain_resource_map(
+static XSM_INLINE int xsm_domain_resource_map(
     XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);


