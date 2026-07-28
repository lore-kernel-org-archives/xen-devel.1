Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4940AC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:50:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374244.1621280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiCm-00067N-Te; Tue, 28 Jul 2026 13:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374244.1621280; Tue, 28 Jul 2026 13:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiCm-00067G-Qm; Tue, 28 Jul 2026 13:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1374244;
 Tue, 28 Jul 2026 13:50:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiCl-00066s-4k
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:50:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiCk-00EvdR-Hn
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:50:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3b4-2eae-0a2a0a5409dd-0a2a450ba9bc-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:50:46 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3b6-b7e8-0a2a450b0019-d1558036ad62-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:50:46 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso29242115e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:50:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45ba4b0sm82523515e9.6.2026.07.28.06.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:50:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1785246646; x=1785851446; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VGDGiJPmLE14ZfHvAKCk4xWyMnkwoww93SfDim7yWaQ=;
        b=WkvRLoUkTWG2LO9sbo7gqaI6+j3u3mBB6kGyP0bXzVSv7dLYbTzPubWjztRbyfmSrP
         rWlBxTDuxAk/adtMStVBpuPfWJ4B/AfAg+T0YYh82zu1MR7l5/iAENgMO1GV+pBJF0eS
         WwYMk/H3OopvPSRqOJKSe6yxQHyobiaz1Bn0BGdwZ8qqPMq1Dz+O+4FZDkKXDoXqaTn/
         Vdd6rg3gHnO7AaSVEaOx7866dYGg0yGSdu/R2oqustXoxttZ1AAAr7NyxWuqzsaEtYSD
         3vlgM7fdPk+XnkiwvNi0k+I/AHloCrbIP/aXJmm0VvmNbEN/5j4AEdg9zdQsAqKAYzT8
         UBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246646; x=1785851446;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VGDGiJPmLE14ZfHvAKCk4xWyMnkwoww93SfDim7yWaQ=;
        b=Dfz1ysCG7Rr1ynzM7sdMDUTyAIlkQwxT6RvY/g8ag9KkRnvyNzGBx6btAzKL8efkWU
         Czd1MVGrBpWoggEa5QZ33e80Vhcd/7206KIZ+Gqh5Ul0WxKhw39u9PSYEQVJmD8CFue8
         YHOLduszoYRLLm2RGKsEMeQ4lVY/s9oioXjfYz4Ztp1BjSukIBmskk+UKS0Z5cOEAO1H
         uwFV31cb2RBejdYsCnPS8egrhn2CjCpluVyBmVKddWz88EWix0Ot61MLiY+GxylCqTiz
         WRcjANVyUjt9rQ45/PwTMuFHrP6LUFq1jSAHRyULeyeUezcFcvb3jlwjW7tO5n5mj+dG
         Sxcg==
X-Gm-Message-State: AOJu0YxYR2ijeXExwVmTk4aJYPDuAIu6vh13Tbpi+JYW/dNmLNHEpQeB
	cgpCguzhGDAp+Ynrd9qcRyF7JEh0EDJGHmMxcMfjQC64ucU/TpHhnh6unzt6+fhzb+adr4j5KMH
	a6JnPqg==
X-Gm-Gg: AR+sD12hBF09fUNzUl3zE3n/DeF7lRCkBuP/0onZeOmsP3N0est+n9Aegu/lwaa+3kF
	Sfc80kThCUN2xZPd6dN4Imf9jAQ78P1asCceETKL89kYzk/nxBacmfAJ0Aj+mLfL6lwJC0nLFSy
	i/8ivVctZdBeFDxX3NttwgYMjCBgE1JF2lCYj3L5eLSk23RTJG7sz0pi/ftTBdr0asrO97MZk8A
	VZKiL6yitsJPX/84rrHepTGE9w1JBT7Q8+JwDl1IYYfNQyRc3C68YqixjYiWdUN4aE4hf7h64Ji
	0wnxRrkpDaajVyOgUMo/C7o0M3ctHIbfvS+XDLoo4xNT/hAk2b8hMHIILeMDlLf8gowulbIuMKE
	jz48zlg2g775UhZMeH7ad2RAG4eIKpnnxbXgiErlosZNiei3HNwApZYeR5MXyXmP4lTomuxGfAZ
	Q0bqQfPjpIc7rfsdCce4z8XrJh5oGn8byl16Eo5FBSlwb4S/iXHBzSLEnedF47okJKckTNB/CGL
	X0b
