Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAB0C61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 08:29:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399698.1635682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz90H-0003Xp-IY; Wed, 26 Aug 2026 08:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399698.1635682; Wed, 26 Aug 2026 08:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz90H-0003Xi-Fz; Wed, 26 Aug 2026 08:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1399698;
 Wed, 26 Aug 2026 08:28:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wz90F-0003Xc-JP
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 08:28:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz90F-00CQ2z-09
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 10:28:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ea3be-8faa-0a2a0a5109dd-0a2a4507b7f4-42
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 10:28:58 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ea3c6-b4ea-0a2a45070019-d155d02fbdbc-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 10:28:54 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6a38098734bso1105655a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 01:28:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5deaa8473sm4067116a12.21.2026.08.26.01.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 01:28:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787732934; x=1788337734; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DywgHdCmnUOIWC8SRrCzIw91lBf8ROON0CehWTXQdrI=;
        b=dk4JC3CKPEM8jzPQWlCYSz6hafZKTFklwrLDlsDJ1G3PPoylNj3fZ1g8v7JHB+Nkmr
         xAi4AMr8oQV7MSNjPYoVu+GVx5tmaWbnUO89o9FAzZVgYi+SORE0epAOFDf5hvJzLHtV
         YDowjFvcOED0gazsdQFsnMJkKEAx24q4m92x8wB3paILK97f1MIDLotwm2v9mzHgszQf
         vQGnH7YrbMVn2yz2CmoLJQM8OCfpDykIJ5qCxb4moJL+ZeimpauWp7tT4Z7zy72kXU+v
         QSJpFCzJRyp4NpNGjD6juufP2bwDBMasp3qp0A7UrPxzS3UI4+3eonoyroMKVSZqOJbO
         QPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732934; x=1788337734;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DywgHdCmnUOIWC8SRrCzIw91lBf8ROON0CehWTXQdrI=;
        b=S580s+3uIEaVNSHFWKtlJK89jOJqKW9REwzvGb1Gk4PHRVwrf+S2z7ouQEhc5qutr6
         AKRo4wwt9iWgTW3y8xmFbn7Exs4Wc+JA1IbNaOkbnb75QcKdwhholZjXRpKzQAYwVuEv
         qR/ZQaEYMRUjq+S31y9Hn6rIUPMF1R6zwJkkL9jryvTcXplH+L4b3ybZ4EMqXZDrR1jo
         QZwlfYsxWzf/JLmeaaolg7tXYHY3svCdWdnt22S38rkNVgbtxdqumazoNOd1LtKOPoVn
         yh0YPmEYw+PeHkwf2+wKD3DDvse3hsjZ1N7yPReyZ/mJMj/e2aVuIc+LC5Cuc0RFB37O
         ssxg==
X-Gm-Message-State: AFuF++m4tDslNjE4/cl2Dpos4NmP7mULoDQxt1G5pdYkqgEKeFJknuR3
	3Tu88ExEm9MVqitxHf8rpfipY/Feup1DYH/2DKgRNp5AgAtTNu/f3F3PsR54f2xKE3QtSjoCKwa
	NvzZFKA==
X-Gm-Gg: AR+sD11DXW9N9GQdGkPmXTp0rGsDluz67vsNV7hWHeC+ArBQ9uC7NseT+C9M8HzaTV8
	/klmQig6xj7WmoTXUohxp7OwcK03L4pYQ/+PygmuB+2f1KMolLO8m6hnrZEWbjPJV6MvPtZcKQc
	tm+qWv7mT12v69nI66NZ2MbEVMULyx9qSGur57mIXHDV5J//MVX5xhAjeHmLWpBq2SDrL5hr59p
	X64ateUcwkukonAytUpZFUXf1X8ZLaXX3A7k1kbQrP7Kx24cwnjM/WKiviemzaTTv7VFZ/MPBXK
	tvjIlmqECeEn/j0UOwHpEZbTSWzKt3xz2mgN3BJwK/qRn8RCDNKn3WkhXE4Qssa9FyJMJlRgxmh
	9hobCyO5ZrbbZKrg6WMGqHkAqWfFO1zVVr86sW5p83tejyegk+MlMd60xAjduJBJ0BKP7KA0n1l
	JaiYRnpadt6CGkDnFON7A0LdR48JU7QVUVvNH3ZF3tsQ6kkssZPfKLDvVl0wOuFhk1uqnTpoJHj
	n1ytz6cdtwW22uwmobD51i29ip77bi0siS36ky6SYEXqfFSghMu
X-Received: by 2002:a05:6402:52dc:b0:69a:a4cb:2882 with SMTP id 4fb4d7f45d1cf-6a5df6209bdmr6269331a12.9.1787732934557;
        Wed, 26 Aug 2026 01:28:54 -0700 (PDT)
Message-ID: <da410944-fd1d-4309-837d-04d99074c084@suse.com>
Date: Wed, 26 Aug 2026 10:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] symbols: also special-case symbols aliasing
 _sinittext
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
 <fd7dc2f7-6505-42e2-8eaf-fb8e9af21bd4@suse.com>
Content-Language: en-US
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
In-Reply-To: <fd7dc2f7-6505-42e2-8eaf-fb8e9af21bd4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787732935-34AC8AE4-19CFB893/0/0
X-purgate-type: clean
X-purgate-size: 1362

On 25.08.2026 16:29, Jan Beulich wrote:
> A recent 4.22 randconfig build job hit a situation where (LIVEPATCH=n,
> i.e. --all-symbols not specified) both __note_gnu_build_id_end and
> _erodata aliased _sinittext on the 1st linking pass, but they didn't on
> the 2nd one. As a result two fewer symbols were emitted on the 2nd pass,
> causing $(call compare-symbol-tables, ...) to fail.
> 
> Extend the existing "corner case" by also considering aliases with
> _sinittext (_stext really shouldn't have anything ahead of it), but
> discard only non-text symbols.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Re-base over _{s,e}extratext removal. Add const to cast.
> 
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -217,6 +217,11 @@ static int symbol_valid(struct sym_entry
>  		if ((s->addr == _etext && strcmp((char*)s->sym + offset, "_etext")) ||
>  		    (s->addr == _einittext && strcmp((char*)s->sym + offset, "_einittext")))
>  			return 0;
> +		/* Same for non-text aliases of _sinittext or _sextratext. */

I've locally dropped this leftover mention of _sextratext.

Jan

> +		if (toupper(*s->sym) != 'T'
> +		    && s->addr == _sinittext
> +		    && strcmp((const char *)s->sym + offset, "_sinittext"))
> +			return 0;
>  	}
>  
>  	/* Exclude symbols which vary between passes. */
> 


