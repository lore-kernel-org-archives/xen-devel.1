Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4192FCD4F26
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 14:38:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342420.1602602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waaMF-0008TL-9w; Fri, 19 Jun 2026 14:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342420.1602602; Fri, 19 Jun 2026 14:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waaMF-0008TE-71; Fri, 19 Jun 2026 14:38:11 +0000
Received: by outflank-mailman (input) for mailman id 1342420;
 Fri, 19 Jun 2026 14:38:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1waaMD-0008T8-5k
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 14:38:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waaMC-002iCK-4b
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 16:38:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a355433-bab6-0a2a0a5309dd-0a2a45059480-46
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:38:08 +0200
Received: from [103.168.172.147] (helo=fout-a4-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a35544e-ef3d-0a2a45050019-67a8ac93c1b3-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:38:07 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 2C9C0EC02E9
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:38:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 19 Jun 2026 10:38:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:38:05 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1781879886; x=1781966286; bh=/i7pC19+3b
	FJ7A+kdm54Raod/rgl764jeNJRrJkGgPM=; b=U4OOhmGrNG8Wp01+Q7VaN4VQmc
	xCRQKp2KpwKpwJsrcs0olxKS63N7fKsW6x6CsBZSMm/FrPPQDnnsj3xkCQogAPbF
	CCVTAjviEi/hFLDQ9fhTZYBhda9a1YBgyJtgsjZloA4RChYn3FucHDuFVyDwUeEj
	vvDqLrDQWxCngqbjd+OWfNiIWAm3W1jqaGoSh51fT/UBcZKuXOag521SLL0a1laS
	QWkuClyOKL3sJsB4gPK13lI9xBxjhd/1fErlAvgn4+s1wWZl/1yNSzetgBccq2ct
	8TacVJ0iB1wbOJXPwLZEkvacs1tCs/jxeKUuJB3mTxBxAF4/jamYgz9zKzCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781879886; x=
	1781966286; bh=/i7pC19+3bFJ7A+kdm54Raod/rgl764jeNJRrJkGgPM=; b=K
	H7PGRrU+XZuMqK2M99xPMGCr1PziHmtnMWUkZKkog3Oquybi+M+mwB94SF/kUE5v
	4AvX1Zb/OpRZaEDP7DRqD4+DYMnk0cLXGPPpG7EpsW4ukOn/CTypyO8F9Vyj+IhZ
	hBSrr+88tgC+1RhhL5E99R/naKfNTKJoHcX4z2Nfd2O4kOJ9RN9jxUDt70XjaUkY
	0q6/Vhj5eVkcfm4o19n0LILCP0k5VVtp4wnnPM5+yhNs7ovkzCPmluZCZC33pVQT
	2Bxzeh0nKyjWuUXoecwIh/Qq471Q/ZXcq4YEPjVRt740khs2KfIgESK5QD9FaE+C
	NErCz0eA4DF16wGGexKoQ==
X-ME-Sender: <xms:TlQ1aqlqMP5sT4XMAqPGUHjwKgFiEYWiaYPKGYS8BoqiW8qg89ni5w>
    <xme:TlQ1aoxU3UKQkIYyeFvN4QUYonLogAyZpc32BR4rhqdFaCQ8dk1e5KS_YhIFma21i
    nyZHNhTOuAsWgFh4U3mB-ds8IfnOjEfM3sYvE5yrchKL3SATg>
X-ME-Received: <xmr:TlQ1auQyZScd1B6RpjYerQenelZ44Dl9NDr0nh45MHx9Upy06bm3kojaKLOaOCmenbtvHwWiZKxNgg5QrPxneGVy82vXsSzGPnI>
X-ME-Proxy-Cause: dmFkZTFqSJS1QHXLtvkFnIqYtqmC6ayo4SgVyj6HWHrAQVt7+PEj9C3md8NYRUL4z7jQRq
    5UNVn3cNgc7ladcq3lv/cSgCbK78E2FMtD6XOpuk43zfjMjPYcdC/oQpchGxrYe9HS1wbz
    SRRCZk36vCRXbmsRxZbKcP520D8Z1/JAETLPYlHva8L5lviGVcNotxhboVkarHKEkCCyBO
    kgsL0y5xNxxE5pDCzJv9QXd4gTjleTuk433H7Po3IYn28lbfNbnKuDWCixk3DqdWwBCM9w
    Hkz8bb06a1tzU0Tr3oyNCkHQQlaiqLdFL5IWFY/EUSzLeoecgtEN3N3dLl93lH2LzOY4KM
    84ivC45I3CMDZuCPrK9IdmUJtsiROIgQi2h5j/GLuaDlJiGTiovjGd8yerneCgKvFIHoGb
    yX5fyvri20hSJ73/2RJ9imLmz5WuWQ0xuYX8oeN8tXLTtke02C+ry/CJoSH57DHLwv/NPh
    c5HdQDH3UIlqkS+qzAFTymGX5VoU4+TtYsRvsK67tLcGUGpQCnVGVTdobiUjQ330sJpOsZ
    J3BttkHRR7XqjwG/udM8XD6bY3jOjq+689zkJGpCM1jEVD3tDx3Qm6331CpBrvqwGCmP+m
    rDWuuvZwTsKbYig22Vlku8M8rkTPzgt95+3S7I7tCjByM/Z2gYLQ5JBKimbQ
X-ME-Proxy: <xmx:TlQ1ajsEdbz7TqVohW-PtJvDL_T0-bjf-VCjzt1mth6GfO-kqxDdEw>
    <xmx:TlQ1aovEKBGf-rKC5Fu3ZRiMF5Gwwb9N8MlVwoOi4wmt37wySSS0pQ>
    <xmx:TlQ1ahx-v2oj_R7pRTC1jyiOldyaaS2qJfPWYINsLiSWGMKklOGsvA>
    <xmx:TlQ1amjjpBf2Xja9jKtZObl0pHJhZY7e9Lv6Dnf3jPbD6Pc-AGpr9A>
    <xmx:TlQ1ah85NHtevA14rO6cfyQjBCr4lqLEBOTaOolNFCdWKHcPxsLWTcdD>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 19 Jun 2026 16:38:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware
Message-ID: <ajVUS5F9G4Jse20i@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Vt1VMVM7T/i56yz"
Content-Disposition: inline
X-purgate-ID: tlsNG-c201ff/1781879888-9CFCA127-90C80F89/0/0
X-purgate-type: clean
X-purgate-size: 2681


--/Vt1VMVM7T/i56yz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 16:38:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware

Hi,

After updating Xen to 4.22-rc2 on a system with Heads firmware, dom0
doesn't start anymore. It worked fine with Xen 4.19.
The last messages on console are:

    [    1.495140] installing Xen timer for CPU 2
    [    1.496149] installing Xen timer for CPU 4
    [    1.496587] installing Xen timer for CPU 5
    [    1.496809] installing Xen timer for CPU 7
    [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. CPUID: 0x0002=
 APIC: 0x0028
    [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. Firmware: 0x0=
011 APIC: 0x0028
    [    1.497055] cpu 2 spinlock event irq 200
    [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. CPUID: 0x0004=
 APIC: 0x0000
    [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. Firmware: 0x0=
019 APIC: 0x0000
    [    1.497074] cpu 4 spinlock event irq 201
    [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. CPUID: 0x0005=
 APIC: 0x0002
    [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. Firmware: 0x0=
021 APIC: 0x0002
    [    1.497074] cpu 5 spinlock event irq 202
    [    0.008235] [Firmware Bug]: CPU   7: APIC I

Full console log (containing both successful boot of Xen 4.19, and then
reboot into 4.22):
https://openqa.qubes-os.org/tests/184780/logfile?filename=3Dserial0.txt

It doesn't reach loading graphics driver in dom0, so I don't have
anything interesting on VGA (the last output is about the kexec call
done by Heads). But at least I have a serial console.

This happens both on older Thinkpad t430 (Ivy Bridge), and newer Novacustom=
 V54 (ADL).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/Vt1VMVM7T/i56yz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmo1VEsACgkQ24/THMrX
1yw2xAf+Lz4uCwl+0iYr6Iw5VV0wWWIWGhsQVAEf0WuraFM9i4C+qjgs5TTMdDgT
jBHBmobjHqR/k7m1TuqZzUmtvJ5NuAMwQ19ECG69wqjkPOWAkX/JKDPJxD8TNJHJ
Ey7ItE2a1idckrhiXUjJTKnhn7DYbCLuFwHVv/3qKZy9cuUmSVRfn/Xk3MAJdbu6
4Qq5TLaBxJbuzoSRyAF5n0GMQJ4MFugNctmhz42jT8wVn9slAeVtRx3yKPlea7ZI
aU7P59bncb5c0ydME9MNluHf9FEJTd9eesuXMyqgdr+RQd5JJ+y614dxt4AIhII2
tZVSkqiZWVdKWYx3l2neVJzKA5khSQ==
=Snqt
-----END PGP SIGNATURE-----

--/Vt1VMVM7T/i56yz--

