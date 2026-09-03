Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1949AC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:51:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406980.1640146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25ye-00074H-SA; Thu, 03 Sep 2026 11:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406980.1640146; Thu, 03 Sep 2026 11:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25ye-00074A-PA; Thu, 03 Sep 2026 11:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1406980;
 Thu, 03 Sep 2026 11:51:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25ye-00073w-2r
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:51:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25yd-00AJ5A-Ec
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:51:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995f3f-2eae-0a2a0a5409dd-0a2a4502a6a6-14
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:51:31 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995f42-6ca4-0a2a45020019-d1558029c1f6-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:51:31 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso19214885e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:51:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee60d9c6sm67076335e9.11.2026.09.03.04.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:51:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1788436290; x=1789041090; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zhIYR/oqHKXSjiZI2vs1xRVSb8E3/e1gFl+5UoCDK/g=;
        b=gZQ0InSQIIgnf/QN+fnhYNxM7L1ncmzMWz7WeaAIKm5wQa4UyMPQihbwStcWPqBOcN
         Ho5LefdzW923u1fKOiM3Xtutn71w8qP+NVV/16nQ/awD4MTLUga6FSLz/H4j50te8yDy
         aYOafifyTu509z8qUWDnztoFVy9D9Fm5iTCATN1JE4EOP7rSoxrJJIqI6fV1JmaRRtcq
         IWONGmWU6gFF1knuYo8WSWbxrzvNUreIQ77JA0kjtuvtkcjq7pakmOt1avOYX52djPYQ
         QdBWZwRJqUB5dU9/zNitJTkkmJW0SlzQoyghZjJz9+LabbRzLrOzxpwkY6L/JrktBAQ5
         NCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436290; x=1789041090;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zhIYR/oqHKXSjiZI2vs1xRVSb8E3/e1gFl+5UoCDK/g=;
        b=IrvnAUgSG/ZqoprsAFyrWXvtsFgpbXG5GCUt6vxTPYE/5/y1yfSGYCbO4JNCV8cTq/
         Tf/RBHXj2JWIx18va3ilsnUn4JT9nb6ZY7vausKcMtz5m7DLOsmFjVCZS+8wojoxChZR
         vMMKCtsiGOqBJODrvUDQDtoC4tFTK41q7FI1J1b8srj6/WwENypuDQUV2Zs/AS0423Zk
         HKuGqMcQtWa8gzSgfAS7YWVENTVsec3LN4PO0RlnK4PFCmbOPV3jih6j8SNgybMRclu6
         CG3OjOwlrEsYpEsPjQJgjWvY1V6LyNxSB2HiXV7h3tzD3acCclJNDJN0PBgUyelIPFgb
         NZlA==
X-Gm-Message-State: AFuF++nmnDAvbYU60ig1ngTIS7SJeBuQKvgqgpRQ75funH/QbFwKP2iB
	EgBF1dj6bW3RtJQ511DUcABpwJX/AqjJEOljubCr8YY/4VVkSByG9ewZYhN+g7fRQBgSmBiQPDk
	+5fE2EA==
X-Gm-Gg: AYBFou2lCXX6Y+MdwceoAga1hA2MM8oT4e0Q4/3tu5JD9Vhzf0RoHnJnIkQ957j+8qI
	LjotFu6dBwz7c2z0DbtuvhKo+zPJN5nTdYtX25NqVNS0m/P44MePdeQBhNUi3vqp6g+39z4SkzZ
	L0PCGn/2u5LdqBUN+prjqvfwktsYyvYpGy0KJWBpnhNjmhrGsD0Xvuh1tbKuG8Am46RmQxHjJIS
	kZ1AAvq6rpS2qw38AZ1qybc82o5EgbsLIMMK5zs3r1WFftYwKRtLe6Ok/v4Qi6DeG98ZiuWRxWL
	R5OIw1+SUQRAAlzs18r6j3m/J+w7giUWnKKMrFlFgYnHuBpsFn8EjjQf8Rj8tbZXAs1O2e3ACUT
	Vl1gKv5YlOVlBcyA+GtpZ0mEVowC8uHu7u6P87oZvVnYGTvU9T5o6zaXr6Plzm48rPn4BEL7+ZO
	08lFCh5LAZtOS+vbjrQFII4tHKDpyuHVpLdnpjxraN0QSn4fii6yvVIy00V4GwOzxqx2jisV2VP
	Ba+GVBSdKoxlnj2o6FeUOqCeXIK7WhmOnVPq121ff2g53KLwXkG
