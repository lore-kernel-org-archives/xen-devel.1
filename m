Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F6FCD5BB0
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 17:22:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1317162.1586405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTZY-00059d-3E; Fri, 22 May 2026 17:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317162.1586405; Fri, 22 May 2026 17:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTZY-00059U-0I; Fri, 22 May 2026 17:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1317162;
 Fri, 22 May 2026 17:22:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQTZW-00057r-Om
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQTZW-000DgH-50
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 19:22:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1090ab-bab6-0a2a0a5309dd-0a2a4506bc86-16
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:22:06 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1090bd-7371-0a2a45060019-d155d0aebd3b-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:22:06 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-39394e1e8f3so73366941fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 10:22:06 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779470525; cv=none;
        d=google.com; s=arc-20240605;
        b=Ejfgr2X/mgtvknTCzA6fOps6avwwAd06VVgu6IHD+XjSC7WtdGWcQoCH+mVs1SP62v
         x173wvpexMA70YCduHtFNcttj8umV6iEEuloRTrkJhNvMCfeWlcPld/6rpYZ6jv0vx8p
         zIDQaELDL2Qg7ppZTi0HDGNkcGUq6H2yPJALGT9RvIUry+Y9cbFbDtaW5uIH+rb5aqDa
         XQ+LazeyZdy4T078gIg7J9061xiU39Vv+nQDcENxP4sLh8SclDKqvgctjItH6eyvBwzd
         YVdLXWQSVH1qe5blrN1bNxsk58jhAPz4iUSG/hyd3wJhZ3mSwHJTmTHz4Q+CPTYwxOZB
         2BUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SllpBOG4I8HIjH+P8zdU6RFQYgr0es/ndiJmyiv+G6E=;
        fh=074dSOZR2TjZuH9KX7pMcX1QOxphcb/LlKcediamujk=;
        b=MsubFfZgxRRaeh5bdzYsRvzFLexN7jTMBpJrrRrtNCnPSVJUdMKpdlgPLHWwrNVIAM
         MGyJ4SAFkDNvAx5gTJDGyUSKJjJO8IdDOowPwb6nCBA82xHk593NkjBo1ZSGFqiFQAWH
         J1SCNocGp+QQuN07lX91Kea6C7WUBEohlbJhBfCqDBJeRFeP9E9byiYrqox/6g+84PRr
         6Orq4oJhQT9ltoWDmFrqj14sn80hysEFOOeggvuKw5N+StGEoWEWLiG2YlqYnBoD9U2G
         iwGSsTys8D90KEp20I8+7LDmB7GTK6S0jizy1YXG3jmLU4g0kT2/cfsPMncUnezMUaLD
         kl9g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779470525; x=1780075325; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SllpBOG4I8HIjH+P8zdU6RFQYgr0es/ndiJmyiv+G6E=;
        b=Lknlu3xnDrZ8OMU3z6yk9auDufAozrvVowFC4VH0HvtL7HYE5wETWRJZsaFlelsuji
         Xm3os5LHBBaN9e+LydZtEz1CpqxfQVNimA1eCPVWoB0cJrbu8R6UCYBQ1PAAmbdsGH3t
         YVywqDbODtDAb7dznd95MkYU2CJVXua/nLgHewDu0/KSV2nlCuvHX884kLpjVJUnmHDD
         lAJVNiN7EjWByVY4pboCV9AyCZz2m+Mu50lCpnIpG6xo759lrccXaZcAxapYzUJ3WIzf
         t7zE6rTwBO02Ow7mXuY/udykUyn/IMJ8vGAq0lyLXBYHWcv0n3tYZXBwyQuqI1WRGLAG
         4LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470525; x=1780075325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SllpBOG4I8HIjH+P8zdU6RFQYgr0es/ndiJmyiv+G6E=;
        b=PKyl3YuXK5jAL/AZ8KiJWU+mdhpEFfGf3R8ESi5fy/gxV6qUdaL5SA+ImV0hHTvh2F
         dkHjlxLL7GtJbvdR0OkdMCKLFRiI+hZ2jqnaoa0RXkSRoDcD+NjkK4nbBWIvXNlOLLa+
         KtHy0Z96ffTWut+1KXhREdbKx+jA0jKYSObdGBSJbtwBxbQgcrBfAYoGbtbKjwRgZYR2
         KnRwyrSpPVqp1zdJXxguTjnsAXeXzQdJVGS0brcLUpOfA5Pqi5f+SJteTxv4kd+7SuCy
         RlaforMBK8WiGwVsgvDgHCcMlDd+Osh0b7nTMZ8/oZxazI1PMlcaLLqh1FymlaMojOYq
         bNEA==
