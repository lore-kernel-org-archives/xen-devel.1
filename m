Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86FBCA5FFF
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 11:39:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440762.1658211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDh2u-0005t9-Hf; Mon, 05 Oct 2026 11:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440762.1658211; Mon, 05 Oct 2026 11:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDh2u-0005t1-EC; Mon, 05 Oct 2026 11:39:52 +0000
Received: by outflank-mailman (input) for mailman id 1440762;
 Mon, 05 Oct 2026 11:39:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDh2t-0005sc-5l
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:39:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDh2s-001NTx-GV
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:39:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac38c6f-e002-0a2a0a5209dd-0a2a4509e270-38
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:39:50 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac38c86-be1a-0a2a45090019-d155dd2ef05b-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:39:50 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48afe75f055so1384707f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 04:39:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622704a5sm6904741f8f.15.2026.10.05.04.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 04:39:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791200390; x=1791805190; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NLUMBlP6wab4z/GNt5qFu6BIEKo0a9Kb+izkdV6F9o=;
        b=Zwi4Dm9i+abg+LHgZDyxTjiXuP/+fJXncbhSiTNp4ha9KWGj7rX1C2Zd67PJfDN5rf
         O+z8GOmL0IhP9fLbxmr4CkE70OfJPWOtHTlwy3xXKFPQiqeraxMuXMUjHFhD1iN2+rpU
         WiJEtsNcPDsM++Nj9I3ECo+CkuzAXQSKjDI7CjCiT0x/5A2t6Wqx71tqYtgCRmTiCPzc
         keMg2Z6dY5CBkimlb0NybeIfUQHy7cnhgdGayj+mL5IlUaMyNSTGyPvTA6hSMwmtYhyT
         NxJsnyZBox4aCTK+XgAUPLq04g6fEWju0Fgoq+9YIuxk0cdW1NBwb9uFaczuHJyaR8ug
         Ilmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200390; x=1791805190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NLUMBlP6wab4z/GNt5qFu6BIEKo0a9Kb+izkdV6F9o=;
        b=z+lzZMJDSS2/VbbfSrBcwN9IFNi1UUtkolIbLkVUsEQJfKveFyZCKFoOznN0DArgrB
         kTMAZGHaeCCtB7qZtfSHpO+zvfdXTq/wq7AO1LY93tNRLxX9SoPprub2kW3Ko0xDyN0J
         IancWonFgmMWQ6hEzGEtFj0C+s/NWJWiwVglnvNg9GLArc6DG2fD+9Wo+JN/qWaaE8Ya
         ls8wcFkT57ySLeRkWgG1IUnRupIWljJeSNT9F54SSMkjPkIBZWhIIjDlb43CmAoRJTuE
         1gccXtxcNnO7SLdHAYiHeYjB0TlP6tcgag0mLIm9bqWruH316TsJhnR/5TH3CtOuw7HP
         YjBg==
X-Forwarded-Encrypted: i=1; AKwUvByWDIHEgkk7HBUBQTtRLQUImTkTokz90ScT2myySj0DbiHNLy4DViMHxSMoQMRFD0lL6rEL+nW1N8M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIuTTZPaeMNy4eDWtoB+EcdRNFKPvSl/dIp8R+cS6e3kwyl4aVP
	XUz611u5RyawKV3l1UFSwYzS8RzefIdfd3XBWYyK/EtTPQ9YcUgQXRjD
X-Gm-Gg: AYBFou3KAquWScciyz9HXordZPEUf8WJ2HbcUiLNCLgWEmyar6Jhl8IFw31Vn4c3KMi
	SLdAKHueHB89dd0EYujKU9FtRUKEDKm79MZaJEeuQD0/ZHKWEmMYy61qfLc1MdIlcn01QvpeJTn
	qGy6JCTHWuItK8kSuLnLSj2kurqgiwRgCzvtMqdSAbYUlXx6ULM+cXDxW1vFCNju1krAXNSw+HW
	SEHaSSte16uMypRhjfJUSzVLxxvVcsupTE3st5EpeJw3PZcFt3mbS5X7rOkwwdxZsCrDSBYKeUn
	6rvQf7fuN+Mtt+8WziP16YyCvOpwyAJcR+J2diETxbXb+q7qVsg/CWo4zDiWV04BQfSi0W66GJw
	xDYccKwTwf42Ww++MrckqCTQgh7IGrPJkoTFxkVw6V3kg21+TKt4Sz58hyVuwyCp1lksnyFmmsj
	MVMUmHzwLt5gyc5WzvgyEk1wUG6yD/rZDBCvNjDvCvU//W9QzTeDNFgarDRDfKsjuzXZoer523y
	0YiCCG64VZFXfQhNisRXzbXnE943AJjdCxzpHV6WwfR8aTdd8LyZFKoqDo3
X-Received: by 2002:a05:6000:25fe:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48c47ff6187mr10348227f8f.40.1791200389742;
        Mon, 05 Oct 2026 04:39:49 -0700 (PDT)
Message-ID: <de3ec947-97bd-4d04-9fb3-416d1dda3eed@gmail.com>
Date: Mon, 5 Oct 2026 13:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen/riscv: fix A/D bits in Xen's page-table
 mappings
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
 <1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b803f90003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b803f90003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791200390-3A0C5034-E29C96EF/10/73395122804
X-purgate-type: spam
X-purgate-size: 2721



On 10/1/26 11:07 AM, Baptiste Le Duc wrote:
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
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v3:
> - rebase patch 2/6 which modified wrong indentation.
> - change commit message to address review comments.

Nit: a rename to pte_has_reserved_rwx should be mentioned here.

Changes itself looks good to me so:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Note: As I mentioned in the reply to the cover letter, this patch is not 
applicable (at least I failed to do that by using git am ...) on top of 
the current staging tree. The conflict is easy to resolve, but it looks 
like a proper rebase and resending of the patch series will be needed.

~ Oleksii


