Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7C7606A689
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AhBYeLIC
Received: from list by lists.xenproject.org with outflank-mailman.1503480.1699198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZiv-00075o-Vt; Thu, 26 Nov 2026 13:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503480.1699198; Thu, 26 Nov 2026 13:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZiv-00075h-SI; Thu, 26 Nov 2026 13:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1503480;
 Thu, 26 Nov 2026 13:41:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZiu-00075N-Hq
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:41:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZit-0089hu-UB
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:41:15 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0836fa-bab6-0a2a0a5309dd-0a2a45068cde-14
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:41:15 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0836fb-195a-0a2a45060019-d1558031d028-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:41:15 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4ba013938d7so66037895e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:41:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a9687sm673010865e9.10.2026.11.26.05.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:41:14 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700475; x=1796305275; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+jYP1X/LsUZTkVE+ccByXbdvGJ9GQt9K191XlKP7vo=;
        b=AhBYeLICXcFKGCMCajtMw9TGmTPmYKK/m2PYQA24KA8mh7iGQIvQ0NurE0gI/xcq8K
         xuRlD2dd9B8AAbWr7O4SCr56ARXdrnq2qEZ3nIoGHFKGJh9eJ4dbZ5cD6zXqFnRIGU5G
         ytObeGV6UatCPKfxafn9uGdlVHSZHchEGEG/nhOrkwysud+YGS9mSXqlzujWYJaB3o0G
         jotjs8He/O3WGQGLH1rn3Uyw4vJtTe+CN1VA4JbNtRLahEqGePAWK56bMZL88Af56qUJ
         kOpmBpiB4p/PeB8C/MW+F1S6tx5kxD4m4ptVzu1W3z1K1uvwiPW5qH5ORhGLojT/7b9y
         wAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700475; x=1796305275;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+jYP1X/LsUZTkVE+ccByXbdvGJ9GQt9K191XlKP7vo=;
        b=lM07vlU6p9MZucBN3Yh+77sELMa+zpThbhm6bThFjm425bq6mlQRnZslDQSEcI0V+V
         HR1A4I8M/LPvJsJ8OGeToIrirDug0fQsttugAM6pcis6ZR0kwvY0WuT3VNFsE+2upqe1
         5BWRF4EUTzAle0UeQzW/IMzYB4hmP+ZrPXYAGQ7q0yoCOBYsN4Jg5qFHMzd47gYlRTVG
         F18FjT8eBTlHZ9pw6Yld2iur7BAlAlK0G6ScDZL9YI5F2Qf2CXo+51pYWTMco8zbtKPG
         3cyZMllLx7EXEG0LJr8rCRkdvcJd3NUYTl0OSJgvSAt9UVVdIeZ8BOCKCqt8763v30kb
         7Wlg==
X-Gm-Message-State: APuU4Z/QOQbccDbrtkqABbgfw/bpKzWGQI20rZaYg1+nqlYriWdEj8uS
	uJuf7fQj7b27Mu1VCQgRhBE+WJ2cGKhJCr+61FXoo4CJPKvKIA7QxrKBJH0ku/FHdnFKdR98hUU
	9PGmyUw==
X-Gm-Gg: AZFdTZeunFDAT6Ib2fiQBYCNxuPB3Us1BVNeDagB8SucmLs1SK0xEYEhSDDUkV8569I
	cimAO9EgvFwTPvxqUO9odiR1FX/6O8lgvE5DE41kEboxCadvYlvFJfx0hOVzIstLRxZLYv/Uh2b
	AybUeNclSOyD7OkBcWSC+RXPlUgfLx/alfmWk4lACxzAZOKKq9/Bq4Ub229/K7f2B8P4+alHNvf
	PE7K0TQ+MAM/aJ8YTkAv6NXoyY3Em9PYLN/2lPHZ5ULwdRaamEsGKSD/QUIwZJ8SRfuJL0jrtIw
	i24U6u1m5B8BCLUiF2OW5UzJX7FvUAjbX2B91W9wr9eNdABcanWF/vtxkQOzrUtdloA1DnUy+ti
	ysZKF628PV1ZdXCExEoAwMOtefj1UweNjd++uxa0Y4+w1D/iVMS+T+hsnkTNxYlfhfIle1J51i6
	msC/rmx/ZEgH4+7VI7+eOFcvM/r4KxScC+RBRJOwKLhArwR240po+i1DpDaEZXik1izpNpmbZWX
	7zMXBTP4GdHV8ABGI5SAHodmlrFSmOfTeBBsHxYq9hSNIjz59YeFOJUFTXC1T03c97eQpFxOPlH
	kRCNg00DfltrwbfWoE3fZxivNxZadaCrKZnT0UrJqidzGQ/u8TSUREY8RLy+mo/9hLSLyNv7QBc
	Tw0oqBq1GqIbIjF0C
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr444851105e9.3.1795700475010;
        Thu, 26 Nov 2026 05:41:15 -0800 (PST)
Message-ID: <f12df30a-f427-4c95-be32-e9a83f8985ac@suse.com>
Date: Thu, 26 Nov 2026 14:41:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/13] x86/HVM/MTRR: use domain_vcpu()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1795700475-F5C0F77B-ABBCCDB4/10/78276251493
X-purgate-type: spam
X-purgate-size: 1599
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If for nothing else, then to reduce the number of open-coded d->vcpu[]
accesses.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -689,7 +689,7 @@ int hvm_set_mem_pinned_cacheattr(struct
  finish:
     if ( flush )
         memory_type_changed(d);
-    else if ( d->vcpu && d->vcpu[0] )
+    else if ( domain_vcpu(d, 0) )
         p2m_memory_type_changed(d);
 
     return rc;
@@ -735,13 +735,12 @@ static int cf_check hvm_save_mtrr_msr(st
 
 static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
 {
-    unsigned int vcpuid, i;
-    struct vcpu *v;
+    unsigned int vcpuid = hvm_load_instance(h), i;
+    struct vcpu *v = domain_vcpu(d, vcpuid);
     struct mtrr_state *m;
     struct hvm_hw_mtrr hw_mtrr;
 
-    vcpuid = hvm_load_instance(h);
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
                 d->domain_id, vcpuid);
@@ -788,8 +787,8 @@ HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save
 
 void memory_type_changed(struct domain *d)
 {
-    if ( cache_flush_permitted(d) &&
-         d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) &&
+    if ( cache_flush_permitted(d) && domain_vcpu(d, 0) &&
+         p2m_memory_type_changed(d) &&
          /*
           * Do the p2m type-change, but skip the cache flush if the domain is
           * not yet running.  The check for creation_finished must strictly be


