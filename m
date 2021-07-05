Return-Path: <SRS0=1i6W=L5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E2CC07E98
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 08:59:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82AE3613C9
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 08:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82AE3613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149945.277317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KS4-0005iV-N2; Mon, 05 Jul 2021 08:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149945.277317; Mon, 05 Jul 2021 08:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KS4-0005iO-K3; Mon, 05 Jul 2021 08:59:40 +0000
Received: by outflank-mailman (input) for mailman id 149945;
 Mon, 05 Jul 2021 08:59:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0KS3-0005iG-G9
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:59:39 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53bbcd84-dd6f-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 08:59:38 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx658xWKxT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 10:59:32 +0200 (CEST)
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
X-Inumbo-ID: 53bbcd84-dd6f-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625475572;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=bEbVxWBeCflnuHit0eKhOuE3HAcewAG2Gvvb7jVrBts=;
    b=R0O5u7TZDRNjMw3phGHsDcQnzgvaRtA8YNLWy5AIBGrGpwpibqk9ybcOPpmA0UGqFM
    4iGs9sVcW3r/6u/o2rXHIbToyrFRM53D62tWHHQ7lxDF6qja2RJVCw1SgxUU1GciSsBZ
    VDNXw+DpihHmUMTPYjk4zbuBrvFh3jUGsoAUOGY5sRwkosG1lkbNzS3dLhUZd9pvnBbt
    Cs7uyYlUWUHhBKru1LFvlSbcZM1v5mtLaNNTEbGNpnwneXBLZM1ir5eRpJwXmWzqk+BT
    Ybslxe6Va5z7pVkRAcJT06iSasSJ2SERM3Rva9w1k9mY3OByaPGmq9O+FJchMDkZBN4w
    MYwg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 10:59:17 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 12/40] tools: unify type checking for data
 pfns in migration stream
Message-ID: <20210705105917.132793c9.olaf@aepfle.de>
In-Reply-To: <9db50e05-233b-e279-307d-548fc23d0115@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-13-olaf@aepfle.de>
	<9db50e05-233b-e279-307d-548fc23d0115@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xqhvDPGS.iJwfKNB=6Q_0nZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xqhvDPGS.iJwfKNB=6Q_0nZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 2 Jul 2021 20:43:13 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Anyone adding a new page type is going to have to audit/edit each of
> these helpers.=C2=A0 I think it would be better to write all the true cas=
es
> explicitly.

You mean the check if a page has data or needs to be populated should look =
like sr_is_known_page_type, where each known variant is listed?

Olaf

--Sig_/xqhvDPGS.iJwfKNB=6Q_0nZ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDiyeUACgkQ86SN7mm1
DoCljg//arNFhP+kCrV1rOksDQaAaAwSF+UHNujyD7RyQCLQY154FOYrDAE1pcCe
NSq1KtGc6behnrxusAF1TrT2CXv52vC+1elQCjsIkx8ZifRHkZZSvV0hy/LpVEaG
j9+ql3A4oMvpPTljI8eXOdkR/8r4pc491w1yQy5QtwphBZdrJpnrdji/aVBmEzGP
0YwLDx9kawNzE1FbTguMx3+0raWeCfFAaopiSj/s7PN0+UO0dsHUYf5vOT5kkxto
hEtyEJKHzRkyNcO4DdnP+vkWgRBHbW1XcJLT0ByvrW6Jbanuru1RBquWqc6zP/3I
wNRZrEUCX68WcIU+FY/7xxtjF7jUaIDYYALEs89oKroi65rpyYgjNr66TkBMO4uJ
mC+lA/2v5H4D50Uo5w+NxUFHJscEiBNjq4BZn8nqNzi4NkkKVRI7po/zv80Z2Ahc
EheNFoYJNDpultmkSI08JScqfNahuMfrpZU7ppVcqzQXlm4b+bRakA/PJidZku2x
I22JSt+g+cfVVJcG2IW94zD+btqM5wEvHcoyYG58evh1oyFHRylbDXuZvHaSpeyf
A7DkaqLuVL1CHydXtA9QLRHPUGltJ8D352Aj22SA2Ez3qNeK1QZl8K/Y8qd+/uva
pzaJC9A1NDg5+uUhR2joYMeNLHa8WHuzzCqpm7YHhkJGB/d+v+w=
=EoB+
-----END PGP SIGNATURE-----

--Sig_/xqhvDPGS.iJwfKNB=6Q_0nZ--

