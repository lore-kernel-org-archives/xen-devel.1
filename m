Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC3606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6tB+Wst
Received: from list by lists.xenproject.org with outflank-mailman.1504040.1699591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgYS-0004cQ-I0; Thu, 26 Nov 2026 20:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504040.1699591; Thu, 26 Nov 2026 20:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgYS-0004cH-CU; Thu, 26 Nov 2026 20:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1504040;
 Thu, 26 Nov 2026 20:58:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 1xWgYR-0004cB-4z
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 20:58:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWgYQ-007h6u-EQ
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 21:58:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b089d81-8faa-0a2a0a5109dd-0a2a4508b01a-6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 21:58:54 +0100
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b089d8e-f659-0a2a45080019-d155da36a506-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 21:58:54 +0100
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c50933bdf4bso1401017366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 12:58:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795726734; cv=none;
        d=google.com; s=arc-20260327;
        b=KUCje+U/0Gkp2tZ9BNCfLtz25Hb4eJXYmQt0w2+wvEZGNfT4fJg5bSFNux+hWvXwE7
         ODey8uHBDw4naGR4yvmOHtTOlj7b6k3Zn2xmiXC7ar7BJqwreWYal6f0KhuPiswqOfnP
         R8VcMzplWWzpEOZI2KKc/42K1Qv/uY+W492WGDH/RDQeuRSsGMSCTkRGTFImNr1Vl+4K
         mmuLEb3VxYMRLnJZMvv6yZmJRXWZN7//L8FXNHTraUkVy6NU2+yCyuthqkBMuEsGaY69
         Lcyi6o0LPMTWzEzchalxjSbv5OU4ClSB+nyW5jvy5POKwQ9yxhGk+hsc/fkNXyEzfyxr
         L5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nfkx6YqvUCuyBA6MZuKpdZq+qdppvAtiNRc7kvEvQBY=;
        fh=WU3HsY45l8IoeuZptkB5i0FKT1rSu49KrMuKHU+Mfbc=;
        b=rJi5T1umb0fWIr0nWKkatgbRFM2Bb5NkNlECOQcuvJlvEtUObSS1FigPNdowH8NTn6
         XD59mAPFTRH3H4t5Iw9/ksYOVYkW2XyKhzNWq2QZ388CgDMx4UIZtVvE0MOO9on/gu8o
         66G75n63dpzNEkh9WUt8No1bbju5p87yMQq/ZdOlVjjjKJt6gb4WKkLOGdpAQwYEjNZP
         RNx2H9uEuuRFz2gHRrPduYBP/5f0Im+WcFgmvXA20JTG42t5zkQa/uTXR8EYGFGj2evK
         ZyVhwZ55as+fQOTPqC0SZYNTFZZtzURbZKOM8zvWyp44uCDCxOtxRlwn/Y1Hq7LntXGJ
         JuCw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726734; x=1796331534; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nfkx6YqvUCuyBA6MZuKpdZq+qdppvAtiNRc7kvEvQBY=;
        b=R6tB+Wstes9U5pwDfnmfhvblVpAD579rmPyu1gMAUTkLiOZobrzqinylTR6knZun2O
         H8ls8OgYlJYN0Gj9iWnDTv4yVmvAfnxrCnpSXct0t9V899KOdbNF9/Nsh9GdUSe4OoGr
         ukOld77Lm2pXMMIyJrBUmQkIohQYKwsbj2NLCShJEvHgJsoLRiz1f3d3sIbruZenPpf4
         gQTT/DcVTnbOjzd6qAGRyQi/k3rtmSTNeOeRv7aSs0ZNrwJaJE+Jwr/auR0Ixyu2MNP8
         ZInKR2mK0K/vQePq5nyOZNKDv4lsF+Vg2h/ht0H+9DzvAX3VWdjtIMZloAJIOSbuML0e
         xZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726734; x=1796331534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfkx6YqvUCuyBA6MZuKpdZq+qdppvAtiNRc7kvEvQBY=;
        b=wlh+FVIknYMa45Hy6RLst5DSGv8zeZiwNVUeVP1ydlpBzEgh27Wfb/mN3hoKUA/417
         3zwNXpYc6i2DvdZk4rAs6fnhVZZWCL4luel1q75stsbm/1ggYUHbeGpUGSWiUqyKmNq2
         Qtjqmrk+aDVAuS5wMYo7dhI54mH56JvuOJdkxYvURRK+aD7zUbM0DSOuLeSwwkR4dvvu
         76YIyNXmrCcuZX8hp8sFf/VNw7acy6vf0xX0R2IHtpFnWNPqWu4XqxQ+xnw7iOySi9az
         Ux1qNZJ/kad25zspQfHw0CUzdxweuh3kSS8WaHfl9zgVPlfdc5vdFtINrcK0qvOCCG3+
         UoXQ==
