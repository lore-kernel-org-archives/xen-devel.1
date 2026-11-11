Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8A606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Du/beyj0
Received: from list by lists.xenproject.org with outflank-mailman.1483709.1687055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Av-0005wo-PF; Wed, 11 Nov 2026 14:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483709.1687055; Wed, 11 Nov 2026 14:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Av-0005wh-M8; Wed, 11 Nov 2026 14:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1483709;
 Wed, 11 Nov 2026 14:19:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Au-0005wb-Bq
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:19:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9At-00EK0e-HO
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:19:43 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47979-2eae-0a2a0a5409dd-0a2a450cc618-28
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:19:43 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4797f-f479-0a2a450c0019-d155802bcc03-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:19:43 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so22068515e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:19:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08de826asm45594795e9.0.2026.11.11.06.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:19:42 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794406783; x=1795011583; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XgR4CVBs2IvYVK9ZQXGZ26ZjCdVu4t0flK0Wxxf1HkY=;
        b=Du/beyj0iAt/9N18kNjzy9dU8/tpLBI0IqFgythX5Gdgjr60c5EFuHKA7y07T7AGQM
         RepMbIw6VCEbiaqtQxWcchqXGBQg+C6qbkcQjZUBs4Md/20O8sJjN9g9yOxdDj9Oxex2
         R1lmpPBAIRd+2kTWgCtE0qZcpItRX3MsYRDGZ0WwPSf/KvU9R5Q5JVjMd9bgvmOP8Oav
         5QFU5KVMPxbZPPNV8F5N5pGs6MrmdkkTQotAHANs4ZoFUNCHBiWj2w+221jAj3wQNVcn
         DGoF1vSBpHrIIHCUpSvJesfSgc8Ay25F3deh/FGp9K8RMhzHyw4/g4HO4Bv5tRYo0bmU
         TA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406783; x=1795011583;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgR4CVBs2IvYVK9ZQXGZ26ZjCdVu4t0flK0Wxxf1HkY=;
        b=R0pClybFwGYJYZ57dh8BGe9jobeswBIoMU+JaDAoEW42fO2Tmbp7+Sw2cV40GWJt8P
         ieFvghiV1PWr/TiisfAvHL4BMKIIhNjwzL3QpBwpGJ8eO7ks6H7SlBhMXSFzDp8+vPHw
         mi31xJOQYIUKYmzaydmF3nJiPArDHgu/7wcp6+nHPzWCC5BotuToNW111gK/Phm1ioNs
         x/v/+4CWNK470Nhqpu4D2yfFtnA41EfR1hrGP3pDgBs9OQymSqG0tWfJOvaxUNSlaeu1
         TiWaD+tShEpx4VZaltsV2G1VvOXPkDXXjesy77wFH64udX/uktvSpPP9voXwz12xHqGc
         fXbA==
X-Gm-Message-State: APuU4Z/4wK/0hppmyBXZht9Xaj6TjfSZ2QHRXafzKAnsO3ujbep5ANVC
	qerOwEWe9YkWnCNrlL4aPNCZ+kmA90WJULRGmSpD5W3lIy6Q4JgKVFlcMesU83VQEh28sVRXAXH
	NqkEgVA==
X-Gm-Gg: AYBFou0HYgVak3W4WnFwFbiKkeBImC9dQ3IaXV+6aCs6sPP1616MrPbSTn9+Zyl3gOf
	d1dvLY+d6YCJLOYkcP8dXReLEZAErqK/Pg3ZhKmQDxBrIutFVbcidpml9HAeVmHVWz+pD+wpFfu
	r+0VSVhJP7r6ZqYkal0WJ3e9ydRV5QpEGuQn0gM77RT6bEYxJ231sa/Dmv0w1jANNbMCvxDRva9
	YSne5bSYi2iNrOKnFylQF1n7Fgmhc2U1ylR9bYdzwZXq6bDLdAPt2hchq9j9SJggQVaA8GN5tAb
	tlzZ+hEH5TMDFEr10ddiI/JXbzCgD+U4S0MzRjNKMdQJVUs34lQHWmeG8r09jm0aqtuYt5UstCa
	rYvlvZbNN62yF+dCEO7RY0V8AXMrCIiyrK9r2adKbdK5J+NW2k/+3/c7AqWKTSBqNDk/O2+OlXl
	2MvhIDF1Q3VeWEUeunk5vNZH9aDV+QMQR2k65ND+bx0ztFz1tNmtTpNL4oFE+s6WDuf+dTqNXUc
	VdJKXIrIjaDM+xHrHhbOi3w6aNkWqeT+ZEld1FL8LVzdSCqBS3FvheWrQcoZUxhGxJ9/mhGqoop
	/0M+my+EK569UjqDuQR0BkuLfefilPRfjJ8uPEuIy/ThzM3mIzAV9WyP5wOtuf8vt0WijKpb05R
	xqc3TufVw86Q8rS2A
X-Received: by 2002:a05:600c:620c:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4ba093a9e10mr44205485e9.12.1794406782833;
        Wed, 11 Nov 2026 06:19:42 -0800 (PST)
Message-ID: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Date: Wed, 11 Nov 2026 15:19:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/30] x86: permit guests to use APX
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
X-purgate-ID: tlsNG-d25034/1794406783-50520A5B-DDC27443/10/78276251493
X-purgate-type: spam
X-purgate-size: 1503
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This initial posting is long overdue, but the series depends on various
other stalled (lack of review) work:
- x86: support AVX10
- vVMX: VMX insn handling
- (test harness) x86emul: lift macro machinery from XTF to aid EFLAGS handling

01: x86/CPUID: introduce APX_F
02: x86/CPUID: enable APX sub-leaf
03: x86/xstate: enable APX_F
04: x86emul: add eGPR parameter to decode_gpr()
05: x86emul: replace earlier relaxation of decode_gpr()
06: VMX: support APX
07: x86emul: latch XCR0 early during decode
08: x86emul: support REX2-prefixed insns
09: x86emul: APX_F REX2 testing
10: x86emul: support JMPABS
11: x86emul: switch to EVEX.R{3,4} nomenclature
12: x86emul: switch to EVEX.B{3,4} nomenclature
13: x86emul: switch to EVEX.X3 nomenclature
14: x86emul: support basic APX EVEX-encoded ALU insns
15: x86emul: support APX EVEX-encoded shift/rotate insns
16: x86emul: support remaining basic APX EVEX-Map4 insns
17: x86emul: support APX SCC insns
18: x86emul: support APX+ADX insns
19: x86emul: extend copy_VEX() for APX use
20: x86emul: support APX+AVX512 insns
21: x86emul: support APX+BMI1 insns
22: x86emul: support APX+BMI2 insns
23: x86emul: support APX+CMPccXADD insns
24: x86emul: support APX+{LZ,POP}CNT insns
25: x86emul: support APX+MOVBE insn
26: x86emul: support APX+MOVDIR/ENQCMD insns
27: x86emul: support APX+MOVRS insn
28: x86emul: support APX MSR access insns
29: x86: permit guests to use APX
30: x86emul: use latched XCR0 in x86emul_get_fpu()

Jan

