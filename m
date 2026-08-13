Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ECCC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:44:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389969.1630542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUn0-0001SW-19; Thu, 13 Aug 2026 12:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389969.1630542; Thu, 13 Aug 2026 12:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUmz-0001SP-Tv; Thu, 13 Aug 2026 12:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1389969;
 Thu, 13 Aug 2026 12:44:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wuUmy-0001SH-S8
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:44:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuUmx-000x9u-W7
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:44:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7dbc12-8faa-0a2a0a5109dd-0a2a4501eb28-4
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:44:03 +0200
Received: from [209.85.128.177] (helo=mail-yw1-f177.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7dbc12-5984-0a2a45010019-d15580b1e56e-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:44:03 +0200
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-81dfdbd86d1so20356327b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:44:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1786625042; cv=none;
        d=google.com; s=arc-20260327;
        b=jGoRatopwTF0sl/RYwDmfsQzV/ism8ldZ4Vo4w1ECcgNJG2naStg3MU0CP2SZNZ+ym
         mDNqcnDKc4ZfDG8gLFyLTLmYU+347DU2oz7PmVHKb67srYkBVXBn6Fg4OAKZW87Ziugh
         u5xJX8B4+l91JN14hvaQQ2DO07LZax6g9ODddrxiPd7hVWRcVWjv/Kat8JkUIb8DhRBK
         QV54AG/S5uQ1lqBEW5z0P5BX5Txgs/lduE56NGr3zPJKy6lDxPxVOPdyWh2NPbdT9KKS
         QAZ8B/cfjDpqSRKdKUn1ETtgU0YSNt+coWMS/oFuyf3nXd9L4BFBV05Mxs/EmnE9ztE0
         OyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4/Rde2C4jxdMN8BwFIfhLNo8P5/cVcL0piK60vZwB34=;
        fh=BuXLlZlolQM134F1k1/sGsHUv8OnQcq1/qbdathgLBE=;
        b=H+IRO3ZspGLE8GCvAnEU+f8NAnMvBMx6/LZ1HuxBJOC5ITTK+nRrpVhfDnwO0y0Sg3
         1DZuFnRrIwDPVhSik8VGXaNPX+TkqB1q7NVJF6p80UBL6tF5rqnG5EPk29oLmxOIrFL/
         grTPiL45c58RXtAAE9x/NV5GULFuvrfHvD6bSEz+OcXb64RcsR3McLhQKc0JThoP5a74
         XaV/sxcA4a1D3fw6Uh4wSPjMTpBedNL5oDhozRJMin1NYVABgzgGxB4QBtUexhoYhmkM
         /XRVM2xHDOL3TgkcIn+DIEij4z3umk1Klo2cOrylE0Qwmmug/PRHbrZq/HpvLYfWOWsV
         MYrA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786625042; x=1787229842; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/Rde2C4jxdMN8BwFIfhLNo8P5/cVcL0piK60vZwB34=;
        b=L4Iu+RVWTi+PWu57r0JLFhYo/LbnaWBm/K5VbJk0luZtDBUvhmCKDzD81LX/erGzJZ
         XX92YQipSu4TN/96kPcyrpWet/uINlwObzxMDsWyeCohEsOfwvcTNTtxmb2nx/vRF0Kx
         iKP+He4U+SnZJssyodJ2bnDwxqTcuMn5LD4URj8y0CZY0sYCA/n+Wgdg7S0xb4ehku2k
         oml6U3WRQf/3QC0Pu2PlqHI3cnvFqq9JBkLT2A8mPEYAFFaS9Uq2Wzqw2MP21/Ic9bPM
         RHrmCSNwN1Ep/quyBVpGT6/wfEvkHnZJ1PdgU+cgt30lPM2pibM8gPQNh7sNeWicZDB9
         DHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625042; x=1787229842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4/Rde2C4jxdMN8BwFIfhLNo8P5/cVcL0piK60vZwB34=;
        b=KMPY8I7re4aUdoPun1KSjDQ+kos5o/ZQ6CTjwTkKZgVywKPW38uo/NF6p/CjXogQW0
         V2aN2MU1vpxD9fzUHlmO5WBTUKjD51g43cliSTimyhmI+yGIuh0egDiQAodmv2K1sABb
         vT2h2sE/uhkq3hIkM1Pnfeb6/eWXwQuNU2BEwhoO3yWt9Sjx+6LtS8+vf+ZepOz54l7G
         Ye7fOv5DkpCeHx+Uz7Z55jkypehcCqJFCIG4AiacRTZC9dlnSL2R4GwiR/lneTB0Ao82
         zIMK5cth/sJsJ1VVRucIHcVaxht2H9fBWhqfQBaZyp1OA3gOP2WWjA8ylmbB/Re4/k2l
         geJw==
X-Gm-Message-State: AOJu0YweKB0DFuNci5w6n4g1Xq+rmzUXAYMQNQewxiIk1uoVOzTkbZ8c
	bkA2feteo1Axt/rMZ8H9F1GalMHcX6gmZOyvx3DDXUb0QnI1Isp3pvQnqKwWOewpmgOHjP8J5tP
	O4B7z7qiFSg42LBM5JK1ebFGIqXSL4bIcqpys
X-Gm-Gg: AR+sD12olbwWJnqD17oE/p2+CqywhnTkWS+o6rFCoHWqtE16X2EIJjfpws3IvaGAJ+z
	VNPPaXIGp52HWMvy6EYOS2ZW+NEdLVhW06PlSbK8WLvueN5UlmeetNHfu+Rw2Wc0XoWI9APOZQh
	AwhpPbEL83+Umow/xbcAf6QErG4iqfLryL5SYvVQzvM6mDgI8+myxkqF2jywyhjtBAeuAKMcjxX
	SdZcUcyF1OHA9/q0CU5fg1spn0Qg3y/qxvB3sbxL+mM2h9i5wXEqL0btDm7b1jcONHkwhOqVibl
	BhzVRxwEdKayd+Vv2Dppp+eY7qSSHhYip1Pv7HQTn+W1C8KdAmCbeMmAHXo23DrnxFOsI51fxJ1
	5ut7ODHCvxn9K
X-Received: by 2002:a05:690c:c747:b0:826:8128:3ba8 with SMTP id
 00721157ae682-8347577f07emr20014587b3.17.1786625042378; Thu, 13 Aug 2026
 05:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260810103018.54564-1-frediano.ziglio@citrix.com> <20260810103018.54564-11-frediano.ziglio@citrix.com>
In-Reply-To: <20260810103018.54564-11-frediano.ziglio@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 13 Aug 2026 13:43:48 +0100
X-Gm-Features: AUfX_mzECzi-eavEjyTnQbPDuGeff0qS1iKApcxrAJ42SApVi4Jq65zwmjtRAAk
Message-ID: <CAHt6W4cQZRfwdWSOzf8vkBgn+m2N+tp+aOA6YKnD1ndA8rObCQ@mail.gmail.com>
Subject: Re: [PATCH Linux v6 10/10] xen/privcmd: Add new ABI to allow copying
 foreign memory
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1786625043-BDA7E757-777B5805/0/0
X-purgate-type: clean
X-purgate-size: 407

On Mon, 10 Aug 2026 at 11:30, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> This new ABI allows to copy foreign domain memory to/from a buffer.
> This avoids having to map/copy/unmap foreign memory which is
> expensive.
> This operation is done particularly when migrating VMs.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Typo in subject line, it's v10, not v6.

Frediano

