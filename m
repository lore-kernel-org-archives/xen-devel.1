Return-Path: <SRS0=1i6W=L5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1872AC07E99
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 19:07:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDE96613B1
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 19:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDE96613B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.150622.278471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tvj-00019x-3I; Mon, 05 Jul 2021 19:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150622.278471; Mon, 05 Jul 2021 19:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tvj-00019q-05; Mon, 05 Jul 2021 19:06:55 +0000
Received: by outflank-mailman (input) for mailman id 150622;
 Mon, 05 Jul 2021 19:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0Tvh-00019k-Gs
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:06:53 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.220])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 953bef00-21d0-4b05-aed6-1de50551859f;
 Mon, 05 Jul 2021 19:06:52 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65J6iNcl
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 21:06:44 +0200 (CEST)
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
X-Inumbo-ID: 953bef00-21d0-4b05-aed6-1de50551859f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625512004;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=3V0s+CgM00lZP6hSmgj1I+NGcCO1PIACnD28fTuMRE8=;
    b=MNq0b71+s15MBXSJV63QX6GhsHQD0E321pEuOmV4NR1iQMei9OlkSVUhdEZ5xUn/3C
    PlUHCCut/TL7KWchEmERWDJWlP9aO27TwpUALIclOw//WLqxgIwawOLrsK20RH2E5fgJ
    wSqc7YB6FgIssMCMgeBnsFi4JIOkrmUIGcO7FPZMMLSCN3rvGOCk5F5qeQb0MFUC4T5Q
    ZZC2PakUpf6ONwWzewSs6oYz6FqaO1Xb76A2pWhqzf9wUutajHkw+S8IQdcOwlPlps0L
    xtC0rj6bZIpUrcRQNFLP4oTExTeiuqMKc2zOBU5OC41CdbJC6jf/lz2Vr79M5OXiM+48
    hpAg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 21:06:37 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 12/40] tools: unify type checking for data
 pfns in migration stream
Message-ID: <20210705210637.1948b8da.olaf@aepfle.de>
In-Reply-To: <cafc7026-102d-f569-78a2-9a960e05d8f3@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-13-olaf@aepfle.de>
	<e5f00724-61fe-fed3-35c4-35df837a49c2@citrix.com>
	<20210705135350.GA31821@aepfle.de>
	<cafc7026-102d-f569-78a2-9a960e05d8f3@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/peiMtHwhJ_sW4AKXCzshXnL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/peiMtHwhJ_sW4AKXCzshXnL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 19:54:21 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> But it is...

It was not handled in an earlier variant of the patch. Meanwhile the origin=
al behavior is restored with the current variant.

Olaf

--Sig_/peiMtHwhJ_sW4AKXCzshXnL
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDjWD0ACgkQ86SN7mm1
DoC/Dw//RL3tIKKLnsVp38r2L/f2iAGmv5N1CcQ6l8EQpXT3cCW3+idbcQ36lN8i
V7svUPTtD3HV1TMA8r6VrrIij0xVsGY08VwGL/DFETdi9T1SXwpi2DIOsrM0QNoi
bT8nWLQy+P4koJqItk7e5O1G7k7hatpS8Nzt4uTvRbBVmGlQs5J0uOzG1XgJwqTB
icjMPL+cy3TdbgQHCUBcwzgGqu1Fok/4N9vA5SG98H6TyVnKI1Z77gYZruMTCml2
WIS55ni+Cb9znLg658x8WihS1WgQy9nPHoarAGuga40l85od/G9riV+99Hp8NrqE
PX0Aw1ueWqV5aCoCjrT0mgrm+ebh0h4AxHH8EACjYoVvD8BFzfGsxuoOW3up+ffU
kfhIAqrolw0GzvQwEfpujLDQNOy6SkoMSe72zIukKBfxMvUE6Y0BL+JVgSYth+mF
vI0KoVz80getZqTEGlgJAOdCpZYAvpakrTqLzmPdZj6XBzSKAUUjlCoT0FyE9HTI
CsEOnyKDEIoi/0fjLCzujtx8df48gHqWMSjYyIy1AKxeJplBSIejzLN9OVVN+ySM
pz5QqzOyYnuUnNsAv/REsrh6BplG8T80GmNcregQMwtjBfVYfvex7fLqhYGD5DLh
g8bYVyRl3YVmqkKnc7Y6AKB6+O/2Ncy7NpYr497iou83DFmvUFU=
=V++G
-----END PGP SIGNATURE-----

--Sig_/peiMtHwhJ_sW4AKXCzshXnL--

