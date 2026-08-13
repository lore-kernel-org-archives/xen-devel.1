Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FEEC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 05:55:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389448.1630158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuOOq-00012Q-HO; Thu, 13 Aug 2026 05:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389448.1630158; Thu, 13 Aug 2026 05:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuOOq-00012J-DS; Thu, 13 Aug 2026 05:54:44 +0000
Received: by outflank-mailman (input) for mailman id 1389448;
 Thu, 13 Aug 2026 05:54:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuOOp-00012D-It
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 05:54:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuOOn-00BuFp-Nf
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 07:54:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d5c16-e002-0a2a0a5209dd-0a2a4506cd4c-10
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 07:54:41 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d5c21-195a-0a2a45060019-d155dd2ca808-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 07:54:41 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47db714766aso302100f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 22:54:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5613e2sm4222287f8f.6.2026.08.12.22.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 22:54:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786600481; x=1787205281; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOb5i/C6y9XsFnyr2iObH380nZD0yDVY14kfNgsUQdY=;
        b=LlT2rbQC2VCk+qYXEc+o1rNNjkPcsFAjfz50i6C5uWIAih9myULD3zMlpcCmMM3ymh
         m299W3lA3t8cxroYc8/E1jWAei2U62Y7R18a1Yz1yGtg+BmUyYm9jpdvOL3a0lSmLY66
         8JeUb62E+3po5scpg6aToYjkmRL61onaf9eKxGlYs5ECpkDFGyash8aT8ba4zukprJmH
         vp8T1RRCtkaaI0Z4r0fS/Q12Ss5dcQaB5eHE7rd2Ys/BqwmBwQT4M59M80wibBqEco/z
         Ls8KCi0Ud/1ap0cFnrRTZYppGiyxU3D9uyQmbxBnfWounicQ1Y0TEUpjdqST3D/oPEb9
         Ju3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786600481; x=1787205281;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOb5i/C6y9XsFnyr2iObH380nZD0yDVY14kfNgsUQdY=;
        b=U6NGDtFehtiLaT+ShUhNPizIi28GyhY0AJMv6Vl0n/N5hEAdOTRsxG8kDDxVLoN2ii
         JO8lvbnRrnyNJ89bQOlD21hWgL5F9GHLfnxJ8yFTSqvQrjoHPI5ukmB/ss7yoUOgUgqP
         oC4lFX33H1BljHQYvqkY4pV91Cbwa6gv3z2UNwYUXnPW+pZ6GPZWUmyjw4zICVzkKsGj
         bhgvNvcgVUKzPy3THDKh6RBxCdls4bwi38A0pEi7v0LkOivmjmTKIyE1xAc6Qd+QgabB
         6HtP3y3PHUhj6Q/E16JaMrQMl+rLoYTHQhFLArGbxGZonKOM+W2IqI1BPov9u9jSIDyY
         dr3Q==
X-Gm-Message-State: AOJu0Ywu2mL6DJ92u0jRQTeH3P3O0r6WNdQiL9UQ/CsZ9tBKfAJnilCp
	ODF8ibZ6Il3KyOKRbiIfL9s6CnZy9qu7Va7gmbLQm2ECH+rgK8CntQorjJgmTMY4pA==
X-Gm-Gg: AR+sD13HcIf6RnZVd2Vftugt1mH/xEt+o+JbFrYNSntfFx0PYrIAxHwCaQXS8oZ+2dS
	xH+T8HoXRzTotOCgpqesAQtjg7b48Tq/dDFcXi8iX6HkyY4KF9/L4nzIrKg7PKHhoV9e5rY9nE7
	kUcau+d+DlTwXAm9fJzGigfvf+vMDua9COElvzt+VqzQIvNU58b+sZ1mZEwzBE9sjv1okt/2pYC
	c/00PRbhV4RLTVoJLUAYvRSMlXA5P3AzqKwQu4ktC3Qo4x5rSa+Ysjbizus9d+12OTSIpO8gouO
	0eq56uyJBepfSk3MHKMNAvyBpqHgT2Ggy0QqsNxNze7sqBnfuuCD4z+w344aqKUhKZmlDqE9fKq
	WVp0mAN/z3izA7nKhxcvwi+8PyQM4v002li6NEevQgqvegwikKMvs5+JVg5XVTjtzx9MK/PtG6j
	Co/Wc3At1BRMt5Oi5nF77elkJztkGSrMjxctkJw8xJ50IV26Z6+92oIwuWcthhb1DQYh6ZDj38c
	AZXzQmMTYNrU4yp4DxC0TIScFosfWSoy97xli1SIzLxjP4IWYjf
X-Received: by 2002:a5d:584e:0:b0:481:57de:df20 with SMTP id ffacd0b85a97d-4815a5436ffmr3193230f8f.15.1786600481054;
        Wed, 12 Aug 2026 22:54:41 -0700 (PDT)
Message-ID: <2f2cc724-92d8-476d-bd85-5529fb365389@suse.com>
Date: Thu, 13 Aug 2026 07:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20260720081833.4122182-1-jgross@suse.com>
 <f8481120-00c5-411e-ad66-38ff550bdd47@suse.com> <anz6XwsWjoNeHBxY@end>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
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
In-Reply-To: <anz6XwsWjoNeHBxY@end>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1786600481-FEC7777B-7A41D998/0/0
X-purgate-type: clean
X-purgate-size: 5503

On 13.08.2026 00:57, Samuel Thibault wrote:
> Juergen Gross, le mer. 12 août 2026 10:16:58 +0200, a ecrit:
>> Any feedback?
> 
> I'm fine with it: grub0.9x is really old, grub2 works alright in my use
> cases and is maintained.

