Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1405BCA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:24:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446162.1662233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE9A-0001nQ-6a; Mon, 12 Oct 2026 11:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446162.1662233; Mon, 12 Oct 2026 11:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE9A-0001nF-2A; Mon, 12 Oct 2026 11:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1446162;
 Mon, 12 Oct 2026 11:24:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGE99-0001mk-9F
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:24:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGE98-00Fxbk-MQ
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:24:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc37e-bab6-0a2a0a5309dd-0a2a450b909a-4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:24:46 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc37e-b7e8-0a2a450b0019-d155dd32f17b-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:24:46 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso1636745f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:24:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ac6a91sm17237676f8f.41.2026.10.12.04.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 04:24:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791804286; x=1792409086; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trovYTQ1qQeJdTRvV9e/YhxXnvEDm8E7HM6+VcmASq8=;
        b=TxT7pU8ozphOa8chxH2NvBvkHXHLfw1qy7rsme0soJ/aWhwIPPdqgc3ovX3mIm66Zc
         6EvIOCnknVl3kW5PqQjkz3JQVoUXJMU7nB6tmgRXprIuii81+cJ/dErfznNa7/mHp2FM
         07vK96IhGPTXM+/bEgdPN7RSPHUURobq/1NoUJWFQkskqSbz9lX0P+dXRMnBoePP492k
         vBaYSpddQ1jNU951YteqMb2QGQUMu0WCJi0iga8A6SK+iBO2jDdkfb0pMC9NE+YqAW1J
         7XMWkth2sU94bGFc+M/X4X0jwMZQ0jt3hrYm2dUchyOLExrF7Udx6hL9lS7fbmYoMZ+q
         TsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804286; x=1792409086;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trovYTQ1qQeJdTRvV9e/YhxXnvEDm8E7HM6+VcmASq8=;
        b=CEkKiKcrF6NA0nrAmQMOVaK1qVuMiThoJoWEoT1afhMrhW9MMq6TUOT3dEPkFX4c2Q
         DQvGB+vDM42/39I1yKYqpMYTjsFx25JHxVoRw720jIUlv1YsAFTJJM4tE+TrlD+Qqtgq
         eqgyvwwgB9lmA8vGujKOL6y/Kvsz0cMZoG6hMBsJ2f6Dvhv2JpMcbPkpvK1lmHbw1Ww7
         tNXgen5KQOXoVDFw25aKIMnCI1uSjI1svWD7u9+9z8VtxZvFoI6J9QY7hrCyEws6g3Yw
         ihzQrq3AdM01jj8OBkGLbFf3zAy32LPA/GCCE6GSu1eEFaxRV2k4LS8RLBq4TSU/Y7Iw
         aZvg==
X-Forwarded-Encrypted: i=1; AKwUvBy7lsEciCuiI3/zRnF+oVvsqvwMRtPCfC6p2J+7ebewYEYxRraSs9C4AxVL0LVW3y+M8THPlq68GDo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJkuDIIaQ6J0kzxFUY1K1A2aeXdSwtZG46mNGjmqYBhk1k2n1wJ
	azwMeWod8uWIHVNwlsd8TB4e/OVrrGMJ11sIQicIkUvGC+veAQGPY1GyIC7LP70VGg==
X-Gm-Gg: AYBFou3sufdStdgxAkVR+TFLeJ1OyH4n7qxKVsyvBuJKxfKg0qIdgq86WZ9YT0L7IBt
	WeJMuWTYnEE/xlVFPLXqU7JxGi9ioakCEyOVF5k3bi4083iLgvTKjxGQ14+vmiaOrUIo4Nwenje
	rir4euVJoXMo0KF3J2xgy1xct2zkL/PCBuy8qQuo/A2Eirckazl7yIHIGbTnNVXhfVamLqnDSfK
	F9N2cEVXcyX1W9VXiQn1/uDfgh8Qrci0bdNfePthAVcARlOczey8MUWr9vg1nFcACsxyv/0iBjp
	ovw9zxLM/xGtztPDqFJE7sCOb7xm7qKg1HOju5d7CJfMhafh74bYRy/P0BayXa1RyOpPbiKTrNT
	tu6zlbmciwcXbDP0lphvlNjJDMMfqsUwjmWsbj2HFq2E2gtS5HwLVHb1DimOswybuTFhk4DhIOd
	r25Pb7bHbr+DSxSItirZ5gtG9YXrBc/NyNRjahoLZ1xxnh7SpEK58wGvFGHwhPJ7yjh8UsP+wgQ
	DtrHQE87U8h46vxRcQF3JLSi/F/rhGp8N0RStwRfUsyxo9KfDmBOBNmk27zZg==
X-Received: by 2002:a05:6000:420b:b0:48c:a08:5858 with SMTP id ffacd0b85a97d-48dbaae6fa0mr15610360f8f.23.1791804285832;
        Mon, 12 Oct 2026 04:24:45 -0700 (PDT)
Message-ID: <1c29b7f1-3cc1-45eb-b3fe-42dec36a9ba6@suse.com>
Date: Mon, 12 Oct 2026 13:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-4-kevin.lampis@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20261001174749.2275245-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791804286-1B8D19EA-0479DBCD/10/78276251493
X-purgate-type: spam
X-purgate-size: 520

On 01.10.2026 19:47, Kevin Lampis wrote:
> Calling mod_l*_entry() with a valid ol*e_out pointer will do an atomic
> xchg to set the new pte value and return the old pte value through the
> ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior is
> preserved.

Since you say "xchg" - as Andrew has pointed out, it would be nice for
it to be a simple XCHG, but for the time being it's still a loop over
CMPXCHG, isn't it? As this is somewhat relevant, I think it wants
expressing correctly.

Jan

