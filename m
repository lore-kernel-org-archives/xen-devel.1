Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16ECCD4F3C
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2026 15:38:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312096.1582264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP032-00085C-Iq; Mon, 18 May 2026 15:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312096.1582264; Mon, 18 May 2026 15:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP032-000855-FQ; Mon, 18 May 2026 15:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1312096;
 Mon, 18 May 2026 15:38:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wP031-00084z-93
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:38:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP030-003nH7-LI
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:38:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b3269-2eae-0a2a0a5409dd-0a2a45048b5e-22
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:38:26 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b3272-1dec-0a2a45040019-d155dd34e826-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:38:26 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so1437194f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:38:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3ac86sm37721267f8f.14.2026.05.18.08.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 08:38:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779118706; x=1779723506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9dscsK/n/zXXEPGWqtxY6kvxT1hlDEvADzIWDhRa4Gw=;
        b=UugQgxMLo5EiLFeHFQx7qZw36d9vOqQXZeltKJO7rVZP5pZMDvI4tPcOUC8NzbuSvL
         EDOxSI4RXUVmc4J6XTw9JjKG4kvTNVUm2B4jEsoDShP+FiV6HFWajGFCDWuoSV8Xkv30
         dMyxotO2rJ0eEe2w0ub1m748AHcrwqjgLZbcn08Oa1woI2dEsIa0rm3F7iNNHR1OXTYE
         yrNq3RwGwEih8OqROUxzy8Sy0XZnB9IHl12n1gd3MMgolik5ybEU9UHMq9T6DuiQNyv5
         iHCYTmfjihnuiCTzwSDOVirNtk9l9iZUe8+t1ifbXKSJ7GYgFXLKjY/YTDim4tuK31Js
         L1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118706; x=1779723506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dscsK/n/zXXEPGWqtxY6kvxT1hlDEvADzIWDhRa4Gw=;
        b=HqfMcR4qqaOEwROiCXybmIXKk/7xW4Z134HprVwWFxPeUDB2BeAk8+bYWQnQihwn86
         w09z1XPJHs6IW8S9Bj6RfB2t9v/0cPVujd6g/B3XyGe7KyHU4AU8Yrt23K0oCROVi+F3
         nKn5Vuqkwcj9ZYF2b840n4+zw9S39f1vKDaf2e+TaVbGrSRJEPGMTgg22XSU9zmR8AzO
         wYW6fTAm69FUuT4sDGFu74+pvuKyMFOJx7ywqu57hZz39uOUuLhNh6Qq1xyPXmqpi+Rs
         c5B0LFkozfPn6micuPWLNledW7kcTVQpwvHYAyMowq7mPlBpx1L3DR+v0HU5Q49PemX2
         5nHA==
X-Forwarded-Encrypted: i=1; AFNElJ9ImikKm8Dyh4XeeNCkRv2iRFFWS0PKUYknviAFQjzcqaHLdFJ1eJUKwOoDj3w39dYDJQBeqSeec1E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwcNirV+1YmGGV1MszZaQ0tsB/DL2xKLFHu2AyOpbO31ncJ5/F
	G+MFWgRwMqmlfqUKKDdVSCuvqRfkXHZNiT2mhIccLNdsYtIk2OQu+sUTKJTLABeM/w==
X-Gm-Gg: Acq92OFqdqF0mGz24traxjjD+tEKEMU3S2h7C69HDF4z2tTE9LzfIHNQNlqVkkBOmCj
	DWYIfjT+UAJiJ17yTjK0YpoW0xYKyOL0oC37OYStHPOTaMiZ/qlBbYf2wKEAtdHLyit+5ghyy1z
	T0kbLA+pbOZWUMv8XX8SulC4gIkWHGz1zUlfbRd+Xk/TWUbCDOk38YbEysItoCX/wd56GP3WfpR
	OlZtCqKXgV+/bh7uqGZ3ZqibI+A9/6suJFroPf2x9DIXC1k4AzY8FofVi9Ycmwi+YMLcyL27qJ8
	0awhVNGipaYpkSVJG38HVMwIiuR3xtDdm70IKW5idpQA+26oeYS/7mHOWL4BEB51kzsUDo2YpoM
	aXHgst2b2DDrc1v8UMAu4LLr95mBeLMEbhG4obCHFyxslo8x6zZh28l0aBuc3CaPa/UXHj33ySX
	dh6d7Z91Cgos7GIEje5QdjNdJHufquDdHGXHI7wjTrbmSvXhLjvYvRj1dmr4LRqnHRmBNKKiTQP
	992ogo0OsTotP4=
X-Received: by 2002:a05:6000:4210:b0:43b:4f86:e985 with SMTP id ffacd0b85a97d-45e5c5dd47amr24092727f8f.33.1779118705938;
        Mon, 18 May 2026 08:38:25 -0700 (PDT)
Message-ID: <0c732808-8bf7-4f8f-9a81-4c649f030a00@suse.com>
Date: Mon, 18 May 2026 17:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/26] Introduce enablemenant of dom0less
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1779118706-2BB6B3FF-4F94A824/0/0
X-purgate-type: clean
X-purgate-size: 691

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> This patch series reprensent a bunch of patches necessary to enable common part
> of Dom0less.
> The stuff necessary to start/launch domains will be introduced separately.
> 
> This patch series is based on [1], but a lot of patch could go even without
> it.

What do I do with this kind of statement? This still leaves it to the committer
to figure out which ones could go in earlier. What helps in this specific case
it that ...

> [1] https://lore.kernel.org/xen-devel/cover.1778140240.git.oleksii.kurochko@gmail.com/T/#t
... the remainder of this looks to be ready to go in now (and I intend to commit
that tomorrow).

Jan

