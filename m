Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991E8C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:51:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374260.1621298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiDS-0007Dl-CK; Tue, 28 Jul 2026 13:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374260.1621298; Tue, 28 Jul 2026 13:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiDS-0007De-9S; Tue, 28 Jul 2026 13:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1374260;
 Tue, 28 Jul 2026 13:51:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiDR-0007CA-4w
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiDQ-00EYdu-I1
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:51:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3d4-e002-0a2a0a5209dd-0a2a4505de42-46
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:51:28 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3e0-4cb1-0a2a45050019-d155802bb802-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:51:28 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so23621965e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bffc501sm250222935e9.4.2026.07.28.06.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:51:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1785246688; x=1785851488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mw7VsvfNJTXTcegWX2idkXl4Jj1/NWvy2zHyn00rWXA=;
        b=EuUOjQSwyOnANwlE/lyXstis7npwmig/W788G+QJaYNXFDPb0JjJJS8Yd2w61BgM92
         3BLP1tmDgVG+49+0SH4wZ+99GLk5CFxvg50iVW8Ec0lIaON4TcTfeVR8Qr9yudP1FsIi
         PfrJkWlr0QcQzjWExR83RxZ+C3jzmyAMo84RnEZ2w6655mjBeJxAwjdco2+E62tUn8ZS
         l8kpTF5jpe0CVzO4E2y+CMfiukxsyAeOPwEFIH9+zNGW89thpVfFCSHjkjKEAX7YtIkl
         UU3T6WiY1XheUSTZxIpWopFZYVxKvs5ayg5NRrmbpLc6pkv/Zkl0GyE0agjB5pg4v1OO
         /5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246688; x=1785851488;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mw7VsvfNJTXTcegWX2idkXl4Jj1/NWvy2zHyn00rWXA=;
        b=hsHHfOz+U7BZOiQBZzFSlhw2MJjU3KnsECPTgsrnvO5MsiqIba6Gn76+wZNk2D+Jx2
         /044yTRvUSZnL8bUXMvuFD+2j+eNznKxcY4Kf94iGffgIJ6iqb/636sdiGVh6mNAenKa
         jPXafp5zstPgDvRs87P5ony8ZEL3zjsJzts5so6GITeRUNR1GbJqu5lNypwxo/HAThcH
         uJKX6IAmc0fZgS6rh0RouL8KHAS6c7gx6B+7Ve0sqfCoQAbrfKbWsIdNtz1Exrwmc84v
         Gvm+Js4Se4Q+OpESVb7feky6vNGQEAQl3oyZcZb80FLjXXb+IA4khIIaf96zk74q0vhp
         99aA==
X-Gm-Message-State: AOJu0YwoYKBpyeAa1Z1JtX9tKr8b3DF0ERImt+TLDbaOYn6kqKvaz37k
	Rbta8hjdQXCo4tLKiM/9m+B0dZL7yshU9RRZ1lIdfbSBeDJuuCf1kb5rJvbzhNXxp3XXA9E0BNR
	Ckb4QTA==
X-Gm-Gg: AR+sD119CEJwr9RdV2CvYzhSxJabSHc4XoCD3jcfimzPAr2c5N4N491XPMEHeBEzN4x
	pBfeG9UHqVnqSpkDlJSMAhEXH2XlJZerFr6mj7x8uKnhx8GaG8bCbVLVplPJgTfIS4dmBf/pZUd
	2tt9IAiB0rZmo6qCgRhafS7RujaQ1qxxQhTQhVn4lgoobJklAg0hthmLYFeflR/Bc3jztcRGZWH
	pNtM/kuaLo15A+ceNGh7rfQUpO6bbyav6QzHcfqLe4K/355pSXRgfgyDU35xutp2ZrQQXvrwc6y
	uIwxuDTcKR7xCjKBCm7FymjVlPoMgEcDlTkirj9gUsRYnKQ57bjjj0vcc4kb66BOx5DIWC2LkCj
	hN4lR3VNxEnuteZmDZM0xFjVA4QQMWtkhLPjLlkWgzCWy7uFyVAEMLLUHN15JzhJOGWKhogt76+
	rbZbJyb9OMn8SGv9KBfw7Y+KdJjdbI2tNQ/+7v15Ocj6i+9dgHzPBWtRgs4WZuU2EIJw==
X-Received: by 2002:a05:600c:3e18:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-496c6569058mr27439655e9.25.1785246688035;
        Tue, 28 Jul 2026 06:51:28 -0700 (PDT)
Message-ID: <47051ab0-fce2-4c9d-8e45-ab4b598fc2ee@suse.com>
Date: Tue, 28 Jul 2026 15:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/7] gnttab: use available local var in map_grant_ref()
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
X-purgate-ID: tlsNG-c201ff/1785246688-6BEB92A1-013C0595/0/0
X-purgate-type: clean
X-purgate-size: 746

Commit a62776332cac ("grant_table: harden bound accesses") introduced a
local variable "ref" in map_grant_ref(), but then didn't use it
consistently throughout the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1324,7 +1324,7 @@ map_grant_ref(
      */
     mt = &maptrack_entry(lgt, handle);
     mt->domid = op->dom;
-    mt->ref   = op->ref;
+    mt->ref   = ref;
     smp_wmb();
     write_atomic(&mt->flags, op->flags);
 
@@ -1366,7 +1366,7 @@ map_grant_ref(
             status = NULL;
     }
 
-    act = active_entry_acquire(rgt, op->ref);
+    act = active_entry_acquire(rgt, ref);
     act->pin -= pin_incr;
 
  unlock_out_clear:


