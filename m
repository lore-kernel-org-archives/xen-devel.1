Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F143C43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 10:54:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351631.1608734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF31-0003nG-Gy; Thu, 02 Jul 2026 10:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351631.1608734; Thu, 02 Jul 2026 10:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF31-0003n9-EA; Thu, 02 Jul 2026 10:53:35 +0000
Received: by outflank-mailman (input) for mailman id 1351631;
 Thu, 02 Jul 2026 10:53:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfF30-0003mx-FX
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:53:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfF2z-006AId-KE
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:53:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46432d-2eae-0a2a0a5409dd-0a2a450bdc78-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:53:33 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46432d-ac48-0a2a450b0019-d155dd34b043-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:53:33 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-472326ca506so1212877f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 03:53:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dd94cb64sm8013869f8f.23.2026.07.02.03.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 03:53:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782989613; x=1783594413; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WHZrdIaIr/Qonp/FQk8s4CA8XTn74JzLmvsThtsbxFU=;
        b=Wu8eT+cLAghd5mT98HZc/e+P5K+TTIwE1q72DVXUrj+DECscaXNY95qaoYUpXQX5qo
         KBI59t4b59/cZBIrh28xCg/mtBspWh9N69WWbQeiIOUEz4bI30kzF/78Pr4RUPEENyWe
         okGk3b42jDmu1OR9tF9Xo+LORwX0TpskeWhqLwB2Hrb47ZyteYn4AqlmEgYHFBneYrXx
         O37DWNBN/EpgQEC5dwdCYgcnDkDGergw8KW1ixJYaIGTdeMjuFCLvzsPC0qJQHCPSZKA
         2Rfoa+R6warED4KiLEz6+oSzXuwYRU96sAVjdW81z+FeICrPOeq/luTso/NwdeGWzUWp
         Rcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989613; x=1783594413;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHZrdIaIr/Qonp/FQk8s4CA8XTn74JzLmvsThtsbxFU=;
        b=g6RgUlcb87E3wTBKmx7w7lgZy26TW9miWgTxfqXXZhi/Xr9FTkw33bl5Yv7kLqXV7G
         7II1j2/eMFucvImtJTDuBl/TCu2MFm6fVn9YNZmOSdEU9eEQDEB/azdEycNSrS1Qr7ke
         73RCmOptxbnyeVGLenh1JWWoBL6gPM6lYPOhOFoTA10ES6E6oGA4e4o0F/X/zXHVntLy
         eMwvvW+7x15hnCKx8nz8PSsI0t3wNuZBRooI9rRytDGgmXFo/WInGPZtMpQP8MkrBwjF
         aZdec2enuFxeuZ/M2BnHf3Z181ZAxJ06bFITkARSysmQoN5qhqgj5F8BXajWR31HaU7p
         dIDA==
X-Gm-Message-State: AOJu0Yz4tMBQtrG2Fh/XHJBZ+juulHnrGcrsIFqEgenPwGuq56AjeBe1
	qlTjbs8hB9lTcZUYU6iP0t9GppOT3jVHKz9l1J8zIAJiN1WKywewhGFwGzTvw80/ilgnvmjkZUp
	PFPfN8g==
X-Gm-Gg: AfdE7ckUVeXk3JF4+C/Q3oiEldaKilAHjoJdsuXk9Df4tdq9Wr5y1L9ZTOBMbdZ/b9O
	rFHPCAVP2BwWsAzx9PZopQJ5wcm8WD3UFSahoLZwnH7dJdMzTKqUzPI795nCkOpst6aJhyXMmaL
	9NqHyajgogGRGpJnUsGsuq2s/LH1FXqP9oSyge6D5RCPMzyVZfoVtcOz9jn5gbNckCvfVVORsku
	apX+9Gl4m+nWhvaiYFE6WF4iK6sxpsH034BgUrrQazrVF7vyIMQj2vo33IjQ2pvMCIS04tobzNn
	6Qg34fQPtLMjLu4L3eSdCJH8xFbx2KEBbaDzoFrWhwYaBLLKh2uyU2weXKH0mt8tANc04/LhRXR
	hAe2i6Curd2T8y+wahr9+7O87woj6D7g1lV7OhStr998TwSzyH2nWf1fXm0Rh4Mo91FJUrHrlgQ
	f6Do5TPjNydbe5b94kwALoqjJxLnZ3DysE32AyJLgLhlQQfNNknGQcmzGvsA3j+06HciFIyDuDm
	9BC
X-Received: by 2002:a5d:5d82:0:b0:475:f0f0:9ef8 with SMTP id ffacd0b85a97d-4775b930513mr8613725f8f.61.1782989613072;
        Thu, 02 Jul 2026 03:53:33 -0700 (PDT)
Message-ID: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
Date: Thu, 2 Jul 2026 12:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] x86: CET-SS related adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782989613-3AB38220-FB1BC830/0/0
X-purgate-type: clean
X-purgate-size: 472

One might think of this as follow-on to XSA-451, but that's not quite
the right order of events.

There are a few open aspects; see in particular the final patch.

v3 addresses review feedback, which includes one new (prereq) patch. See
individual patches for details.

1: HVM: don't (almost) open-code POP_GPRS
2: record SSP at non-guest entry points
3: traps: use entry_ssp in fixup_exception_return()
4: prefer shadow stack for producing call traces

Jan

