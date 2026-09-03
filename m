Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1390DC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:52:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406986.1640155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25zC-0007X4-2y; Thu, 03 Sep 2026 11:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406986.1640155; Thu, 03 Sep 2026 11:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25zC-0007Wx-0G; Thu, 03 Sep 2026 11:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1406986;
 Thu, 03 Sep 2026 11:52:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25zA-0007Wc-QL
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:52:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25zA-007Gry-6v
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:52:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995f5f-8faa-0a2a0a5109dd-0a2a450bcbca-10
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:52:04 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995f63-b7e8-0a2a450b0019-d155802ac04d-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:52:04 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b8eeb3ff2so20476955e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:52:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5d1fa6sm71126955e9.1.2026.09.03.04.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:52:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1788436323; x=1789041123; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tdr/Gmp1cERSIVeOl3/iaDcbwecc4l4TxDPSodIgybQ=;
        b=DXY8sqcxV/GDAJDDH0Es6YoZcCm72JwauTXxi1LWLeRwinS6Dc5f/KFTLXoP/+EQR9
         4ArwFXAQeDnwGjMkl6S01VoahY0FwvZjjF5u99ekvMqAXoXZvHGS3TD7cvDRCqo2+3Oe
         E5CSq5eI2CsJ6TX4gBIboq+VdTWaWxXXj9mLJ1zp98LORqeA2cZKif23qk4FHH+yNYg8
         txLri98ac85ncuhMi/y9ueHazHwd+8+xy8ev0qAe3inRUQtVifC3cx5f7TVCNqGBzXnP
         LYPpCOTsLt1FKtQuh6zJ5rK7pLihj3iwl03owVKuHRW3dhO7tmWdXKAaT/slEjFloQxi
         QK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436323; x=1789041123;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tdr/Gmp1cERSIVeOl3/iaDcbwecc4l4TxDPSodIgybQ=;
        b=lJxhHr8Y74bxKJoeZTXyd5+n5lVUJX1TTLGXn9VRXqd3KzqpqsxLZZd2HEXmn1ZSZS
         sIDCqVdmKwuUT+NddaEG8E2YG+NxuYTMdfqH+U0IOJFsFKe/ClRPCCtmkFVNcltaSK53
         D3TlPiZfGidvDVnsX9BltWIR87jclDi/CHyKSEXj7cdfpwvQNbORoT4jMgSxGkRksy0C
         uyw0e09eICqGXRevq1ePblhotBzSoenvJk/phBA3aYEcthlmppEHXf+bP/WLbfuWOUjL
         aRWHnJeGjFMmiFkgMwfMIn4CzWD59+MvwzbMdrsKTG9XEs7zUC1l5NmGwFZAZsgbx6JP
         mawA==
X-Gm-Message-State: AFuF++n0SgfaUP+rhKL1a91Xyp8Q4UpmzapWQjLNgPtGLvNs3TA7KP6V
	zEnjuD3rdc9+3ZmouHFIWB1N3sk07bhlg+rAAJolYH3kFSj1DKglsGiFExqZrafOpaDWt/DhHLo
	6ruMJ7g==
X-Gm-Gg: AYBFou0GtnubWLulT4Cf0zbCO7qo2bYwqkgyIhUjobJjjfBu3JoBrp0ITsw4GbdmXKt
	N+11+bROjIdNFgiSZ3Sn1oPBK22OpnHNnX9LRU8fwlOazpthFkrWq+u4mNBxTbtvKiNNVINRwBT
	QLfVfM92gNPRYyhOdw+Y/jHw+SPh639X0IZ2n+52dfzkNPrbJ+xbA7v5AlGPIpVdcRUq4o54qeQ
	s+dll2oHxZB3GCdveidxlklWjI6YvVJxhJefVkNilaXPVx03OU6ztZX24+8OlNfsE1GLWyTz/1Q
	l5VFmq5mEZ7k+hkaidykRBXvtN7BqHyfuGosW3nG+HTqJYa4RRNFYRGE7l6PCLJhwRM3/+/bLS+
	dU+MTp9bgbQhHuPz77HgtqWcKryCmwiBujCPVUQ0xPxV9pUPBmj8bbfOywWXlGaOfLf1tTOzy5/
	7fNgflCWlhW/ZUi/HuIXbh8iRvRdUtiLJNOEZX7wicVxj4Ni20S6IRwcuKBYXAv6Ou9j6E/AKrH
	SFVn9vnGChtdXJXYOq9cLbxs/X3+eD7OXV8jwcDGzkXUC+gJ1j6
X-Received: by 2002:a05:600c:4e16:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cee069c79mr130970735e9.4.1788436323591;
        Thu, 03 Sep 2026 04:52:03 -0700 (PDT)
Message-ID: <7424be87-9a97-4b83-b920-a8ccf4c1a889@suse.com>
Date: Thu, 3 Sep 2026 13:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] Arm/guestcopy: avoid use of "current" in compound
 literals
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
X-purgate-ID: tlsNG-42698a/1788436324-A9EC69EA-E371F59A/0/0
X-purgate-type: clean
X-purgate-size: 2167

Compound literals are also covered by Misra C:2012 rule 13.1
("Initializer lists shall not contain persistent side effects"), and
(sadly?) that rule also applies to lists with just a single element, or
more generally with just a single side effect. Use intermediate variables
to overcome this.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is assumed to go on top of "Arm/guestcopy: deviate copy_guest() uses
just like their x86 counterparts", conflicting contextually but not
functionally.

--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -109,29 +109,37 @@ static unsigned long copy_guest(void *bu
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
+    struct vcpu *curr = current;
+
     return copy_guest((void *)from, /* COPY_to_guest doesn't modify */
-                      (vaddr_t)to, len, GVA_INFO(current),
+                      (vaddr_t)to, len, GVA_INFO(curr),
                       COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
                                              unsigned int len)
 {
+    struct vcpu *curr = current;
+
     return copy_guest((void *)from, /* COPY_to_guest doesn't modify */
-                      (vaddr_t)to, len, GVA_INFO(current),
+                      (vaddr_t)to, len, GVA_INFO(curr),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
 
 unsigned long raw_clear_guest(void *to, unsigned int len)
 {
-    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
+    struct vcpu *curr = current;
+
+    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(curr),
                       COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_from_guest(void *to, const void __user *from,
                                   unsigned int len)
 {
-    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
+    struct vcpu *curr = current;
+
+    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(curr),
                       COPY_from_guest | COPY_linear);
 }
 


