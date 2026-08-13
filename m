Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950EC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 15:37:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390232.1630745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXUc-0008Kv-91; Thu, 13 Aug 2026 15:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390232.1630745; Thu, 13 Aug 2026 15:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXUc-0008Kj-4U; Thu, 13 Aug 2026 15:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1390232;
 Thu, 13 Aug 2026 15:37:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuXUb-0008I3-2D
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXUa-00DYu7-FL
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:37:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7de496-8faa-0a2a0a5109dd-0a2a450b8a4c-26
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:37:16 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7de4ac-b7e8-0a2a450b0019-d155802eb415-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:37:16 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4998590d392so737645e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:37:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b0f6b1sm71714325e9.4.2026.08.13.08.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 08:37:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635436; x=1787240236; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saE5g8Am/lNHGtqQTN89TgfreqlX+yvOtgKlUJ85WoQ=;
        b=BTHiipQBcrT+c1ethwJPXDUBfW+NoDrSbwmIo8RQR6HVP+1jeFNAMei3obaGg5qui0
         iikASwWvKvmomqL6KdjFJh5TUoxiqUCZdk3eO/qZZO6CrqfxPnKWq54w5zPuSMSQXOKE
         pBpwlF+AFjj/T4mtNpldf+/EuJQbjju2S5lBIXT5QsXgPI9/YkUMOH1Z3tNCviWU58KG
         q/2YDmS2T0w9i2bwCa3DtShySeamSNVcMF8/ABOiUNqYg4wVfOJAip/m0OLBUHCw24ID
         TQ9J5TngKGxrvvuB60ddHmQ5Z3iFJG2knDPCyDFqF0e35HqViR2Uq/KTPwlfyfXzTMtt
         o59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635436; x=1787240236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saE5g8Am/lNHGtqQTN89TgfreqlX+yvOtgKlUJ85WoQ=;
        b=q7AhayH2Pd+SS1NDsFVzHWiZjPrl/IJeQQWIFzkvSUoCctgCr0thyuelWcJjnaOlW5
         Zx3UG5tw4R8O3ah/J275+rrSIxnZ9L968QupasurpuI/9bOvdCDUCD0kWF4DuQrLEuxt
         bRF5mFBfOTsaIeEywoYH4MmrH5I1C13F8kcn8nhreF4WU3/ud78mTgpjXLqZ7sBtxl/v
         0uGZ4/o6qAHAanUXgtZbe3WKQtvxJOso+UaC6kJFPHuq2xj4xDSKbqJF4gHxRKZTDg75
         SxaPsEIamNMiOvMTMjHDU21p1Adx5s0oUVYYYiU8IiIJ1B91BBbjpwCS5E9bWe1vHfs3
         Gyng==
X-Forwarded-Encrypted: i=1; AHgh+RoLffeMsym390EB9BwgeWcaa430E1wfY/EFs6JtyN6BDu6dK+BLnaIllqNh9SHZvUaVIJqCSLqZ4/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfI9MOBj5zUp1gaq38DQIZOjInGtQWz5uCfmOmRYVF9s+RHb5P
	neR6ttiniS5d01wLO7pUtqfSuZlNPBytlrZsQzyqhSJc/33A9OiMdEQG
