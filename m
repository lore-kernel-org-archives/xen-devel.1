Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A609C61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 11:57:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399838.1635805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCG3-0002JF-3i; Wed, 26 Aug 2026 11:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399838.1635805; Wed, 26 Aug 2026 11:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCG3-0002J8-0S; Wed, 26 Aug 2026 11:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1399838;
 Wed, 26 Aug 2026 11:57:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCG1-0002Hx-Oe
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 11:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCG1-00D3Cr-1M
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 13:57:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed49a-8faa-0a2a0a5109dd-0a2a4504bfb2-16
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 13:57:28 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed4a8-b57f-0a2a45040019-d155da30ac7b-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 13:57:28 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c2530cabcf4so18463866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 04:57:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b2817sm465635266b.53.2026.08.26.04.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 04:57:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1787745448; x=1788350248; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YC0UNEN4nZ3HK0sJ7RDWvZcwbOtHVAF0XSsvZEItZHE=;
        b=IFiesb6Ne9Fxk8U+LmenJxUhA7Prjp+AGWXvT49htMNG8ZGTdt1cXOUDlnuntvFsHB
         7HJqLDcStn2hNoT/yChpbnwDzA2nm1wv9riHO5DxBKqv3t4JcO282I6D2T6KJKSvXUuV
         C9NjWHNrscAY9ry3SSdBasmKNwvc0uByCkj9BdTkHJiQTimJe0TFlo37Vj9Q3RiLin4c
         0jxmKeioErFcRWK6Vxjcd7zVHt8zT6YawU98tlYFCERPE6HUZ05azlEx0hO1BVL86/oO
         +YSETAotNO+C846aZ61WVoFF/eDWh4vtiIlNG+j8gNx4aPF/YaQqMdH9VrF1WEHlI/p8
         hwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745448; x=1788350248;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YC0UNEN4nZ3HK0sJ7RDWvZcwbOtHVAF0XSsvZEItZHE=;
        b=DGLa/+zJYhDmtv2d2pCtB7mh/BV7zGc9nKQ6x/KcEPzgyBqlJBKGC2svC7a5aLXwxi
         cNnqhyAXCRT9IHRFXAbFmABDLZH4yzcWxMDYHIgWqPCw7nuFh+JoAt1yjCAlqEukj4Nj
         S7RUrlyn8NbGF1bRMGIn64fIU2M1roqbEScSE6S0mtIki6S3u7V3GH9cO7g31baVGSp6
         3Sald8Y9ciLb5rOuatP3940xSnH4ed/etksttxKvAVyfbyS5c4uBbPH1Wg9TKeygyamn
         sYGR2kQWgpVWVfTYjSMephawDfboR5gHrvzgJT7Ha0rnFj5/5/wGrpJ/fKms0n9Hc6Xp
         ilZg==
X-Gm-Message-State: AFuF++kPidaz3d88OGaVRhy14rYoze8WZokYb4jK+emEJ0AeuqZSSjUx
	A+MF2WPR54LyAaw7izvBvpuyHF9IJEVptPt9LpcKxRetv4MCrp7n73U8AXbVRffOdl1HXTCMW7r
	s7Dn5MQ==
X-Gm-Gg: AR+sD109Zw4EeZpqdqEaj1tfhk9e1Ol1s9x4qjn/4S+1ttGmwz/9zkr9LDYvttrRtpI
	LuRZPkuHf4Cbh/CYUG5lxyvshio+QQu6HDy3q7k+pDpK/5Rvrqt2yWQrAH8BD/1cp8Nz8/7aKCw
	ZRWvZhDK91EKFpLseEVuoWj7FnxUeXPlqLP8G4Seuu/ox6ojFkx3yCiLqy3g7+22ZvRpf1lTIBp
	7o8fsXL/n01qS7YmvQDJRMtPQK9Ro5zCT0m7qbBLL7GLpiUGqMU9vlQO7fu/7/kD/RjKziYcoky
	PV5QpisN+fFbjT5tlYntfI0u059gaeOSQ0E7Dcn6+tCQjS8r3VDlhBwuhXp2VlA1uChDyzt96PF
	b6fNEFSwMCpokaflEeaAyLVcJJDx/Hj/wFD4D8X6RErQAhWKpGVDq7SdgVJnSI/2KMSMaRdSdvg
	FPimsJ1ZjF+x5LAnjbCirLSBVutSAKCKp/Ig/wTh0YZVBenf1YxoP/1HeuI68QNCxULsl4yCoWQ
	PuqVqXptox77EGiKPLSk1q8FarSgqGo4UbV/JT2WgVkiHKCBs0te60eszn3PrI=
X-Received: by 2002:a17:907:7249:b0:c21:752f:c3f7 with SMTP id a640c23a62f3a-c250bc127b0mr792726366b.18.1787745448459;
        Wed, 26 Aug 2026 04:57:28 -0700 (PDT)
Message-ID: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
Date: Wed, 26 Aug 2026 13:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/7] build: split and unify linking of final image(s)
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
X-purgate-ID: tlsNG-ebf023/1787745448-518D1B50-217AEDDD/0/0
X-purgate-type: clean
X-purgate-size: 854

The monolithic rules, largely but not entirely identical between ports,
were pretty ugly to fiddle with. They also ended up going out of sync
when really they would better have stayed consistent. Break them up,
and use (largely) the same rules for all ports (x86'es xen.efi being
somewhat special, though).

The final three patches are related only in so far as they address
observations made while doing the conversion.

v2 addresses an install issue I had noticed too late, and has one new
patch. See individual patches for details (if any).

1: x86: split xen-syms/xen.efi linking rules
2: Arm: split xen-syms linking rule
3: RISC-V: split xen-syms linking rule
4: PPC: split xen-syms linking rule
5: build: move $(all-symbols-*)
6: build: move $(compare-symbol-tables)
7: RISC-V: place .sdata / .srodata / .riscv.attributes

Jan

