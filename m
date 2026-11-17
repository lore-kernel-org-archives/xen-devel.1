Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9C606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D/V+fKLJ
Received: from list by lists.xenproject.org with outflank-mailman.1492104.1692800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTG9s-0007db-6L; Tue, 17 Nov 2026 10:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492104.1692800; Tue, 17 Nov 2026 10:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTG9s-0007dU-2r; Tue, 17 Nov 2026 10:11:24 +0000
Received: by outflank-mailman (input) for mailman id 1492104;
 Tue, 17 Nov 2026 10:11:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTG9q-0007dO-Nc
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:11:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTG9p-00EIlp-Vz
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:11:22 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc2847-bab6-0a2a0a5309dd-0a2a4506970c-6
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 11:11:21 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc2849-195a-0a2a45060019-d155dd36a474-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 11:11:21 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so573573f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:11:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c69406640sm27062441f8f.12.2026.11.17.02.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 02:11:20 -0800 (PST)
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
        d=suse.com; s=google; t=1794910281; x=1795515081; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/18RQ+3TaDcgZDCItjQYfW2C6DYwgVs7ohuyUyS6g30=;
        b=D/V+fKLJhkGSkVQloE5VqOmC53ZsjL5XI8UyAlTJnCbn1/axjuxX7S73DhsEbkvu2p
         s51KnDiEZpJ/y+FgcgU7v70cKCvVd4DjZ05Rzw+CCszjLD97ZDroGltMrvrG+i6IG5fN
         ZUFsHBWrh3lD5Wq/pJXB2YMP9gOKNymJkOV5VG8jb4KJN6R91OAdqjwR/QfLtgN+D4Me
         ehkDJRKF7MtQFmJKo5ElmOU1+Ee5ODsG/uIY0mWIngZNzyDh6bKfzRg3cA/qHVzb75X2
         js6Wl9GiqP+S6z6whS/7HtR24dhPk05LV1OIkrWSy6ly0jDrb10tmVwvBdjzsm3XRglI
         GkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910281; x=1795515081;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/18RQ+3TaDcgZDCItjQYfW2C6DYwgVs7ohuyUyS6g30=;
        b=CIGSmeAFzook67UAeyXaoDKg5cMFJV70HzDNDPpnwmtp99hJ9P/oPlYhrrQDgqvNKX
         +oSqByUD8nP49d0QVqrxEkeS4xtIhKfczVEEQcKeHCi754nFO12oQTqHhVV9pqq9XP8F
         fOU5nF5s7UxdDVNTJaqN+VcOeqFFZP6luc7FTQ+D3J5IGIen3Hlb6BzyU6TkBCWnmpuQ
         VvleLMKnepjFqvWM0/JZPKzTpmuFVwxXbpUs0KeOBZM3A13S3Ih9cAp/iTO7by9ppQaQ
         GNXs9Pp9NrHoKw4XEuCwZyRsoSUPluoHZm3HvtoozdHZTaUEgs4fGU7hqAycppooVtaS
         7A+w==
X-Forwarded-Encrypted: i=1; AL+hErF9Pg02oKIm5dkxzspquDT1EkXJ04OTQaPrOFYdOys7ey23faOru0LijdgSjahPtRp/Z6pnZ8QvHPU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9KoWYKTwGcKTyk482gDtAE/YrKIROMo8PohwQz24oAFbCprajS
	M5AMT2MqVvkVpjmmAx6S7TIs361CfQ8d0HafbI94VblYV4rvk9fD2QoM5HcEEahYVw==
X-Gm-Gg: AZFdTZftG++R5AnRw0HRAXIiZfyE7P3WLC0H732PtjBdSrDNoNfUmiVPSgcfrO3+K1g
	g91A2w3x9aqwr9H8k7lRSwMYwL9o2+qiDu2/xEn9n+E4OkHThne+c7SE+TKziDlyjLnScybjsKP
	2H7EJPwQzRCPijvGYWAiy80+/ToqXfI43EBe+EfprXsGf+2kv246ZiHKzWyAn0GSPfwOcQZDaaZ
	GiSVYbQysJ5iiugHe/odKaTR1k7zt+LsVqyClQJn6xq6ghNmRp0YzD+ciIASkl83hs48quVQSKo
	21JdEifLVUC7O2uPSt9UR55UVCN8ictm6aWjBbjomekoHQWktxhA82cVrLJPFY2QmFkwJWKCV1b
	kXzNDMB+1MOfve8W5mdAF6Al4m3B2bJWAEWj3DKf0joWHheHsNIRn9WWJETE5cV+KkAmPh2DrdM
	znkyVHzulEaJbdK5HhLm8M5SsxiOxCjsEPyHXrkJQY/tqzUtqD/k/DZhm5nvJRrNf7IPVvVPB/n
	KgXVMa9Fpwsnxhya7BdHkyi1mTHlkfNhjo+dlV2KqnE22JdKuxcYNmERUQXj6p8HXD5Q1XQxWk8
	OSrmEnYOpZiOxdCGkQh83QS9SyBNiL/2uKY/LxFJE/X4ESW9WD37wbriZ+pG5tYzvGkr5XS0Quu
	zA2CybF4Sx+nBwqLU
X-Received: by 2002:adf:f00f:0:b0:492:aff5:da4d with SMTP id ffacd0b85a97d-4a37294847fmr3470629f8f.7.1794910281259;
        Tue, 17 Nov 2026 02:11:21 -0800 (PST)
Message-ID: <7367755b-e2e5-41bb-9b3d-494f6d17378a@suse.com>
Date: Tue, 17 Nov 2026 11:11:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: Don't adjust the memory operand of BT* with an
 immediate offset
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20261117045812.304422-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20261117045812.304422-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794910281-FDE0E77B-7B476854/10/78276251493
X-purgate-type: spam
X-purgate-size: 1111
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 05:58, Stephen Cheng wrote:
> With a register bit offset, BT{,S,R,C} can address any bit from their
> memory operand, so the emulator moves the memory address to the operand
> holding the bit. With an immediate bit offset, the CPU only uses the
> immediate modulo the operand size, and doesn't move the address (Intel
> SDM 325462-092US, Vol 2A, section 3.1.1.9 "Operation Section", Table
> 3-2 "Range of Bit Positions Specified by Bit Offset Operands").
> 
> The check that skipped the adjustment for the immediate forms was
> accidentally dropped by the commit below. Add it back, and add a test.
> 
> Fixes: 47591e012f08 ("x86/emul: Further simplify DstBitBase handling")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a remark towards the description: I question "accidentally", when
the description of the offending patch says "... and simplify the entry
condition for adjusting the memory operand." I'm inclined to change the
word to "mistakenly" when committing.

Jan

