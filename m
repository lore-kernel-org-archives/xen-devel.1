Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AE60A2604
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UN+WJpIw
Received: from list by lists.xenproject.org with outflank-mailman.1482105.1685978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp65-0005NR-FY; Tue, 10 Nov 2026 16:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482105.1685978; Tue, 10 Nov 2026 16:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp65-0005NG-C9; Tue, 10 Nov 2026 16:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1482105;
 Tue, 10 Nov 2026 16:53:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQp64-0005Mx-1A
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:53:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQp62-000gcT-Iq
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:53:22 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34bf6-2eae-0a2a0a5409dd-0a2a4509965a-32
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:53:22 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34c02-be1a-0a2a45090019-d1558031d4c1-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:53:22 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so21220875e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:53:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba02300988sm69047475e9.0.2026.11.10.08.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 08:53:21 -0800 (PST)
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
        d=suse.com; s=google; t=1794329602; x=1794934402; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5at6xC6SRmqyHZ0FsAKtgm1P0dW37lrGU7PfyrZYb8=;
        b=UN+WJpIw3crE7YXhxVPHZmbTLTS47CH1/xEsjWh/exLLfgZuRnHXSKJy4AJm0LuBoX
         5/Tj2U7OoXZMO5AsJ3Qh4epbtM4B2koJv7rJVkcznZ9cW2a6Gq5QBenDN9t9H/ps6QcE
         g9A20GQ35dmMiR8n9809otdMZfPRC7nTHFpxpAq/FXAh3eIh34XbWHdHtGMROxUFtcx+
         qWIR0wX7WnP1YoB8JNExYZWLkzrxKfWzvjduPsS3OLOLqA3on5gjLnppsTffIgDKql07
         EVObjqdjJhrcbV/pYhilcvTnzzXls63YMKOxcae2nZlgIgLD8E0E44+bOKHF+4twK5pr
         i3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329602; x=1794934402;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5at6xC6SRmqyHZ0FsAKtgm1P0dW37lrGU7PfyrZYb8=;
        b=FgHOZISrV45je0O/xvx86JHiESxJfIr1XDvPYIvgfLBzwuOxmzumwn4mMPxn9QSVOe
         4cuij5voI/yPQSscFTu/2k0jPrSoFVztemeK8kC2GxzwikT0edDiKgYBC4fgiyMptlkS
         FpNdv4i2sLKkPgnuG9Q/Mo1d6rWubfxKKjhtBOjX3yVPXa8EQMO1O/l25MlrJTTqespX
         OnpAl8MtFQfrBdCOBOvrRK+fbtoi9UIN3mGtXlKrXgjC1mThNU5TerxD5IFOj+u6rIrt
         tmIalXEZP+OZRqFtjIhSzfYBBCXopA8c8sFaaHXauuVulUkfEyfEsRVctZKaI0qsKQQK
         am2Q==
X-Gm-Message-State: APuU4Z/1fLbkAPJF736kZvUlT+mZykQmoQd9JTyENxFz66S314u4X+f9
	2cN9W4Cv8Gge82DAE3y0LsqI6NT0TgqUTSxtlyYBd1V80o+22hX4AzgV05fJ7Rd6UA==
X-Gm-Gg: AYBFou1z8TFaDuWlMrXiOpoe+6p3pEXEXuNPc+EwH5SvNxrfXWuwn2NVq+Cs4H0vbGG
	jU+KUbN4eHsvVXlA3hzN6SdwdrWZoC7Ip7+/pDs8dp47MJN4W2PQYvDe9NZ8S8saVM9jQjiYjUv
	xSs07xmQ1w7CBSbF5YtiaO7NyFn89/t9r+sglWYBcMWCvuL83Jrv0eaSJNxwc1U1I3B8J4v6vSQ
	d+zEIT3GmRoObH7fjwgqm1+k+luU0dvE7dzcAbPyCXOQgazign2X8+XCc0ykx0t95eLr8ihkRgN
	bK4MJ628gAlQ/irf5dsklrW8qs8FLaWLiptLX8bF7bbRbF4ti2LXFC7mRLgVP7MPHFQSfOfYX4t
	tKenEYGQjtixTOM70L3K/lz4b5CPUraNE8Ckm4lz/mnWSyd5WG9DeMcb112ixl2TRIamNUwyRkQ
	rpX17v1AmtmHOyI9dbCBV1+49+0LEvtDpFfHh5rJ33KntNjzrqZRF+YjBDFz5qcL/RYeuItB9uH
	bnA9aMDJHJGzbS/amy4kVFKR6cLQe+9nWWdx4dQxmRuXp9Tf4PDE++rxjWrJy8yumbSOG50u/Uw
	uhX/dAF/iCrZsjVRl+iq8CNJbM1csNEinf39ijTZhGIIdz37aDZxJpMg0FlX6z7S+C4zaadMHGN
	i2VksvFDKZ5csPZH7uvY8Uv7gMB59Q2Ks3dXoqQ==
X-Received: by 2002:a05:600c:c0c2:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4ba02bd1ae9mr40450245e9.26.1794329601934;
        Tue, 10 Nov 2026 08:53:21 -0800 (PST)
Message-ID: <cbf00338-3af0-4cd6-81b9-7389fe29760d@suse.com>
Date: Tue, 10 Nov 2026 17:53:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/39] xen/riscv: detect Shtvala
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d676e7f7aa71e4ee439c4c796b886710ffb9f50c.1790779209.git.oleksii.kurochko@gmail.com>
 <1792509997.8631fc262581453bbf619ec5b2062170.1a159ebf27b000f79f@vates.tech>
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
In-Reply-To: <1792509997.8631fc262581453bbf619ec5b2062170.1a159ebf27b000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794329602-BDEC6034-315949B5/10/78276251493
X-purgate-type: spam
X-purgate-size: 877
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 17:26, Baptiste Le Duc wrote:
> On Wed, 30 Sep 2026 18:23:38 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> The H extension allows htval, on a guest-page fault, to be written with
>> either the faulting guest physical address or zero. The Shtvala extension
>> removes the ambiguity of this zero-write by guaranteeing that htval is
>> written with the faulting guest physical address in every circumstance
>> permitted by the ISA.
>>
>> Not offered to guests: Shtvala describes htval, an HS-mode-only trap
>> register a VS-mode guest never touches, and the H extension it belongs to
>> is already hidden from guests. The guest-visible equivalent is a
>> separate extension, Shvstvala, covering vstval instead.
>>
>> [...]
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