X-Gm-Gg: AR+sD12AA3FBTdj6i+vDQdWmifChNO3Ki0VK3fHVM3GiM8GDcRLvLJG6i4h8Q/88YTx
	SxaF5dDp7Z5/5rd+6MIXp1BQPOhHAFdpCIH4U04/mgM5rdJdksXUgmj+8c4qF5ot6/DejkG2bmG
	5txoRKUpQcyXJGNgJD5TveR0c+qjxssGgan6M8LZ6V+OSqFXhiBPwVbi3/t/Dy5kFz+zdPbTWLv
	Ss/kHjykVhM1gLSIUgooQ+CMQx2SzSXPh2cTe8cP9T4VebeexlXscGZSfg3Z3E9E0Kzogq4REAh
	41p0UpqxViDFYnp9ZMjZaAOQoisdiL/KLRtLVFQy75bAd/TgOEdHbnRW6zc8joQNKOkVlgslgwA
	qdgx5TWocZj9eIOX4a6hWF+IuOfNGayw+Vz/BKOD8v2rswlJ916Yq6nl9uR6qwYChgPIu6rQPdS
	gooH3T9KEsffnm01DlnVUBLyZU+WlDh2mgW/jY+BdAY3wXLak2jikv7ckJq2kmQjwoOCHjZJCxf
	hZqh4vLNl1XUIed26+3/uNJmsdxDtOxgBJaag1gKHM=
X-Received: by 2002:a05:600c:c054:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499821fa293mr63218975e9.15.1786635435706;
        Thu, 13 Aug 2026 08:37:15 -0700 (PDT)
Message-ID: <9abc0091-43e5-475e-ae61-697f480dda5e@gmail.com>
Date: Thu, 13 Aug 2026 17:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/20] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <59b5b69f53ef81d68fd279d9ee0c03f5ffbbc2ae.1785836421.git.oleksii.kurochko@gmail.com>
 <3bb59f64-7ff1-4bdc-b951-cfb78671e8f9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3bb59f64-7ff1-4bdc-b951-cfb78671e8f9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786635436-1A6DA9EA-C47A66DF/10/73395122804
X-purgate-type: spam
X-purgate-size: 9730



On 8/13/26 9:19 AM, Jan Beulich wrote:
> On 04.08.2026 17:47, Oleksii Kurochko wrote:
>> @@ -120,29 +148,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
>>    * and strncmp() is used in match_isa_ext() to compare extension names instead
>>    * of strncasecmp().
>>    */
>> -const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>> -    RISCV_ISA_EXT_DATA(i),
>> -    RISCV_ISA_EXT_DATA(m),
>> -    RISCV_ISA_EXT_DATA(a),
>> -    RISCV_ISA_EXT_DATA(f),
>> -    RISCV_ISA_EXT_DATA(d),
>> -    RISCV_ISA_EXT_DATA(q),
>> -    RISCV_ISA_EXT_DATA(c),
>> -    RISCV_ISA_EXT_DATA(h),
>> -    RISCV_ISA_EXT_DATA(zicntr),
>> -    RISCV_ISA_EXT_DATA(zicsr),
>> -    RISCV_ISA_EXT_DATA(zifencei),
>> -    RISCV_ISA_EXT_DATA(zihintpause),
>> -    RISCV_ISA_EXT_DATA(zihpm),
>> -    RISCV_ISA_EXT_DATA(zba),
>> -    RISCV_ISA_EXT_DATA(zbb),
>> -    RISCV_ISA_EXT_DATA(zbs),
>> -    RISCV_ISA_EXT_DATA(smaia),
>> -    RISCV_ISA_EXT_DATA(smstateen),
>> -    RISCV_ISA_EXT_DATA(ssaia),
>> -    RISCV_ISA_EXT_DATA(sstc),
>> -    RISCV_ISA_EXT_DATA(svade),
>> -    RISCV_ISA_EXT_DATA(svpbmt),
>> +static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
>> +    RISCV_ISA_EXT_ENTRY(i,            true),
>> +    RISCV_ISA_EXT_ENTRY(m,            true),
>> +    RISCV_ISA_EXT_ENTRY(a,            true),
>> +    RISCV_ISA_EXT_ENTRY(f,            false),
>> +    RISCV_ISA_EXT_ENTRY(d,            false),
>> +    RISCV_ISA_EXT_ENTRY(q,            false),
>> +    RISCV_ISA_EXT_ENTRY(c,            true),
>> +    RISCV_ISA_EXT_ENTRY(v,            false),
>> +    RISCV_ISA_EXT_ENTRY(h,            false),
>> +    RISCV_ISA_EXT_ENTRY(zicntr,       true),
>> +    RISCV_ISA_EXT_ENTRY(zicsr,        true),
>> +    RISCV_ISA_EXT_ENTRY(zifencei,     true),
>> +    RISCV_ISA_EXT_ENTRY(zihintpause,  true),
>> +    RISCV_ISA_EXT_ENTRY(zihpm,        true),
>> +    RISCV_ISA_EXT_ENTRY(zba,          true),
>> +    RISCV_ISA_EXT_ENTRY(zbb,          true),
>> +    RISCV_ISA_EXT_ENTRY(zbs,          true),
>> +    RISCV_ISA_EXT_ENTRY(smaia,        true),
>> +    RISCV_ISA_EXT_ENTRY(smstateen,    true),
>> +    RISCV_ISA_EXT_ENTRY(ssaia,        true),
>> +    RISCV_ISA_EXT_ENTRY(sstc,         false),
>> +    RISCV_ISA_EXT_ENTRY(svade,        false),
>> +    RISCV_ISA_EXT_ENTRY(svpbmt,       false),
>>   };
> 
> Just as an independent, up front remark after having looked at patch 16/17 of
> the other series: Is a mere boolean going to suffice in the longer run? I could
> see some extensions wanting exposing to only RV32 or only RV64 guests. E.g.
> Zilsd is RV32-only, while Zqinx quite likely would want restricting to RV64.

