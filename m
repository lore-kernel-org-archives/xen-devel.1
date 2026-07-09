Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B2C43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 13:39:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358191.1612435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whoxj-0003lf-8p; Thu, 09 Jul 2026 13:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358191.1612435; Thu, 09 Jul 2026 13:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whoxj-0003lY-6F; Thu, 09 Jul 2026 13:38:47 +0000
Received: by outflank-mailman (input) for mailman id 1358191;
 Thu, 09 Jul 2026 13:38:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f471a22b0000edb5@swg.vates.tech>)
 id 1whoxh-0003lS-Mb
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:38:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whoxg-003lO7-18
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:38:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f471a22b0000edb5@swg.vates.tech>)
 id 6a4fa462-e002-0a2a0a5209dd-0a2a4502cbc2-10
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:38:44 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f471a22b0000edb5@swg.vates.tech>)
 id 6a4fa463-64c6-0a2a45020019-b9ff1c23979b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:38:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f471a22b0000edb5.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jul 2026 13:38:42 +0000
Received: from xps13 (lfbn-lyo-1-392-219.w2-7.abo.wanadoo.fr [2.7.22.219])
 (Authenticated sender: guillaume.thouvenin)
 by mail2.vates.fr (Postfix) with ESMTPSA id E235F81FA9;
 Thu,  9 Jul 2026 15:38:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=emI/7sIwRHwJxEO9JDhWmv1nUA8d/7RiIe/jz0K5Fe4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Ed5/k0bXomMWa+QZi0lkus0GHfg4IN2eGyptMPTCMUhGs0lqVPus7QnbuP9sKvXUzrBv5Jhus
 U+idW82Uo6jHMFcakF1qobGeJMOWvCkgRExRSSdC14Aj3AllFPZGJOFw1eR48txsV0unpu0gV90
 tEdwRkjsSxKV2Rj7tiVoMvNGE/14Q99wuqRHcgSrhp5uh6Jg16YhvKTjc8pZZQFE11O9ADLB9ru
 cTvXSx5eMAaluMAUP42GeyseanjK8/YZgSm0DoHyY5yVAYlYSuvpVmxOywzsEZ9dWwsEtU9B1Nk
 KTmxpj2Uf0z9fKIbfrC8BcTVlWOPvV9OSi26/IDvor/g==
X-Zone-Loop: 1934d72960d2b6fa1705a4e7d9a341c90e1603e5f7f9
x-campaign-type: default
x-transaction-id: 43273463-acf2-4f28-973d-6a0db09f1c42
x-swg-uid: 01-64f67ac1-f17c-4c5b-9983-59d05ea84270
X-Mailer: Sweego
Message-ID:
 <1783604323.8631fc262581453bbf619ec5b2062170.19f471a22b0000edb5@vates.tech>
x-swg-bid: 1783604323.8631fc262581453bbf619ec5b2062170.19f471a22b0000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 9 Jul 2026 15:38:40 +0200
From: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
To: Andrii Sultanov <andriy.sultanov@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v1] tools/ocaml: xenbus - Fix handling of requests with
 len = 0 for socket connections
References: <b4e53497b6597ba9d9712058c97436d1445cce79.1783594799.git.andriy.sultanov@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4e53497b6597ba9d9712058c97436d1445cce79.1783594799.git.andriy.sultanov@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.52b.4a74cb983be72e3a.19f471a1ef5.d52f07e356c85ff=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783604322042
X-purgate-ID: tlsNG-720697/1783604323-3ED42A87-AE5FAE4F/0/0
X-purgate-type: clean
X-purgate-size: 3080

---=Part.52b.4a74cb983be72e3a.19f471a1ef5.d52f07e356c85ff=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 12:00:09PM +0000, Andrii Sultanov wrote:
> Following the report at https://lore=2Ekernel=2Eorg/xen-devel/CAFLBxZaeT=
McF4tcV45MJdCVx4A6qbzQdjKei_Quh_iLrtARVFA@mail=2Egmail=2Ecom/
>=20
> Without this fix, the backend would be stuck waiting on the zero-sized
> body until the next request comes in=2E
>=20
> Instead return the request immediately after reading the header, there's
> no need to wait for another call to =2Ehas_more_input and =2Einput
>=20
> Reported-by: George Dunlap <dunlapg@umich=2Eedu>
> Signed-off-by: Andrii Sultanov <andriy=2Esultanov@vates=2Etech>
> ---
>  tools/ocaml/libs/xb/xb=2Eml | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/ocaml/libs/xb/xb=2Eml b/tools/ocaml/libs/xb/xb=2Eml
> index 3e3ef2b29d=2E=2E12ddb05c6d 100644
> --- a/tools/ocaml/libs/xb/xb=2Eml
> +++ b/tools/ocaml/libs/xb/xb=2Eml
> @@ -249,6 +249,11 @@ let can_input con =3D Queue=2Ecan_push con=2Epkt_ou=
t CommandReply
> =20
>  (* NB: can throw Reconnect *)
>  let input con =3D
> +  let reset_and_return partial_pkt =3D
> +    let pkt =3D Packet=2Eof_partialpkt partial_pkt in
> +    con=2Epartial_in <- init_partial_in ();
> +    Some pkt
> +  in
>    if not (can_input con) then None
>    else
>      let to_read =3D to_read con in
> @@ -264,17 +269,25 @@ let input con =3D
>          if sz > 0 then
>            Partial=2Eappend partial_pkt (Bytes=2Eto_string b) sz;
>          if Partial=2Eto_complete partial_pkt =3D 0 then (
> -          let pkt =3D Packet=2Eof_partialpkt partial_pkt in
> -          con=2Epartial_in <- init_partial_in ();
> -          Some pkt
> +          reset_and_return partial_pkt
>          ) else None
>        | NoHdr (i, buf)      ->
>          (* we complete the partial header *)
>          if sz > 0 then
>            Bytes=2Eblit b 0 buf (Partial=2Eheader_size () - i) sz;
> -        con=2Epartial_in <- if sz =3D i then
> -            HaveHdr (Partial=2Eof_string (Bytes=2Eto_string buf)) else =
NoHdr (i - sz, buf);
> -        None
> +        if sz =3D i then
> +          let partial_pkt =3D Partial=2Eof_string (Bytes=2Eto_string bu=
f) in
> +          (* If there is no body, we can return the full request immedi=
ately *)
> +          if Partial=2Eto_complete partial_pkt =3D 0 then
> +            reset_and_return partial_pkt
> +          else (
> +            con=2Epartial_in <- HaveHdr partial_pkt;
> +            None
> +          )
> +        else (
> +          con=2Epartial_in <- NoHdr (i - sz, buf);
> +          None
> +        )
>      )
> =20
>  let classify t =3D
> --=20
> 2=2E54=2E0
>=20

Reviewed-by: Guillaume Thouvenin <guillaume=2Ethouvenin@vates=2Etech>


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.52b.4a74cb983be72e3a.19f471a1ef5.d52f07e356c85ff=---

