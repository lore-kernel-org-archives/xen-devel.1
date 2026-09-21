Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EFDC982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:32:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427426.1650126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dBj-0000X5-84; Mon, 21 Sep 2026 12:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427426.1650126; Mon, 21 Sep 2026 12:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dBj-0000Wy-4L; Mon, 21 Sep 2026 12:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1427426;
 Mon, 21 Sep 2026 12:32:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8dBh-0000Wp-Al
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:32:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8dBg-00D8OV-2A
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:32:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab123b7-2eae-0a2a0a5409dd-0a2a450a9e98-38
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:31:59 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab123bf-f2d2-0a2a450a0019-4a7de18ca70f-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:31:59 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso20123545e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 05:31:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd8bf159sm213526515e9.10.2026.09.21.05.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 05:31:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1789993919; x=1790598719; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1kl2NJfxaX+sX2BnLCJ2xm8QIrtkOnD1LC4q+3z4FE=;
        b=IayEs0zgb2r4ge/Ttv9tNZrZGq8RBRID6SocrGNamPNuaHKGXqobksdudEoShwbvZf
         qQTqnykHQ6jQoilurUOl4YN7E74f6AC+PhZoXMK5l1WtKvrAKTLJB4VRX+S695M2NoAk
         JyCsUOxeP0pRJIe6+wZ1Zsz4jHzaVhaV9w3639cgGsUSHbrb7xI97ewUutSiAgef/HDS
         IJWiQQ0O3oWG1rjShCTNadhYs1fLEWVUzGN0oPnh00dGtkpNeGKOnug6qpH/U8oSgZ/J
         QvqpEMHqqIxj6L1TwewU68SKPoPE/pVh11sPAiSCMbpVPYPJR4XJ1xIsS2VHtPbYC+x1
         11Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993919; x=1790598719;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1kl2NJfxaX+sX2BnLCJ2xm8QIrtkOnD1LC4q+3z4FE=;
        b=hbrt3NhnEOcK6x4bdDRfzuSTAoonhfu/wJb2nwYhCLAbnjwODaPJrAVVe8zqSDAJAM
         KhIRUK/vEySIlts20woEdnFiZe/SDkOfMp/uc2DABOO3xm+x3cSzlFRz3KdtkIXzsxXR
         aXIH2y8aSYiumVsp1BrxyGcfg0LrKXIFGTX+IoPhLB1z4Zynb6pp4ce0E6pYvZbnrcmm
         TffDX/nhMCNGyC5xJY/QousVUvAzETF7erYICszYFlwDh2n23rYirF7RotbyLYHooX57
         S7fFHuHYpQKtXSAyp2otQ2ozSrAD9JcBcEWSpc22jvA4XjMve8mZ+Vq2eZCzuLgB3H/Q
         Tg+w==
X-Forwarded-Encrypted: i=1; AKwUvBwtA563kxZ909wCks6hY1AC1B9M71DwLkeK9mIOH+aw1nnFTnAVVTTrtNs/bCBRBHbhFGbhnhkyBlU=@lists.xenproject.org
X-Gm-Message-State: AFuF++n0wtxs0VbBLcMrVN5jV+PiElVMbijF7nZfNZVLgqsWrRih2GMI
	OYYdtnmuWZYwFqIE2Q0h+pc+wn197gdeRuJz+8HdumwU+gdkdz87XH71pMQePWXmQA==
X-Gm-Gg: AYBFou3vNyBuxxrihdb3wpX1LWlF8VeDYZ0EROpqgod/fBqA+lZDZDXKvqcN3lG2ARw
	js1jN0VeQW0bpNdFZ16SmcUzIWUJ7HZGtGtUH/57op+MRZKTETUBWyvXlmJkoXbtqv3m1I1EHIw
	DgtHqRDsdvk+RwrT9CiEt+wl8BdPuHvAwGS6eZdZhem68FjtZS4whsPk2QYWa/OxAnFHq4ELTvB
	x6Mi3zrJlLnBhdJ4Ud/jkezTnehPXAJGKla0ME8Gm+UY8vhLcy4Sqjg9WO+0ktlDZb5HRyuyXiX
	h93YHZmoi5nugNVNOrNgY279962tCvH6nKwcESJTmBLWpTKehsG9pd0w0QeFxGQOmkRLfoVy+L1
	zYtJcolIJqURScfRh78ioyvyXpSRRU0kRqApcAH4DxE2FocIdsQnpB6BNom+4xUOUWQoDrrHwqh
	VgDY/ynRSvrjmEck2UB1aVk6PHs9Bu7aWhpOv+RhRheuTAP2wyLD3tdzIlhbffvbSgBERQ9aYmT
	NVCAJ2DnAfE/Owfs1/kp2Qj4/2FIDwoQIciK9jDTcQzWmXm6jNiLDjssZM2ip/4igKBBqR3
X-Received: by 2002:a05:600c:3b96:b0:49f:ce73:4a with SMTP id 5b1f17b1804b1-49fce7300a2mr110119755e9.34.1789993919463;
        Mon, 21 Sep 2026 05:31:59 -0700 (PDT)
Message-ID: <bbaaa4f9-a1c4-4ad0-9fae-7fecf1568086@suse.com>
Date: Mon, 21 Sep 2026 14:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/39] xen/riscv: introduce IMSIC h/w interrupt file
 attaching to vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789993919-5A7DACFC-BD3D779E/0/0
X-purgate-type: clean
X-purgate-size: 965

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> Introduce imsic_vsfile_attach() to initialize the AIA-related state needed
> for a vCPU to have a working guest interrupt file.
> 
> A guest (VS) interrupt file must be mapped to one of a pCPU's
> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
> run on needs to be known first. arch_vcpu_create() is therefore not a
> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
> vCPU can still change before it is first scheduled. To avoid
> reassigning the VS interrupt file id and remapping it to a different
> pCPU's hardware interrupt file, imsic_vsfile_attach() is called from a
> later point in the scheduling path (e.g. continue_new_vcpu()).

Hmm, why does first-time handling need to be this different from the
handling of a vCPU moving across pCPU-s? The sole difference should be
"no state to load" vs "load state that was saved on the old pCPU".

Jan

