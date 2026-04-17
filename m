Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2DBF43682
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2026 08:58:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1284050.1565980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDf1B-0006vY-D1; Fri, 17 Apr 2026 08:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284050.1565980; Fri, 17 Apr 2026 08:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDf1B-0006vR-AC; Fri, 17 Apr 2026 08:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1284050;
 Fri, 17 Apr 2026 08:57:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e1f601.v1-5bc42f588c204b238698d215908a218c@bounce.vates.tech>)
 id 1wDf1A-0006vL-0n
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 08:57:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDf19-00G32z-86
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 10:57:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e1f601.v1-5bc42f588c204b238698d215908a218c@bounce.vates.tech>)
 id 69e1f5f7-e002-0a2a0a5209dd-0a2a4502db6c-36
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:57:39 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e1f601.v1-5bc42f588c204b238698d215908a218c@bounce.vates.tech>)
 id 69e1f601-af86-0a2a45020019-c602890b55f9-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:57:38 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fxpg50Zn1zDRZ7PB
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 08:57:37 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 5bc42f588c204b238698d215908a218c; Fri, 17 Apr 2026 08:57:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776416257; x=1776686257;
	bh=DW2l/jc+ZEcxNJuiNNbXqKEtvirgVWtkF8VjCPX3hh4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zYyjDc/3zFNXCrXm7VHZe7ylB4ai+L0Br+8/PG2vPyMor6V/MQQ14Nud2ofmm3w6D
	 MkCFL0rZC+S4014Wap5zCH2vgORObnE/X11men32PKDOgtUHON7oC94/bAk2/bGjEu
	 cPae1qwzid9wVKPbSjZnViGpBWKdf0dEB5Vail8C7HEC7lUdsoIMH6U9EL+Qui2oTK
	 Eu+idol4i/g3Rs9jdLua5PRTgMZWR/aEWBxsshrvs6gNlb32aYbrxyWp8b+udvXQCF
	 SO25K72mQgWOfbDJKGBDVAmBi2KTyjBnax+VW87PYg77vKVwKyd1+azxVxC31sprXn
	 VgZXL4PB4YrPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776416257; x=1776676757; i=anthony.perard@vates.tech;
	bh=DW2l/jc+ZEcxNJuiNNbXqKEtvirgVWtkF8VjCPX3hh4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Gp5wfOtHgiSAk3yA568oHC1o4YiofkHKaBTYC4a8Fm4bZOdaCqjYbvLwARcHVIfWO
	 EHlEJ/siS/wDnIZfF5N+SNEJnJYI0kyC7y7eyQztz1yA96LQOcDaXzV1EJPkNZ7lMe
	 4+LJxrOWz0fO6Rvj5hmIozJuiXdezTbVnEGLxtnnZHrLT4CTeJeVsLmYi0O8du8JB/
	 P4mCSbhZncXC7F/AHeXqAS2oAjmucE3g56K5CR7bg+tkHjk7Hozotws+Ldz4C4JRW4
	 P8OUnZwU5vJp9DPPyd02pQFpqY4M1dk+yEpCsiMhiJ38AFxAr6Hvi7fBaj1HkaGmKY
	 k+eDKFZeJ4twA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v10]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776416256345
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>
Message-Id: <aeH1_5V71IQCbgCI@l14>
References: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
In-Reply-To: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5bc42f588c204b238698d215908a218c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260417:md
Date: Fri, 17 Apr 2026 08:57:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1776416259-B3762161-4279913A/0/0
X-purgate-type: clean
X-purgate-size: 774

On Tue, Apr 07, 2026 at 02:10:37PM +0000, Teddy Astie wrote:
> +    for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo.threads_per_cor=
e )
> +    {
> +        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +        {
> +            fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - %=
s)\n",
> +                    cpu, errno, strerror(errno));
> +            continue;
> +        }
> +

A trailing whitespace was introduced here since v9.

> +        has_data =3D true;
> +        printf("CPU%d: %d=C2=B0C\n", cpu, temp);
> +    }

Beside that, patch looks good to me now:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



