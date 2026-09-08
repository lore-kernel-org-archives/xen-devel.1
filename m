Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2D4C79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:27:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411910.1642362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uuY-0004qw-7q; Tue, 08 Sep 2026 12:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411910.1642362; Tue, 08 Sep 2026 12:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uuY-0004qp-56; Tue, 08 Sep 2026 12:26:50 +0000
Received: by outflank-mailman (input) for mailman id 1411910;
 Tue, 08 Sep 2026 12:26:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3uuX-0004qj-3v
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:26:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uuW-003uv9-Gm
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:26:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fff08-e002-0a2a0a5209dd-0a2a4509cf1e-0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:26:48 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fff08-be1a-0a2a45090019-d155dd2bb585-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:26:48 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-485843aeab8so5107139f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:26:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858bc74298sm32279700f8f.6.2026.09.08.05.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:26:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788870408; x=1789475208; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/jnIXZxy5wL1r0hTCYkZDnPYR/0n3ToX9UUqnXE7Kl4=;
        b=Fm+87f8w2JBibJTX5uUY4RITXEfP1NrRngn+pSSbCJpgCDM3Z/qjRSWiq+PJQQItQ/
         VIH9JyqvPgGIBmDZeQvG/UuV9PT8uWM14n0jJd246cz9AMTSF41hS4LGQv3gpuW4dfqi
         68c5ZmZjU53MLnNPrFiBbtO+EmbN5RdSxL66ur9q5tB7egQbHVAdyJXAK9GHoOQVwLX7
         UviuNSQhGSiyrnVRkMqwets8dVGNF8lL+jAgeRr2UrdJ/UohrrUQt4/1S7IImPwor7yi
         3nBMeHmuCwGAFAl+n/qqjSALooifnI495W73dfkuD6FE6mhJSKsh7/NSzvO11GUVpJrc
         JHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870408; x=1789475208;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jnIXZxy5wL1r0hTCYkZDnPYR/0n3ToX9UUqnXE7Kl4=;
        b=krPertEK7LMebgqfG3kiTWTv81rft6vxCRZq/PGj2AgnGL4TJuBsp8skYgdMkQgBbJ
         Q7DVqj3EL/yRIugBvbvfMYt6CDoqx6bkvHtbyUNpgDndhlmKPGn60vqqNX1TA8TPFkfH
         DUg6Z8k5wMWLMBCEhAohyQpq/imZiF6PKqOLv1SF+wnZ+p3QD0m5I5NyIE9JDFuo3gWy
         RcPlcmSjxL7/q3Gr8khD6g5GAgrc9BdNyK2uoy1lHPKnq4BJvmEJmFlNdUCiGoJHZv8G
         XFMz9EqUSniFRJNHjaMMUxiNvuFQpw1RVc591qsuFj5w3ywzpfmyOQw4kaUK5uJr4cwX
         RDVg==
X-Gm-Message-State: AFuF++lueXo9V3co+1u6qc4sX+9b/E9Nn54SuyafwgW2f6PT6dNW0brO
	Tj3QOk3UFStNCiBF0d2vOAnu95VxoD5/xB/PtxwcZr0rar0c3XALBlVBZTq43IecGu630L7YELy
	YjtoaUw==
X-Gm-Gg: AYBFou1a3hxLFAo6NTK/ir2pssOTbucibaE8FaMossYFvZSxfCkMFaRIH9PLHf/Bi74
	iInOdUAEFH8SqBL80H4EApLKFZvY34XYdFIL99B/TXXh5xb1NSi7xJZoHBz0GUEjWkyEtlfBK1B
	aLcq7YT/R4J8ZhrH9+D99IR3ifsL/dsHf5UqqThCljZH9mjTsAIMIeWKbCTYkW0uG74MP9k+Ilt
	dvydNNGrpg2n3Y3bJNUZM+WLjlU4J+6+D3QQEZMAaYxKk3QTJ/K0S9IytwtjZja0mWEzprl54VS
	mfrA1XBBWnKxsw77+KvV7RNU88Jg6yzdeeUgDd3F+4T7coICFBMRynbncjSlFFl8v4zOLXEepzZ
	KaMQwo7X9UFq0wbWCJb0pnGY/Vxfy7NWfV2I9oVQ/P42s0K5w0Eig3y5T4U5X8wuHWpc4KezGEL
	GsPsScPjbssDfv4eFQnIkA0j3KEMpboN2vnLnWdnMbUHcF89onkd9urOMXbo6jpRRO3EHGY7AaM
	ipnjNB3sMR09SNbgkI0Kuab4z/UbALGH2I7wBeZu9UGdEwVU3ZH
X-Received: by 2002:a05:6000:4796:b0:484:3312:f127 with SMTP id ffacd0b85a97d-4858709b371mr47597122f8f.27.1788870407878;
        Tue, 08 Sep 2026 05:26:47 -0700 (PDT)
Message-ID: <153fd1b8-810a-4091-84d5-5395d83f2ee9@suse.com>
Date: Tue, 8 Sep 2026 14:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/6] build: split and unify linking of final image(s)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788870408-FD06B034-F9D8E49D/0/0
X-purgate-type: clean
X-purgate-size: 743

The monolithic rules, largely but not entirely identical between ports,
were pretty ugly to fiddle with. They also ended up going out of sync
when really they would better have stayed consistent. Break them up,
and use (largely) the same rules for all ports (x86'es xen.efi being
somewhat special, though).

The final three patches are related only in so far as they address
observations made while doing the conversion.

v3 addresses review feedback (patch 1 only; see there for details).

1: x86: split xen-syms/xen.efi linking rules
2: Arm: split xen-syms linking rule
3: RISC-V: split xen-syms linking rule
4: PPC: split xen-syms linking rule
5: build: move $(all-symbols-*)
6: build: move $(compare-symbol-tables)

Jan

