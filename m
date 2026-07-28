Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD6C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:50:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374242.1621270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiCT-0005mg-HN; Tue, 28 Jul 2026 13:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374242.1621270; Tue, 28 Jul 2026 13:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiCT-0005mZ-Eg; Tue, 28 Jul 2026 13:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1374242;
 Tue, 28 Jul 2026 13:50:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiCS-0005mS-G2
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiCQ-00BQxQ-DA
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:50:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b38b-5cb7-0a2a0a5109dd-0a2a4505dec6-42
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:50:26 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3a2-4cb1-0a2a45050019-d1558034ad53-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:50:26 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso29238695e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:50:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c44b84edsm128749065e9.5.2026.07.28.06.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:50:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1785246626; x=1785851426; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O19QP3xK+jBJGuTPifAq7K+sTyafDuxBrZmdycbbFB4=;
        b=adAUasnuXTgFIflJp5hvpDOhLBfCqhr1WHiLCRrvl6vNO4EVJDz1N7WKWqkxAXrfue
         jXnCueHCmjyQOaRgzOIEdAc/ZZ0DjbuZbKcu7UyFu9KWCMGnjW1SffwyCeEI6k9Gth1w
         mpXjnLndR4/SlS/Mr1fYI1vLNi1dnSdVsiKT5DtrL2ryDCMteZQA2NBJiBtKnS8TdpWx
         QetprwQgFYBJ5UEgG7UgjBq6efLAztQw5bab+GNhNIWWrfh0udI8c9GuLa9IL1HHuJyJ
         d80DsHsZPnOHG4ZRlWeYc3xRuS2oamhL/6qjJ4VCekTZ4SYqoRCGk1FWcHfaZTLCOuP/
         IpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246626; x=1785851426;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O19QP3xK+jBJGuTPifAq7K+sTyafDuxBrZmdycbbFB4=;
        b=ExR4QPmmnjALEUa3icukNJ6nQUG7+PUb1dtEfoxPGW1cExIbwYfjGXlKa/EBFCHdS7
         UDl/2LK1CTTFsOQRiVgMzcyClpcdrADTCMxNgO0yFPnSdRVMEyhg0kc6Tgw8+eq7IDMh
         6Ja4kk8kosg6o/XZim7b1pw6mUl7daBlEuRnyR9ha2nxO3ecjdQAWZrSPRAPMq+MtHqi
         mKqjGpjUQcOjEsvTH1iwrfr1ERg37Ur9nBIdXmue8hk/TZMsNOtNCvFRrALO9j+7ugo7
         gmNxmxkGJEEu0CvvdNVKdel2XxsboU5060A+fFMv8PddSOZOYWLaDmlQ9apM4nWItts2
         3o1Q==
X-Gm-Message-State: AOJu0Yz81Np9YzY0o1cHA0P/pCjg+Y5ExneOu4MOGGg1ifGlEDmwbGMM
	z4NfqaTD2FNPZ4C4CmIC1KlgaZ6YG4tgVrAvxVQbmPs5T6lx/xa3gujm8ZuxrBKgGUnvSIHAb9t
	OvaFpBA==
X-Gm-Gg: AR+sD11QckNunU2VI81SUMaWiWk9o2N9C0MAB7d5ulGPYaIsfP3FHauRllww4vcb1pC
	RfU4fVjHem924oFcIHKLI0DCG0SoL4/wms7mccsJV2aNwB09wtvOthgrYUrIEtMp5l3MQEy2jt0
	mVVGptnUQ7PQnA4NuFyKbF+0ft8EnvbhuleYuj7xncrBXFWUxOkYu99TlDy7iekr+rtq6UioIfW
	xSSqS3Ofk5eSph5Da6En7R8IwK78RuAeJr9gTbih1KysDhYMtCe7wJ7HZuYZ7oN7C0LEa7LBvut
	c4mE88GSFilC9LFBGynpHPIi4oavg1MT8hMqrOOlRH//3atLaqzxqJpurzGO2uP4po7A2bMYqk7
	H4TC+Xp8ouGi0Uj5o5PfCLdZGjWHQ3fpR7pwEDCA8/B0AosFcFrbcYzBz1pbFiIr0X9J/FhEFcP
	QszqWvwPzBQQLH/M1qp24zVb2f1SYXd7LIExMkgdk2hMB65Vlf0UqIKIcj/mkhrieSNOpSaMlKL
	C8x
X-Received: by 2002:a05:600c:c8f:b0:495:6b55:f938 with SMTP id 5b1f17b1804b1-496c642200emr27255995e9.10.1785246625683;
        Tue, 28 Jul 2026 06:50:25 -0700 (PDT)