X-Received: by 2002:a05:600c:1c07:b0:496:c8d5:aa5e with SMTP id 5b1f17b1804b1-496c8d5aa8emr17145795e9.29.1785246645893;
        Tue, 28 Jul 2026 06:50:45 -0700 (PDT)
Message-ID: <9ad78491-7759-483d-8ef9-91b026efb83f@suse.com>
Date: Tue, 28 Jul 2026 15:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/7] gnttab: limit scope of transitive-only variables in
 acquire_grant_for_copy()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
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
In-Reply-To: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785246646-A9EC69EA-3DEED1D2/0/0
X-purgate-type: clean
X-purgate-size: 3238

Especially their use outside of the transitive grant handling code can be
confusing. Two of the variables were merely used as aliases in the "needs
pin update" path, while one of them was purely used because it's available
in the "already pinned" case.

trans_{page_off,length} remain where they are: They're misnamed imo, and
would better be sub_page_{off,len}.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2608,9 +2608,6 @@ acquire_grant_for_copy(
     grant_status_t *status;
     unsigned int shflags;
     uint32_t old_pin;
-    domid_t trans_domid;
-    grant_ref_t trans_gref;
-    struct domain *td;
     mfn_t grant_mfn;
     uint16_t trans_page_off;
     uint16_t trans_length;
@@ -2662,6 +2659,10 @@ acquire_grant_for_copy(
     old_pin = act->pin;
     if ( sha2 && (shflags & GTF_type_mask) == GTF_transitive )
     {
+        domid_t trans_domid;
+        grant_ref_t trans_gref;
+        struct domain *td;
+
         if ( (!old_pin || (!readonly &&
                            !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask)))) &&
              (rc = _set_status_v2(shah, status, rd, act, readonly, 0,
@@ -2803,8 +2804,6 @@ acquire_grant_for_copy(
                                readonly, 0, ldom)) != GNTST_okay )
              goto unlock_out;
 
-        td = rd;
-        trans_gref = gref;
         if ( !sha2 )
         {
             gfn = shared_entry_v1(rgt, gref).frame;
@@ -2841,16 +2840,16 @@ acquire_grant_for_copy(
             act->is_sub_page = is_sub_page;
             act->start = trans_page_off;
             act->length = trans_length;
-            act->src_domid = td->domain_id;
-            act->trans_gref = trans_gref;
+            act->src_domid = rd->domain_id;
+            act->trans_gref = gref;
             act->mfn = grant_mfn;
 
             if ( is_sub_page )
                 atomic_inc(&rgt->nr_v2_ops);
         }
         else if ( !mfn_eq(act->mfn, grant_mfn) ||
-                  act->src_domid != td->domain_id ||
-                  act->trans_gref != trans_gref ||
+                  act->src_domid != rd->domain_id ||
+                  act->trans_gref != gref ||
                   (act->is_sub_page &&
                    (!is_sub_page ||
                     act->start != trans_page_off ||
@@ -2866,9 +2865,11 @@ acquire_grant_for_copy(
     }
     else
     {
+        struct domain *d;
+
         ASSERT(mfn_valid(act->mfn));
         *page = mfn_to_page(act->mfn);
-        td = page_get_owner_and_reference(*page);
+        d = page_get_owner_and_reference(*page);
         /*
          * act->pin being non-zero should guarantee the page to have a
          * non-zero refcount and hence a valid owner (matching the one on
@@ -2877,9 +2878,9 @@ acquire_grant_for_copy(
          * updates pin counts before obtaining page references, for
          * example).
          */
-        if ( td != rd || rd->is_dying )
+        if ( d != rd || rd->is_dying )
         {
-            if ( td )
+            if ( d )
                 put_page(*page);
             *page = NULL;
             rc = GNTST_bad_domain;