Good point generally.

Right now the distinction can't be observed: RV32 isn't buildable 
(#error "RV32 isn't supported" in asm/config.h), and guest XLEN is 
hard-wired to host XLEN — build_guest_isa_str() emits the rv32/rv64 
prefix from the Kconfig symbol, and riscv_isa_parse_string() rejects a 
host ISA string of the other width.

On top of that, extensions with an architectural XLEN restriction are 
already filtered out for free: compute_guest_isa() masks the table 
against the host bitmap, so an RV32-only extension like Zilsd can't have 
its bit set on an RV64 build regardless of what the table says. The 
boolean only ever subtracts from what the host actually reports.

That leaves purely policy-driven per-XLEN restrictions — e.g. exposing 
Zqinx to RV64 guests but not RV32 ones, since Zqinx is architecturally 
defined for both. Those only become meaningful once guest XLEN can 
differ from host XLEN (i.e. hstatus.VSXL support), and at that point the 
shared guest_isa bitmap has to become per-domain as well, as the comment 
above it already notes.

So I'd rather keep the plain bool for now and widen it to a flags field 
when there's an actual case; it's a mechanical change to the struct, the 
macro and the single test in compute_guest_isa(), all local to 
cpufeature.c. I can add a comment stating the "guest XLEN == host XLEN" 
assumption so the reason is on record. If you'd prefer it as flags from 
the start I don't mind doing it now either. I just don't have a way to 
give either value a meaning yet. So if to do that now I would suggest 
the following:


+/*
+ * Which guests an extension may be handed out to, by guest XLEN.
+ *
+ * These flags express Xen's policy, not the ISA's rules: extensions which
+ * are architecturally tied to one XLEN (Zilsd on RV32, say) need no 
special
+ * treatment here, as they can only ever appear in the "riscv,isa" of a 
host
+ * of that XLEN, and guest_isa is masked against the host ISA bitmap 
anyway.
+ * They are only of use for extensions Xen chooses not to expose to 
guests of
+ * a given width despite the hardware implementing them.
+ */
+#define RISCV_ISA_EXT_GUEST_NONE 0
+#define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
+#define RISCV_ISA_EXT_GUEST_RV64 (1U << 1)
+#define RISCV_ISA_EXT_GUEST_ANY  (RISCV_ISA_EXT_GUEST_RV32 | \
+                                  RISCV_ISA_EXT_GUEST_RV64)
+
+/*
+ * Guests are of the same width as Xen itself for the time being; once 
guest
+ * XLEN can differ from host XLEN (hstatus.VSXL), this becomes a per-domain
+ * property, just as guest_isa below does.
+ */
+#if defined(CONFIG_RISCV_32)
+#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV32
+#elif defined(CONFIG_RISCV_64)
+#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV64
+#else
+# error "Unsupported RISC-V bitness"
+#endif
+
  struct riscv_isa_ext_entry {
      unsigned int id;
      const char *name;
-    bool guest_supported;
+    unsigned int guest_flags;
  };

