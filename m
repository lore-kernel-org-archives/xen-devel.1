Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC77960A3811
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gPILWqXA
Received: from list by lists.xenproject.org with outflank-mailman.1483944.1687316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Nb-0006Gg-9Y; Wed, 11 Nov 2026 14:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483944.1687316; Wed, 11 Nov 2026 14:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Nb-0006GZ-6x; Wed, 11 Nov 2026 14:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1483944;
 Wed, 11 Nov 2026 14:32:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9NZ-0006GJ-Gv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:32:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9NY-009pj0-Tr
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:32:48 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c90-e002-0a2a0a5209dd-0a2a4501914c-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:32:48 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c90-5984-0a2a45010019-d155dd2bd037-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:32:48 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2874470f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:32:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498362eb14asm10526988f8f.34.2026.11.11.06.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:32:47 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794407568; x=1795012368; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bNjUeIkHX3SknXNEAmYEjz+9ktAFmTRHfgzwyv4uXxc=;
        b=gPILWqXAZO/kkKoQoGLzrD07HEfF6igLYiHLRJhAF6FPUAVg0BTVfLAijb4Nlj3gzp
         HBxglwqWTeeq+GPkEYTRdQ9Cz0KlK3B4MbPoPN4lwW/Cttb2WYY/Jdzf7378ipqEuQYd
         DzGceFACZ/2ma24vmkfT54phJWnmdHV37lxKfKxzNQ6p+d0hl/JyMmH6QuSj//0kaa6N
         iK3mV3A1PSGor2KWyif9gacCNz9pvxgyHSnRt2thZj+xW12CS4t45+yi3WCu1ulBp/r0
         eJ/sadTbxj4ZoOMGUThOHXGCEmjcfHZNb4TfmXIfKWt3pv2PJAGTUJb7XBZNBokG21Ya
         Np6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407568; x=1795012368;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bNjUeIkHX3SknXNEAmYEjz+9ktAFmTRHfgzwyv4uXxc=;
        b=W4ypxfpKuZM9bNlIpO34XM/W91p99C6abFBf6GrBUu/iKUgv08l1aL7+PilA8IK3kQ
         0MmnIPYdzjdtEeVdBWQ1w4g8sx1MFw82/4XiUq7P8fChZ5qtfXnblfurDVh3edzqb8sl
         SGA3KdBJiIKK3h1jHp3T5cJbQCxfoS9Aa+XcKI96CAdvdcJymY01D3bhE3F9AmaFojcW
         px7o9YuI9pQJGu2ytzqv+105KuyY7skEr2H3H5kOu8YMpMcfI2w8Zr8CY/fbhMkW8MgZ
         6xGYibCDCLPiQVGfP3XQGgT7RDFwXJJrnHAlpb/lSbpl7c+5TV57PmMqwZbaI3T53k1W
         /r2Q==
X-Gm-Message-State: APuU4Z9vQwKoOYtWgelcUTo1A+v5NQQV6PTfMuAnDqUdszYSots3DDfb
	zsmZA7qRbNuAbNWytxPZSwHuSU621y7/UlTKGf63ws8ggIn43zidNVSFwFHFyjIpJt2rvmEofG8
	Ule53vg==
X-Gm-Gg: AYBFou22w+i2vnoikVUqxdEhfoWKzme3t9huQkI1MUOzNt46+6QC7bGxHTlpJRLX3C3
	A46lUGJGgrZUkxB49KQxnfM/X/dFbJSaiYbsGuf/mIpwptPlYQFzG0rRnlQzxdPyzdbwwZamaIW
	h7IFBoqRlP9snTP94jhXL0C2UgHYO2PeCRAS3wRBayA2qY0ReNAtO5Vtkk+nv3dTMe7Pu6WYZzd
	nfBc5JQPLf1AZlk9mkrby9faiPi7hJuBEdZf0Qpw/fbyCJRm47rPc1/wkFc97HEMJn5AU6dOmim
	IJ1HFRP/cc2069GryPyJOPOebCYJDHLvffIg0kRxL6Izx3+Pl+K717MUWCLaho9WhpCXqZfp2/A
	eFRYw5oPjKUldlcuMV7ToRD1rn66FR0Nkv3A0EkDl0306aUrdRPf85LyYGlFbRLYE26Hejigaj1
	dtGnQ7LoWvqDi8OzzAC0PuKH74tTbFqqpdg8n9mpdtUWPysDkM27OLTqNDM1SpBNFq8jjMxH6vj
	qKxJ8elkp8d6/Snz+hmtEuhOv9C/8Tv8BEOFCE9akfRWjX5boCu0oaLOMCVOy0dZJ2NN1mtkLHz
	Ov5Pitvrs8Zg2CjW/Xd+bT8/+HqzcgCAA80Ipt6BigJjwomkUWUNILsN/FdVN/bgsJASgzfwWt5
	WkqsHBhcSijZfFRaRSA==
X-Received: by 2002:a05:6000:2c0b:b0:48c:58d5:30fb with SMTP id ffacd0b85a97d-499c4814a7bmr4776719f8f.5.1794407567761;
        Wed, 11 Nov 2026 06:32:47 -0800 (PST)
Message-ID: <a7fa26de-1f3e-452e-9362-b9b50a96e179@suse.com>
Date: Wed, 11 Nov 2026 15:32:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 29/30] x86: permit guests to use APX
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
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
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794407568-C495A757-24849C38/10/78276251493
X-purgate-type: spam
X-purgate-size: 1451
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The feature is marked experimental (for only parts of the code actually
having got tested yet, while other parts require respective hardware)
and opt-in for guests.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -19,6 +19,7 @@ The format is based on [Keep a Changelog
  - On x86:
    - Support for AVX10.2. (Experimental)
    - Support for AVX10-V2-AUX. (Experimental)
+   - Support for APX. (Experimental)
 
 ### Removed
  - On Arm:
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -87,6 +87,10 @@ For the Cortex A77 r0p0 - r1p0, see Erra
 
     Status: Tech Preview
 
+### x86 APX
+
+    Status: Experimental
+
 ### IOMMU
 
     Status, AMD IOMMU: Supported
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -367,7 +367,7 @@ XEN_CPUFEATURE(USER_MSR,           15*32
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 XEN_CPUFEATURE(AVX10,              15*32+19) /*a  AVX10 Converged Vector ISA */
-XEN_CPUFEATURE(APX_F,              15*32+21) /*   APX Foundation Instructions */
+XEN_CPUFEATURE(APX_F,              15*32+21) /*a  APX Foundation Instructions */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */


