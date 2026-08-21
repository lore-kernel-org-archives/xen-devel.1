Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0D5C5DF87
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 08:51:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397230.1634591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxKyF-00075o-7g; Fri, 21 Aug 2026 08:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397230.1634591; Fri, 21 Aug 2026 08:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxKyF-00075h-4l; Fri, 21 Aug 2026 08:51:27 +0000
Received: by outflank-mailman (input) for mailman id 1397230;
 Fri, 21 Aug 2026 08:51:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wxKyE-00075b-Fs
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 08:51:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxKyD-00BLsr-LR
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 10:51:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a88117a-bab6-0a2a0a5309dd-0a2a4508d552-22
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 10:51:22 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a88118a-f659-0a2a45080019-d155da2fe975-3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 10:51:22 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c1670dad7a8so140094366b.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 01:51:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24589e1b22sm335368666b.9.2026.08.21.01.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 01:51:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1787302282; x=1787907082; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFT/pHnrSFjXlJZiw9C1ljCMjkuf3hUnHlq7EH6Wz5Y=;
        b=QXVdJtDU/CTyxXgCjbQHR7J6W2VjpwRMZKynwlIIUq5t3DvgpVe6kATnvPQto78I05
         J4b+Qq/nY9QRVcNW8Z9enFMuLZNfRy52csaaYEujioGRB4/d6GFV4Ft5Cnb2U3QnFytT
         QOXobIc6E00My1FT9/orxEFvCR/ChK3BNMkS4InvT4ONfraNoMK7iKju14DKsoHyICy5
         bnR1clGKZYeL+1/Ntri4WFHhyORkk3+RmxigDSqQFQB/BZGhHSuP7zDUtbIhYXyq2d3w
         G0n1fFZ6jZWqO8zqyVQZTOxJhb0hz7CPfDXGRfV+x1TV8r3eMe5/eS/p/n7bvYs3q7lA
         bpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787302282; x=1787907082;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFT/pHnrSFjXlJZiw9C1ljCMjkuf3hUnHlq7EH6Wz5Y=;
        b=WDcJqpF+u8RKPHxXSdmsPeR5We0VS3qNa5e4D0ICJkpw4ojhks5rfFttg3hL96tyKH
         fhk9iW3q0DdxRxkLGagPvuYzNQN+RWF5yl75Z+7tjDI4UbpJc0BlWeZY0a62GUIVUSV9
         ZLt8ogOldwPmvqUwWX6VBnSMi4BqHnTyk/kxEmy8SnSwlqJFA6cLwfqnfB55QLI8hbRj
         ATGpnQMSPGi04ICn8W2HzO+gDlLsfNhFR+rgTNomMv5cVIkpHpJ5xrjCnxCbo8aTSxQQ
         jUtHPG5b0YTKDPQp0OQ8S6c0OHxsG5BAwA0cJCVdOATluZ2va4QOV/Qs62eRSEO5jLyf
         iIpA==
X-Forwarded-Encrypted: i=1; AHgh+RrFx81D+V/qgUhe1k+LdNkOyHfKYseHQs03oLohLriGQJhlaWYZAEohWg5kZ1zgkGB1SEfirHeopfI=@lists.xenproject.org
X-Gm-Message-State: AFuF++m8SwJbcOLrnlQnrIr2Xt34VkvHEvVqrFXc1lI8rgrPaiA6QgLN
	xgXONzM6UNmyxTQRX5foeRvTa86oLaInmYZRd/zdm3n0ePIjMtqFBLLNcbnZCaGTHQ==
X-Gm-Gg: AR+sD13T4hAG+nyCECh/ndNRn7/lVgFrM3KTNdHqMpb5GFL+RV67Xj883QkR01tTnEb
	6u0xqgM1/S2PTxP0eFER4kDVkiFNCMfqGLpfOID9kHgxV9cSEVOKT94VDea9KIpKovkG2gON/0Q
	XZUs7ktoTsYiIo/Aar4mrXlPvgj+5sDpBRzF0JnMsYerCtGzweWzfBm4Wzl13MUPVNG3HGdODZ2
	Luz9L3KbL6Qak8sb6vpy8XJDsaNH1+LC8L53sL75Z7oqMEt+7S8uKvcsXd0y7RcwD1LUqGkuC0w
	p0iakWn2eT0xdRIEsX2jS9HjcMxtEbpkW0/+VFGjSlusUe9qZ1YbZ/DrJCnr+od7OlWB9lwEYXE
	h5qgMUieszAdtGPnA64fAfXSnXDBPVb1+uTz26pU/Le1NDxLJkeCAiWNElAveDaQZRzXMGFmRkk
	ofjTsXZ257hpKjr+UUr5hVkzA92yzxTXRxwunUwmvHXcos+Y19eKSELMJ9Kz/PRV21kSBFcQjEh
	T8ObVYlw0Pa5rza30wJkXJIvcxH4ykeHlp2EztLCBat9MZkd+8W
X-Received: by 2002:a17:907:9308:b0:c12:695b:8876 with SMTP id a640c23a62f3a-c246a39efb5mr530633466b.5.1787302282308;
        Fri, 21 Aug 2026 01:51:22 -0700 (PDT)
Message-ID: <79a5b821-e2c9-4e64-b2cf-1f839e2037d0@suse.com>
Date: Fri, 21 Aug 2026 10:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: Expand comment about NullSelectorClearsBase
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260820172640.2072049-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260820172640.2072049-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787302282-D574B87B-A9C1E3F1/0/0
X-purgate-type: clean
X-purgate-size: 821

On 20.08.2026 19:26, Andrew Cooper wrote:
> Rework detect_zen2_null_seg_behaviour() to use the new MSR infrastructure.
> 
> Zen2 doesn't have WRMSRNS so don't bother relaxing the write.  All it will do
> is insert a useless alternative.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Naming Zen2/3 in init_hygon() isn't ideal, but the early hygons really were
> not far removed from the AMD microarchitectures.

I wonder what we should do about Hygon. Just recently I saw patches going into
somewhere (gcc?) to support recent hardware. We haven't seen any contributions
in many years to keep our support up-to-date. We may want/need to consider
removing support if that code is effectively unmaintained.

Jan

