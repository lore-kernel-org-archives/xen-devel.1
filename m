Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5BCCC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:59:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448106.1664148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGett-0001oU-AZ; Tue, 13 Oct 2026 15:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448106.1664148; Tue, 13 Oct 2026 15:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGett-0001oN-6t; Tue, 13 Oct 2026 15:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1448106;
 Tue, 13 Oct 2026 15:58:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGetr-0001oH-DD
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:58:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGetq-00FzTD-QH
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:58:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5528-8faa-0a2a0a5109dd-0a2a4501d994-14
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:58:46 +0200
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5535-5984-0a2a45010019-d15580afd99b-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:58:46 +0200
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-8ae8607e8afso21157637b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:58:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1791907125; cv=none;
        d=google.com; s=arc-20260327;
        b=AZFl+RK2gBK39j6p4BFB/NcJCrGhe5qpEKKkeGTP3HhrThS+WIMkSrs6n9ucwImm0B
         GBoXGx9ZFAhxppHHUqZFB7M2u+QYBTcGoCWnyrHqBS3P1gMmNFHvPfyO/cW2kVULXpMu
         u//4Ov3iP9XHpTIC89U8lGdzV6oXJKGbdq23M5YiC7y367DKQ9wlmaeuESOtQt3njeVe
         r1XAfBaIUhdmZnFLB2WBLfk7vKTMls23U4dGyq39d4Ijhh6pVIUIsVVeNDbKauF+0nlZ
         ES1GNYh3+uBdV57GgfsrzP8TWH4s1q0attfoh+CUUe4NjdlexD1r+lgTGO9m1WQa7ZQQ
         Lbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DZuhEJteCjiBcxYMsQ5/Kb0n1Eh3plqb2K4/0ypuhTg=;
        fh=CAgUrIXa0DSX39LmKILE0T8Wu6Oin3YfOZR8uLe6iJQ=;
        b=qJipOsmNn9sjvVh+KcF6OSrkmf5tcIm8aZ572lg/zoOg724kXbFbV/SWZOqLIQvjWT
         pSdadYPggwABGwpUyf+/5O3M/DWfWZPmc75YAc/Et5TLAFQj++NT6W71cKwSbuRvnJU2
         DlF5GbpI06dsHUc07fH3G3O6fm9v0yuKY6nX2z2W0HlxS1PyIUSEn6lVlLhcH9dKa+ml
         cx4ewFrP96hDkwrcyYn97vkAax4gOmQDuW13WZD0ayu12wVIuWIycvPLixdQgPmtMkGB
         nsQj99hDbTAQSuiPm1bfOCoZ9d0BgHH9EZKLDI16lRO2THnsDG3AvN11G7h+oSYjJIB/
         QK4A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791907125; x=1792511925; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZuhEJteCjiBcxYMsQ5/Kb0n1Eh3plqb2K4/0ypuhTg=;
        b=OYegPcyEYyjUQm9bNz0Tul+ULOb+Ar2dIT2vt+LGesQJYE3NBBsLLmh9oE2dGYQElj
         hFDs+aAfhAO8BCqFgL4X/6/OeWWfKq8nNOkFiUV5NyBvk6AnF/dGPl+NnJr8ibyiUAex
         YyKJj7x7iKgfWhYDZrrOgh3g9ekVa2FsTblQtTShuQntNvAaPFRHrtuGreBIEZlfhQuq
         uvo41hte7HvazGsgONxiGgvAv/+rJfJrJV8s7sXsbcu+33WhI6jpsCRJ4e31Fm9//4Sp
         3vucAHOTksLyx7QRicr6NM+ptvo7+s9OQuW3PNlZU25ImLbcNsbi6Fp9OhO3y/EQ0UYK
         BSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907125; x=1792511925;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DZuhEJteCjiBcxYMsQ5/Kb0n1Eh3plqb2K4/0ypuhTg=;
        b=NHSYF2kXNxZkshjpEDTWgmyNqF1OcX5agkLbcVBdNvOtfCYe4ppE6Qzqp2xPERY6ZH
         I6jr+E5zhfhKtUnNkC8SbCuY/Fu6uUuTciJQAHdWNZbz3ctbZnrUWuOEKpnC9+T3r0OM
         w8a3iU8XCMBT3arXrN2zMNWkPocCpJkCo5hobX+Zjn22XpGa9JDohoVXBAHkKh0XZTeY
         A4OTD0Z8KpYefM2L039gDXNod+AuU5DnfUuApJ+NRUjxoqZeYX3GyuuSq1qupTY9JSK1
         zDx/5LDm6CtBchQUQbJvtTF51JyAysCXG2sfNkElqnYx/iSFGAPicvtzYE21dpaPKSLg
         dPbA==
X-Forwarded-Encrypted: i=1; AKwUvBzOOA5yKm6Y7wB9wDBGY+iYT3tBj5dJmIsL8qgYn2ytWsPFAXwv/e6xXo+OgGqbAmnP0ALCnHdPa0U=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLtHkPQxlfdDBh+NlozWFdpa0Mt8YatQ8Qw5724p22LeTQ3xLeY
	n11ZcipTPi08PwX0xTYpIv5iQnOSpaaEa4XFXNZFiVdRvHja7b4tYvyNuJHVSY9RFa0RivCbTGZ
	p8l6Uc2rZgbO3Bd15PRzhcb+mnrreb3Q0yXtqXh3MSQ==
X-Gm-Gg: AYBFou3YV7/K2IyRg+x4G+ZUT4/96LedJA/OX/49by3/Ew+44F0bQ8X/WiGBPujJhfe
	Trrb4b3m8N+toop7M5qOirGsK1xXwsQ1itLy10eipdfCp2LRbSn3bDIb4j808HN3dmLZhipDta1
	0eBUkcv1lsQVJAWpZsCPVHUDyR8shqLLROtotOmAu/fFeGbbH2vHQjPbGANjg4kUx/TScGOeZuW
	oqGJ9ubvHFu+wxBXxdMIuB0nc8f5avMUJGTZisaVAEo4DKONZk/CrJR7BBTkTrFn2+9ZhY39YR+
	ls3m40UgW97tPv2TJ7Y6Qr2i9sew+Xfty/t/G1XuwVUiGKjMj+Bgk9fA49N0jyXZNlVJ8djSoTI
	3ELUKNpp6XVQwo7wbsL9ryCNUtjKL1pfmIS4Ew3Q=
X-Received: by 2002:a05:690c:c50e:b0:8b0:a496:9e9f with SMTP id
 00721157ae682-8b0a496a4d5mr20751777b3.16.1791907125130; Tue, 13 Oct 2026
 08:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-9-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-9-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:58:33 +0100
X-Gm-Features: AclHuK-vJ3MrY9cM47TQWMRigAS6YCJDLH3ew8EymvifUYmGc29Q40zWzPPbrec
Message-ID: <CAFEAcA9MzduZYdWu6VSot8SLaQi_MaeKJdJCUS1YdPWb2y47cw@mail.gmail.com>
Subject: Re: [PATCH 08/22] i8259.c: use i8259 prefix for functions
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1791907126-BCB45757-D98024FD/0/0
X-purgate-type: clean
X-purgate-size: 674

On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This ensures consistency with our normal QOM-based naming convention.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> FIXME: rename trace events?

I recommend removing FIXME comments before posting patches, it avoids
the possibility of reviewers suggesting you do the extra work :-)

I don't believe we make any claims about stability of trace event
names, so we could rename them. Should be a separate patch if we do,
though.

For this patch and with the FIXME line removed,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

