Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4970C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:07:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56982084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="gJ50rvyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56982084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDtGz-0004er-0x; Tue, 09 Apr 2019 16:06:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iKuQ=SL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hDtGx-0004em-Ql
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:06:56 +0000
X-Inumbo-ID: 7d556040-5ae1-11e9-92d7-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::3])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d556040-5ae1-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1554826012;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=NtIUSYuC84zFxWuojukTSdBSq7gQmy5Jm/w/ZMIOmM0=;
 b=gJ50rvyxdXf3O9N7J9LJTaOZzLfEGWVs3hSx+MIm7p+UEcQWnrfLvw33MkHjitt+VT
 4BfBfXwWl0UF77zbPSzRTF4eRnqkez+hcQkfCGW/MJlS8rNtTu6t1Vgvhxh825wN1UOR
 bWsvSL+J8L50/cfCqnLFygN9JvOQkT00hmhKby2RWK12H4IkPRH8hCzg+ZSiDV23Y7rd
 VMbdkJfpxmcEz3brXd7TaktvNArtAeCtZaWCci2c0wT62tBLGToQIpKVMVsa8amtPJVl
 oNFSlnoRl7m6xtscSp/3c4A8XrV/gJqPaPlBoJ1mP+2uCDVSqlGWFNuFX3yTb5YC2MyB
 t4WA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznKRsvz7yq3NXPy6+NT"
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v39G6j2Re
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 9 Apr 2019 18:06:45 +0200 (CEST)
Date: Tue, 9 Apr 2019 18:06:42 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190409160642.GA18345@aepfle.de>
References: <20190104165755.73674a27.olaf@aepfle.de>
 <20190104174831.271161e5.olaf@aepfle.de>
 <20190107110737.1ef0a0ef.olaf@aepfle.de>
MIME-Version: 1.0
In-Reply-To: <20190107110737.1ef0a0ef.olaf@aepfle.de>
User-Agent: Mutt/1.11.4 (20190403T140714.74226f36)
Subject: Re: [Xen-devel] status of non-live migration of HVM with libvirt
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
Content-Type: multipart/mixed; boundary="===============4579897145740428844=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409160642.CQMKonZ3QAgjbogGYPq8AWVLcvqHcVPh3VGg2xpU4nE@z>


--===============4579897145740428844==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Anthony,

looks like this fix missed qemu-4.0.

What is your opinion on this fix? I think there was zero reply...

Olaf

On Mon, Jan 07, Olaf Hering wrote:

> Am Fri, 4 Jan 2019 17:48:31 +0100
> schrieb Olaf Hering <olaf@aepfle.de>:
>=20
> > Am Fri, 4 Jan 2019 16:57:55 +0100
> > schrieb Olaf Hering <olaf@aepfle.de>:
> >=20
> > > worth keeping (and fixing) the concept of an "offline migration" =20
> >=20
> > And regarding the fix, it looks like qmp_xen_save_devices_state does no=
t need the concept of "live". Just shutdown the blockdevices and be done wi=
th it?
>=20
> Anthony, it looks like 5d6c599fe1 ("migration, xen: Fix block image lock =
issue on live migration") went too far. Why does stopping the disks at the =
very end of the save/migrate process depend on "live"? During a migration t=
he disks have to be released either way. During "xl save" the domU may cont=
inue to run, if '-c' was specified.=20
>=20
> It seems the 'live' parameter for xen-save-devices-state is not needed.
>=20
> Olaf


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXKzDDgAKCRBdQqD6ppg2
fqy3AJ42berK3PGBfgU75eiLm2AzTDTnUQCgqZ3uT+4FFs0riZUS4tSDVrIxX0Q=
=gqiC
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============4579897145740428844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4579897145740428844==--

