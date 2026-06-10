Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1DBCD8CB2
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 11:51:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334199.1597306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHSb-00005q-V4; Wed, 10 Jun 2026 11:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334199.1597306; Wed, 10 Jun 2026 11:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHSb-00005j-Rl; Wed, 10 Jun 2026 11:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1334199;
 Wed, 10 Jun 2026 11:51:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michael.bommarito@gmail.com>) id 1wXHSZ-00005c-S0
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:51:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHSZ-007gq1-8i
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:51:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a294f9a-2eae-0a2a0a5409dd-0a2a4508aeec-36
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:51:03 +0200
Received: from [74.125.224.48] (helo=mail-yx1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a294fa6-63b5-0a2a45080019-4a7de030a9c7-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:51:03 +0200
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-660390acd71so6173117d50.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 04:51:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1781092261; cv=none;
        d=google.com; s=arc-20240605;
        b=H76PFujfVztEbnOuxHrZc+0hmjy7r0x+LVnQtKgSMwCEO9Jz8el73aH4n6vaoHj4zw
         2Grgh6mGtoJYOa6AHuxmEq8WUdGshMJiDDR8A7bHnFlymKyjxX6bCA5wZ8zGYG+HNMlJ
         zMY80Sbo02TTl8SbETDPffhFaRzVxYhZdpDyyU8Dr9ZeOEIRM4sfJ5RSHsze/U0ZZYq4
         ZaKapRnoqoIJiuopF8uhNwQYiVbWZ5SbyNeUUCIsbvzYkZC/g9h/fHWCI0n38Sqg+z0H
         HMZv5JITE2U9maRroCXeXSrobMrbQqZU+PMwZuh5dWMdZ2UJEDbEEX+AX4UKkGqgz+8x
         83DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dwPq3PrJhCSLcrbWMlkdgCrTzqM/jvJ6qgHnrU/vgKM=;
        fh=wGqDb8M5Tq2pYxpgnqPoIrthiDox5J+X9J0zPG7sXvg=;
        b=MMnNUa6mbD6DMNeD4udltoW+dOOtmusP0FTp0L8W779Rjm32+9dIjTTzzrHnfZYxiP
         Uxug3NpEIJz7gYYm2WqU/lrYo9+mF6hN8jVFREeTqKQASaxLD8/i3qcpIpQbKwdDU5rT
         mgZ8WUKvg06N8jMV6fo8a1fobO4+gih0ufJzY9khoMrGwdxDhsZrLzYIxU4gUlDZrI3p
         K0f46bbwK6FeM1MeQQDFkFc3IakJJ4Xiy2yNGOH8b56LrKPAYhaolqap20WJ3OD21tWW
         +vKGhl2XfDS4LFm8G6LQRPJ83hZGZvynGnDz7hJFXZiayyMHS+IE/BnN49SU5ZIZiViC
         5sSw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781092261; x=1781697061; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwPq3PrJhCSLcrbWMlkdgCrTzqM/jvJ6qgHnrU/vgKM=;
        b=atOb7Hs3gUX4fn0zEUVhBF2nu+26PsvVlriKL6/B3zpfbTBdVoJFZNFZqGlE5x7IkN
         gkpHdARTwmtwH+qbvuH3k+u9/J86L1qqahV/3HUuN+Ag6NCo1oVf+sE5Jk+Yp9TbhqKk
         Ib0DwBBrKMiPzCVABJGM/6ECwoZ0CajXkZJ4OE/NqnSJAxvpzRFpDR6vQroMEnhS6y5a
         CFERddqySUBntZSvvVuACPZl9riW3QzS5ZrVLBdC4MbEMVDe+02LzkZpSMe3ci/S2oX3
         eKMqR6IruHskq+UyRmwO7yIQFfNDQHYPpPl3CEyLHP9I10YiyEBGKgt9xtM+Y2/PFScL
         bSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092261; x=1781697061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dwPq3PrJhCSLcrbWMlkdgCrTzqM/jvJ6qgHnrU/vgKM=;
        b=njnXYbYl7lO3w9u2TxF23r10PZvLZhPKU4X+AN2BeezJvMVPYcdgNCWST5GLsmWpj7
         uLjOX/F8VhAfLbnfg8pC2wkvnP9Gu7jOZ/35j+yxS5eO6aJ3oSKaGqMYVIrUXPQ86Zbx
         AWbU/jcLRZGvRfpGYvko/nCnAfraaLMfVcuyQCcGcsI5htfRXhUz5yk7dzymExxL//+s
         UB0svMHKI9AkerACXbQwX+EybctZvXagBKzqZGbtEQ/nsvNkSGVc8Zp8vcihek2hMQ1A
         03/3J5dYVRWfpfHEBPfUgPtx3eLSWXJy3Q3+VBEvyCO5ufAuIIt9dVIYBOwloul4AKrE
         os9w==
X-Forwarded-Encrypted: i=1; AFNElJ8so+8SOwTRl695OzR+/rICqbHLxeHq7CC8K/zS/Tkh5oNtRSuEUwsOmePKLtwnX3rRUPxx1mHNgWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSy+QYLttjdITwGputhJr0LuLJc86zu97F5C7Ar6IaaVh5qK1l
	wAsnN2buAUv3gD+TFqfiZrcf6iuQZXSGO9BD68hsb4ar4sCMpgGXs9w6ZqmWFG6VZ79z6nCkhXC
	/zNAe+thhdFY0DGYBUUM8T0sl8vOGytPPPeM3
X-Gm-Gg: Acq92OFv2tDd0O2HXzsR+FiOv1Ji83yHDipdYyHJwSUEqTIiHENSHpq/j5MsAfY2VWB
	CmkFeypQ3OSJdLiOxwYG++gd34vHWakqWKkI2xgNNCLUjO5XAhr5+rjfNz/okYAJU6+Tlua6ZKs
	p4v571XgBg0dar4afOYkRmYO67NmqKJyQLf30dzQHOSzL++YC5Hfo58Pw7Co9dz0S7LXlpsMEQb
	f01s/IeSxWvkThh3MkoEPtEMXvnpbSi/EvXgpyr8H4/GgKw3JAPS3Y7YaTfjjX6+eY437vOaqFB
	DzG2cLeUcRt4mQJ4J8qRb+IDtNSGdzX8AeZ/AXYxRgOIjNPj3EJtajrKbA==
X-Received: by 2002:a05:690c:63c6:b0:7e9:18f:3778 with SMTP id
 00721157ae682-7ed5028b682mr178627467b3.4.1781092261652; Wed, 10 Jun 2026
 04:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260610114137.3749027-1-michael.bommarito@gmail.com> <b19b3b96-db17-4ed7-890c-be174b21f391@suse.com>
In-Reply-To: <b19b3b96-db17-4ed7-890c-be174b21f391@suse.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Wed, 10 Jun 2026 07:50:50 -0400
X-Gm-Features: AVVi8CcVWtYlxSk3K_sxCwT39zqlVg5P_kt6D6e0HsTfuH3uHGfRxqf-bQDC2fA
Message-ID: <CAJJ9bXyFatHYnqvwHyupzZWOVCd02Fu4dpOdZTvLE-At+Z5TRQ@mail.gmail.com>
Subject: Re: [PATCH] xen/pvcalls: bound backend response req_id before
 indexing rsp[]
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1781092263-BCB64DB1-622FC108/0/0
X-purgate-type: clean
X-purgate-size: 379

On Wed, Jun 10, 2026 at 7:48=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
> Please add an error message here, using pr_err_once().
>
> Instead of just ignoring such responses, I'd consider stopping communicat=
ion
> with the backend for this device.

Good points.  Do you know if there is a canonical way to track
bad/buggy backends I should reference or reuse?

