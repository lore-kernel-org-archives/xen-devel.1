Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA39CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 12:53:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448977.1664924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGyTS-0004aw-53; Wed, 14 Oct 2026 12:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448977.1664924; Wed, 14 Oct 2026 12:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGyTS-0004al-0E; Wed, 14 Oct 2026 12:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1448977;
 Wed, 14 Oct 2026 12:52:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGyTR-0004ae-41
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:52:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGyTQ-005Wdy-Gs
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:52:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7b1a-bab6-0a2a0a5309dd-0a2a4506d40a-10
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:52:48 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7b20-195a-0a2a45060019-d1558032dc77-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:52:48 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so12017585e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 05:52:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bca808casm1553075e9.0.2026.10.14.05.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 05:52:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1791982368; x=1792587168; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q/+VDWZQRxNSZfvFQaF0HGohNlNj8Digp/UjXxEXHXk=;
        b=DGcLsapiedF8BNI2hQ3xxVIfa7yXndSEHfs2nk5suNcKLyYfpHF1+YRWcXMKlwaSRI
         6zCqKznysjZYbDrXKBlWbNGymVnK9g5HTlxpbccjrSn7VD547Pn56BYGPo/y96Ajnso7
         1n2YF9Ix7ItZbrbihKXpb3Kh8l2t9C7lBXHbDSGtzWeDniTLtmemwJHndH8PGfZFphMW
         KqXZ2gFsI7HWR/O9mxpFpS1WZq+wmZm+DhZFM5T0uPlnb1riQwyLnS8NUlhaeMHDMdpL
         0Vg98r21BXwssWkje19xKRvYO3q1GZb+uKf/EsfQGvb4Er9X/yhqQilAyNNPBEQIXFoL
         A7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982368; x=1792587168;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/+VDWZQRxNSZfvFQaF0HGohNlNj8Digp/UjXxEXHXk=;
        b=cOVTaxuxSNLgCLBNXc+yKTeWmg3uWZkCrOEW1WTvTlSUgfMWkh1gANIfvMfABBLi9i
         ShaDxm3xmNnryz1yYFFDad4iRWy1ospYNgj2x9hRV1lqeGQbocdCiab051Dz56itDzHx
         wL2MM11G1ecVc/epcpxR7/jmEUTyzrlqhdSiEFI6jUAzi0qAtPNkAAt69jO8Xq++xhjo
         GO/F9sQMhPH8FrA0BYeImJ9IIydY45w+O6Q7aU3And6lr1xk7cpg6vCBBKFR/Uvq7wiI
         jp5jZtMqKyYOnozplxziXWGeQsZWabKQ04lwHjJnbLJeMuNKogFnL6sL+gLirD5LEVzL
         NI4g==
X-Gm-Message-State: AFq9FYICdB7e43uIM1FeOZ+XEBaZbJy5HS88tlrXjipmCVrucw6kT7cz
	6Xngqkvjv1AMP97pT05Upg5eYk4Dk2nmChlp/KM6RDFF3Vttek+awopilfSsikOamTTihBZkdaW
	8c9VqwA==
X-Gm-Gg: AYBFou1VdGOZ0zFYqoQJsHW6a48+zpxhOWcUBTbaQCkYn1LL6PNrMYca+/I/NXXj7Ie
	A0kUHMufL5K2dynYhT2IkPXNFtMLzAScqeAHsZrtxN0JjjjDLGmYnKjnRn4bGs8QeO0wC61WjSG
	z7A+helnU9A6bD+XPMW9D58kf5aVLR6C41yzO40YAdIDpv06g+iKU5UJXvnYQF3i3CNAutsgLmy
	vL6CINoridNl072zv30+/S5dOQ1B7ivq5GNiOF7XRHP8tqKdniS3lXHCep1GDOoPO3EimvLHsCp
	LPQTvIprwJtadvwoqijWkBA+mVmN3b79r55JbfkKRE9Ad7BDDtOGZltYiP15+2SS6RwT5XfjmEJ
	JBBE7oY0JQ5BTdX+wwbebAlNxWdMfgWvxp/fd3Ylox3ndgNlxQDfef+VpNJCuQZLNrwBPovJZd+
	Q/3CyO9ngDkc0ohH8geQ4fAAi4LRbj7UbpH/nImkJYVmT7cv02RugaCnrf+iclugbEqQlw0qf9q
	d62R8Ppc8kUlNAUg/F6eE8AmNiaGjCnD9LuIHT9GbU5e+s4LXjXk0ItiDH3rWg=
X-Received: by 2002:a05:600c:5391:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1ac6671c7mr105488805e9.4.1791982367862;
        Wed, 14 Oct 2026 05:52:47 -0700 (PDT)
Message-ID: <6d0acc68-9d07-4e0a-b27b-0095a51ebe42@suse.com>
Date: Wed, 14 Oct 2026 14:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] gnttab: drop bogus check from _cache_flush()
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
X-purgate-ID: tlsNG-16d1c6/1791982368-FE47377B-C5D80245/10/78276251493
X-purgate-type: spam
X-purgate-size: 829

There's no such thing as an alive domain without ->grant_table, and system
domains (on Arm) don't own any pages. The check should also not be left
there "just in case", because if that check could legitimately yield
"false", the page reference obtained would then need dropping on the
subsequent error path (see XSA-520).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3637,7 +3637,7 @@ static int _cache_flush(gnttab_cache_flu
 
     page = mfn_to_page(mfn);
     owner = page_get_owner_and_reference(page);
-    if ( !owner || !owner->grant_table )
+    if ( !owner )
     {
         rcu_unlock_domain(d);
         return -EPERM;

