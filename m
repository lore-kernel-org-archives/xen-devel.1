Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB97606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YYLCy390
Received: from list by lists.xenproject.org with outflank-mailman.1469313.1678158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOA4Y-0007qP-Bo; Tue, 03 Nov 2026 08:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469313.1678158; Tue, 03 Nov 2026 08:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOA4Y-0007qI-8z; Tue, 03 Nov 2026 08:40:50 +0000
Received: by outflank-mailman (input) for mailman id 1469313;
 Tue, 03 Nov 2026 08:40:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOA4X-0007qB-FK
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 08:40:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOA4W-00DNvc-8k
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 09:40:48 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae99e01-2eae-0a2a0a5409dd-0a2a4501e5e6-46
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 09:40:48 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae99e0e-5984-0a2a45010019-d155dd32a92f-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 09:40:46 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48e1d0e5dafso218103f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 00:40:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78a6bsm23509881f8f.27.2026.11.03.00.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 00:40:45 -0800 (PST)
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
        d=suse.com; s=google; t=1793695246; x=1794300046; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfY+iLymB3MMEjfwlaJdOBvqUt1Xi0dcHx4dzg8CpHQ=;
        b=YYLCy390hB4IQinpLJKgs1wKivusCndlovrJ8MAmeEW4XajV1UztqHgveNbDuuV88U
         nbzZMSHakp8Sx4UHOLjuWKbXynr07d4kf2olxlWRBeUfY5J/T0uuh4NJDBepMrRcXPyE
         8+yBID2ZsSSIRLTYth7esyL0SCkf+uQSeWKK6LtVqL8297HoAJuD2bs6Oszs9OrqgGb+
         yeMck6vWhdyzUyogYMJVmELK5SODJIMfejcAdb1C1PpNnyBDJyjvbyve+BoiJW3P3M1M
         KuGgAQUpW0Rkjn7q7L/ED2eZkHFrlUVyicqysbUOKT/dt7ufJ0cH0ipLTCYnikxbfnLi
         rHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695246; x=1794300046;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfY+iLymB3MMEjfwlaJdOBvqUt1Xi0dcHx4dzg8CpHQ=;
        b=BPE4ax/jsFQFXc0rjDE4I8vJnj/U8uLuzozINPn8aPDyTcJN291Xctup8yepRvhS56
         CLNhiYtr6X0Rmy9PpOQAtJ5K146XOUnOtR/dRV9K4p35kRPM2FCUK3GeWmUHWoV3zl3s
         gNY8OvnIR+pO4gaNNJ1M+dc401VBgUb2Bg9lL803V0SYzRrTMa6X2CTw/OM6vEKO3lBx
         aLcMKcXroxqJsN5m13M/x1/boPYHgcEhJ0FRRDzzEFy0Qa2X6v3K98ndaPEUMEnWy615
         1YFMkZ+u6GeFrNFx8RHbDDey+C40sdjXrhATsc/ryKpl6Pd+41pf2UDFXMaDCPBJQGkb
         eZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIx19flivBDAvMzP2Zk2RaYdP7YH6zgi1foocN74GnNjdfxzbX8OMNmvN2lzZanb7ofpvDsD5nFTI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8I91WmT9v4qXfcKdXHaj93aeEJCyZ+sf7LrfbRNY324L+jafHy
	9OTiyV+RFM6ZdNDlIdEWp9bbpnkIcSdTd78Omj8zrv65Yi417Yvzz6PwW4slAzes4w==
X-Gm-Gg: AYBFou0Pi4Oc758vskeyIRDomG4/hht0XFGMtCPVkbdlmYl3Wj9XoDSIkzqHhBEYq5m
	ZPSeP74Fk86Zpex/ajFpsN/RViTPN8fjUaEcxxHcIOV/t+aZUptPXqHBgTaBXROd0Y5Flth4v4y
	hrMAJy9PQoh5JreItUm3NnO94itZrUyzyIwaT5woCTBaMOhd9xUPfXheINA+6w+Q9emRQLh942k
	IrhDVtEn8yQGK+HlOyrr7g9Prw4ofSqa8ZCeyYj+weM5YJm0HTLJlHkNtlML4a/Ip1mkzlzuJmg
	M0clYLII3x+dpsTmMiym7khvzRIok6mJsxk5foDOUtqHujGwPpjlS8ZDFtJ/cEmcp+5H/rsAt5v
	DHWPlvOm6vRyS0/nqCQM6LWF1otWluOuKRQzkwgkCRLoktwdFrxCswRDyOlOBy3mucMf41moCy5
	sZId7H7IvQGkaMt5sa37lvBw9nAiPye6NU55mWXPVkxk5RgRpcEtjPiRIVPnaeJ6Z76qLctQTWN
	zHILs6Bb27q0jUkNiWZUNenUcefwAqDMoXCSNXKeUKcKop2vb+rnNlpWixXwzpdrpM8rCHJXtVG
	x2Nd/n2scGPMNYImy0zTRcioXCez9DZ/H86pVqmY+2ovW4JPnFz6IK/0DCGU/6QyPU2ZvuP6pp/
	Jb1QqnW26oU0Z1RFW
X-Received: by 2002:a05:6000:1449:b0:48e:6c28:6051 with SMTP id ffacd0b85a97d-48e6c28619emr31010306f8f.19.1793695246331;
        Tue, 03 Nov 2026 00:40:46 -0800 (PST)
Message-ID: <6b7b5ade-41ac-48de-ae30-8bf8d1c72037@suse.com>
Date: Tue, 3 Nov 2026 09:40:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Drop {nmi,mce}_pending defines
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102174056.1763614-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261102174056.1763614-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793695246-1E465757-C6FD0389/10/78276251493
X-purgate-type: spam
X-purgate-size: 310
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02.11.2026 18:40, Andrew Cooper wrote:
> These obscure the data layout in v->arch, and prevent using the names for
> other variables.
> 
> Expand the defines in place.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


