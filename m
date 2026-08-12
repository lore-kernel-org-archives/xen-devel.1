Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886E7C5B567
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 07:22:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388760.1629741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3HZ-000386-Ix; Wed, 12 Aug 2026 07:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388760.1629741; Wed, 12 Aug 2026 07:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3HZ-00037z-E6; Wed, 12 Aug 2026 07:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1388760;
 Wed, 12 Aug 2026 07:21:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu3HY-00037t-D8
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 07:21:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu3HX-0064TF-1E
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:21:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c1f07-2eae-0a2a0a5409dd-0a2a4503d8a2-8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:21:46 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c1f0a-fae8-0a2a45030019-d155dd31c440-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:21:46 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47fecbbafdaso152514f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:21:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d702c9sm4852995f8f.34.2026.08.12.00.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 00:21:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1786519306; x=1787124106; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5vpURs3yad1Td8RhRxntoH7HJSvYuQccNB1curUvwc=;
        b=EuL5wCFg5Md3TKLvlN8yd8FgARGYyHTQCQcBTG7dKBtEo+xoJJqOixpqIHEBCb+5YZ
         oJZZV738rd+hzgKX2njLPL7KAiqt/GEOtLK6AtainfP2D2HiT/Grfz/asPUzKW2pLnH7
         AeDKvu+ghcuIUHiFeQPCjvDBTa3rSaKY3oiEM5bLdWIflOs2WlRIaVd0Eycq+5wP2apW
         OcGE0MCU3rrmrpZwCP0/sST0esa+jjXztnLxR/d7mYMFFl5VIjbersMqLJGP7GgVU/OB
         OSHKGtdblcQoU2sZsCDh5ctk0jddcRvfJQqMzxfOrWiDrX7JKkrXxA0995sBD50S+oBp
         TMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519306; x=1787124106;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5vpURs3yad1Td8RhRxntoH7HJSvYuQccNB1curUvwc=;
        b=jCv6mvKE8HOgX3VHlu35tjVvLyAsUEo5XNMLiNBEJXeRjimk3s7RFelD4euMuj/5P3
         a5cc3O1CATENHiTyei+ZIwyFTbMJR2buc5V27h31HVXu5oaVfccA0wYyi9vK1JPl4WS+
         WRAgd01dyZh4M69UcHnXegwPHWbwXnN4m5mLpO+FYwLFVjf6RqeKWJKSgrZBItMYcDy1
         qsk4p5DtHh74aNgRFU+hjgctsjrfsDSMw5L+yT6thLSSkyAFbb4NBk65bcrv9Cv6cH7X
         oWdhfAQhIxPiWFyLsDSESD0lC9YID+upS4axPZka9XL1tWwC63x8c6/pgG03L4MihF7Q
         DiyA==
X-Gm-Message-State: AOJu0YwbfA7C6t4aEf8+70riw3NRO92VT6uo3aWQtddFXcrES5xKdmnT
	dzhI8nIFTbOLlPhEMup+SnFshCxgOUSeq/brCdnFwcPLOi/TjgHlwcpOvz9yeZlqog==
X-Gm-Gg: AR+sD11E3niUzq+66z3NIwnf/mgsRMqsSX/oc7wnDzcH2A1P9+OlopG7eKS9LfNuZmp
	7lCjIQ5eqvPmQuivnS91xw/AZG040kGp4hbGxQ4Z2LYzFvcZIMJIvlgOcBn9CjAL/V6tfQH5YrM
	74X1KdoeSwhE6iV0kpWIlFXgo0ZQONtdXYT29KNoLwj/ZQhguZwrJ4ZNmvwc8ehHfAaLvt5+6e8
	kSdKGbaqFoAPiYrAW9Ys6Obk3Tnittxqh5ZjLDspqfHpssGRfTAsEC3dsXXxX0QmQTK075I5n0Z
	nJgkj6TIVIsal5iuHduiim3dBpnc4a3sziydLKg8YLyO2uxvNONOZMk9mUjlrURFRpA/rTwAuDL
	RKpXN/B2Mh1ivJao8asMzG6vrVFLNn/faf86M76NLSnGu6fZO8/FZ8qWMB5LcZU0EgASyo6Xezt
	twVGUswMYUtNg2GReaRupMR+S6aWv/72p13Ofv9MGkQqA0BCm+pjjA8lpJhIsM6zeZsg46N3Ixa
	+WE9dhCxf42VRgJGN6w0VQSx7cpx33BjzeMGThwMmSLkSsgLMWY
X-Received: by 2002:a05:6000:26c9:b0:47f:91e3:3cbf with SMTP id ffacd0b85a97d-48152b03a57mr3521512f8f.19.1786519306253;
        Wed, 12 Aug 2026 00:21:46 -0700 (PDT)
Message-ID: <b7754a86-4602-4b41-a07e-3e6389dac78d@suse.com>
Date: Wed, 12 Aug 2026 09:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
 <1786373377.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@vates.tech>
 <05283ea0-de82-4160-a3f9-5fc1292a20a5@gmail.com>
 <1786436246.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@vates.tech>
 <a58af12e-13f0-48a3-b39d-bff92991ccd1@gmail.com>
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
In-Reply-To: <a58af12e-13f0-48a3-b39d-bff92991ccd1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1786519306-6F8C54E9-3A3F27F8/0/0
X-purgate-type: clean
X-purgate-size: 822

On 11.08.2026 13:49, Oleksii Kurochko wrote:
> On 8/11/26 10:17 AM, Baptiste Le Duc wrote:
>> On 2026-08-10 17:36:56+02:00, Oleksii Kurochko wrote:
>>> On 8/10/26 4:49 PM, Baptiste Le Duc wrote:
>>>>> +/*
>>>> Why have you included a copyright notice here, but not in the other
>>>> files?
>>>
>>> So I just decided to do that for new files as I am not using corporate
>>> e-mail.
>> But why didn't you do it for all new files of this series?
> If there are such cases then I just missed to add it. I will double 
> check during preparation of v2.

Hmm, I'm a little irritated by "missed to add". In past discussions (plural)
the usefulness of such copyright notices in comments was put under question.
They go stale anyway as code moves around. And likely there were other
aspects that I forgot.

Jan

