Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E733606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RziWUWgV
Received: from list by lists.xenproject.org with outflank-mailman.1464687.1675558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQc1-0007dz-Gr; Thu, 29 Oct 2026 13:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464687.1675558; Thu, 29 Oct 2026 13:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQc1-0007ds-E0; Thu, 29 Oct 2026 13:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1464687;
 Thu, 29 Oct 2026 13:56:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMQbz-0007dm-Tb
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 13:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMQbz-00AYpF-6G
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:56:11 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae35060-2eae-0a2a0a5409dd-0a2a450296b8-48
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 14:56:10 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3507a-6ca4-0a2a45020019-d155dd35b898-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 14:56:10 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so1918424f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 06:56:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece14a1sm35919655f8f.57.2026.10.29.06.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 06:56:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1793282170; x=1793886970; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WB3lF7EPEE1aYa6kOgODxIiQOSUkR4cyg+8/BqTd+pY=;
        b=RziWUWgViTN+aBE0KgJCn9XnB34QXwT6NSmF/GUi4au248C88alkc8M3EYuQi3WHCn
         /wda7Fjt3W+04TEoyl1BTdAfmmjuS76zESxgIyrhTLh8fBciVM8bM2Q+TkuKkoNNL79I
         t2XJjnz39EZEzTRA5qyIOAoUD3VhMqxbrUFKOxcS9ugQiNjOuyq+NNmwEsFjtNHHp1i3
         2Cwf5gTjhblPBwvtPjdAaVbP6H017lwRkk3gEVvLP/zx5zwYhuwnpTWmw7CrQItWiKmm
         NhTwOw7FsMZ86iJSlrmyNCeSyrNzL7QuaZHtIl9xCHu+5iQnOhIey2NhiPPL7s1iqe8I
         MzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282170; x=1793886970;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WB3lF7EPEE1aYa6kOgODxIiQOSUkR4cyg+8/BqTd+pY=;
        b=Dh7D09WT4a7lZgJigKpbj6W4NDKgX06qp9gzNaJAQaXI0/8+ppTIa4gqXNDrEzv9uq
         fwZilYineORfOBcLIkdGYSCh4Dmv0zs3HjSUfLTgWVkGcjj6iwXoQ10TntQhntGc6dMu
         RYVWQR2vCmt0FovojuT8w5fLJkigWuZ3um1SHquiJhufdYTnEy1nwVKtwMsgKx35k0Pf
         4ZdfO92tYR/iY9/5FQyXb3xSF3D6wn8GfHymh+ri0OzuYnGSeVogpZXQUZiufsAmvfTZ
         kGA7BPJ8HkPyoM6xnim0mWhdSyVHv3WurpDLEb9WrIlANNuVRZ3ejlo4YI5wzG/KD7sp
         9SXQ==
X-Gm-Message-State: AFq9FYIfQbmKUjN8hGXECQ+EOtSZeb4S6LXxzcQukLbUDGItSoTcuEda
	gYghjOkoAvA20nGxpZTswuXo+IiB0cEIMNb/FAjtsrfgLvnbUAOw486iq+eIPhSLGWNKQCrcIT5
	53R5p5w==
X-Gm-Gg: AYBFou1hk4QUFXa6aFenct0tsuMsqblcvVP2M6FcV0OS9/f4j67i8c0/74LIoTJ3Wuj
	xo604BtT+5AfRmpY/ErsLP9wmJLvKnD7QRVBjkhrP0B3ngJa8L25FFShJLUdqEgO/3s3aZX+Qfh
	5Y8bLRqxjNlW6d+WQq0+h9XdVHN7QPgEwFT0DrkjYRIt6gwpli+TWOe6vjH+wYRspr358zy7hXt
	9p//7AXcIcCch4rui5Ii6wNHuBJgUmWTYIYw5e5Lp/cqt6NNx7F9R438GSa4DTlnBKlGyXVufXH
	Xp1rPWuw1ZcYcPoiKH1nQdbM4+4Gzfne4np1vWrJMvDbKuprPjXBILK1nwh9kObueVev98zzb5e
	yT/fnU66CKLaA+RAZB4xsf1kGe46NxAjV4VEk/NbilLvJJtPuoXpFsW0/RZFGvrChWNV5XD2Vps
	Jj0VrNYfZC+KoUnkHqIX3f8iRGeQ0o5YoAEzrUY/sDYY5hUJGtrmEJ6jTi2gphI9SKX3VO6Cf7t
	GtkT3s9Wsh/yxZSF2c1RE8HA/LS8m9YFNOZi2L14zbj0OMl++oVLgt12Mr4g065t/wJd0qCe8mm
	BjvLmTlbgobTKiwHIToDsPSqVolj18JVtgRuZxuyNkD0hV+tj2bTTcs7SllD7orKs7P9II3nH5l
	8Ei+8vNRawh8Ri720ZQ==
X-Received: by 2002:a05:6000:2006:b0:48d:faa4:5b66 with SMTP id ffacd0b85a97d-48e5d2f95cbmr13557122f8f.36.1793282170394;
        Thu, 29 Oct 2026 06:56:10 -0700 (PDT)
Message-ID: <c9bb9cf4-9171-402c-b6d7-14ba45618c6b@suse.com>
Date: Thu, 29 Oct 2026 14:56:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: shrink (pack) struct periodic_time
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
X-purgate-ID: tlsNG-720697/1793282170-30FCE2AC-9EFFA85F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1359
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Except for warned_timeout_too_short, which is used with
test_and_set_bool(), the booleans there don't need to occupy entire bytes.
With them converted to bitfields, pending_intr_nr can move up into the
vacated 4-byte slot.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -21,19 +21,19 @@ typedef void time_cb(struct vcpu *v, voi
 
 struct periodic_time {
     struct list_head list;
-    bool on_list;
-    bool one_shot;
-    bool do_not_freeze;
-    bool irq_issued;
+    bool on_list:1;
+    bool one_shot:1;
+    bool do_not_freeze:1;
+    bool irq_issued:1;
+    bool level:1;
     bool warned_timeout_too_short;
-    bool level;
 #define PTSRC_isa    1 /* ISA time source */
 #define PTSRC_lapic  2 /* LAPIC time source */
 #define PTSRC_ioapic 3 /* IOAPIC time source */
     u8 source;                  /* PTSRC_ */
     u8 irq;
+    uint32_t pending_intr_nr;   /* pending timer interrupts */
     struct vcpu *vcpu;          /* vcpu timer interrupt delivers to */
-    u32 pending_intr_nr;        /* pending timer interrupts */
     uint64_t generation;        /* distinguish two armings of the same timer */
     u64 period;                 /* frequency in ns */
     s_time_t scheduled;         /* scheduled timer interrupt */

