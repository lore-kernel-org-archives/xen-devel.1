Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7154C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:51:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374253.1621289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiD6-0006eo-57; Tue, 28 Jul 2026 13:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374253.1621289; Tue, 28 Jul 2026 13:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiD6-0006eh-1t; Tue, 28 Jul 2026 13:51:08 +0000
Received: by outflank-mailman (input) for mailman id 1374253;
 Tue, 28 Jul 2026 13:51:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiD4-0006cW-EY
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:51:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiD3-00BRHU-RL
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:51:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3c9-5cb7-0a2a0a5109dd-0a2a4505837a-0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:51:05 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3c9-4cb1-0a2a45050019-d155dd34dc83-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:51:05 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso3499450f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63bd3sm58862990f8f.27.2026.07.28.06.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:51:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1785246665; x=1785851465; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VmsmB3SZeOUc6ARdQUTuy227vcpv9NvZgtecFoLVbnQ=;
        b=PlyahEoMAkNJnMPwvL3Afr4EX87EozkpBZrMqh9bwRT+j22wZcmw5rFeP624PXP4VA
         hetl9IqBI3UwcKeOVk3F+rWFf+7i+b+5o0KTOkYe4QtR3u8yi07PiWTg3xjyAd8+LtG0
         S42qcEMwS2Kbxo9VRJVtp2FgDUx+0BPDqvtC1m8mjyv9sbid9oLKhe/6zQaGtq5UOkDC
         9GjRMy263qsrIK7IHaOiAlgCObC56KgGaId9BsxlcktBiqhqEEHhy+ZmBXZpDxJG7d9c
         kMd58dvwUtS1gK1+DZUlVLGEmBnuZv6yniFmbLTpXAbhLZkDROAySdSHiFRQw4hOJoMq
         JaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246665; x=1785851465;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VmsmB3SZeOUc6ARdQUTuy227vcpv9NvZgtecFoLVbnQ=;
        b=NV7+gDKFHCV5W6HNWkiCssWgo0mJwH8jnAHOmwIlmddnU1LBQB+v8sFVAA3xq77LGS
         BwRHPlLOLK8g9mAxBNse/z1kbpK2rutR4B905w5PVId4UxLgxbVgaBsjrAHA++hxdikq
         H+1lVbK8BkKK1aBbbPgTBwEKPF8qdjoQwwo7+YQf7tiHd318Wc/Gp8OvJJT87T/EOS30
         cPxTccpTWXu8FF2Ytt24dI4RQifD8d0Sv04vK+1DnnirX+UqWYnkiBCWt6T1Lm0zDqtR
         8y/uGhNsxIl+UFxjVZ48WNHVTO/4xvjukpC4WBMVjvhCKUXFDkGeUx3Gc+xdrREgCJf0
         2NVw==
X-Gm-Message-State: AOJu0YyhN149SVWsse2Oqo6svorN6o5HFf/o/dr1aO4Edrn4KNA8AbXI
	kE5b74xlYITirWD0DU4f3nMg0QdtsutZK6xmnP/VuPfFiGfay+KsIOb4v1/WKZ6glui6NjIySOW
	QEh+Fug==
X-Gm-Gg: AR+sD125B/O+S7iMuWHS/bESZ4L3iqy//EAxKA6k75G8caBLejVTcyihG89WgSVUEjH
	x6utBjLSjXWEJcORdk00fGgjWyy1RZmSubeaQUXWuzvWXvlhBWzknDCDZtr8M9WZQ2Y4Es1Eck7
	NX2K2pKXPqx3i/ie+AXv43VlVIgdaQkxTqhQlVyFTPRqsP1/TxtpEFnW44uKApWERsVFQ8NdCok
	XNqOjcp9exf1t3oD2rR+w5rggMikSEBuQFgbKKTM+xdM2AGRwC0XpK6OblvaHUWzLir3TzBb3mF
	DPgs5y5euROi0xZqfw+411iE5kGN6YWOpcSaToVngGGi6zqGFCTxroF2e3K3ejoqI1dD4NiD9bz
	2AYFuXMNa0yGljs77/HAuaR0s33qELn+7GNEzJvD4/07NARHqC+6nQqn+78me6a2KQRNe2OFEd3
	wfHFq1gPfqAsK0uwVVxpG4ei6Ei4uyk2W47ywSzF7OXYsUw8brgF9xfRwuqzjIdXHgqQ==
X-Received: by 2002:a05:6000:707:b0:47f:90df:4ec6 with SMTP id ffacd0b85a97d-47fb1e5ffa9mr2814316f8f.6.1785246665147;
        Tue, 28 Jul 2026 06:51:05 -0700 (PDT)
Message-ID: <7392c56e-7250-496f-bb66-bdb6c04d3ed4@suse.com>
Date: Tue, 28 Jul 2026 15:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/7] gnttab: fold redundant error code paths in
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
X-purgate-ID: tlsNG-c201ff/1785246665-F4EA12A1-19DF5A0E/0/0
X-purgate-type: clean
X-purgate-size: 1370

One of the open-coded error paths of transitive grant handling is an exact
match of the code at the unlock_out_clear label. The other can be made so
by moving the put_page() earlier.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2729,10 +2729,7 @@ acquire_grant_for_copy(
         {
             atomic_dec(&rgt->nr_v2_ops);
             rcu_unlock_domain(td);
-            reduce_status_for_pin(rd, act, status, readonly);
-            active_entry_release(act);
-            grant_read_unlock(rgt);
-            return rc;
+            goto unlock_out_clear;
         }
 
         /*
@@ -2763,17 +2760,16 @@ acquire_grant_for_copy(
             release_grant_for_copy(td, trans_gref, readonly);
             rcu_unlock_domain(td);
 
+            put_page(*page);
+            *page = NULL;
+
             grant_read_lock(rgt);
             atomic_dec(&rgt->nr_v2_ops);
 
             act = active_entry_acquire(rgt, gref);
-            reduce_status_for_pin(rd, act, status, readonly);
-            active_entry_release(act);
-            grant_read_unlock(rgt);
 
-            put_page(*page);
-            *page = NULL;
-            return ERESTART;
+            rc = ERESTART;
+            goto unlock_out_clear;
         }
 
         if ( !old_pin )


