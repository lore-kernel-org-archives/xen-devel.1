Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D8C606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P8hAsYCA
Received: from list by lists.xenproject.org with outflank-mailman.1502464.1698514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWE6R-0004hb-Dc; Wed, 25 Nov 2026 14:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502464.1698514; Wed, 25 Nov 2026 14:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWE6R-0004hU-Ao; Wed, 25 Nov 2026 14:36:07 +0000
Received: by outflank-mailman (input) for mailman id 1502464;
 Wed, 25 Nov 2026 14:36:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWE6Q-0004hI-C8
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 14:36:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWE6P-005YkT-OT
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 15:36:05 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06f23e-2eae-0a2a0a5409dd-0a2a4507bc4a-42
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:36:05 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06f255-b4ea-0a2a45070019-d155dd36e06c-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:36:05 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4aa5833c263so5633209f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 06:36:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf630esm35233336f8f.16.2026.11.25.06.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 06:36:04 -0800 (PST)
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
        d=suse.com; s=google; t=1795617365; x=1796222165; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/DalU2gXb4PPozJJkt+lGayjGYAAnuj6wQ3ZPv3TQUQ=;
        b=P8hAsYCAYd4kDLMegi/bzF5NcBzuL4OVzIFi+cNM7L7pb+ACg8w7yx+E6HqZ2ihE7S
         wWqCVcvO5Rpjd4VMX7zuwRhrfmHeRv/pSOBQouZmcuBDAoE+R/sg2z9/J11qDuR5oXi/
         iZQVIfSwlFP7VFbO5mg7Pl9vD/+Rnq8X2vj5x1viTobeC+7Lij1a9HbM7A+TbLh0Q4rz
         JcoSrZeD1EsQQF+MqSypdgm1sAPVDMTh5tdFQufFrRhQ7TOlpt6gXJwjdubD4uPcoP42
         ml1uLixr3EGtUW3mNcU1Pe8BYaYsdqc3jLnRiAsdJxe4khlncqTpxgsU68mWKt9xayzH
         C5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617365; x=1796222165;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/DalU2gXb4PPozJJkt+lGayjGYAAnuj6wQ3ZPv3TQUQ=;
        b=IE9o+JdUwL+GqXVkW8rGBg96i1bUMmjZOrVVzAgHaGRt2+GxGJRGaakbYb9fVFERMd
         FpPyjNrEkW1jhSF4tSPP8+q+tmpTnr+5KaxyosZI31Vi7VrQTPf192eXF+Rn1+Bi9PpY
         yd2kVr1KXgW+TzfvL5ElXCcXpn4K55cBcjHw3x3byy7o8OShdByRrtQEYR4Ex7p4vBsW
         wpfx+8KkyTzsyi2XWEtW6hG7dTCU0Tj4y3Yld9gCWKgqvyAZTZ+Gz/7y1g6hHw4u09cE
         YWTlL5BG4/xKf590kDaySzzdZAliE+tlIpnu5ekz/RbmM3PZ3ZBRrcmkuXF2W0p0IpT6
         vkwQ==
X-Gm-Message-State: APuU4Z8nVAe4oD4P8Zgg4haA1DybT81lS7S4d6LwIBuxTeqn1xMekYOO
	5MDP7ZE4FV14wP6bfA/rYDl/IOb28G+QHl0j/HiTUPSsh5U7kzHix6d+AFIEa4wqh3DSDLw6Xpe
	dJCFSzw==
X-Gm-Gg: AZFdTZdZGl+TEGWNUV7FWWkzcNp3jQpCbfwqt3AjHyIH0rlu+NCKs+6iOd+/kh4LvTa
	olVQ0Qg8zOHiqmpWUS5Jc+cShsA/qW2wnoE/7zKfgYOtO2JIiIgGwzi69+1Ck076dNi0JmAjamf
	HtimkByVRVLVPBVsYBLTl5F0McbG4NxZDWVmtQ70wcC5awDcVCsU6peeh/hWpB0Y1GkxLurnNS3
	LmPELaEPyQJdgjyI4yhjuE74oHpZjJVadvwTlA4jVuZ1t9NBRTKcvwivIs+/iQT3BYEB51eBbcM
	EWdCL+kk6PaHTMfeNIxFIF0SkjjdVCvXhtnulzguVxwfI7HJ11N3h71L+ChV3JbbKb2wI7VMq0b
	97JzM/EWCVv/BwY19JL6de3o5GWoaynqAAu5ps2j9diRvucALaCCPRw8aUfoZFGx5/9bkc3bYXG
	87021FscPDyYwtY4Br31wFoqwBJnKhl864P1HLXYsGp9Y+3cAt38AMUQF9JCgDgegiWDszyHK+F
	TnP6jz8qXmmrCaLtoYlTwE1EJdmVUAsId4GLNhY6MSA/U3nh148Q1J6qhO8RBOD8gXJaf6Rk2lH
	pQK7ZAXcPkj9IWIb0dO0Vivn8WopeG62r1iRvIfOQMTjEbythlZly9GSxJ1kxYT8hT2mq81D2x9
	5n1hG0b7d4V4rcTa+zw==
X-Received: by 2002:a5d:5888:0:b0:48e:4300:c70e with SMTP id ffacd0b85a97d-4abb46bc414mr34768199f8f.46.1795617365200;
        Wed, 25 Nov 2026 06:36:05 -0800 (PST)
Message-ID: <22bf414d-ed66-4c2d-b8b9-f2fb7e5c219e@suse.com>
Date: Wed, 25 Nov 2026 15:36:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/3] build: permit .data.ro_after_init in *.init.o
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
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
In-Reply-To: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795617365-A7ED6AE4-444990AB/10/78276251493
X-purgate-type: spam
X-purgate-size: 734
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Setting __ro_after_init variables is one of the purposes of __init code.
Permit such data to be present in objects to be converted to *.init.o.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: New.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -263,7 +263,7 @@ quiet_cmd_obj_init_o = INIT_O  $@
 define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
-        .*.local|.data.rel.ro|.data.rel.ro.*) ;; \
+        .*.local|.data.rel.ro|.data.rel.ro.*|.data.ro_after_init) ;; \
         .text|.text.*|.data|.data.*|.bss|.bss.*) \
             test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \


