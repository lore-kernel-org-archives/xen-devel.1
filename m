Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41BBC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:28:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374204.1621181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohrP-000834-VQ; Tue, 28 Jul 2026 13:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374204.1621181; Tue, 28 Jul 2026 13:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohrP-00082x-Sh; Tue, 28 Jul 2026 13:28:43 +0000
Received: by outflank-mailman (input) for mailman id 1374204;
 Tue, 28 Jul 2026 13:28:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wohrO-00082j-HY
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:28:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohrN-00BTIz-UW
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:28:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ae88-e002-0a2a0a5209dd-0a2a450398ea-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:28:41 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ae11-fae8-0a2a45030019-d155dd2de4f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:26:41 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so2588410f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:26:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a596sm57279913f8f.4.2026.07.28.06.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:26:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1785245201; x=1785850001; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HrOvCzsNhd33qamE+cZ36ihr91EVmBqcRr+fANgYdRs=;
        b=FO7NDSEzzQGO9KLDEY6CQPkJi09d8bVOH2fMmBGSFw+ZhyPRQLBGoBmKkjqkCcChay
         r9xWd81hrHwYJSmQj0nqMgxouvi3AklwPy+Rz5g8CyoocyOm0PIrqwbld3lv6oiKYLcR
         8662nVQ9zUax1CpOy7a2Kx+vRMCgkefjv2s8HSUmDh44pcCi59llwFOg9BV/7V4rI4Pq
         Xt1srIViMJ3twBMbgGNMaUGR12FBALCKYsf63yfF1Z/q7ViHXUU6GephWzPKwMJcV+13
         2WbAMq4ylAdOyRE+IZAd29YJYcfE70EEGtxYi0qosC7uB2ufpW0/eDwZ8FfFZga0fclK
         ulxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245201; x=1785850001;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HrOvCzsNhd33qamE+cZ36ihr91EVmBqcRr+fANgYdRs=;
        b=aj074I9aeEkQ523PY0aQ75PKjga3NCEr33ItXNxOey53Xg2+LRaVn8Cv+0bERCCOWD
         bXfCJFrqmxjrw5OJBF5F9/dqdng3rpvGGcViIDqWbBKmU4fWX7yy0HWFQB3I21vFbaxE
         AhExaed6WsIEeItd2zx1a/3+IKL1jfKUWwcdaxJaqsw/NG9sUbPjNlufa6LY2vGfTk9U
         TfWUoRIiVtrQzJjNjqejOtDPyAWZWgzr52xr4mCBbav2ZY9uKazGPuvwQkeeiZ/JHrsX
         nfwkjvMmkph6JCXCCINNJztvoZAYutSEsdxQf6TV4OKIB3OzeZhNkF62yADZWXn99mJv
         sGAw==
X-Gm-Message-State: AOJu0YwuWrci2TU7JzzjmOkJXj19JxJ9YMxl+Xn+cmsB9B34O13tiKI2
	D9F1hqWf6DK3wtn5eaRX5QJ7KMfT4QTrF9nlUSh+ajwN6VzlQlB1uavYwWkDgepx++Wym9OCEGj
	gtwrNLw==
X-Gm-Gg: AR+sD10CiynUpKMhfELLFtgKBcTrJpRB18GtZ4pMofDY4sqsx3wNvG86YawcTEIOOj4
	t86p3Ji9ZvnNInDqpfvayr4lTOc1HOgC0EEb9AdseEmdhIvtwecALI1kjcSdiiCai0j3HIwlOKt
	1pS/edwuLzubhlq5om4MUAKdOp00QkHa0wDx6gECfcVoa0ZWzwyIcCzj3CmpYUenxw1fQckP9mE
	XWl6YGPpRqggp+7g7XU2kScR51XcHZf9HiHryHEvVmybNB/DBkKTZcruTcoPdrS1Y2oFxkc2HYc
	B8kvhIzJLXynL7yUW25dkeLM6sad5ZwY+z+QA3sOr4SifvvZJPkT0VegIt0p5A/EF0Wg5CajsL0
	wWJO3Yucmzk+ISfjbpp3/Q4xCMCzq5kIJVYyyZSEU8BD1txSk3+xj3xuLLHqDqbtDnF7d0Tpbey
	You3k1PetH5PNJfLYhgkM2J4XEb1qct8MT5WXcBM+lYboOJtslvw+R61n0b3177VI2JAOh0vvPV
	Ain
