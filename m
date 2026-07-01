Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8309CC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 09:56:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349685.1607356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werfg-0003Of-PH; Wed, 01 Jul 2026 09:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349685.1607356; Wed, 01 Jul 2026 09:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werfg-0003OY-M6; Wed, 01 Jul 2026 09:55:56 +0000
Received: by outflank-mailman (input) for mailman id 1349685;
 Wed, 01 Jul 2026 09:55:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1werff-0003OO-61
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:55:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1werfe-002rpI-J4
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:55:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a44e429-2eae-0a2a0a5409dd-0a2a45048970-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:55:54 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a44e42a-a01d-0a2a45040019-d155802ac476-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:55:54 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493bfe9f886so2326925e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 02:55:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636ce7esm16871279f8f.23.2026.07.01.02.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 02:55:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782899754; x=1783504554; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6zK63DKcNYjOuOCWSCbY08PInPJq39y+zntVNCWUd8=;
        b=bb1HvOu8lyeFAPBrVRBrC3trbLYdmzWitWi2wE9bJEEMTysfrgnOjJCMJ1f25nq9BB
         LlJwq5E24WDD/nh9dy2z/g8adzPWucaKbD2pH+FSPVusZ9WerYEXELYPa5Gc8t/c8P5J
         LWlyi4rqerdFk+pxIJJyGU2aqfpyjWaFzgCWnJtlH0zE/PUYV05A7MqJl38dzNKhbwU2
         pGd6MOnD1BaWYlf/vbOrEI2awlQ7e4K2/I9ccX8CTlekRkf3xfX7wOkLoSpaJF8+3wpm
         ZqNCj/7q8FlqRvGAVtv6cGaVqOKaivW08bLZUubcp2Zv0toD9kXFuE4Vrtx/uwqyu89W
         VlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899754; x=1783504554;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6zK63DKcNYjOuOCWSCbY08PInPJq39y+zntVNCWUd8=;
        b=gJoAvz/NBZA1hmiaC6CgnKGI2X7lTXYSdmgBJJVR9R1Bb3uiT9tMZ1Dn3naDHvXLZi
         IBkGqmu3APMyysTN279tx/QcKtvTP1G4EnFt+ICp8ltKITBf0lADejcaMnDYMtVDEBsz
         XE44zsJMcpV8F74o0P8e7l+KfMEsXoIQDS6PitHYj+5I/IyVN4lVNDEfh5xDYKIpysUM
         t99fwRFRvxbZqcBHwhGr75p9nb2lKTaRCKdgH2geB/xgsIIE/TZzkQKcaw3cjKQXqZRA
         pq6Buati4hblr9y2FcMpBi5t+cbd+fB1X4iMG+u0hzTYsoEnsSKqo2FtlIBTSx55QJ7O
         SIcg==
X-Gm-Message-State: AOJu0YyYU3Wp+uMhpsTW+0h7RJKT/UaidIm0BQSjPUIpmx9Xms2ynFnn
	cq5qGxv5HGjulL5cs1S83f9/cBfAgcwo3A++f5lghS8pyua25Xg8wBjnMXpG0Oc+On9UD/Pd9cf
	/JuQ/wA==
X-Gm-Gg: AfdE7cncOdyJ/mJtQTkkjQPeJfFvG3OoN2rBfPlEyjLH0VmNQhL95wq8nRl/tRfJaPR
	88zJAIOpVt8FQwr2L1xErX/AFxdW6w5b9jMTsUTJam9ATf+5snhaR0rxTvQqR2bdQKYZ4ZryRZs
	Nygu5anun4MFyikXJPQB8ie9lQ1RVGOFEJg/XshQ+tSjzW5jg8lvA46q4PoZB2AwkLEtHmmbKxo
	VRjbAEmiI0IY4FmoBgYW8IqBm1TdSh6lNTI+ASeYzEJTrh4pXvLrKJvrGYAZ4xuh+vtIa0ahzAO
	rT+9UUmsXGpYmjhIlbtIu8+AqXcr6nMIJBCDijVEzD2eXEu3KVB7SXHVpj9ZaTIQ2id9DOEaC0W
	fNqc7b1g0pM4Gl2+ooHweMmII1ddI7cKnABaS+5tPUdJN+SbYZGRbAUPsJ9xfEwKjxwzApt613y
	sd2MDy2bMv7AqlMyHOBtWkM7pzuzIcQF34FkNQRkQNqrriSYMHX2PbxLMCvm45BVJnEkDku5PvP
	TsJDdXPmPlgq/M=
X-Received: by 2002:a05:600c:5010:b0:490:b0e0:3de2 with SMTP id 5b1f17b1804b1-493c2ba5866mr12321355e9.33.1782899753698;
        Wed, 01 Jul 2026 02:55:53 -0700 (PDT)
Message-ID: <d2661f83-a97b-4fc7-bf52-25e99f63576b@suse.com>
Date: Wed, 1 Jul 2026 11:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Xen: correct commentary and parameter naming of
 xen_exchange_memory()
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
X-purgate-ID: tlsNG-ebf023/1782899754-ADF351CC-00CA4BD9/0/0
X-purgate-type: clean
X-purgate-size: 1913

As documented in comments in struct xen_memory_exchange, the input to the
hypercall is a set of MFNs which are to be removed from the domain, plus a
set of PFNs where the newly allocated MFNs are to appear. Present comment
and parameter naming don't correctly reflect that.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should "fns_out" maybe be "fns_inout" to further emphasize the dual
purpose?

--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2291,18 +2291,19 @@ static void xen_remap_exchanged_ptes(uns
 }
 
 /*
- * Perform the hypercall to exchange a region of our pfns to point to
- * memory with the required contiguous alignment.  Takes the pfns as
- * input, and populates mfns as output.
+ * Perform the hypercall to exchange a region of our pages to point to memory
+ * with the required contiguous alignment.  Takes as input the mfns to trade
+ * in and the pfns where the new pages are to appear, and populates mfns as
+ * output.
  *
  * Returns a success code indicating whether the hypervisor was able to
  * satisfy the request or not.
  */
 static int xen_exchange_memory(unsigned long extents_in, unsigned int order_in,
-			       unsigned long *pfns_in,
+			       unsigned long *mfns_in,
 			       unsigned long extents_out,
 			       unsigned int order_out,
-			       unsigned long *mfns_out,
+			       unsigned long *fns_out,
 			       unsigned int address_bits)
 {
 	long rc;
@@ -2312,13 +2313,13 @@ static int xen_exchange_memory(unsigned
 		.in = {
 			.nr_extents   = extents_in,
 			.extent_order = order_in,
-			.extent_start = pfns_in,
+			.extent_start = mfns_in,
 			.domid        = DOMID_SELF
 		},
 		.out = {
 			.nr_extents   = extents_out,
 			.extent_order = order_out,
-			.extent_start = mfns_out,
+			.extent_start = fns_out,
 			.address_bits = address_bits,
 			.domid        = DOMID_SELF
 		}

