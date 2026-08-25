Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FF5C61DB9
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 14:26:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399262.1635414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys6W-0002O0-R9; Tue, 25 Aug 2026 14:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399262.1635414; Tue, 25 Aug 2026 14:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys6W-0002Nr-Ly; Tue, 25 Aug 2026 14:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1399262;
 Tue, 25 Aug 2026 14:26:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wys6V-0002Nj-C0
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:26:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wys6S-005Ym4-HX
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 16:26:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da5fc-8faa-0a2a0a5109dd-0a2a4502e6fe-14
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:26:16 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da608-6ca4-0a2a45020019-d155da2bd09c-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:26:16 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c15cd3fd760so590907466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 07:26:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496297c7dsm1767520066b.20.2026.08.25.07.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 07:26:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1787667976; x=1788272776; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=izWfnk9aze89Z+Z4Dc7jlmjmkMhPkAe1QNXnL4qSw9c=;
        b=IzSKSfu1Gj0PW6u68y8pbbd2ZTMrHIzB354Tmwkbx8mIjoipr+/ETEB3nTFDFEJ7WI
         Qn99a35AqpXVVnlsBR+FJa9zcWnzpphaOuVjJS/uGdbziAwe7PQorkBX61sdJBZ3RFaW
         cuAzG9+G3izLwG4GcAnsg82CgzeCichRkfQyu4al+a1oNNUYu8ne9ZFjuS5r3PE/5LUA
         aVbOsQFwms6PBZe0DEEBSJ72T4Opdwoj/PS9e55v33QiB4fTwIvaUBQvmb+y7sGNlNWG
         dS53JfwsnlPqHQMfsf7QqlTn2nFPtHshPzBkFI7inrBdvdaQOlS0xnWS/9lMeEvK6ohE
         vxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787667976; x=1788272776;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izWfnk9aze89Z+Z4Dc7jlmjmkMhPkAe1QNXnL4qSw9c=;
        b=IdrvJBaxw/ucSNT3QKGkzEO3zfb8MEfBKTQ9A8T0gLSVxFkmYaFhVqVr6AvSQbBjTC
         xgf6X6vGx8GIeuSIFkJPjLHCaohkKrRklFTEp8ZIpRjdTIyLQySj/EeAn4kVb03EfjQF
         K8RVQPs7QHQL/nEMaVFyx04fiGOvZ6Da4MAas5v5Fa2dWzWVA/XPDO/DSHB7Ar83N9GU
         uHdfAN2LOXtlJtfIRdm1h2wLJLy+6zZkuwVcQIDkM67n3pK/lbKGhlrvSxUemO6kLnfc
         +ztmQ3iswPCInw4UQ9xPFPcRki70BtxAejEEaIFfHlCHbfl2TwgoXSU4mHwZomjUCTFt
         R0Gg==
X-Gm-Message-State: AFuF++n7KaH/lZkHSx2QRMqeGc71JeWyFxUoSImavMPRwCzDcwQsLOBG
	2AdlvjEnoELJ4Y53RyrRST+kktGW/g6PNeCByApcTXxp7JzUr0lzbg5jNMpvwDufbxBV13Qvbyh
	nZ8f8Bw==
X-Gm-Gg: AR+sD10VtAkdcNQyoJFoCW2WrZPxaoyyK6TeWzoeuY88Ytt8n9WtE7C7RneAQ74HrtG
	GCAXfG6dLNBwXbcfu/s/kvXM6lw1NSq0S5oExhmm04YFfGOQ3cOoEkjFxf1yQL+PLk9S0oPWlQU
	wPdVrqwianpAnexoobWl58f3LolxICpmpMq90zWpCfbVX3yKE8oJQkf3t74FRpeoPodYPbZKxdj
	a88bOpNn9k5PRKcktF72ARV6SSnvLMO/v40PxYSq6d7B6gO5U4Rf1bdVpWDhxqKXsItP00j/6/k
	i6rpzOg00++3Pv2j+zkGPak3FHm25EGVEsQAmKMNR7s4NMEEADsFj+nPRSmaHuLBIzYH9j0aaSE
	F4S1Up1f46p4od7jJ8KExyyx/1R0RdCqcaqP2Cuxz4KVaFy9ttglyyUWrxP1OyHNEMr2VZmyEh1
	jFJBLfqlrCNjPqNrDjgA7/zd1bmisPRBriFgqB3VEcWrLjqWxF3EEAQH/Whhsh/MlmpQmP+6oy1
	13ZfhYjKR54aq0xSzmyhjYHEhX4Vo4jyRhYdvVgOBMDlxhdNKXqF20fEtJjeAo=
X-Received: by 2002:a17:906:6312:b0:c24:6445:d19 with SMTP id a640c23a62f3a-c24926f3cf9mr3326881766b.17.1787667975854;
        Tue, 25 Aug 2026 07:26:15 -0700 (PDT)
Message-ID: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
Date: Tue, 25 Aug 2026 16:26:14 +0200
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
Subject: [PATCH v2 0/2] symbols: aliasing at text section boundaries
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
X-purgate-ID: tlsNG-720697/1787667976-F36BF2AC-AFB3934C/0/0
X-purgate-type: clean
X-purgate-size: 135

1: drop _{s,e}extratext
2: also special-case symbols aliasing _sinittext

v2: New 1st patch, simplifying what's now patch2.

Jan