X-Gm-Message-State: AOJu0YzxmfM2YavRYNtA+KOMdDbKY7kcKsqDFLl/3MNm3rEiudev8smi
	6opaBIIt5BsMUUASpKVcr/gdMJposI55IyMOBITCzVo/gLDd3THKXXoC6Qsc1NlNm0os87eHpGW
	Q5RE5zg2V+bBuUH/qYZXpTUU1QsjFMUU=
X-Gm-Gg: Acq92OHXEaXpzIKOfPjU64kIs9bmTNyXw60CazSLtKbwRaji2G6oqtCO5zgTPpKKQzn
	1VhrnxNwBDcmggznXqiVzNgQ/zOci4VE/cfgRNC8FJcG3VWqDBU2I6qQv11gUWEY8AfJAFtbJtU
	mGVsEDTMamg0wwwy4q/DY5rO+IJxh8BbYV89Xiqr0wSJ1HhJiDg8Sz5E13S5HXocjboodL5tSQb
	+yt3osr4ZY5QmiqrJduN4eB7CcPYQ1c+v0CNknfT8JpntTlRszaAKN/YIPj9kCy/ZzH94WrpoUK
	A3Y7
X-Received: by 2002:a2e:9a16:0:b0:38e:a0a7:d6d9 with SMTP id
 38308e7fff4ca-395d8d0e7d9mr15178421fa.19.1779470525108; Fri, 22 May 2026
 10:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260522165238.844649-1-dmukhin@ford.com> <20260522165238.844649-3-dmukhin@ford.com>
In-Reply-To: <20260522165238.844649-3-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 20:21:53 +0300
X-Gm-Features: AVHnY4LCjaYC3Q_hbLwOlZIBV2uapzaZTHJHPnKp4tv-XOnoSFM3A1g3WyY3KzQ
Message-ID: <CAGeoDV_+t_L2m8NG4JixgdCvG5spwQnp-2e1TtJjE4QzTCAr6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] argo: correct logline in ring_unmap()
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1779470526-87B7DD75-1194D071/0/0
X-purgate-type: clean
X-purgate-size: 1141

On Fri, May 22, 2026 at 7:53=E2=80=AFPM <dmukhin@ford.com> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Drop XENLOG_ERR from the logline since argo_dprintk() already injects
> the proper log level indicator.
>
> Also, drop "argo: " prefix, since it is also injected by argo_dprintk()
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - dropped duplicate "argo: " prefix
> ---
>  xen/common/argo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 98a3db7fd070..5da14c929e14 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -474,7 +474,7 @@ ring_unmap(const struct domain *d, struct argo_ring_i=
nfo *ring_info)
>              continue;
>
>          ASSERT(!mfn_eq(ring_info->mfns[i], INVALID_MFN));
> -        argo_dprintk(XENLOG_ERR "argo: unmapping page %"PRI_mfn" from %p=
\n",
> +        argo_dprintk("unmapping page %"PRI_mfn" from %p\n",
>                       mfn_x(ring_info->mfns[i]), ring_info->mfn_mapping[i=
]);

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

~Mykola

