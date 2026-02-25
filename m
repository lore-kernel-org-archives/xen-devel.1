Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58302FD3764
	for <xen-devel@archiver.kernel.org>; Wed, 25 Feb 2026 14:44:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1240820.1542076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvG7A-0004JA-5D; Wed, 25 Feb 2026 14:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240820.1542076; Wed, 25 Feb 2026 14:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvG7A-0004J3-2X; Wed, 25 Feb 2026 14:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1240820;
 Wed, 25 Feb 2026 14:43:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZsK=A5=bounce.vates.tech=bounce-md_30504962.699f0a9b.v1-a30e3c04f63547d1b1ad5ba6c8d26352@srs-se1.protection.inumbo.net>)
 id 1vvG78-0004Ix-SV
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 14:43:46 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6012b9a8-1258-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 15:43:41 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fLclv3V1Dz5QkLc9
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 14:43:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a30e3c04f63547d1b1ad5ba6c8d26352; Wed, 25 Feb 2026 14:43:39 +0000
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
X-Inumbo-ID: 6012b9a8-1258-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772030619; x=1772300619;
	bh=NVNJ7jOt8+RQyYSunDDdQZVJhSiMVIUPRFpoqvc90YQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qTF3KkhoiXVnXmX8S2Y0sQFEq3rrN34jhrx0DvAASAgwJqhUFQvjSXVOygKdIpD2v
	 RESigaV2vk44lzohnUKoovcmc0j88NkJ5/zep+Vcvndp2Q+w099taL0s+VeXkxqrxa
	 jAJAtchtLp8fVMwB6IcSldI9CX231X//GVHlYGxZrW3POjMyO00n529gBw1arrW/e2
	 xFLoT30hwbLBRKb0fXQbK5uuW2Ypeur79gzpDLYGBduabotceqAWZ7jPxCiu1RuW7V
	 j5PBXXtOk7Z/H7Xd4uMFczjs/cFuSeyfcXq8cMEKDS5dS12TK5H0OCmRzVDmoCcNFA
	 B7oSL3SLqUOzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772030619; x=1772291119; i=anthony.perard@vates.tech;
	bh=NVNJ7jOt8+RQyYSunDDdQZVJhSiMVIUPRFpoqvc90YQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Pq0hu87OT1TEXiPM5M+/RMxFhE9/fRs5KAispnXrrPdERAHh2aBp7zHaBu1qFxBoW
	 EjEjsI5Gccf86lIObAe4Cin5bO87uQ3gKDYSrhUbT+aJg5An+aNysmnDb4fjAj1w7U
	 OQ8fVNeNO0bpSMMnld+hH+DAjfwmECtJ9usmUVErzu/6kkoWYWUTyonBfZBEj0Uyu5
	 xH+tAzL65Yg4DIOtcUpy8YMMpWaBwnu8wgmSnRUnR8cavGvwoqxMYoz6nSSmO1XNA4
	 4qErosE6Jy7BTjB9VKlpnC5pdJznr2FJuDMkt0xadXPKOeNKGMjOX7DRUVG19kwmby
	 Ah0/NcMGfFFXg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20libxl:=20constify=20some=20local=20variables=20for=20building=20with=20glibc=202.43?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772030618736
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <aZ8Kmg3bV-dIEu0A@l14>
References: <20260220121220.52078-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20260220121220.52078-1-marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a30e3c04f63547d1b1ad5ba6c8d26352?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260225:md
Date: Wed, 25 Feb 2026 14:43:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 01:12:00PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> Archlinux just updated glibc to 2.43+r5+g856c426a7534-1 and that
> causes libxl build failure:
> 
>     libxl_cpuid.c: In function =E2=80=98libxl_cpuid_parse_config_xend=E2=
=80=99:
>     libxl_cpuid.c:447:16: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       447 |         endptr =3D strchr(str, '=3D');
>           |                ^
>     libxl_cpuid.c:452:16: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       452 |         endptr =3D strchr(str, ',');
>           |                ^
>     libxl_cpuid.c:454:20: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       454 |             endptr =3D strchr(str, 0);
>           |                    ^
>     cc1: all warnings being treated as errors
> 
> Add missing consts. Note in libxl_cpuid_parse_config_xend() non-const
> endptr still is needed, to be compatible with the second argument to
> strtoul(). Add second variable for this reason.
> 
> And while at it, move semicolon to its own line
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



