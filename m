Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C99ECA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 18:48:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436692.1655373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBcrX-0006aG-R9; Tue, 29 Sep 2026 18:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436692.1655373; Tue, 29 Sep 2026 18:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBcrX-0006a9-OH; Tue, 29 Sep 2026 18:47:35 +0000
Received: by outflank-mailman (input) for mailman id 1436692;
 Tue, 29 Sep 2026 18:47:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xBcrX-0006a0-6W
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:47:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBcrV-009uNc-Qw
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 20:47:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abc07ae-8faa-0a2a0a5109dd-0a2a450c9408-18
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 20:47:33 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abc07c5-f479-0a2a450c0019-4a7de5cded66-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 20:47:33 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5ba34653aefso842490e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 11:47:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790707653; cv=none;
        d=google.com; s=arc-20260327;
        b=Bt9YE0YsgC7KohBqhnfpO3jCl4HdW9/6b72uabyUzOZ6DuGJdP1hpbGekDnkj8kQa5
         glFmwKokBbyrYCkVGurDWC3ThpeRPLJZToYeSjKLKJKMTpjnRfyJ2/HNJue0O55GSeB9
         SKhHpAMgE9iGfmfX+NWddsQjI1E75+lH+8QjInPLJR/SbZocmunlL34U5MFKDBI5ab1G
         jSUlPHhvNZx1lTC9CtBPvuS6BTmhkJclgASFrvEnYwXqMixgYkQTbnmBzh2nK9k0iVbq
         MkORbMERibJcw5edv88FpO3MnXc4SLu7Z0zUzh3klbv3aRgSCF7r/fwI93V68SB37fCl
         h4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ib0bYDqSItM8q5zF2oSJMETpGHQoRqwtaE6dD/u7iD4=;
        fh=DRIV/2QV7TrPZJXhEwETnDBVA3dZxdD9Slb8lfIc20M=;
        b=owrhrExY3+mhbUv/nEI4Xq4biLfJCxPd6+T7Atdo5mbLezGx6CyRRVAsybHifILBLO
         JcldoxWiDF2xw44Tnwrvb9CmennV0bLKAPKYU35a+1QeJUmgyOnliH9gnoil1vFR4OXl
         H1V2pcsLDDwdY0WIS6c6Rj7R5+MmPP4rewAd/stFHJs143aDVxEuCFmpsX+YUtAZFZo6
         7/FYKZQCVJ0aJvYzeNIdK4/5NjvZcKXGYgQ0Yugjc7er7psIyxoBEafLD2xizjALd4l/
         NgP5/UoCFH3MJkg6txpL2TiAzp5dKeSMXWblSdA3XCp1iCF9nM82hPU4RikLex4fEJpX
         uroQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707653; x=1791312453; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ib0bYDqSItM8q5zF2oSJMETpGHQoRqwtaE6dD/u7iD4=;
        b=gx2Mep9U1k4gjxHYqfrK9mz48UTl6TkWNcFspfbl8ydFa22zNahlQUFCDif+Umfkmy
         uwc60tF/tFgQcqSRZ1ah8Oq/ZNb2pgjtKf1qp1IgxHPWArGjcjdtBze9NOJfrGjw/cao
         YKN8VslbNZvqsiJ4qeIICip7LtJDV9+eCIuF/59jNDWtnHveW1bXP7w5oslHYbbh/Dx8
         XthpToJIeiR8CIo7ZagOzCu1LKke7ln4tO1P/znx/PidHQVXO5/UB0C+agdcXYlNGRcq
         ObA4ubjwc+G3exwco/DtfBS699ZWWXGDPtSm4rH0UTlliJBtumvZeddF0LtPQTDs7lZR
         JwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707653; x=1791312453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib0bYDqSItM8q5zF2oSJMETpGHQoRqwtaE6dD/u7iD4=;
        b=vxkUPsTYzBYK8VRMjk0TndHfmuFLO23h8dCmtwNlrmeqYZ2s4hdNvXtk9RwqeRiuEC
         6VnqCgwl9joKq1pmgwwpDFKFvC1jwFAvyLs0NfOLpdEnp64CBIMEuuP/mNL5YTIY/66r
         xjgtuzhdRjVi4dmHk95DLxjSjVLdYPFXza1VuHXJUJdfXXgWN4vlbucUKLLumxR0VeEf
         DkdlpCRdCuju+4NRwn1/q8PG6ljnas1yDmp3oIv5atDaos31luGw+P3s26WYWWdoFL0a
         O2j4w/sCpDVj5/TQrGZna0Z/645IJnxF5NmRDvlMnfIrpK/b26E/rXmxJMRiDvE3SgSp
         nO3Q==