X-Gm-Message-State: APuU4Z9LY+u5xDlurFN0dK0po4rxYb1LDoqILMmLov0U0TUm69vJ1UL7
	YLEck7tw0RIkvsFHkwUY1iHcRCrHBSfI3mzarg+C774GHhL60qiTSNnMOuPQI58Yp/mvQr8D9XR
	9WSKKw97wFwnewQDZAAInUyDldTHeFXHSGQRjIzE=
X-Gm-Gg: AZFdTZft33+mCINCR7lvQGG2HXrX86ug0gWOthD3jTule5A2IEeObRl6Oi6+gCc6Otb
	XbRaPgZCW6VCi+bdU27T7duXZhAxMdm94nKuRlKcRI0Q/GNsekBikbnz461cAaS5iSYqStBliOp
	AlfW0JtDz/jOz7auf4t11JqZMZKf+4Jh2kK+ylB3etBKvvo1iXO/XAgabc3eT1MztspuoLcTiA7
	BU+tUd5bSTOmml4x79DYXJfZHKx3hAQaV64V3Moef1guRd50C0O1fD7N7lbxrMp5nk3LHaMpAkD
	6PZzT2VKedlywXmKgmhoOzbYmN/cbCyJ3UPjpE86DXu6ckXv55c3hSRwIhuK4cJ6yWboiCT+VcF
	LCuzFfDj53oLL6pvI/5wSyUf1KKppiPsf8b7Gp63CfrPymwFTTxwh9ghIRQ==
X-Received: by 2002:a17:906:9c01:b0:c51:f96:feb with SMTP id
 a640c23a62f3a-c513a5e63ddmr1271258566b.5.1795726733785; Thu, 26 Nov 2026
 12:58:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110045730.433737-1-balaandeguefrancoislionnel@gmail.com>
In-Reply-To: <20261110045730.433737-1-balaandeguefrancoislionnel@gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Lionnel_Bala_Andegue?= <balaandeguefrancoislionnel@gmail.com>
Date: Thu, 26 Nov 2026 21:58:42 +0100
X-Gm-Features: Aa3M54qycq0fHiomy--jdXNRi0UvZ-o7nKK_KLCZEOYDyHZ4PNK5_JVrK79SkCU
Message-ID: <CABqoPO5CMwW4gajFO0jktBoJepM+p7hCdYesE8Qa+SD522U+Cw@mail.gmail.com>
Subject: Re: [PATCH] docs/man: fix typo in xl.1
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1795726734-D654487B-712DB801/0/0
X-purgate-type: clean
X-purgate-size: 1768
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Gentle ping on this patch, in case it got lost.

Thanks,
Bala


Le mar. 10 nov. 2026 =C3=A0 05:58, Bala Andegue Fran=C3=A7ois Lionnel
<balaandeguefrancoislionnel@gmail.com> a =C3=A9crit :
>
> Fix the misspelling "coniguration" -> "configuration" in the
> description of the -D option of both "xl migrate" and "xl save".
>
> Found with codespell. No functional change.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Bala Andegue Fran=C3=A7ois Lionnel <balaandeguefrancoislio=
nnel@gmail.com>
> ---
>  docs/man/xl.1.pod.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index 51405f4e3341..8964811e8917 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -494,7 +494,7 @@ Leave the domain on the receive side paused after mig=
ration.
>
>  =3Ditem B<-D>
>
> -Preserve the B<domain-id> in the domain coniguration that is transferred
> +Preserve the B<domain-id> in the domain configuration that is transferre=
d
>  such that it will be identical on the destination host, unless that
>  configuration is overridden using the B<-C> option. Note that it is not
>  possible to use this option for a 'localhost' migration.
> @@ -707,7 +707,7 @@ Leave the domain paused after creating the snapshot.
>
>  =3Ditem B<-D>
>
> -Preserve the B<domain-id> in the domain coniguration that is embedded in
> +Preserve the B<domain-id> in the domain configuration that is embedded i=
n
>  the state file such that it will be identical when the domain is restore=
d,
>  unless that configuration is overridden. (See the B<restore> operation
>  above).
>
> base-commit: a5c26d0e73d4cde7c4620ea43cbd82ba7b2af02e
> --
> 2.39.2
>

