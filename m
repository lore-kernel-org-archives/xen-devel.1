Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6484C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 10:10:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433660.1654096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA2sZ-00021P-EW; Fri, 25 Sep 2026 10:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433660.1654096; Fri, 25 Sep 2026 10:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA2sZ-00021E-B8; Fri, 25 Sep 2026 10:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1433660;
 Fri, 25 Sep 2026 10:10:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xA2sY-0001v7-Ir
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 10:10:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA2sX-00HP2n-RS
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 12:10:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab64877-2eae-0a2a0a5409dd-0a2a4509ede4-10
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:10:02 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab6487a-be1a-0a2a45090019-d155802aa8cf-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:10:02 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso10339345e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 03:10:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a349fa1sm8436019f8f.8.2026.09.25.03.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 03:10:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1790331002; x=1790935802; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DwskbpTsUOApT6/J9HgR7S91QaDE9ndp8yl6w/+1JI=;
        b=R1WzkFNCWptBuKWAUhTeEx0h0wi9JlEmXGsJ0u31lO7tQj3CC/TxpFgPf5El7QZaEM
         EeXFQDY5j/oyfHY7giLizHfSwiuiF/3FA8OAEmSt3IcBKESPs0l016SeXYn4PfHBzjve
         Y4+tiLIanEBuJNPMs5dlX4SMsepHEywZe5Z8nsKGfqhAo2Kl0HizNx/tvD7v3A90S2qS
         bs6ELvqgCssEak+MILl+nNKm8uLT623CXc0wzwba4bOkU+KaN5jqgiYccyDHRG0loGA3
         XXvMig4CPJvr5n+sB/HQ3edYs/kDbPeiFlzuMpS8NAmon1pBltXEt/esyVNnUfznEj/8
         o58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331002; x=1790935802;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DwskbpTsUOApT6/J9HgR7S91QaDE9ndp8yl6w/+1JI=;
        b=cHdS2Xb+EaEtuimeSVpfyoEM6vV2qut5t1OCeK32OY5u8eh3HXrje57FFOHSt+yQ/q
         kc8L218KybWKVyTvttwMlN1bPZrGchDksQvcXEnSRpavd3DI44yykBs6Tth9P/eZfyIS
         RahCF/4y34yzoDeuxjH2laahr+sJa/WhJr+DCK7pRbFLgfIK6Rdu33GShxaxwoIwqo0r
         nmGcSCF8RueImutkc505rCgcosLwcB+J7giyrykHSExV/peJglYDMGUIazy8xPSWpOTd
         s0Y63FOoKpbKTiRXpZ/nXs3yKg7K5HJgJePWPHReylFw2ddIkCrMqWiwsjOEyV0rtq86
         Igqw==
X-Forwarded-Encrypted: i=1; AKwUvBwGv6NyNWlxiAthPmVswwnrkNVqwjJ2YNIpfnJokkiepK2giKL/13Kc6KKX2CZJsc9r7Nw+n9nd9JA=@lists.xenproject.org
X-Gm-Message-State: AFuF++kOu87QLIHl0nkty0/NPhDa6Aob+aNW7bYJpQcF+BIJ1PcYvTWw
	+FASlmY0DujcsFN9QodYwK1FGVU1OKkrMVR7sr8OZNolMrEglQNkrZVpZOG2DcvjKA==
X-Gm-Gg: AYBFou0in6miWZ7aP9QsW7DnSxdWtKLJ3CYJdIOKgwKHjdvVS9t/M5mik16ZQ1z3Gzh
	EL7HC+Fk85qzNrLhoPKjBbWCITCbQxY6MTs5H3Z7TXq8ZIxPhG3knGEpUtzX4GX9Mm9ZMOb5TOz
	zosLTF3D8KjHMrWxsKwVytcnun5sfjQ46ynhSY4mqqZRi5ul7FxzVDrMzsm8crSTBQAX57/i/Zi
	4PC+zqvnbyfD4Ql6/Kd2zjiOHbCUCEFcLBm4ZAJ9C8uZM/7p24CxifQxeWR1V9n8itOZWH1VCA4
	V4ihXWpeaSdJcHfw1uxcMhWeH9lWNP/uL61b+tcZlhpkVy7KtFQw4HDDPkkhqcudNbC2PYcNY7x
	aPRS/7G3ilQn9YKAvK3mtRWT5OJ5Ic3g/kTQOGZ3tGjHYW7xFlig9QqGEn9q8I3nN/B5c5G+i0l
	ISj3U7S9k4VPaUNl0Mzz6QP19+1rw2ovqegzs07OHUqsphlEXrU07xy1nFYoMeQaj+slMcS0TIx
	4aZk3f8EgxOUxP5pR/ZtK7hhu/dr8u3qctvFglE31rx77kATlr8VSt7wDQC27s=
X-Received: by 2002:a05:600c:3656:b0:49d:28fc:d6a0 with SMTP id 5b1f17b1804b1-49fe670c76cmr71948715e9.18.1790331001862;
        Fri, 25 Sep 2026 03:10:01 -0700 (PDT)
Message-ID: <70f930b2-31ba-4278-ab82-03a3c67d573c@suse.com>
Date: Fri, 25 Sep 2026 12:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <216f0de990dd180c8336837e86bf5860e37b9c50.1790326132.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <216f0de990dd180c8336837e86bf5860e37b9c50.1790326132.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790331002-FD469034-9A091F58/0/0
X-purgate-type: clean
X-purgate-size: 549

On 25.09.2026 11:38, Abdelkareem Abdelsaamad wrote:
> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
> debugging complications, security and performance implications. The APM
> volume #2 15.20 (40332—Rev. 4.10—July 2026) states the two possibilities that
> VMRUN will immediately exit with VMEXIT_INVALID due to the injected event.

This is confusing: Another variant of this was sent a little under half an hour
earlier. Simply going from size, the two also aren't identical. What's going on
here?

Jan

