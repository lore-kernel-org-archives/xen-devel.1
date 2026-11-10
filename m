Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF137606EEC6
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TBfWiLR/
Received: from list by lists.xenproject.org with outflank-mailman.1481313.1685166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi3Z-00071E-Qr; Tue, 10 Nov 2026 09:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481313.1685166; Tue, 10 Nov 2026 09:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi3Z-000717-Mp; Tue, 10 Nov 2026 09:22:21 +0000
Received: by outflank-mailman (input) for mailman id 1481313;
 Tue, 10 Nov 2026 09:22:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQi3Y-0006zx-1I
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:22:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi3X-006coD-Dw
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:22:19 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e247-2eae-0a2a0a5409dd-0a2a4503cea8-18
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:22:19 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e24b-fae8-0a2a45030019-d1558034b11c-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:22:19 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so13338045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:22:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a3f4esm4293637f8f.53.2026.11.10.01.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 01:22:18 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794302539; x=1794907339; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzOvMiOu1nVnPt973CpKEadVCI/2/BSG8qUSaSjCYls=;
        b=TBfWiLR/kS25CxhSjThfDopmFd9vfxMgacgaWCgR2x9CeRwc3XwSIFk9Rnfp8A8nhd
         nH82ybjWblOECioKjq7s8Buu5BKx0EuqwoB6dDzBVcbEbynXrP6SeS6cVEzGqY1cA/Tv
         GMVVS3MhT2hfxoeTQLQAvfU/7HsWxpS1X1gN8YelFK6SRBN8ngxf++IUGxw7qOr8ImsO
         4+/NdOt2v7YU5cN86xaEvU7D+qXR1Ew7A3c/mFTxf5aj5iLI8KUHf04OPY7z5p5yke+p
         XDgMHJT1UbIBcHgQ/UNlcYmA3obgWcmjSKtnZad6/pnkXB5lztQ6/L/uJ/MuNor3sbme
         rQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302539; x=1794907339;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzOvMiOu1nVnPt973CpKEadVCI/2/BSG8qUSaSjCYls=;
        b=b7KW5wbvWN3r1ewNMh1FTH8pF8UPpz3GxJvmvWGI6664UQzeTI1vNTh90OfKhxUuaF
         YufPj0tBVoPaEicIWu5OE+Imh1T6aHM9VT6gQD6Ks6rCVSx79bA3jKrCMwdHfjmClr2o
         JaLaMhIKiUSPSCcGas/SLl9rvFlKQIaiJNfZMpUDZltYxXXhJxcpvd/EeomIg83mV8mA
         8J3FD71vovwcEhibkuwCgP7G4Bn/N+4Bu3P3qzvp6DOF8c1o5++j39bwXrjXzIAlaBVA
         P3EiNhgyiaaepbAOW24fzUGk3bMaD/lCaX9D/d6NHQV3Sa/j7Y1j5GBse968APpYSM4E
         hC9Q==
X-Forwarded-Encrypted: i=1; AL+hErE8lkTvVHYVarS8z4CzPe+1/9dsN922SPfQcO58YX7Zpl58TnPDjaw1UuCpdWa7tpRYF4AofSlAsxQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9bQ9yhzI6YYNTdqfkHrc85hCkKNR3ec7xRZ1dB9VnVlBnWFd7E
	8yySuC+s8PxC1fyoGcWH8MUKEOip0vL76SAGRRqifS/UBIGW764KS42OIVID+7LaKA==
