Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75087CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 10:00:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448660.1664698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvm3-0003hK-KH; Wed, 14 Oct 2026 09:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448660.1664698; Wed, 14 Oct 2026 09:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvm3-0003hD-He; Wed, 14 Oct 2026 09:59:51 +0000
Received: by outflank-mailman (input) for mailman id 1448660;
 Wed, 14 Oct 2026 09:59:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGvm2-0003h7-6V
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:59:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGvm0-0044ov-3p
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:59:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf5292-8faa-0a2a0a5109dd-0a2a4509af1a-8
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:59:48 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf5293-be1a-0a2a45090019-d155dd30cd0a-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:59:47 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48c14a06c95so3062828f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 02:59:47 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376522.centertel.pl. [37.47.102.11])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab506bsm11606688f8f.27.2026.10.14.02.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 02:59:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791971987; x=1792576787; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/rd2s6vNeSV1St8vt21X3prAbokQGGVQQUKPiDr6Uk=;
        b=CjLdElRqCcLGKypBlXJGM3zTDzb6cVDxX7T3uU0ShMiZCs5+IRgIT6an+UcDib11VU
         Nv3dYSwkZeEDYI45hdCvuAdfRxfm7+oAmfJc6F/d1AND+n7/238UcpAD6viEZ2QAU85E
         Ct7dxuKS1IKxtwzXpjlsCxL004h0ROh0kR0CmPltqeyaShh7Ht9af3o8Os9Sk7e1Lnsk
         nF8cOuLKbjHWtj3IVebEV5/zsAl5FFhJa+oumJOIWItJNM9eq7o0ji+O6kIuqkapbCQU
         2Dn/aSFA94M1G2aiI19CKT4FJAI5UgVF5WFN3MnL+LTZw1MkXbvyTbs4qde/xUIAV7mp
         qWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971987; x=1792576787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/rd2s6vNeSV1St8vt21X3prAbokQGGVQQUKPiDr6Uk=;
        b=LInShmzRVkjnW2dNU0YDXMK/tENJORUfqtFM1OPco2SYlKaPXxeu+5Mf63hqKfn+wW
         qTm7/S+JEAOzo2oMxS8Wgae1cs0FeW3KpWgHuACOX06oFqHuAjT9+UQLDG+UIZg4hTFs
         ZXog+cDwenhoArjnKoKPloSE7+Y4xvkthBIZmZq/Dl4qxUHZRKF4XDLommX1Z8du7KAj
         1bhkoFSTl5Pm4XH1ByD/bB8NlfZm7CcRJgFdokALQAmLQuIeeyh8XLCZ/A1uS4SHogbf
         4Hw1a38rUvJJoMA8Ia8ZyFsX2M2uQV8gmt6sSzXutczdRem5asa1kbFLzowDLh1knIsP
         +KAA==
X-Forwarded-Encrypted: i=1; AKwUvBy4QZS1edLpfRA2f7LYmICRCPFcoQSjGI4xnTouZ329Td9C1eiKElOf/C9IgRxVaFOemF5butSy70c=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL5Mj+nwUH51gndlrYb/uqXArptdFmm6WeVueEc0QiQd/c9RCd6
	7Lg9TpwxLSCiwYiNV6OX4Avx1rwzqq3r7x7qmRqymRkbr+2Enz+KSysS
X-Gm-Gg: AYBFou0pIZqo+KjzM2Oo50Mia6HiC0zOxxJIqMZhGWkLsdvZyc/A2WxL2zIfNfm8JB6
	KHr0sqz9OjFZ7N9mHf1ms7oLtY3uCfc5H3tgElXHJazLhGxJoROITC8Ukf07b0l4ZEFXpxSUdt4
	Ln6872wSGY2BIdVYOa+nJcEh8KDMMFqeKd5IJrOUjCOqblY/PqUd2Kb5NJcko7HTimP5SVEkK4G
	5KxPzJ60eNriVhbQDPTk9UXeDH1iN+ASaRpt6k9p5saB36my/krzC4y6awUBWReYKrKTLtHFfoS
	3lRZF4OpqO5Nk4uO2Eci4VtFndCnTQpyILV24hi9BNjg5Mco09hFOBR7G0jhLmur6mBbus2MnJX
	cK+AkZa0F3jkNOUA9e9ckH/+h12UTYkBqbOYUx8IkWwoyBdCEPI6TEyIp0op+uP0XS405ch4LzL
	ngxOVuwYGioEBvdGhT/T/XMEtCf+V/qBSkvHhy+nnd5tKgD1j62GNJl6xCy30eVsPLKjq/Fd4qr
	C0Z2wbwebJEIAi+KubGSGGLXmJBc7BXT4lmXD8=
X-Received: by 2002:a05:6000:24c4:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-48dbace386bmr29056878f8f.43.1791971987477;
        Wed, 14 Oct 2026 02:59:47 -0700 (PDT)
Message-ID: <3e9e986b-f996-4154-93c1-a07b1f432e71@gmail.com>
Date: Wed, 14 Oct 2026 11:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] xen/riscv: fix A/D bits in Xen's page-table
 mappings
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886039.8631fc262581453bbf619ec5b2062170.1a134bb191b0008425@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791886039.8631fc262581453bbf619ec5b2062170.1a134bb191b0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791971988-FD06B034-090ECB05/10/73395122804
X-purgate-type: spam
X-purgate-size: 2195



On 10/13/26 12:07 PM, Baptiste Le Duc wrote:
> Xen does not handle page faults caused by clear A/D bits, so it presets
> them when creating PTEs. pt_update_entry() does so, but three places build
> leaf PTEs directly without going through it: setup_initial_mapping() (the
> boot page tables), check_pgtbl_mode_support() (the temporary root entry
> used to probe SATP mode support) and arch_pmap_map() (the fixmap).
> 
> Without Svadu, all three fault on first access. For
> check_pgtbl_mode_support(), the fault is raised by the instruction fetch
> right after the SATP write, before any trap handler is set.
> 
> Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
> PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
> all cases for consistency with pt_update_entry() which sets it at runtime.
> 
> This fixes arch_pmap_map() for free, since it already builds its PTE from
> PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> its default, text and rodata permissions, and check_pgtbl_mode_support() to
> use PAGE_HYPERVISOR_RX for its temporary root entry. The latter drops
> PTE_WRITABLE, going from RWX to RX, but this is harmless, as that entry
> only has to make the current instruction stream fetchable between the two
> CSR_SATP writes, and nothing writes through it.
> 
> Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> open-coded site above leaves it with no user outside page.h itself.
> 
> pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
> of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
> masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
> carries A and D, a reserved PTE with A or D set would no longer be caught.
> Mask with the V, R and W bits explicitly instead, and factor the check out
> into pte_has_reserved_rwx().
> 
> Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
I think I missed to mentioned that before, sorry:

arch_pmap_map() was introduced by f89e1a170299 ("xen/riscv: introduce
asm/pmap.h header"), so perhaps add a 2nd Fixes: tag.

~ Oleksii

