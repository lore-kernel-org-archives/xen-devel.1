Return-Path: <SRS0=ETG8=4R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAE8C3F2D2
	for <xen-devel@archiver.kernel.org>; Sat, 29 Feb 2020 02:15:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6968F246A8
	for <xen-devel@archiver.kernel.org>; Sat, 29 Feb 2020 02:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6968F246A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7reG-0001nb-Jd; Sat, 29 Feb 2020 02:14:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1jX4=4R=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j7reF-0001nW-5t
 for xen-devel@lists.xenproject.org; Sat, 29 Feb 2020 02:14:35 +0000
X-Inumbo-ID: 3932fb2c-5a99-11ea-9ac7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3932fb2c-5a99-11ea-9ac7-12813bfff9fa;
 Sat, 29 Feb 2020 02:14:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E98B9AD26;
 Sat, 29 Feb 2020 02:14:31 +0000 (UTC)
Message-ID: <f0cb003a84d70062f383ad920ec6b322d51570d3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 29 Feb 2020 03:14:30 +0100
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: [Xen-devel] CfP for RT-Cloud (Academic) Research Conference
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: embedded-pv-devel <embedded-pv-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3963845174476680745=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3963845174476680745==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xgDq6o7Qvd7G9yGusbXs"


--=-xgDq6o7Qvd7G9yGusbXs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Please, find here The CfP for the first edition of the RT-Cloud
workshop:

  https://www.ecrts.org/rt-cloud-2020/

It's an academic research event, affiliated with one of the most
important academic conferences on real-time systems and real-time
scheduling (ECRTS, https://www.ecrts.org/).

Here they are the first paragraphs of the CfP:

"While most of the current cloud services operate on a best effort
basis and provide no timing guarantees, there is a growing interest in
cloud applications for industrial and critical applications. However,
for cloud technologies to be fully embraced by industry, a higher
degree of determinism is desired. This calls for new techniques and
methodologies to design predictable and reliable cloud applications."

Deadline for writing and submitting a 4 to 6 pages academic research
style paper is on April 16, 2020. This being a workshop, it's would be
generally ok for the paper to be about ideas, proposals and/or
unfinished work.

If interested, but in need of more information, don't hesitate to ask
me.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-xgDq6o7Qvd7G9yGusbXs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5ZyQYACgkQFkJ4iaW4
c+6ZxRAArNuHwf8TcYDsA216EhFoSR4V+3EQeVAm8eAHHmZb7LsB4oCJ33NChfQH
ES7f2HEhF8Xy7l6TaohCT599PKRUm0dInJ2cninpryNgBlADgyQ9ywsg9q8fMW5Z
a1b0pIdiYMHBJtyUKfRTP85GNYXi4oEwZfNMpQ1D6VLP1s+1TvyJMEkALQq7YWJK
MHZwjbsQxAJQg/IonKOY5mfH/6irsHsvL2jtRiX2X9l1IxDpaeKHMKjtUmdGylur
xSbhEiDCOpuI3CouTONVe/u5yGvgewB657ZCbrrh8Cx4UOHetD7uCWuDr+MJpE1k
GhXJEfW0tuTOL7CcOvz3/l82bQmrzeAKpkDfyMNm8UMSOVNnkhSgM4RU6cGA+RKi
1UpRa/m57xb7si/9dkMA1Xn4nLfBkjGHjgTXdIMFKGwDhP7kffzctjc2CUQpaIOo
KtHZFfEBjcNjUGJW7diiYQSvrQdEGXRyQZpYxQ+Cq5veQGYUI0ThoR/XNsO4FJjm
8iSD+ld3uL3YPx26gKEaNeOlA6iIAGnisrZz1UTLV4yQt0fxHhrrprzK9ytFc6Qg
l7qC+6w6SP4YtHGMD0fJ7LQP0gWMwmNMhrCkdMJt5AeKUrOibs2e2yDsmtQG35Sw
OWkrfsd0KljaXO3J1Fszud9XrOCD3ZZERrlyq8pVr9IULYijwyg=
=U9bD
-----END PGP SIGNATURE-----

--=-xgDq6o7Qvd7G9yGusbXs--



--===============3963845174476680745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3963845174476680745==--


