Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962A1C55838
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 12:31:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382130.1625508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrEI7-0005n1-Gy; Tue, 04 Aug 2026 12:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382130.1625508; Tue, 04 Aug 2026 12:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrEI7-0005mu-E6; Tue, 04 Aug 2026 12:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1382130;
 Tue, 04 Aug 2026 12:30:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrEI6-0005mo-2o
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 12:30:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrEI5-000bEY-7M
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 14:30:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71db67-e002-0a2a0a5209dd-0a2a450ad7ea-44
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:30:40 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71db70-f2d2-0a2a450a0019-d1558035b139-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:30:40 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49545ba3d4eso15440815e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 05:30:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41d17f2sm47140603f8f.2.2026.08.04.05.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 05:30:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785846640; x=1786451440; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tD8l2te+mjYfra2fISPdgTAYo6a1/PWVUQZcpuPMPqA=;
        b=GRMig7i9cvXEeMTERAjZw7i0Xy1md4hJ1cqzuCYxEEnjE4wazw2+FaHjVjaLNvrR3h
         x14i/RGxZ8tPrHLiy3/+0/byV5hnFq5qdO57gGcd1TwoudZ85vT9JTVaNCnH54XeGv1/
         KtZlmflXNZ/0ARDb5DY1KnyXa1BbRYhmp2WB6xbVL8G0hKuopvOqki19KdYTP3v1Y5dt
         P2PKyrFwjEaHX78El86fPFUDgm2DkB/I+T13P6/0Yz9IbIksQnv2Rhyv2cyteof+mqrL
         Dz8n8XaMzj3jQHe1hFG5Jt9LJ6aEhws8UhZXN5d7E4qn44naQhkZ/uKp3XUY2uSVaAv7
         rj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846640; x=1786451440;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD8l2te+mjYfra2fISPdgTAYo6a1/PWVUQZcpuPMPqA=;
        b=oryiNJbpmMIpKNgdyoBWNrJs94JC5yAq0S9XhoWaSUKZ9pvXGon46AMOL6qS75aII5
         zikzJ1ACnjunhTeajbgfwg2yZtzoApR3GH85IG4/pRab6xPFOodV+lptfaxgDbqRZa+n
         A+/XzE5QgaJKJlHZlzOE6apfqQwo3q95u65kUliTdJmsOCiVJcuaxJP8H2/iGE1VD0m1
         2azRRO14oEiy4BEv/NbI0A1VSgwVe9DuKUEZ+lWAhrIqevoeBUUNHAE3TdWWu0HX0aYV
         AmM+zGXk1yYcWx+dgu1qCZYDMctdnVBYv1U2fOVDh0r/LraaJmxdO+hTRrN8JisCLW6i
         WdNg==
X-Gm-Message-State: AOJu0YzhqzkVq+B5W0HeQsWdVIPRdJM45KHEgctoT7kj/dfGWRxSUXlo
	sFV/NLFgURpJMY561Opy/XuZCNPsScxOAAu+/JSvl/RGI9lx5R7pdU589OhrBwcBgTsu3jRl/19
	CZfr8lA==
X-Gm-Gg: AR+sD11JEqq1FKUgMOFjmczTvDUAuqtTu1lGRRB6D72JkdmXCOsr4RFgodn0bXXdipe
	HjT6xf5+tofz1GeW6lCFelsk48ZTl3tSfpo2zCrZX8D/vz8AAIVmhOyRD5JpaVI+6F5DyiGp7Az
	b0EsQl5OuTPJWv+k3+B5ZVl/9OCoPvjhO4f2FO80A+kk9UI3GBkl77Cbj+UqiaYyNB+qJVigHUX
	SfLnFaX+iO39mx17UV1Odrf3ZP1SrP6kL0tz+qBBFsP1Xrft01I3tbjTMQV9p9NM6Xrm5Em8wmq
	jHeVDT6zLOtlT2cWfFAnw+nEIHHt54XGqWw4OKOWfM8sf9RBEIuahIcBelrOQ/V13s6vFcFXiL5
	jcQO2Dj1rCCXdYukZfZeZT8w9qIteHvpXH3r4tUDNpRvUvphQLJUax6Fs9w+91BC0FkHr+syGaH
	P6iDb0430mN2b/79zMaO8MusCdktUKIWblOVq4jZBsuuneoaoI0MvXEPi+i87HiI861cq6CcHyh
	dwt0XNQ6LlNtvqqsP0MaM9LgwMca2upKSXwPSA2N4YeXzXZa5C+