X-Gm-Gg: AYBFou1lFoA7m4D+WgA20db4gCkbeVZjFP4QvEzpacPncaYLbxtdJpBM2ImlwB3fP3z
	hoaDdazNOFi1kw2/9Uo80jxRvEWPO34F51k3eT79tCOcapUvKhmpudCzv05yaKjonI2Z/7l0RXs
	lP0rZt40ComChLojVwy6vKRF+gKtQLVUx9Usoo/UfOGB8spYBEjez80RPb8Ybvj4t5KAgv/87eG
	hcUSHCdaWkQhWw7RyD2Mny0a0nfLXklxwaY4zYjirXVzMwWgsTqF1rDCn3bUk8SF2ve8Or7x3wb
	xx1hXg6DZT3qAaA30/sLGPCYUyTJKBlYDQRLQOTG94Y+VJuHkefqImGze6Ze0xPJGqtTd3dqhvS
	WE1kHUrqdp+N0IWMjHx7AhGlXaVDiqlMBilDK+mzVgh7CPeifFoRdyi/dSMyH3gKWB6SglT2H36
	HEyefn3j7J37BoEyoPw7fM5bBvyTHXanOF5AUR++/rCdHWhJQ3n7SZNNXN6Vrymnqe/qEViAB/V
	jll0VWLC7ZZz0pKn005i/s/MD9+hsBVHeWKLjQF4VUwPy8m0R4HZfDilUHljBg/A9MRJqJVdiut
	9nWyHQqusRRjX2LgPRoub6PUwv7cS2ayTcgoREIHIMoDKNllYTg8W9V/j32MkBhK68yG/5tYIJk
	RBFoGuezvLaAKoxz5DDCz0yi8NyUt/6xJKuBZrGM=
X-Received: by 2002:a05:600c:3b0e:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ba02349411mr32173855e9.18.1794302538674;
        Tue, 10 Nov 2026 01:22:18 -0800 (PST)
Message-ID: <e159cc57-d8b1-415e-b3ea-d85f03b2d2c3@suse.com>
Date: Tue, 10 Nov 2026 10:22:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: wait for QEMU exit before restarting a domain
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
 <0762b21d-3173-4014-bd43-fa2a9cef9c85@amd.com>
 <fdd91377-bcc1-4695-8cb7-b5db1f0f71ab@suse.com>
 <14f7eb35-4dfb-4c2b-8594-fa07cf700bfe@amd.com>
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
In-Reply-To: <14f7eb35-4dfb-4c2b-8594-fa07cf700bfe@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794302539-6F0C94E9-B964A130/10/78276251493
X-purgate-type: spam
X-purgate-size: 1771
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 10:10, Jiaqing Zhao wrote:
> On 2026-11-05 16:13, Jan Beulich wrote:
>> On 04.11.2026 18:33, Jason Andryuk wrote:
>>> On 2026-11-04 01:46, Jiaqing Zhao wrote:
>>>> The PID-based device model destruction path returns immediately after
>>>> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
>>>> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
>>>> port because the old process still holds it.
>>>>
>>>> Wait for QEMU to exit in a child process after singaling it for at most
>>>
>>> "signaling"
>>>
>>>> 60 seconds. If waiting fails or times out, log the error and retain the
>>>> existing domain destruction behaviour.
>>>
>>> 60 seconds seems like a lot.  Did you measure the time to see how long 
>>> it takes?  It's an upper bound, but maybe 10 seconds would be better?
>>
>> Is 10s enough for it to time out upon disconnecting pass-through devices?
>> I'm seeing this happen routinely, albeit with an older version of qemu.
> 
> I checked the code, passthorugh devices are removed via QMP, with
> pci_remove_qmp_query_cb(), before sending SIGHUP to terminate QEMU.
> 
> Passing through a PCI SD card controller on my system took ~1.2s from
> `xl destory` to sending SIGHUP to QEMU, and QEMU then took ~50ms to exit.
> So 10s is pretty enough here I think.

Yet that wasn't my question. What you describe is the situation where qemu
processes things normally. Whereas I've asked about qemu hitting some sort
of timeout in the process. I haven't looked into this in any detail (and
hence I don't know what exact timeout it is that is coming into play
there), I just know that I've been observing such quite often when shutting
down a guest with an SR-IOV NIC attached.

Jan