-#define RISCV_ISA_EXT_ENTRY(ext_name, guest_supp)       \
+#define RISCV_ISA_EXT_ENTRY(ext_name, guest_flgs)       \
  {                                                       \
-    .id              = RISCV_ISA_EXT_ ## ext_name,      \
-    .name            = #ext_name,                       \
-    .guest_supported = guest_supp,                      \
+    .id          = RISCV_ISA_EXT_ ## ext_name,          \
+    .name        = #ext_name,                           \
+    .guest_flags = guest_flgs,                          \
  }

  /* Host ISA bitmap */
@@ -149,29 +178,29 @@ static int __init dt_get_cpuid_from_node(const 
struct dt_device_node *cpu,
   * of strncasecmp().
   */
  static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
-    RISCV_ISA_EXT_ENTRY(i,            true),
-    RISCV_ISA_EXT_ENTRY(m,            true),
-    RISCV_ISA_EXT_ENTRY(a,            true),
-    RISCV_ISA_EXT_ENTRY(f,            false),
-    RISCV_ISA_EXT_ENTRY(d,            false),
-    RISCV_ISA_EXT_ENTRY(q,            false),
-    RISCV_ISA_EXT_ENTRY(c,            true),
-    RISCV_ISA_EXT_ENTRY(v,            false),
-    RISCV_ISA_EXT_ENTRY(h,            false),
-    RISCV_ISA_EXT_ENTRY(zicntr,       true),
-    RISCV_ISA_EXT_ENTRY(zicsr,        true),
-    RISCV_ISA_EXT_ENTRY(zifencei,     true),
-    RISCV_ISA_EXT_ENTRY(zihintpause,  true),
-    RISCV_ISA_EXT_ENTRY(zihpm,        true),
-    RISCV_ISA_EXT_ENTRY(zba,          true),
-    RISCV_ISA_EXT_ENTRY(zbb,          true),
-    RISCV_ISA_EXT_ENTRY(zbs,          true),
-    RISCV_ISA_EXT_ENTRY(smaia,        true),
-    RISCV_ISA_EXT_ENTRY(smstateen,    true),
-    RISCV_ISA_EXT_ENTRY(ssaia,        true),
-    RISCV_ISA_EXT_ENTRY(sstc,         false),
-    RISCV_ISA_EXT_ENTRY(svade,        false),
-    RISCV_ISA_EXT_ENTRY(svpbmt,       false),
+    RISCV_ISA_EXT_ENTRY(i,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(m,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(a,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(f,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(d,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(q,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(c,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(v,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(h,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(zicntr,       RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zicsr,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zifencei,     RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zihintpause,  RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zihpm,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zba,          RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zbb,          RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zbs,          RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(smaia,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(smstateen,    RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(ssaia,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(sstc,         RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(svade,        RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(svpbmt,       RISCV_ISA_EXT_GUEST_NONE),
  };

  static const struct riscv_isa_ext_data __initconst 
required_extensions[] = {
@@ -572,7 +601,7 @@ static void __init compute_guest_isa(void)
      {
          const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];

-        if ( ext->guest_supported &&
+        if ( (ext->guest_flags & RISCV_ISA_EXT_GUEST_XLEN) &&
               riscv_isa_extension_available(NULL, ext->id) )
              __set_bit(ext->id, guest_isa);
      }

Will you be okay with such changes or it could be postponed to a time 
when it will be really needed?

~ Oleksii

