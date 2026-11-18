Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C4606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=UE1H53jU
Received: from list by lists.xenproject.org with outflank-mailman.1494118.1693786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTc0z-0001zK-8R; Wed, 18 Nov 2026 09:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494118.1693786; Wed, 18 Nov 2026 09:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTc0z-0001zD-5m; Wed, 18 Nov 2026 09:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1494118;
 Wed, 18 Nov 2026 09:31:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTc0y-0001z7-Bd
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:31:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTc0x-007xDL-J5
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:31:39 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1edff54370006d3f@swg.vates.tech>)
 id 6afd7072-2eae-0a2a0a5409dd-0a2a4506854a-40
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:31:39 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1edff54370006d3f@swg.vates.tech>)
 id 6afd707b-195a-0a2a45060019-b9ff1c23b309-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:31:39 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1edff54370006d3f.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Nov 2026 09:31:35 +0000
Received: from [192.168.1.14] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 09C6481CB9;
 Wed, 18 Nov 2026 10:31:35 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=+ypnkIKVmVhWvpbBOu4MLjk3YMl1mlXlpFVkwAAr4H4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=UE1H53jUIn2O6LXglZDiQJ7oJknMf9fJVjHqyoSgSd14lU9IJwEUY9uSaGWuWrp0aIwxilI+B
 +vKOQL50swbvYgGLlDaigYCUQbNpIZucw/RhgUVp4gQt47ozxRUWhXclKins5moZXS2XU7fJGxz
 yEV7jQNy6DkwKvY8BK4Pw5dDT71A72qvCQ5s7qvp8L6wxaVMxBpgM7dAO9c8x/Wt94opywAVYMo
 jN7bte63QXjmikUb7p3JI0cbCdGzMzgZiVDqH30o+xEdEM9HqaCLkOB1/IZeE6bGsWurXt+cOQh
 meR8Z/XcqTtYV1pX/XoyB2SXLaMBEAYF1ENRe2aMOLCw==
X-Zone-Loop: c9348b9f03a50dfbd06419a838d867ca0da89cb5dc6e
x-campaign-type: default
x-transaction-id: 2e9b6317-517d-4e7e-a3aa-151305bbaf14
x-swg-uid: 01-15002d24-69e3-4d76-81c6-d6612e119f29
X-Mailer: Sweego
Message-ID:
 <1794994295.8631fc262581453bbf619ec5b2062170.1a1edff54370006d3f@vates.tech>
x-swg-bid: 1794994295.8631fc262581453bbf619ec5b2062170.1a1edff54370006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 18 Nov 2026 10:31:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vlapic: accept a logical destination of all ones
 as a broadcast
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20261117233700.2654525-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261117233700.2654525-1-stefano.stabellini@amd.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.241.34e04730e86b11eb.1a1edff516a.5ea8289d478c57fe=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794994295146
X-purgate-ID: tlsNG-16d1c6/1794994299-F70C777B-D9D4326C/10/78276251493
X-purgate-type: spam
X-purgate-size: 3305
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.241.34e04730e86b11eb.1a1edff516a.5ea8289d478c57fe=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 18/11/2026 =C3=A0 00:39, Stefano Stabellini a =C3=A9crit=C2=A0:
> In logical destination mode, a destination of all ones is a broadcast
> accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
> the cluster model (AMD APM vol=2E 2, "Receiving System and IPI
> Interrupts"), and 0xffffffff in x2APIC mode (AMD APM vol=2E 2, "x2APIC
> Interrupt Command Register (ICR) Operations")=2E
>=20

Intel SDM also appears to say the same=2E
For flat model
 > A broadcast to all APICs is achieved by setting the MDA to 1s=2E
(MDA is "message destination address")

There are many occurences in SDM that all 1s destination is broadcast=2E

With a additional note that Intel follows the same behavior :
Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>

> vlapic_match_logical_addr() treated these as ordinary logical
> destinations, so a broadcast reached only the vLAPICs whose logical ID
> happened to match it=2E In particular, a vLAPIC whose logical ID is 0
> received no logical broadcast at all=2E
>=20
> Check for the broadcast in vlapic_match_dest() before telling the two
> destination modes apart, as was already done for physical destinations=
=2E
> A vLAPIC whose destination format register names neither model now
> also accepts the broadcast=2E
>=20
> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Stefano Stabellini <stefano=2Estabellini@amd=2Ecom>
> ---
> CC: Jan Beulich <jbeulich@suse=2Ecom>,
> CC: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>,
> CC: Roger Pau Monn=C3=A9 <roger@xenproject=2Eorg>,
> CC: Teddy Astie <teddy=2Eastie@vates=2Etech>
>=20
> v2:
>   - Check for the broadcast once in vlapic_match_dest(), before the two
>     destination modes are told apart, rather than in each model of
>     vlapic_match_logical_addr() (Jan)=2E As a result, a logical broadcas=
t
>     now also matches a vLAPIC whose DFR names neither model=2E
>   - Cite the AMD APM by section title (Jan)=2E
>   - Add Fixes: tags=2E
>=20
>   xen/arch/x86/hvm/vlapic=2Ec | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vlapic=2Ec b/xen/arch/x86/hvm/vlapic=2Ec
> index 6698779e22=2E=2E50b515d254 100644
> --- a/xen/arch/x86/hvm/vlapic=2Ec
> +++ b/xen/arch/x86/hvm/vlapic=2Ec
> @@ -247,10 +247,12 @@ bool vlapic_match_dest(
>       switch ( short_hand )
>       {
>       case APIC_DEST_NOSHORT:
> +        /* All ones is a broadcast in either destination mode=2E */
> +        if ( dest =3D=3D _VLAPIC_ID(target, 0xffffffffU) )
> +            return true;
>           if ( dest_mode )
>               return vlapic_match_logical_addr(target, dest);
> -        return (dest =3D=3D _VLAPIC_ID(target, 0xffffffffU)) ||
> -               (dest =3D=3D VLAPIC_ID(target));
> +        return dest =3D=3D VLAPIC_ID(target);
>  =20
>       case APIC_DEST_SELF:
>           return (target =3D=3D source);



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.241.34e04730e86b11eb.1a1edff516a.5ea8289d478c57fe=---

