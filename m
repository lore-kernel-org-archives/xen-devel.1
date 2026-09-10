Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8DBC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 15:06:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414857.1644550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gMI-0007hB-M3; Thu, 10 Sep 2026 15:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414857.1644550; Thu, 10 Sep 2026 15:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gMI-0007h4-Ig; Thu, 10 Sep 2026 15:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1414857;
 Thu, 10 Sep 2026 15:06:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4gMH-0007gy-BU
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 15:06:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4gMG-0036Rf-0A
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 17:06:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2c773-e002-0a2a0a5209dd-0a2a450cbcb6-14
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:06:35 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2c778-f479-0a2a450c0019-4a7de18c9b9c-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:06:32 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso16364415e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60ac42b9sm1207805e9.6.2026.09.10.08.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 08:06:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1789052792; x=1789657592; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9HsNew2T/nYK93IszSbli/3oKF9fTf1EzwRDq+XNYY=;
        b=VwPtBqwoF6bOUNpQMvGTG4/FhONMkyE4DA7ee6PyQfRsSo6lsKJFglf9DCqhEsPm5v
         8byAdKD0ZEqNaoCq19Epgu1mcHR/ZGpoGWh6tgDDkdUKzz9g+YVGSo0tOk1eI5bKs4IP
         1tjjkcWTO+BKy2j1Q/qqZzh5LGIrQuabtMVjhF290gkIBNPN99GsZc9NJDM5ugSiDTWz
         1Pje9vdZdHxTMsFfcGa0naeVV0Zl+KE4/TdH7cxKDk/sfg64k53gXa5kcxRCmqy5P0ci
         rGfQZJMbN9Bq6O8hrPCDzz3nrlHFl9ywuCjtFvC443SiKKYGxPwotIuUVnrtcvxDceuJ
         IINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052792; x=1789657592;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9HsNew2T/nYK93IszSbli/3oKF9fTf1EzwRDq+XNYY=;
        b=VUZ/6qeEvSg6Nbf9P19SthnosTJsxCqPyvYpX7lZA/KYX+WJyiviHa3Jjo31U4GMur
         nMF5ub2nnkZaspBGpnk4KHruPgVi0UL4CTQw2ARrqviizDXrS57S04SS/nrrpFfWvkP8
         J0vPWhXmHH/5d7VDR0C2tVpaT1HiiVB2gKtTmvyGRigx/FVciWQqvfXchrFqtbbIhiYU
         KhYqPUIy3NCWrWs3LckNypxUcS61uAMp3TwACq9uLJc+9NKJDb13i8uGG/2RQ2uBcy1i
         YVHAgfBr75bk0Af//LYDAykBIvl/A0euSg2xpfmo2UzzNkpvhFClJOE0Z5qplnstoW7O
         LVOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLGh5wxm1DamhFijyPGjtzvRvKKX7UnrNiXVCNhcs01d0iuJs/Cw6C+pPp4fImAYsfT5Z9xAljNZw=@lists.xenproject.org
X-Gm-Message-State: AFuF++nVuQ1XVT4qzIWVw4xJztkpjrWPpKLaRIO0o4EffegAWWVQEZlg
	Li3vdoogWer+QdZbBH4OqdYd4K8wciLc6VuGHOawnxAp+pcPRwoW2vw1Yg6oUqNb/Q==
X-Gm-Gg: AYBFou1IlKhZvtZaFubnlgfuDLbtmCBSLEHe287UAzvmo45Hc1pZ0XO/FN5EQnzDr2R
	WpWNY0SLZVpW4oJinA4zps6ibiTudDRvqAwP9NWPyr8wuocu5vMpel59Mc86NdSWjbEEZHz8uTK
	W5XHW+kKUtb2BwjzfmoUDUp7Rr6xFatRtAPgxxRsl+4r9fHo7oaaDL9Ve4O9ZU4BJ7NvV3zFo9U
	P4NPh9j1RXAMQ3sbLMqZaA8Nd0yyFAsJJ/SzwOaHCyC6dYjIz5C041JGHN8lNzD5AvossdTAevo
	AjpVMtrfXegwMcsBveCAMVrzXtpRbRlrhFYZKJ1vRBAIVCHX0vHXUaheVer6kdWG673XQUBogGi
	lAayDizp0heAmdeYk+NUrDDGqG9w/rwJJWLr2W9KE686+AjZzvISGvkrGSgJB05WwLIhRvF7qfA
	YhDMVDTyVAfTcKkn+gC9gJATxXOydds8b+EepNdYs2fbd7zBv40HLYM8OFDmny6xxZ7jH3MEbI4
	x2vqJoJrqrsAO14VRSPFzDib2GerqicHAmp2vVEaIB7h8q2dQPV07z6v1bbYsk=
X-Received: by 2002:a05:600d:8446:10b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49d258d8630mr58912745e9.12.1789052791609;
        Thu, 10 Sep 2026 08:06:31 -0700 (PDT)
Message-ID: <97689598-20bd-4d93-81ab-f74b6e5709d6@suse.com>
Date: Thu, 10 Sep 2026 17:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/39] xen/riscv: resolve the faulting guest physical
 address
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
 <c7975a131c229c721b2d4fe81c13fecd8deb4329.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c7975a131c229c721b2d4fe81c13fecd8deb4329.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789052792-024DFA5B-656815C3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1893

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> Take the guest physical address from htval and stval: on a guest-page fault
> htval holds it shifted right by 2, so that an address wider than XLEN fits,
> and stval holds the faulting guest virtual address, whose two least
> significant bits are those of the guest physical address. The shift is done
> on paddr_t rather than on the raw register: a guest physical address is 34
> bits wide on RV32 with Sv32x4, so shifting an XLEN-wide value would drop its
> top two bits.
> 
> Those two low bits come from stval only for a fault on an explicit access.
> Where one is taken on an implicit access made for VS-stage translation htval
> holds the address of the VS-stage PTE which could not be read, while stval
> still holds the guest virtual address which started the walk, and the low
> bits of the address written to htval are zero instead. htinst tells the two
> apart, which is what the spec points at it for.
> 
> stval needs no check against an ISA extension: a guest-page fault writes it
> with the faulting guest virtual address regardless. Sstvala would not be the
> right thing to test for either (it covers stval across every trap type
> which writes it, a wider guarantee than what is needed here).
> 
> htval does need one. The H extension lets an implementation write it with
> either the faulting address or zero, so without Shtvala a zero htval cannot
> be told apart from a genuine fault on guest physical address 0-3, and the
> address has to be recovered by decoding the access and walking the VS-stage
> page tables in software instead. That is left as a TODO, and until it is
> written such hardware panics rather than acting on an address which may not
> be the one which faulted.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