X-Received: by 2002:a05:600c:6d03:b0:495:7a23:1eee with SMTP id 5b1f17b1804b1-4980c674f32mr243964825e9.12.1785846640329;
        Tue, 04 Aug 2026 05:30:40 -0700 (PDT)
Message-ID: <25cf9c88-7589-4a5d-994d-45f488a3e00b@suse.com>
Date: Tue, 4 Aug 2026 14:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] radix-tree: drop radix_tree_init_maxindex()
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1785846640-4A9D9CFC-F5BD7A87/0/0
X-purgate-type: clean
X-purgate-size: 2590

Radix trees are in principle usable as soon as memory allocation works.
(Radix trees with only index 0 populated are usable even earlier.) If only
there wasn't height_to_maxindex[], which is filled only by a pre-SMP
initcall. The benefit of this array is rather limited - the calculations
done by __maxindex() can as well be done by radix_tree_maxindex(); the
overhead isn't all this high.

Fixes: 21844b0e32e7 ("PCI multi-seg: introduce notion of PCI segments")
Fixes: 8dc6738dbb3c ("Update radix-tree.[ch] from upstream Linux to gain RCU awareness")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Two Fixes: tags because the use of a pre-SMP initcall was clearly setting
up a trap for later code to fall into.

I know for certain that I've seen logs of Xen running on multi-segment
systems. I can't quite explain how that ended up working.

--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -32,12 +32,6 @@ struct radix_tree_path {
 #define RADIX_TREE_MAX_PATH (DIV_ROUND_UP(RADIX_TREE_INDEX_BITS, \
 					  RADIX_TREE_MAP_SHIFT))
 
-/*
- * The height_to_maxindex array needs to be one deeper than the maximum
- * path as height 0 holds only 1 entry.
- */
-static unsigned long height_to_maxindex[RADIX_TREE_MAX_PATH + 1] __read_mostly;
-
 static inline void *ptr_to_indirect(void *ptr)
 {
 	return (void *)((unsigned long)ptr | RADIX_TREE_INDIRECT_PTR);
@@ -80,7 +74,16 @@ static void radix_tree_node_free(struct
  */
 static inline unsigned long radix_tree_maxindex(unsigned int height)
 {
-	return height_to_maxindex[height];
+	unsigned int width = height * RADIX_TREE_MAP_SHIFT;
+	int shift = RADIX_TREE_INDEX_BITS - width;
+
+	if (shift < 0)
+		return ~0UL;
+
+	if (shift >= BITS_PER_LONG)
+		return 0UL;
+
+	return ~0UL >> shift;
 }
 
 /*
@@ -705,27 +708,3 @@ void radix_tree_init(struct radix_tree_r
 {
 	*root = (struct radix_tree_root)RADIX_TREE_INIT();
 }
-
-static __init unsigned long __maxindex(unsigned int height)
-{
-	unsigned int width = height * RADIX_TREE_MAP_SHIFT;
-	int shift = RADIX_TREE_INDEX_BITS - width;
-
-	if (shift < 0)
-		return ~0UL;
-	if (shift >= BITS_PER_LONG)
-		return 0UL;
-	return ~0UL >> shift;
-}
-
-static int __init cf_check radix_tree_init_maxindex(void)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(height_to_maxindex); i++)
-		height_to_maxindex[i] = __maxindex(i);
-
-	return 0;
-}
-/* pre-SMP just so it runs before 'normal' initcalls */
-presmp_initcall(radix_tree_init_maxindex);

