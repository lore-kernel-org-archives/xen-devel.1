Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB89606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lpm2X4yS
Received: from list by lists.xenproject.org with outflank-mailman.1472048.1680110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcL1-0006c6-5d; Wed, 04 Nov 2026 14:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472048.1680110; Wed, 04 Nov 2026 14:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcL1-0006bz-2r; Wed, 04 Nov 2026 14:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1472048;
 Wed, 04 Nov 2026 14:51:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOcL0-0006bt-CE
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:51:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOcKz-00Ak3d-PA
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:51:41 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb4674-e002-0a2a0a5209dd-0a2a450b943e-22
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:51:41 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb467d-b7e8-0a2a450b0019-d155dd29ac2d-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:51:41 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so425524f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 06:51:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8e29sm4510590f8f.19.2026.11.04.06.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 06:51:39 -0800 (PST)
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
        d=suse.com; s=google; t=1793803901; x=1794408701; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uc8W2UpuSTrMsgDJbRnprQBO1BgyU+dWXGRRmxPKO2Y=;
        b=Lpm2X4ySRCfNpbBAPqreGCn6le4xVypK567jhdezzNyxJl27efwNfnIVl5uN9hCajn
         QgLz1okvFfG0YbjipHgUSHjtpIvhduSWJskWSJMRXBgrK/UfSfpHpOIEk9kAhf3rvt4B
         VbMKklQ4PyzJzPGsYWbNlYndEkQ25EqDtn8Z06MBO9ItcrR68b9gMOOB5MgROiaSbIWt
         xO90mENRV9iRbsQEzenA0Ckm6bgf8vWDuKt/EP6uaBpGhJUQm9N5lvh+ETV9hv585tBl
         6oFEKhLMtqfUUAJvMXK02xZVdiyRSf4haI31Nn/qQHsCKzVIcT8jmgRjUq9R3UF8TqsD
         sSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803901; x=1794408701;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc8W2UpuSTrMsgDJbRnprQBO1BgyU+dWXGRRmxPKO2Y=;
        b=sgNgXpJZt91SXleowTVlk1TrZt9gqtR9X7HkpePLIpz66fbiSkCrmKixZe+IAVwheI
         IR/cbatxgkbr+04nLeV/TteD/yCOk4AKBueVno698QoFtiofrKKFxEELzEHZl4fJusGy
         OZNlyIeLRCKwL/ENzKxwsqM0q3hA0VHTp3xOc7azcStp0K4O9p7ec6eIl/my2z46OXxI
         eTutXqvuyOWo+a9931SIETfTZ998DlcfQ9VIYZNbOib+gZylwgy/8I3bA22Q2+xwbm5+
         uSGggRN3TWjPUb/+3VrKTtfGp3PrTfHhLG6iMrI0EZF0dRWJO4acQgKmVxq74YYSS13Z
         2v9w==
X-Forwarded-Encrypted: i=1; AKwUvBwtpGV5KMIssXHMcS/1ZbH71Ksc0PzLPuBY/2/3FAFM5b9TTeL0+HbPVzSOjZ5Z2rBeffZM+b+/UjY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+kVSLuIPEFzc1jbGHrz4fdnMsfzOSz1/jv7PkqYXdA8Tmy7QHY
	ysfIkLnu1NjNXU0976n3uUil48MW6x2um+M5V0BiRTKELWP8vEXdpXJNPiL+pgeJt//yNEW4JUf
	fUzyafA==
X-Gm-Gg: AYBFou26q9um/8Fv5BzS/MFY9+/Svp3O2lhlr+454MnJeNTt2BlJe1voTdZZe3litFj
	jjxQX0eTakXoq3tEkkwldsvBZoneKuPnYC14MoYTuoxn0sl9tgJSVKnmdMpfobosrciclalfTWI
	PC/iykOtpuRjpPwJY+kjsrWp0W9JUrEUYwFQgvG6dYlO1d7tJUTv/0OldrHUjiUHYm16kT+tsMJ
	HC2xDyM1hYAcb3H42bV3Fb0vAlQQrlb4I3PKYz2G62xN2amaQUVF5X3OCEvGefcAbPW5QgIDrlg
	DkbTbRvwyMbQbMKKb3bZ+majHDcXKxOMf7iH5rYuCpXncfIjS0TpD9qPSyvZZbbKuNo+RZKNsXY
	tsnkhoMkheIuJM276VEURDTDRFcZ8V5BEoxUojwMeqVt4CXWHAQ/Od2PGXfsGZbCrjBgDQV5Gpm
	JsTVQTYVl1zvQ8jUR2HDLOV7EeezhPJYn+4uTp0vpG8ZDZUJSGVWQd6c5ethTwkJMJq2+9hyhJs
	kRlzq40RBPLFz666GasenJbqOrs4mLYBsoljeqBC84Hz/CsXbMKR4qu6+HiVUVq81qB0LM+u7/Z
	WfEo61Iz9kUIghgNs+fEgsfhx5Iy7iIV7JoI0zffFFGOkV/HHRlMpPzfSQa7KoA6VwXWHOsTDTi
	PyC3wPUdnVbV0yAjb
X-Received: by 2002:a5d:4ec6:0:b0:48e:bf0:30f with SMTP id ffacd0b85a97d-48e6e308ed9mr28652479f8f.34.1793803901049;
        Wed, 04 Nov 2026 06:51:41 -0800 (PST)
Message-ID: <28839e8c-bcde-463e-8617-92576ca8e8e6@suse.com>
Date: Wed, 4 Nov 2026 15:51:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/build-id: Drop xen_build_id_check()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
 <20261104135133.2209628-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261104135133.2209628-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793803901-1B6D29EA-6E48B235/10/78276251493
X-purgate-type: spam
X-purgate-size: 946
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 14:51, Andrew Cooper wrote:
> The function is misnamed; it really is looking for a GNU Build ID note, not a
> Xen note as the name suggests.
> 
> It also has an awkward API to use.  For a GNU Build ID, the content is always
> at +16 from the start, so really doesn't need to be returned by pointer, nor
> is it necessary be doing additional checks on the returned pointers being
> valid.
> 
> Switching to is_gnu_build_id() allows xen_build_init() to be simplified,
> returning after the first successful find rather than passing an rc down the
> function to skip later checks.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> The 16 probably ought to be a define somewhere, but I see no obvious
> candidates in the ELF spec.

That's for NT_GNU_HDR_SIZE in patch 1? Why should the ELF spec care about
GNU notes?

Jan