X-Received: by 2002:a05:600c:470d:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49ce58363f8mr171708855e9.15.1788436289991;
        Thu, 03 Sep 2026 04:51:29 -0700 (PDT)
Message-ID: <efc7a7ef-c22b-4b7d-ab5c-88dcca19f76b@suse.com>
Date: Thu, 3 Sep 2026 13:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] x86/pagewalk: avoid ACCESS_ONCE() in compound literals
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
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
In-Reply-To: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788436291-F20A82AC-376B41CF/0/0
X-purgate-type: clean
X-purgate-size: 2636

Compound literals are also covered by Misra C:2012 rule 13.1
("Initializer lists shall not contain persistent side effects"), and
(sadly?) that rule also applies to lists with just a single element, or
more generally with just a single side effect. Use intermediate variables
to overcome this as well as ACCESS_ONCE()'s restriction to be usable on
scalar types only.

No functional change intended.

Fixes: 0345b835dc97 ("x86/pagewalk: Read guest PTEs with ACCESS_ONCE()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -129,7 +129,9 @@ guest_walk_tables(const struct vcpu *v,
             guest_l4_table_offset(va) * sizeof(gw->l4e);
     if ( !hvmemul_read_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e)) )
     {
-        gw->l4e = (guest_l4e_t){ ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4) };
+        guest_intpte_t l4e = ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4);
+
+        gw->l4e = (guest_l4e_t){ l4e };
         hvmemul_write_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e));
     }
     gflags = guest_l4e_get_flags(gw->l4e);
@@ -164,7 +166,9 @@ guest_walk_tables(const struct vcpu *v,
             guest_l3_table_offset(va) * sizeof(gw->l3e);
     if ( !hvmemul_read_cache(v, l3gpa, &gw->l3e, sizeof(gw->l3e)) )
     {
-        gw->l3e = (guest_l3e_t){ ACCESS_ONCE(l3p[guest_l3_table_offset(va)].l3) };
+        guest_intpte_t l3e = ACCESS_ONCE(l3p[guest_l3_table_offset(va)].l3);
+
+        gw->l3e = (guest_l3e_t){ l3e };
         hvmemul_write_cache(v, l3gpa, &gw->l3e, sizeof(gw->l3e));
     }
     gflags = guest_l3e_get_flags(gw->l3e);
@@ -264,7 +268,9 @@ guest_walk_tables(const struct vcpu *v,
     l2gpa += guest_l2_table_offset(va) * sizeof(gw->l2e);
     if ( !hvmemul_read_cache(v, l2gpa, &gw->l2e, sizeof(gw->l2e)) )
     {
-        gw->l2e = (guest_l2e_t){ ACCESS_ONCE(l2p[guest_l2_table_offset(va)].l2) };
+        guest_intpte_t l2e = ACCESS_ONCE(l2p[guest_l2_table_offset(va)].l2);
+
+        gw->l2e = (guest_l2e_t){ l2e };
         hvmemul_write_cache(v, l2gpa, &gw->l2e, sizeof(gw->l2e));
     }
 
@@ -353,7 +359,9 @@ guest_walk_tables(const struct vcpu *v,
             guest_l1_table_offset(va) * sizeof(gw->l1e);
     if ( !hvmemul_read_cache(v, l1gpa, &gw->l1e, sizeof(gw->l1e)) )
     {
-        gw->l1e = (guest_l1e_t){ ACCESS_ONCE(l1p[guest_l1_table_offset(va)].l1) };
+        guest_intpte_t l1e = ACCESS_ONCE(l1p[guest_l1_table_offset(va)].l1);
+
+        gw->l1e = (guest_l1e_t){ l1e };
         hvmemul_write_cache(v, l1gpa, &gw->l1e, sizeof(gw->l1e));
     }
 


