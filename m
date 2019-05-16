Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC689C04AB4
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 09:08:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33CE20848
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 09:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33CE20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRCMZ-0005bn-TA; Thu, 16 May 2019 09:07:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRCMX-0005bi-Po
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:07:41 +0000
X-Inumbo-ID: 0decfe80-77ba-11e9-b0bb-8f271afb4eda
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0decfe80-77ba-11e9-b0bb-8f271afb4eda;
 Thu, 16 May 2019 09:07:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC91BAD3A;
 Thu, 16 May 2019 09:07:38 +0000 (UTC)
Date: Thu, 16 May 2019 11:07:35 +0200
From: Olaf Hering <ohering@suse.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516110735.67e19d15.ohering@suse.com>
In-Reply-To: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0358537116439737730=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516090735.wt17jg4fwYrRZGiUaUYGO5y2HDoqSFoD6EGBVXTg1Ig@z>

--===============0358537116439737730==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/svK8nDfw7hPuqO=Wo+I7R/s"; protocol="application/pgp-signature"

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:09:38 +0200
schrieb Juergen Gross <jgross@suse.com>:

> The patch "libxl: add helper function to set device_model_version"
> breaks creating any domain for me.

The issue is, create_domain will eventually call freemem.
If autoballoon is set, due to dom0_mem=3D for example, all is fine.
If memory has to be freed, libxl_domain_need_memory will get an
incomplete b_info. Somehow the new libxl__domain_set_device_model
must be called for the d_config returned by parse_config_data.

How should this be fixed?

Olaf

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0oVwAKCRBdQqD6ppg2
fu7vAJ4joy7FXfTYhBXpMb+Td4tBzvCCWwCbBGcNpyzsibwKTuMvr6AnmVvmvfY=
=qbnA
-----END PGP SIGNATURE-----

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s--


--===============0358537116439737730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0358537116439737730==--

