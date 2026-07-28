Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3107CC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:14:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374029.1620982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohdf-0003CN-Qq; Tue, 28 Jul 2026 13:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374029.1620982; Tue, 28 Jul 2026 13:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohdf-0003CG-OG; Tue, 28 Jul 2026 13:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1374029;
 Tue, 28 Jul 2026 13:14:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohde-0003Bv-Rp
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:14:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohde-00EpLL-8b
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:14:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab31-5cb7-0a2a0a5109dd-0a2a450780d0-20
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:14:29 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab35-b4ea-0a2a45070019-d155802bd440-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:14:29 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49548e01d02so19404045e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:14:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45e92eesm82795335e9.15.2026.07.28.06.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:14:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244469; x=1785849269; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H2ukPeiGxCPKUyvMdnH6IcL0Qr78MmoDQ6R7C+zhDn4=;
        b=SSPz4bgbBk2mnM5KGz8vRgJ1uYl+hr6jCvknA0ilFTy4EGNa5ZrsFZI24+6f/jMHzi
         6VTvy5lJtTBzHzE0qp58njZeiyTa6p/+gWFEK+QRPgb4ErT44lE5XZnkyPo0FsSf9VNE
         AqIV7/7mlkUfCUVbTLbpAA+BQyB0EiQXSjSuan4eK+bcwUvWnxumKSGZgKKkAAOcJQL1
         HmeM5zOD3VxU0XRk1JXf3J4qbGxMFlg8TxyVa+AIfOi4qf0O+p8IFbRNFECdeapKpTqJ
         Y4thlM8TBlPFUEwR3xwAcQe2qg2lul+Kw6BRKLJDCEjn7jPx3xaG7MOfn9GpFzNHF8wK
         hxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244469; x=1785849269;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H2ukPeiGxCPKUyvMdnH6IcL0Qr78MmoDQ6R7C+zhDn4=;
        b=L6nuWUCrC0ibXKNC00YTlwzQv9W3/narNgBYcHWRRVfmnAJAZVps4UOzmk8+I+ZmUw
         kqCeyCOXON1/v2cuO3UO7bP1jR0JPfgUgWc6t3cKTD2btsCQJPjIxj/wAv0mm65s5FKa
         KWac/loKRhPzei7q+1iVyV0JG1biTZPxBPxVijCwDusBKGOjraGYIaais/NIEHtJcwPy
         fvrz0QjedRCwYGKWljHy04xDuTxyk+dyUmGctSZbbPWn3hOUotFUkzUOX/Bg9muvhP2w
         nI21y8NSYzrUbgepnDjGvPxV1eE5xiAZzFv6zuMOv2sqSCQVlXu7V5CN5rhDgPRbpuuy
         z2ZQ==
X-Gm-Message-State: AOJu0YzEy7dKnQpFXd1+a3uel/IPA82Q5oQFn7sE9B3yqlWqAI3sdCIX
	uXddjXyb5YL7QsgerIp2Vgf05uzZQFb4CCvnW/0qiBoD5OOpFGONmyzv6ICXAQqPSUpUrMgSnIP
	RcpG5Cw==
X-Gm-Gg: AR+sD11AnG+Ji5+1GzhtxIMc0T2ncncPK+oeUBC6r6raV/3IwXN29Q7fdI7b4ukfBUL
	rwUHqzBDg8XKDC7urCPI6oBr+NA5JTYnr3/xbvIfjXujzsf40znTISx59jZ1Rzgs+E4Jt09lysd
	HyzeBiB3KZXkXL0IS0Jzi41L9qcsnkzxAlE3lv9NMjVsXEMNXpjClZetjnHPHo/6OM5/WEirR3G
	j85e+xO8WFyDCSyGsJT64hRqQuXZswU456XrN56eAd9c3Gr8yuRUyJOs5yC/k6FqZ/1mfkiiB9M
	i2EGeIy9u9OxmBzoJIrJjKccACQ8AeI27vIZgHlecdNzV7533wWnbVUXXQ5MVXo9vJs3LxstiE0
	fY5wTm8HUa4O84+PVn16F1Ht+twE5cQCEvnOpnyrJR1OZmNijhaDXZi82vg0wXCkyv55H1vzUTY
	ZuHrVHmTEZElJBichOdK/TYlo0Cy622dJs4dzSwkrKTKlCY6ZFz0amfB853mDCKaeQrw==
X-Received: by 2002:a05:600c:1f85:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-496c6412ff2mr26717435e9.4.1785244469259;
        Tue, 28 Jul 2026 06:14:29 -0700 (PDT)
Message-ID: <9a0a1494-1357-43d2-ba6b-532fc01b703e@suse.com>
Date: Tue, 28 Jul 2026 15:14:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 03/24] XSM: make .{,un}map_domain_pirq() hooks dependent upon
 HAS_PIRQ=y
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
X-purgate-ID: tlsNG-ef75cf/1785244469-342F4AE4-7C2EF308/0/0
X-purgate-type: clean
X-purgate-size: 2944

They're unreachable / dead otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -450,6 +450,8 @@ static XSM_INLINE char *cf_check xsm_sho
     return NULL;
 }
 
+#ifdef CONFIG_HAS_PIRQ
+
 static XSM_INLINE int cf_check xsm_map_domain_pirq(
     XSM_DEFAULT_ARG struct domain *d)
 {
@@ -457,17 +459,19 @@ static XSM_INLINE int cf_check xsm_map_d
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_map_domain_irq(
-    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
+static XSM_INLINE int cf_check xsm_unmap_domain_pirq(
+    XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int cf_check xsm_unmap_domain_pirq(
-    XSM_DEFAULT_ARG struct domain *d)
+#endif /* CONFIG_HAS_PIRQ */
+
+static XSM_INLINE int cf_check xsm_map_domain_irq(
+    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -65,9 +65,12 @@ XSM_HOOK(int, kexec)
 
 XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
 
+#ifdef CONFIG_HAS_PIRQ
 XSM_HOOK(int, map_domain_pirq, struct domain *)
-XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
 XSM_HOOK(int, unmap_domain_pirq, struct domain *)
+#endif
+
+XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
 XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const void *)
 XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1018,11 +1018,20 @@ static char *cf_check flask_show_irq_sid
     return ctx;
 }
 
+#ifdef CONFIG_HAS_PIRQ
+
 static int cf_check flask_map_domain_pirq(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
 }
 
+static int cf_check flask_unmap_domain_pirq(struct domain *d)
+{
+    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
+}
+
+#endif /* CONFIG_HAS_PIRQ */
+
 static int flask_map_domain_msi (
     struct domain *d, int irq, const void *data, uint32_t *sid,
     struct avc_audit_data *ad)
@@ -1085,11 +1094,6 @@ static int cf_check flask_map_domain_irq
     return rc;
 }
 
-static int cf_check flask_unmap_domain_pirq(struct domain *d)
-{
-    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
-}
-
 static int flask_unmap_domain_msi (
     struct domain *d, int irq, const void *data, uint32_t *sid,
     struct avc_audit_data *ad)