X-Gm-Message-State: AFq9FYLazWYQSrYjCoDmEZzqpt1bZ1btsudMOyQXisXny+rD2qyBEcm6
	2LocLA5C2Dg1+KgMgtifikjhPZtk8fLWJ37+dyRCob8lNudEF4cSEsQb7zzlCnlOKhJ21SA4xEP
	pmfIRgN5kdgA1gCU2oFILGOOfONwZC9I=
X-Gm-Gg: AYBFou2GUMbtGgdoTmhPr2Dzd4bdpriA4EFAFtjQfivmrftAk7xDzwlXfnazdzC28gZ
	rwruDrYc3oBcZhlx6U9sBqqU96eYqkBME35oeWzjlKTFdFz1FQmBsVmTh8x5p82RwqZ4ty0mdas
	as+x9lxt6WKsHnDkWPRPYSJC17KVQQ0jp2h0DII/NXzg6TL652kwneYTNdhXzkJqtjHTgo4RynA
	9Ob+hBDYs6amIe+92HQXpvPjiFfH9QOCAutouY9aBSLVk7bbhC/OUgY/JTEDQDbaiOiv4Che0O1
	IM5/4cHQQAvJ9JPccgl/yt2msovAa/bXss6Z1sSXU+1kcVd8G887qQ==
X-Received: by 2002:a05:6512:3194:b0:5b8:f123:f945 with SMTP id
 2adb3069b0e04-5ba3bc3394cmr181918e87.3.1790707652876; Tue, 29 Sep 2026
 11:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260929170835.964609-1-edgar.iglesias@amd.com>
In-Reply-To: <20260929170835.964609-1-edgar.iglesias@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 29 Sep 2026 21:47:22 +0300
X-Gm-Features: AclHuK-kTkdz9gfeJBmahqq6WdAtd-l1f9sVYCf5UzavUlNx3_YEWUATFJTjedI
Message-ID: <CAGeoDV-7j0wU_PHyq4JBn=-0bT-ktvr9GXMYTQH1UBq2JXG19g@mail.gmail.com>
Subject: Re: [PATCH] xen/ioreq: drop the emulator reference when range set
 allocation fails
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1790707653-014C7A5B-BAC01CF0/0/0
X-purgate-type: clean
X-purgate-size: 1477

Hi Edgar,

Thank you for the patch.

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

On Tue, Sep 29, 2026 at 8:57=E2=80=AFPM Edgar E. Iglesias
<edgar.iglesias@amd.com> wrote:
>
> ioreq_server_init() takes a reference on the emulating domain before
> allocating the server's range sets, but does not release it when that
> allocation fails. The leaked reference prevents the emulating domain
> from ever being fully destroyed.
>
> Route this failure through the existing put_domain() cleanup.
>
> Fixes: ccb42e0ca661 ("x86/hvm: take a reference on ioreq server emulating=
 domain")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  xen/common/ioreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index f5fd30ce12..4b321a5c61 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -595,7 +595,7 @@ static int ioreq_server_init(struct ioreq_server *s,
>
>      rc =3D ioreq_server_alloc_rangesets(s, id);
>      if ( rc )
> -        return rc;
> +        goto fail_rangesets;
>
>      s->bufioreq_handling =3D bufioreq_handling;
>
> @@ -614,6 +614,7 @@ static int ioreq_server_init(struct ioreq_server *s,
>
>      ioreq_server_free_rangesets(s);
>
> + fail_rangesets:
>      put_domain(s->emulator);
>      return rc;
>  }
>
> base-commit: 24bd190cd99447ec634da6cb56590ccf44ad627d
> --
> 2.47.3
>
>

