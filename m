Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29501C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 06:00:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389458.1630166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuOUD-00038D-4m; Thu, 13 Aug 2026 06:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389458.1630166; Thu, 13 Aug 2026 06:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuOUD-000386-2I; Thu, 13 Aug 2026 06:00:17 +0000
Received: by outflank-mailman (input) for mailman id 1389458;
 Thu, 13 Aug 2026 06:00:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuOUC-000380-9q
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 06:00:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuOUA-00HHpz-IJ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 08:00:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d5d6e-8faa-0a2a0a5109dd-0a2a450ab96a-0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:00:14 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d5d6d-f2d2-0a2a450a0019-d155dd2da95f-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:00:13 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4813ea321cdso335782f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 23:00:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5af453sm3538680f8f.23.2026.08.12.23.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 23:00:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1786600813; x=1787205613; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tddkDMvtOF7kURPiW+G9b+uW98uVQMk/Chv5QXRQOY=;
        b=eexl5Sr875ZZh0DtFp+CeSorWs1M6RvOt6GUoZSpDaKbRWA8ndF9T/VRg/7Za8EEVR
         sHtKj/50OgNsu7CY0Ck3tUW6W+WsubLc37ZdCEzWmllj/ecGNFlxtf+nd/3mzpiVI7/c
         8t66vEcBEhuWpAhXbRRiLCTalDHa5W2vGifXh6Jjyh7ijA4f08ved6j5en3+PIj4b837
         yxujYq/2ZVGn1GpCRcCUgEonVtS3/NkptDT2wbPleEQzzSUdCn/HEKEbFR1ljHnJDJaS
         eYRzixanHoKFHMTMgI0ltQ5uSNoNb+zSdJpj78EwSW3iNYYN0lyIDCojip+IiJVHui4h
         zZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786600813; x=1787205613;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tddkDMvtOF7kURPiW+G9b+uW98uVQMk/Chv5QXRQOY=;
        b=a780vvIwEyx7Tv/Zj7wdbajbThCqD2p6IWoqzq1AUHfth2xg5v6q09wtPLk0KDUgfN
         WHnDNy6AuA/Py1b4cxJNBsZtG0Y0ng2bUqq82V9gVpqwQ/HfkSjS8zHPCQulQqg39wti
         r92T+DaSvr5EjwCtoGKXZzlg1XJtDcQIFqXaXNmakmq9dscYtQ10zSH/jnvbwzsUvy/c
         37luPkh6sjT18UR1jTPD3AqHAhY6Et1qfwMQG1gke0LesyCvAumuY+xRy+dZh4PDk6Nk
         hsHIBVBG5mFTcOmlFZCDnHQlhnn+otFzK/8FdNxlj9LcD/c6PMelYo6a025YdzdLiWUM
         bm9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpi4saKsjZBwEAISogTx+DM1cZmv25QpS21+gwz+FJk4mPdrdyfXyagFGX6AK04KctBwbymeIM6k0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyi7pUqtArsJenm4TOgVH6faEgoP30bJQbF73QcTM7eTeTZFfMl
	4A3ZKEKmp03XM/hAqDJtw2ZEni9lAxlTb8j84lqaOVeTlSEKrKDyknQ2fo2e6gnYeg==
X-Gm-Gg: AR+sD12t9coK6S00hXxrC244f5T1m5H6AFIFmqsKTwO/ov6zJHqugQtIUk3uwqk3iDZ
	WW7wIzX7kl4cmnz6/YnouRpeMYRYdaqyULSOFgXa2uxPPXDW8tMeommOE+CtVMk5DBoAJPb8CCp
	KjDTKN+ajN2xdLhPbRYRm6i6KYgFDKUUxVAQPHfaCFNAThWxTogIeCPc66+Czqwys4NcxeGiS0X
	Hj5y33cgmltwqntizYfAfvYXQnplDnmetj4VC3F3ygcD+iEKyBPzxPanF7TGOAZ2PKHEDaFwYGz
	RXBYbP6vgghXMbv9kmkJ5cSN/ZhU5GCv6VGFL8Cj5nx71DQZUImw3gBH8LSt+zliKjDwX6bh6IL
	ohLFsAmM2TADBVLxw3KUyQaG5FYI4zJdLfRGPPd6T990+AWDBJNZA9yijxg3DGZRTBTU9NOlv83
	WGMDxVBB60WXa7Y4uKXx3+5jzIM6j6MgdDTejEbyl1F5COd7qdQ3z0HQMulrNhI+kiWzJjh7n8w
	y6RrqGMOTDpRmD0EZ7J1VzeBmb50Uih1oyCop2nv2pX4FpNm0S2
X-Received: by 2002:a05:6000:41ea:b0:481:2fff:2a09 with SMTP id ffacd0b85a97d-4815a540db2mr3593771f8f.14.1786600813140;
        Wed, 12 Aug 2026 23:00:13 -0700 (PDT)
Message-ID: <04442bf7-7a19-4eb6-be86-8332da2a5958@suse.com>
Date: Thu, 13 Aug 2026 08:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/common: add keyhandler to show Xen command line
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260813035139.915536-2-dmukhin@ford.com>
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
In-Reply-To: <20260813035139.915536-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1786600813-532D8CFC-328428B0/0/0
X-purgate-type: clean
X-purgate-size: 1178

On 13.08.2026 05:51, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Currently there's no way to print Xen command line on the emergency
> console for debugging purposes when 'xl' is unavailable.
> 
> Add new keyhander '?' to do command line printout.
> 
> To allow built-in command printout, drop __initconst in
> 'opt_builtin_cmdline' declaration.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v4:
> - promote opt_builtin_cmdline to __ro_after_init and use it for
>   built-in command line reporting
> - account for empty saved_cmdline
> - adjust register_keyhandler() call - use '?'

This isn't quite what I was expecting, following the feedback you got on
v4. My expectation was that we'd see a 2-patch series, first patch moving
non-help stuff out of the 'h' handler, second patch adding the dumping of
the command line. Naturally the new handler then wouldn't be named
show_cmdline(). I'd then further expect tat no new use of
register_keyhandler() would be necessary: The handler itself would live
in keyhandler.c, and print_version() would then be accompanied by a new
print_cmdline().

Jan

