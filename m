Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B5DC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:56:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392552.1631514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsCT-0004tb-Gb; Mon, 17 Aug 2026 07:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392552.1631514; Mon, 17 Aug 2026 07:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsCT-0004tU-Dr; Mon, 17 Aug 2026 07:56:05 +0000
Received: by outflank-mailman (input) for mailman id 1392552;
 Mon, 17 Aug 2026 07:56:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvsCR-0004tJ-JE
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:56:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvsCQ-007gmq-DJ
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:56:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82be81-e002-0a2a0a5209dd-0a2a4507af8e-48
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:56:02 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82be92-b4ea-0a2a45070019-d155dd35f16d-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:56:02 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so1683202f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 00:56:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b51asm1816281f8f.11.2026.08.17.00.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 00:56:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1786953362; x=1787558162; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFCUkMv3GpQ40PwNsMuGVFNvWtlkQzWO5EkN+a9wFOQ=;
        b=Wv+MVVJ5RCkrY2N4humStusJh3VvX85uuLxGGPogvFz9bzYnatM7iPXUzaIHk18IBA
         LM9/ZF3/pi+FoRCpPftwRbP/uGMtbnL0NKfysdb65rMm1/wtoCW0gk/amtTryZ0TC3Q3
         4FIzN81Uger6XRgfNVuch5E+axs58QqYs0zU64lWJ36QQcGn1pYGzNQjKRUC6mSzWaKJ
         r+cqkWLE3AoNHAta+hMj/lrwy2TG/aTpelxGQaPbU/213/jP69XQyUIu9bD/Ek1ENCxM
         pUpHB9njaAXSiqmUWOIg/RyEJ5xI3wHBpvwoLv2COTgcMp0M5Cb/gveApEAQfOyquuV7
         6lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953362; x=1787558162;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFCUkMv3GpQ40PwNsMuGVFNvWtlkQzWO5EkN+a9wFOQ=;
        b=dIBrjZN9Gfjhbq8dSSHWbt7ObbAgFlK0scZYnLHsE5qfdYVCgyBBfATaPOH5o3oLL5
         W2uXSxE7Ef5OF+8tHLL1MWpEPsMdrzCsFXbGp66RM+ApphWGuP/7/GZoOvwiSHRiN0pR
         eiiyZYQlnUHPX8untZi4TO+UH2riM6zlQxAw1B4M2V3ZARr50fdCL1Jhl6MA1Q0NWiS1
         GfgEsd+crTvVC1EKJfg6hgp48AR1YMAfKo90qTnojK4mYlRhGsT77BU0Lt3D4g+B2ETG
         NYWYsIRB+69Qat6vfbVyrqU+QZgiUVeIKCGoi0iIegSp6IHx20pK8IMkQRCc9+XQPfeB
         jTqA==
X-Forwarded-Encrypted: i=1; AHgh+RopiTAOyPHCU8oin1ua0nloZv62BEFQk26+nu7meXXVAUMe8qS63ub6cA6he7RHt5BVfE/rzjyncX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdR+4mxAw8W335iXeHBQBbAe9u2ZikYOug8aeufsO6/NMtJDf/
	46w73ywKxB7viZODMRCGLCrDwJUcVT9fwKA35QYoVHtycFEpAPUI8blaEKjDnmN02Q==
X-Gm-Gg: AR+sD12oSVqLfN9rBPlwmTadOMJXFJIyUak7ViasNeqaZC5Vs0aq2nIT075JpEqQadF
	zLAUFuzMpm0uJ075A8EbTXUkDIICOoulKPdNweLLtD5LQYmzfUfs0E65V8K4bs1aDgC5oDHkTnD
	0QDYM8azxXaQASCD88kX0K3ZFdbsiXkzFU6u68qi1iF1jfqwo+EtUobOMpLVeQBrPNsYhsbyJFS
	e5idyliUhGyfa+Ru7rCe8Ha2LZErVLfbVz0KWe5NCKTj03oACDX8pnxgOX2Rrr5YEKqSxrRsCUy
	1jE2Rn1tJmD8zLmsZaV2LBgK/DQ7pbHnD5czK8ILDv5d7DQV/ZxbyjfXrpDFVcK5VjMud8dkLrJ
	L1mcExKSEk4U6DYHlt5tlD8ZYpCVTkzcZArs5wdBhw1CIvZzXYShtYxlVn6RtE2gbJSrMxA7cX+
	6XID9o0j83AaXCHfZ/MEoqHay8NgxAsz5FMYjJgsdaiVnbevr5MfreX0fby0obABBJmL00/gRlO
	4pnnfo88OiVpVFYZY9PfxEBKrGk3s92D1ZFSbpTFwqqCDaxhV63
X-Received: by 2002:a05:6000:401e:b0:47f:34ba:2d0d with SMTP id ffacd0b85a97d-48160705173mr32034788f8f.8.1786953361727;
        Mon, 17 Aug 2026 00:56:01 -0700 (PDT)
Message-ID: <aab2b1da-afc0-45fc-bffd-769993e6808e@suse.com>
Date: Mon, 17 Aug 2026 09:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Config: update Mini-OS commit id
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-2-jgross@suse.com>
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
In-Reply-To: <20260817071843.114898-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786953362-A46CAAE4-87FD5C9D/0/0
X-purgate-type: clean
X-purgate-size: 171

On 17.08.2026 09:18, Juergen Gross wrote:
> Use the newest Mini-OS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


