Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4808C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 08:27:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431865.1653567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9en3-0001ml-DJ; Thu, 24 Sep 2026 08:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431865.1653567; Thu, 24 Sep 2026 08:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9en3-0001me-8s; Thu, 24 Sep 2026 08:26:49 +0000
Received: by outflank-mailman (input) for mailman id 1431865;
 Thu, 24 Sep 2026 08:26:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9en1-0001mY-SG
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 08:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9en0-00FdWJ-Ob
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 10:26:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab4deb9-bab6-0a2a0a5309dd-0a2a4506d0a8-22
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 10:26:46 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab4dec6-195a-0a2a45060019-4a7de14cc02a-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 10:26:46 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843cedd129so1153236f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 01:26:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877c379sm12644543f8f.29.2026.09.24.01.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 01:26:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1790238406; x=1790843206; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkkP6WsYRo8sH98YUMRhSG2hYzszU9VFi3Hez4+CZiE=;
        b=TmPYnMa2MYs6fJsBKlbmevEn8TkZ6/haH8tN7PsySjDBEz0sjqLaHqD+sXZ4b3BCBA
         1/JSg6HWJJENhSGnX4H5Adq2PM2PXmk/xpxNvFBzoALcTr0C6B9jsziRxwGTaOkW3Z60
         yUs8UWy2ivcdIyK0Wl8tw3Jt7W79IqVkWpqbkF0ySosDs9PQaH2gQXh/U8sawJE9A5Wf
         1yo0KwzGtgtJ9PUn5s7UqzEB4RCwk6P/WHky/AjQtmK8l6zkcQ49q+6Qz3Y9nBmsejLU
         hLEl5mzjyURwtviHl2UVevdGGth3izO78mv1C05ycaHZd9sRZJDhRnW56LZ+Np/MWNGQ
         mpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238406; x=1790843206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkkP6WsYRo8sH98YUMRhSG2hYzszU9VFi3Hez4+CZiE=;
        b=MapMuY3v2OCAgqyB2E7SMknC3U0T70GQ5SXyf1FgbiBBC0av3w7NkgjhWhW4LH/3+H
         b7ZtCj6Pd2vncC/z7AXI7LDr0FAE9bUPYZh5Jpvhkjgx/7HTLoPlgW8RXJA9QMymTcmk
         FlhNtFDUQpWiGRNnAPS91JYvpdvG3Hx5foKdGbPe5AYKrz+nmUXjfapBoX/Go/4AHOrg
         FgcIQY0Ckq2HifJsRNTCARhJoEd7p18rSR4SgKJaDGxB9XlOxBMTUpjFum18HFGkpEPb
         bRUIGRYMwGV/PQhoOCjXJicSnSp0BeZW9SF/7aU6E8d2hJ768QwtB4Qvgr2IAJWBMCHW
         w8gA==
X-Forwarded-Encrypted: i=1; AKwUvBy+J70f9AxNwoxgfNJWYuH4NAX3TtgwHoXUW7gTDZvBC5ECL4v/bJ3XEpVKMSsdBldTM7ivON+xr9o=@lists.xenproject.org
X-Gm-Message-State: AFuF++lZkHNGLotFeEELWazx2DJh6BM+h40y57xu3lL9kb7A7KLacI40
	t5OLTkMwZCp3oMKkNNyqUpgmxOFCIMup/flbsYKV9mNY1cCqp5TN2/ZFXGKE/aBj/w==
X-Gm-Gg: AYBFou0ACquMs/CFPH/WXQHFbU137v5UFOG7P4RN9mfwWYQoJ8cHQP6BG06Aburs0Tq
	PRnMAhr8P9x5kBvqTvGLPOi0L+Mo9wYazyWVtbHfGQQwNBp/NyVwpa2dRJHGhvPU9T47LSqbgW1
	Q0THGrwUzsVR3Z6i3Em9OMtf6X6f5Xu3VPaIZE25foY9fPXM9vuXfZvxyiAV7QrFWmyexSMiLnB
	1awkR2Uek54FrFj6LaECuFuo10IvtjvibnuX2Yvv57U/E/A8rrDYvrTKfsJda15QN1gIfyDjb4X
	3WluKh329iZU8DsPbwpggvEhL2UCY+5oa1OgJolNgrj7p4AfWG4UEKUbD25c/ttG/UbLu/Kxz/Y
	YZPjX4K09zzVi8wez38em6wFRm8/KODm1sC6hDZYfXtz89cxaIHdtNEZcBja3iln1oI/7gT0V6c
	byt90xHqEZ3hBLV6TsfOytWIJsxNc4WyJ4G//kCcwNN7/h6VG8JA4hF2++j1g4WT1cvDK72rbkI
	4IP6YrYsL6HK/Hw4Q5tnMfTUU0QBsHVFGqo5VGc59eY1z3tYkYNU0ywzD39jA==
X-Received: by 2002:a05:6000:4711:b0:487:a0f:82ff with SMTP id ffacd0b85a97d-4887167c983mr2487806f8f.17.1790238406082;
        Thu, 24 Sep 2026 01:26:46 -0700 (PDT)
Message-ID: <adc37655-4063-49bb-8d3c-3912a558635f@suse.com>
Date: Thu, 24 Sep 2026 10:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: add the Amazon EC2 PCI serial device
To: Benjamin Leggett <benjamin@edera.io>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260922184316.324817-1-benjamin@edera.io>
 <20260923153933.2024896-1-benjamin@edera.io>
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
In-Reply-To: <20260923153933.2024896-1-benjamin@edera.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790238406-F7CCD77B-4254D2C6/0/0
X-purgate-type: clean
X-purgate-size: 802

On 23.09.2026 17:39, Benjamin Leggett wrote:
> Amazon EC2 bare metal instances have no UART at the legacy I/O port
> 0x3f8. Their only serial port is a 16550-compatible PCI device (vendor
> 0x1d0f, device 0x8250) with its registers in the MMIO space of BAR 0.
> 
> pci_uart_config() uses the default parameters for a device that is not
> in uart_config[], and those only accept an I/O BAR, so "com1=...,pci"
> cannot find this device. Add it, with the same layout that Linux uses
> (commit 3bfd1300abfe ("serial: 8250_pci: Add Amazon PCI serial device
> ID")): one port at the start of BAR 0, 1-byte registers, and the
> default 1.8432MHz clock.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Benjamin Leggett <benjamin@edera.io>

Acked-by: Jan Beulich <jbeulich@suse.com>