X-Received: by 2002:a05:6000:2c04:b0:47f:8887:3b07 with SMTP id ffacd0b85a97d-47fb1e6992fmr3249734f8f.13.1785245201130;
        Tue, 28 Jul 2026 06:26:41 -0700 (PDT)
Message-ID: <03d4456b-9e85-469c-a2a1-769faad67bb0@suse.com>
Date: Tue, 28 Jul 2026 15:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 24/24] XSM: fold xsm_{,un}bind_pt_irq() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
X-purgate-ID: tlsNG-33051d/1785245201-76CF84E9-42ED0A11/20/8814405245
X-purgate-type: spam
X-purgate-size: 4199

Like other resource management hooks they are mainly different in "add
resource" vs "remove resource". Hence like in other cases a single hook
can easily serve both purposes, with minor tweaking of
flask_bind_pt_irq(). While adjusting that function, also defer the setting
of "dperm", which is only needed in the "map" case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -104,7 +104,7 @@ long arch_do_domctl(struct xen_domctl *d
         if ( rc )
             return rc;
 
-        rc = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind);
+        rc = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, true);
         if ( rc )
             return rc;
 
@@ -140,7 +140,7 @@ long arch_do_domctl(struct xen_domctl *d
         if ( irq != virq )
             return -EINVAL;
 
-        rc = xsm_unbind_pt_irq(XSM_DM_PRIV, d, bind);
+        rc = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, false);
         if ( rc )
             return rc;
 
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -622,7 +622,7 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
 
-        ret = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind);
+        ret = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, true);
         if ( ret )
             break;
 
@@ -660,7 +660,7 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
 
-        ret = xsm_unbind_pt_irq(XSM_DM_PRIV, d, bind);
+        ret = xsm_bind_pt_irq(XSM_DM_PRIV, d, bind, false);
         if ( ret )
             break;
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -478,14 +478,8 @@ static XSM_INLINE int xsm_map_domain_irq
 }
 
 static XSM_INLINE int xsm_bind_pt_irq(
-    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unbind_pt_irq(
-    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+    XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind,
+    bool allow)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -72,8 +72,8 @@ XSM_HOOK(int, map_domain_pirq, struct do
 #endif
 
 XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *, bool)
-XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
-XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
+XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *,
+                           bool)
 
 XSM_HOOK(int, irq_permission, struct domain *, int, bool)
 XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, bool)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1090,16 +1090,15 @@ static int cf_check flask_map_domain_irq
 }
 
 static int cf_check flask_bind_pt_irq(
-    struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+    struct domain *d, struct xen_domctl_bind_pt_irq *bind, bool access)
 {
-    uint32_t dsid, rsid;
+    uint32_t dsid, rsid, dperm;
     int rc = -EPERM;
     int irq;
     struct avc_audit_data ad;
-    uint32_t dperm = flask_iommu_resource_use_perm(d);
 
-    rc = current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
-    if ( rc )
+    rc = current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
+    if ( rc || access )
         return rc;
 
     irq = domain_pirq_to_irq(d, bind->machine_irq);
@@ -1113,13 +1112,9 @@ static int cf_check flask_bind_pt_irq(
         return rc;
 
     dsid = domain_sid(d);
-    return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, dperm, &ad);
-}
+    dperm = flask_iommu_resource_use_perm(d);
 
-static int cf_check flask_unbind_pt_irq(
-    struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
+    return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, dperm, &ad);
 }
 
 static int cf_check flask_irq_permission(


