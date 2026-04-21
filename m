Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D11CF8FA7A
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 13:30:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1288977.1569206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBBb-0001Mi-Qv; Tue, 21 Apr 2026 13:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288977.1569206; Tue, 21 Apr 2026 13:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBBb-0001Mb-Nq; Tue, 21 Apr 2026 13:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1288977;
 Tue, 21 Apr 2026 13:30:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFBBa-0001MV-97
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:30:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFBBY-00C2TS-0I
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:30:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e77bf7-e002-0a2a0a5209dd-0a2a4503b67c-20
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:30:41 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e77c01-672d-0a2a45030019-d155d0afb52a-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:30:41 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3870778358aso31694441fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 06:30:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e7dfesm3651086e87.71.2026.04.21.06.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 06:30:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776778240; x=1777383040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVu4BB+0F9xZP5VgtvZi5WxnVWMLIcqmlZ2Ib9ieOSc=;
        b=aqccD+s31GCSqO3U8E9r4qFRQ8nsTSEbOR0M57Rm6/a/ZhrivzgvLWU67c42bzRuay
         2ak36bZDxRvxm93nO8fgeDnCbvJI9RuPEFB2U/diX2hkvu5DuniMuJe3p7IIV7idbRkC
         RRN6SGKn/B0JTWGpnTTKU2CrsQc7fLkNssBB47xhcM+R0JTcACGMa71ipipOG7bCXh2g
         qhY2LvfxOcRQd96Pk4uScUgN55rHOKP1hxDHUfKnpHeNrOzVotzVVBs8kzXAwv3zixi/
         5+MA3mzE5gixZsqS7vKz7v0fYyKlDwHk5Q7XLN+xAnezEvSzPr1OpQFVq3l8udv00Ino
         vBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778240; x=1777383040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVu4BB+0F9xZP5VgtvZi5WxnVWMLIcqmlZ2Ib9ieOSc=;
        b=lg2wmpkDDheBT+7xH+cnd9bCQGfHUELx6q+d5JOhqfGW9ek74E95NFg++YP97s62vg
         kBsLGw5MkdClbHT3u2QVy4R2li7tz0IzLjJj+JtXGXXYz428LnKL9AZ0tzWhHSZNxdG+
         kPLXIxA92fDXiJTx33ffFeAKzZEjPaP5wvsPpUBO3SyLk0n2d+bjnBF+r4vnrQyvSWQ+
         Qe8e1d+HPycrti2d9+IXTfR6dZGtBQtm22AkWG3D6LuUixXOP+VzqLNm7qjH8GfYAXax
         syG9a8DwBr5ERKwWZE0XdFGytBcryMRJQ+Mnlt/+MOVafrgZ61/59OOhiny46QZM0hlw
         dfxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/X6a/9atOIQT0QoWi6TYB9f6VPwpxWZYIt1hJTtNps0BJBsIETqW6dwkxWOPMUnw2FkaGCHsO7+M4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6Pmhj/9L0xYnw3udx0CxxUBvSuLfRSG4N0rVmSITZesDLs2NV
	AM/r6aKPwVpn34R0OsrCTIepCjnTIDzgiYUdf7/OjMTU6jqQtAOZsmmH
X-Gm-Gg: AeBDieusaZWOc7GiJRo5R8dW51Sp50tkKKY5efKv3NCxGXyLFs30oUsygtuI2XctTV/
	PLG/gEjpW/N378tX1+YuR6DAxdLt+t8xAOveKQZZknhpgdns3/378+2DVy42C0AZjHV1W8dg+z8
	5xomA2gmmnCl8kVxrdUH5JPRHDLHSKGsYIOd7F0hEQUnRw/10zNbA7a+KUXATlCeK4VDd+ZaUS8
	LybwN/ItVqtPxli6fThHSHrFRlpI72OTvrtJcjwmftYXULRkpGDNlu6eGCvzMztnOT0/XKDHTWq
	3nz3S7Ju8dB2VqQIJjS9cl5mEP3Pz0Q9K/uTH9uCIlJe74pI2kjhSr0niDU6adRsGH7FAiAYTAA
	H7tXaEVKlxK7TMrywJ0DxYZ7B5LfuYYcDbqm4ypiGgwd68KO8dijNW4BUPC+L1sNmVfz2wW0gPW
	/LdpQHdPDgkiOYam/+GHsGI7KUA//U4n2Em5zZm6+0dFjqCxBUyKfMDxF8hdOezzXM7pmtteEhb
	bCOePLIz5CMRQ==
X-Received: by 2002:a05:6512:108c:b0:5a2:c962:59f2 with SMTP id 2adb3069b0e04-5a4172e1c03mr5225058e87.22.1776778240216;
        Tue, 21 Apr 2026 06:30:40 -0700 (PDT)
Message-ID: <5ae7ad4f-e7ef-462c-8a90-755d6f5936b6@gmail.com>
Date: Tue, 21 Apr 2026 15:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260417091124.39552-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776778241-28776938-852DFE62/10/73395122804
X-purgate-type: spam
X-purgate-size: 1676

Hello Michał,

On 4/17/26 11:11 AM, Michal Orzel wrote:
> Refactor setup_frametable_mappings() into init_frametable(), modeled
> after x86's implementation. Instead of mapping one contiguous frametable
> covering ram_start to ram_end (including holes), iterate the
> pdx_group_valid bitmap to allocate and map frametable memory only for
> valid PDX groups, skipping gaps in the physical address space. At the
> moment we don't really take into account pdx_group_valid bitmap.
> 
> This reduces memory consumption on systems with sparse RAM layouts by
> not allocating frametable entries for non-existent memory regions.
> 
> A file-local pdx_to_page() override is needed because the generic macro
> in xen/include/xen/pdx.h does not account for ARM's non-zero
> frametable_base_pdx.
> 
> Update the MPU implementation to match the new init_frametable()
> signature. Since MPU has no virtual address translation (ma == va),
> hole-skipping is not possible and the frametable remains a single
> contiguous allocation.
> 
> Signed-off-by: Michal Orzel<michal.orzel@amd.com>
> ---
> We've been using this approach at AMD for a while now. Without this we would not
> be able to boot some of our boards that have huge holes in the PA space, so I
> consider this patch a great improvement.
> 
> Two things to consider as a follow-up in the future:
>   - change generic pdx_to_page, page_to_pdx to take into account offset that
>     on x86 is zero but on other arches it is not. The page list code is
>     for now unaffected because the offset cancels out,
>   - use the same on RISCV.

Do you have such plans to do that for RISC-V?

~ Oleksii