Was this perhaps meant to be / include an Acked-by: ?

Jan

>> On 20.07.26 10:18, Juergen Gross wrote:
>>> The grub-pv stubdoms (32- and 64-bit) are disabled by default since
>>> several years now.
>>>
>>> Remove them in order to enable removing quite some more code from Xen.
>>> In case someone is really depending on grub-pv, they can easily take it
>>> from an older Xen build, as there is no Xen version dependency in
>>> grub-pv (a version built 3 years ago has been tested to still work
>>> with current 4.23 staging Xen).
>>>
>>> Note that after this series has been committed, some additional
>>> cleanup is possible by removing stubdom libpci and zlib support, but
>>> this will require a modification of Mini-OS depending on these patches.
>>>
>>> Changes in V2:
>>> - moved one hunk from patch 2 to patch 1
>>>
>>> Juergen Gross (5):
>>>    stubdom: remove support for grub-pv
>>>    stubdom: remove support for building in 32-bit mode
>>>    stubdom: remove building of libxenguest and libxenctrl
>>>    docs: remove stale stubdom entries from stubdom.txt
>>>    tools/libxenguest: remove Mini-OS specific parts
>>>
>>>   Makefile                                      |    6 -
>>>   config/Stubdom.mk.in                          |    3 -
>>>   docs/misc/stubdom.txt                         |   69 -
>>>   stubdom/.gitignore                            |    1 -
>>>   stubdom/Makefile                              |   69 +-
>>>   stubdom/configure                             |   65 -
>>>   stubdom/configure.ac                          |    2 -
>>>   stubdom/grub.patches/00cvs                    | 1022 -----
>>>   stubdom/grub.patches/10graphics.diff          | 2297 -----------
>>>   stubdom/grub.patches/11graphics-keyboard.diff |   13 -
>>>   stubdom/grub.patches/20print_func.diff        |   52 -
>>>   stubdom/grub.patches/30savedefault.diff       |  186 -
>>>   .../grub.patches/40ext3_256byte_inode.diff    |  114 -
>>>   stubdom/grub.patches/50fs_fulldisk.diff       |   72 -
>>>   stubdom/grub.patches/60ext4.diff              |  474 ---
>>>   stubdom/grub.patches/61btrfs.diff             | 3499 -----------------
>>>   stubdom/grub.patches/70compiler_warnings.diff |   45 -
>>>   stubdom/grub.patches/99minios                 | 1570 --------
>>>   stubdom/grub/Makefile                         |   88 -
>>>   stubdom/grub/boot-x86_32.S                    |  112 -
>>>   stubdom/grub/boot-x86_64.S                    |  108 -
>>>   stubdom/grub/config.h                         |   12 -
>>>   stubdom/grub/kexec.c                          |  434 --
>>>   stubdom/grub/mini-os.c                        |  771 ----
>>>   stubdom/grub/mini-os.h                        |    7 -
>>>   stubdom/grub/minios.cfg                       |    4 -
>>>   stubdom/grub/osdep.h                          |   30 -
>>>   tools/libs/guest/Makefile.common              |   15 -
>>>   tools/libs/guest/xg_dom_decompress_unsafe.c   |   48 -
>>>   tools/libs/guest/xg_dom_decompress_unsafe.h   |   28 -
>>>   .../guest/xg_dom_decompress_unsafe_bzip2.c    |   14 -
>>>   .../libs/guest/xg_dom_decompress_unsafe_lz4.c |   39 -
>>>   .../guest/xg_dom_decompress_unsafe_lzma.c     |   14 -
>>>   .../guest/xg_dom_decompress_unsafe_lzo1x.c    |   44 -
>>>   .../libs/guest/xg_dom_decompress_unsafe_xz.c  |   46 -
>>>   .../guest/xg_dom_decompress_unsafe_zstd.c     |   44 -
>>>   36 files changed, 1 insertion(+), 11416 deletions(-)
>>>   delete mode 100644 stubdom/grub.patches/00cvs
>>>   delete mode 100644 stubdom/grub.patches/10graphics.diff
>>>   delete mode 100644 stubdom/grub.patches/11graphics-keyboard.diff
>>>   delete mode 100644 stubdom/grub.patches/20print_func.diff
>>>   delete mode 100644 stubdom/grub.patches/30savedefault.diff
>>>   delete mode 100644 stubdom/grub.patches/40ext3_256byte_inode.diff
>>>   delete mode 100644 stubdom/grub.patches/50fs_fulldisk.diff
>>>   delete mode 100644 stubdom/grub.patches/60ext4.diff
>>>   delete mode 100644 stubdom/grub.patches/61btrfs.diff
>>>   delete mode 100644 stubdom/grub.patches/70compiler_warnings.diff
>>>   delete mode 100644 stubdom/grub.patches/99minios
>>>   delete mode 100644 stubdom/grub/Makefile
>>>   delete mode 100644 stubdom/grub/boot-x86_32.S
>>>   delete mode 100644 stubdom/grub/boot-x86_64.S
>>>   delete mode 100644 stubdom/grub/config.h
>>>   delete mode 100644 stubdom/grub/kexec.c
>>>   delete mode 100644 stubdom/grub/mini-os.c
>>>   delete mode 100644 stubdom/grub/mini-os.h
>>>   delete mode 100644 stubdom/grub/minios.cfg
>>>   delete mode 100644 stubdom/grub/osdep.h
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.c
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.h
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>>>   delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
>>>
>>
> 
> 
> 
> 
> 
> 


