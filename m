Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD93CD98F2
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jun 2026 11:41:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344218.1603331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbzUi-0002aD-FP; Tue, 23 Jun 2026 11:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344218.1603331; Tue, 23 Jun 2026 11:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbzUi-0002a6-Ce; Tue, 23 Jun 2026 11:40:44 +0000
Received: by outflank-mailman (input) for mailman id 1344218;
 Tue, 23 Jun 2026 11:40:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef4484aca000701b@swg.vates.tech>)
 id 1wbzUh-0002Zy-6h
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 11:40:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbzUf-00E556-Uq
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:40:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef4484aca000701b@swg.vates.tech>)
 id 6a3a70af-5cb7-0a2a0a5109dd-0a2a4505cb14-26
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 13:40:41 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef4484aca000701b@swg.vates.tech>)
 id 6a3a70b9-ef3d-0a2a45050019-b9ff1c12aee5-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 13:40:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ef4484aca000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 23 Jun 2026 11:40:38 +0000
Received: from [192.168.1.61] (155.223.66.37.rev.sfr.net [37.66.223.155])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 44AAD86299;
 Tue, 23 Jun 2026 13:40:38 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=VVynOhDwfFvfnmxDPyVxVG8n0+DUYs4xnoOXto8ASEE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=UqF0qplKF2kJH9ekTJTzEgA+TT4KFuDf9UsHPiBo9S4/vQFBwyhdJl4CfiHVewltpYRKiZVZC
 Nb9YJFQ18pwN2Hs89dkZn9eR2g8cAmeVc5aVWFALEHFuxgTxw5so2gqsnR4jv9yBRZaRwLHCdwB
 k7JqUlKqsfYuW4Bj7ZjiXsPyxyumoAUs/Slt9RtXI70cer6tnrUZyd8TP1sd8Cy7ZvmrINnhVgD
 sK6F3lICQAT2xazJMy+pYSXnhFLDrc0VpPLvg1ocEQxTP8EXM2Mr8wl5dkfquy/snvNRQ/NQZef
 X7Z9scs9K1aRAgWI/+bEn2dv5ecGujcslQih0GtesdMA==
X-Zone-Loop: d94b590fdb578ed71683dcf75d0c36948c341b7d6d7d
x-campaign-type: default
x-transaction-id: 4f945d24-d492-498c-9683-04224ece7d7f
x-swg-uid: 01-7458a448-363f-45a1-ab78-4ef8d47dcec5
X-Mailer: Sweego
Message-ID:
 <1782214839.8631fc262581453bbf619ec5b2062170.19ef4484aca000701b@vates.tech>
x-swg-bid: 1782214839.8631fc262581453bbf619ec5b2062170.19ef4484aca000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 23 Jun 2026 13:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
Content-Language: en-US
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.ab.ef107200974ed0ea.19ef448488a.4909cd64f98f75f8=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782214838414
X-purgate-ID: tlsNG-c201ff/1782214841-A46A5127-25BB2903/0/0
X-purgate-type: clean
X-purgate-size: 2378

---=Part.ab.ef107200974ed0ea.19ef448488a.4909cd64f98f75f8=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/06/2026 11:51, Tu Dinh wrote:
> In the guest-reported IP address in xenstore, it's useful to know which
> subnet it belongs to=2E
>=20
> Add a specification for the IPv6 host address/prefix format specified by
> RFC 4291=2E
>=20
> For the IPv4 address/prefix notation, as there seems to be no equivalent
> RFC specifying the host address/prefix format, specify it ourselves=2E
>=20
> Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>

Hello, I'd like to send a quick reminder for this patch=2E

Thanks,

> ---
>   docs/misc/xenstore-paths=2Epandoc | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/docs/misc/xenstore-paths=2Epandoc b/docs/misc/xenstore-path=
s=2Epandoc
> index 4994194=2E=2E1fab3bf 100644
> --- a/docs/misc/xenstore-paths=2Epandoc
> +++ b/docs/misc/xenstore-paths=2Epandoc
> @@ -78,12 +78,12 @@ VALUES are strings and can take the following forms:
>  =20
>   * MAC_ADDRESS -- 6 integers, in hexadecimal form, separated by ':',
>                    specifying an IEEE 802=2E3 ethernet MAC address=2E
> -* IPV4_ADDRESS -- 4 integers, in decimal form, separated by '=2E',
> -                  specifying an IP version 4 address as described
> -                  IETF RFC 791=2E
> -* IPV6_ADDRESS -- Up to 8 integers, in hexadecimal form, separated
> -                  by ':', specifying an IP version 6 address as
> -                  described in IETF RFC 4291=2E
> +* IPV4_ADDRESS -- An IP version 4 address as specified by IETF RFC 791,
> +                  optionally appended with a "/prefix" value representi=
ng the
> +                  prefix length of the host address's subnet, with "pre=
fix"
> +                  being a decimal integer in the range of 0 to 32=2E
> +* IPV6_ADDRESS -- An IP version 6 address or abbreviated "address/prefi=
x"
> +                  combination as specified by IETF RFC 4291 and RFC 595=
2=2E
>  =20
>   Additional TAGS may follow as a comma separated set of the following
>   tags enclosed in square brackets=2E



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.ab.ef107200974ed0ea.19ef448488a.4909cd64f98f75f8=---