Message-ID: <6b05328c-7983-44fa-a1a1-bb81eed9615f@suse.com>
Date: Tue, 28 Jul 2026 15:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/7] gnttab: add another compiler barrier to
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
X-purgate-ID: tlsNG-c201ff/1785246626-24D1E2A1-12E7E466/0/0
X-purgate-type: clean
X-purgate-size: 4105

... and mem_sharing_gref_to_gfn().

Like for the fetching of trans_{domid,gref} in the former we ought to also
fetch other fields exactly once.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking mem_sharing_gref_to_gfn() would need another barriers
added on the v2 path, but it being different sub-fields of the flags looks
to make the uses okay there. Thoughts?

Note that the calculation of cache_flags in map_grant_ref() has enough of
a barrier after it already, by virtue of active_entry_release() being
called right afterwards.

The fetching of the frame in gnttab_transfer() is hopefully good enough,
by each fetch happening exactly once. The sole risk there is load tearing,
which can occur elsewhere as well.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2606,6 +2606,7 @@ acquire_grant_for_copy(
     grant_entry_header_t *shah;
     struct active_grant_entry *act;
     grant_status_t *status;
+    unsigned int shflags;
     uint32_t old_pin;
     domid_t trans_domid;
     grant_ref_t trans_gref;
@@ -2655,8 +2656,11 @@ acquire_grant_for_copy(
         status = &status_entry(rgt, gref);
     }
 
+    shflags = shah->flags;
+    barrier();
+
     old_pin = act->pin;
-    if ( sha2 && (shah->flags & GTF_type_mask) == GTF_transitive )
+    if ( sha2 && (shflags & GTF_type_mask) == GTF_transitive )
     {
         if ( (!old_pin || (!readonly &&
                            !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask)))) &&
@@ -2793,6 +2797,8 @@ acquire_grant_for_copy(
     else if ( !old_pin ||
               (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask))) )
     {
+        unsigned long gfn;
+
         if ( (rc = _set_status(shah, status, rd, rgt->gt_version, act,
                                readonly, 0, ldom)) != GNTST_okay )
              goto unlock_out;
@@ -2801,39 +2807,34 @@ acquire_grant_for_copy(
         trans_gref = gref;
         if ( !sha2 )
         {
-            unsigned long gfn = shared_entry_v1(rgt, gref).frame;
-
-            rc = get_paged_frame(gfn, &grant_mfn, page, readonly, rd);
-            if ( rc != GNTST_okay )
-                goto unlock_out_clear;
-            act_set_gfn(act, _gfn(gfn));
+            gfn = shared_entry_v1(rgt, gref).frame;
             is_sub_page = false;
             trans_page_off = 0;
             trans_length = PAGE_SIZE;
         }
-        else if ( !(sha2->hdr.flags & GTF_sub_page) )
+        else if ( !(shflags & GTF_sub_page) )
         {
-            rc = get_paged_frame(sha2->full_page.frame, &grant_mfn, page,
-                                 readonly, rd);
-            if ( rc != GNTST_okay )
-                goto unlock_out_clear;
-            act_set_gfn(act, _gfn(sha2->full_page.frame));
+            gfn = sha2->full_page.frame;
             is_sub_page = false;
             trans_page_off = 0;
             trans_length = PAGE_SIZE;
         }
         else
         {
-            rc = get_paged_frame(sha2->sub_page.frame, &grant_mfn, page,
-                                 readonly, rd);
-            if ( rc != GNTST_okay )
-                goto unlock_out_clear;
-            act_set_gfn(act, _gfn(sha2->sub_page.frame));
+            gfn = sha2->sub_page.frame;
             is_sub_page = true;
             trans_page_off = sha2->sub_page.page_off;
             trans_length = sha2->sub_page.length;
         }
 
+        /* Use latched copies of the shared entry fields from here on. */
+        barrier();
+
+        rc = get_paged_frame(gfn, &grant_mfn, page, readonly, rd);
+        if ( rc != GNTST_okay )
+            goto unlock_out_clear;
+        act_set_gfn(act, _gfn(gfn));
+
         if ( !act->pin )
         {
             act->domid = ldom;
@@ -4145,6 +4146,8 @@ int mem_sharing_gref_to_gfn(struct grant
            *gfn = _gfn(sha2->full_page.frame);
     }
 
+    barrier();
+
     if ( !rc && (flags & GTF_type_mask) != GTF_permit_access )
         rc = -ENXIO;
     else if ( !rc && status )


