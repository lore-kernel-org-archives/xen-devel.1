Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA334C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 17:57:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382534.1625881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJO3-00073v-B9; Tue, 04 Aug 2026 17:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382534.1625881; Tue, 04 Aug 2026 17:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJO3-00073o-6h; Tue, 04 Aug 2026 17:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1382534;
 Tue, 04 Aug 2026 17:57:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrJO1-00073i-4w
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:57:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrJNz-004aPi-VW
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:57:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a7227ec-bab6-0a2a0a5309dd-0a2a4504d772-4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:57:07 +0200
Received: from [202.12.124.147] (helo=fout-b4-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a7227f2-b57f-0a2a45040019-ca0c7c93a625-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:57:07 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 9BDE81D000D1;
 Tue,  4 Aug 2026 13:57:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 04 Aug 2026 13:57:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 13:57:03 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785866225;
	 x=1785952625; bh=ilvpJNpKGxrxV5kM33ClZ1xTMRTeR1+MX3jPiDtUlC4=; b=
	K2METpv0Gv2Wyb7EmMIj1hF9Orky8caRFzOdiQDv23RBX9ItDXQ9Tg/YiBe0G8C/
	36eJQVyFR/8TkLqn2O+Z08O2dCN2wuRPdwi+DzfaUx1E8YgCWAW81FiMqX68F8gE
	Y5tz0uGe69B26aitB+8ZkC+t0H3YJA1atBI35XJi1TkEasNn60oOVr3RpRw5yBmX
	FpLjua26wZ8qWIXFYNEnJx2i/NsS99idxEOEeIp5Dx1qJRWIanffRroegbXaqJ3b
	5lBzDDH08i7ztpti1/nJ8YGwMh+a8npCEGjW6X+Ggf4VtrBJY+0l1ohtytG94mIb
	YNoHhF59DJvqLRCdb8VXZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785866225; x=1785952625; bh=ilvpJNpKGxrxV5kM33ClZ1xTMRTeR1+MX3j
	PiDtUlC4=; b=TfFt0xlY436n2kfkobk2xkIQ+/ScVkVZ+KlgO+jTCDv9zG4ARCt
	lruEPNOXon0fRui7dwg5FCJO0yfsPOmahqGlTQ6p/NrWtJLZSk0ZieNb3fENt5t9
	q1URJoOM1dDefmIN8A93F/pTWz1cgEKuFG7XKNiGTtygJvZyCyuncxl5qjFzkpir
	NOLGSJHG42vgX3mTPX9K8TBBgb9wOHhFLswaiIzZ7PVxZnk3DmCLcM3Vd8RSgydx
	glBUn7xX1EA9onJZXDgg+eS6+VfjOsTtnqn+CC/GDWPgOAo719C0nsgQvBbViJpy
	9PHUFlw5nbgGDqsudlIOfYsg3XLaw/8JI8A==
X-ME-Sender: <xms:8SdyaiJIuIo12wWYh6T8GLaWeJN_d4nH9r8IoZKGNdf6u-ImOgmupg>
    <xme:8SdyasZGa5s7k0Pn0p7dMkR-IGHmhA5zzhndG30EkLJWmjqVfXG4tyAvHXl7z-0Hn
    lyqY7HOTmcF4xgWm2yVLg_uNG1aswVxg7xvZb9rBe8Cl5dIplQ>
X-ME-Received: <xmr:8Sdyak_iDmyWR1EIaMQ1M2KRCkzJI1YijUnS63bvtI_25olxcTy44LlHMBkkPStQsqoKvFXlte2L3aFtRhMRMAXMeAQdXKYBXOs>
X-ME-Proxy-Cause: dmFkZTFTQJJq3HwzaBpsrRj+7R0dJX3Gux2GZu8uRmZucoiC10YCI5CaParej3yLyYTTgY
    3YqGdhJwj/V9t8LBWfFJaL6Q3bnm2sWD2nhCeJrWc0ZgocG2yOIt+62/ob58ziD3n6Y7dw
    yH1RupsKh6+yiK003ybzwftZ57tUkSEOZb/6+EsypgeVm1hwwfuP5WTKqL5DW4Z3KzjR4s
    /eGguNpw2ptQB1cGoRddE58w52TCn3p45tGJ9+ggZAikcIjODG0v1gaftQ8FpmVbfIoHlf
    Ux8KD113N3T87GdnjJaD4dpZR2aKHcRwDhC6CQfdWCR8RoYZiIpw+3E1Zw1A57TjSyjvSL
    AWYnQX95ns26OkobKtA5FWQO3XL0bdp4snaILbKRIEKSBI4qL+VsboOnU7QCgLYDkmIAcx
    XS0LAzRezC7thvNf5dlY4StuTOAStjo2deVlIEpbojfOUsmMhj1Efzsiqx2lsCqWnTisuo
    gBCfBW0WlC0o4+Era0pj66QfvoHsjRqAT/B91CWgIrqoyWAub6xNfkJABnhF1GqNeY6DQa
    q46ktbNR3bTZD5R8WXUuECCAIbrSOwVGpwtZBeeld3n1v3rCjnFvnYE67Yxgm+g4SmBRQN
    EgvDQ3cE7wwk/tGrbrNdzJrWDsAwf0iq0o3tUeuMMxJ47Nxs2c6dN6tzWo+A
X-ME-Proxy: <xmx:8SdyatbDLBPXPzyps6VA9IhCkl-MPq8_-v-YjlIpKjTbKwBInDgh4w>
    <xmx:8SdyaoN6_sb4qb8Ro1sR5OWsl-fFGn61_YQOhNCp8fc7lZeyhkb4Ww>
    <xmx:8SdyapA7fTni9-16UOWxyJ0-fpi0Xia-fXM6p_3v9x8XxVTPm7UnNQ>
    <xmx:8SdyavIXcDojc5TPRSvyRylZY6bGBLmLnLCU8Pws9_QvkWgqTeA1rA>
    <xmx:8SdyajRc_ubrMjvb-W2fjDsEyFM-C-OpW6sFI3zfO-8K_ULQQVzzwlb8>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 4 Aug 2026 19:57:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of
 qemu-alpine-x86_64
Message-ID: <anIn7VAt2oQJ90Js@mail-itl>
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-3-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TDtZEqwh2qedq+2U"
Content-Disposition: inline
In-Reply-To: <20260804174219.835096-3-frediano.ziglio@citrix.com>
X-purgate-ID: tlsNG-ebf023/1785866227-C12DCB50-B438CBB6/0/0
X-purgate-type: clean
X-purgate-size: 4831

--TDtZEqwh2qedq+2U
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 4 Aug 2026 19:57:01 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of
 qemu-alpine-x86_64

On Tue, Aug 04, 2026 at 06:42:18PM +0100, Frediano Ziglio wrote:
> Make sure that save/restore continue to work.
> The check save and restore twice to check for corrupted status.
> Also a command is launched in the guest to make sure that the
> machine is not crashed but working.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> ---
>  automation/scripts/console.exp           |  8 +++++
>  automation/scripts/qemu-alpine-x86_64.sh | 40 ++++++++++++++++++++++--
>  2 files changed, 46 insertions(+), 2 deletions(-)
>=20
> diff --git a/automation/scripts/console.exp b/automation/scripts/console.=
exp
> index e27886bbef..ff58ed29b8 100755
> --- a/automation/scripts/console.exp
> +++ b/automation/scripts/console.exp
> @@ -58,6 +58,14 @@ if {[info exists env(WAKEUP_CMD)]} {
>      system "$env(WAKEUP_CMD)"
>  }
> =20
> +if {[info exists env(EXPECT_TEXTS)]} {
> +    set lines [split "$env(EXPECT_TEXTS)" "\n"]
> +    foreach {exp snd} $lines {
> +        expect -re "$exp"
> +        send "$snd\n"
> +    }
> +}
> +
>  if {[info exists env(LOG_MSG)]} {
>      expect {
>          -notransfer -re "$env(PASSED)" {
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/script=
s/qemu-alpine-x86_64.sh
> index 60f5cc49fc..409a601c34 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -48,6 +48,28 @@ xl -vvv create -c /root/domU.cfg
> =20
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> +
> +# Script to test save and restore.
> +# It saves and restores domU domain twice to check if the domain was cor=
rupted
> +# during the first sequence.
> +# At the end open the console to check if the domain is working.
> +cat > root/save_restore_test << "EOF"
> +#!/bin/sh
> +set -ex
> +xl list | grep -q domU
> +rm -f save.dat
> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat /root/=
domU.cfg
> +xl restore /root/domU.cfg save.dat
> +xl list | grep -q domU
> +rm -f save.dat
> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat /root/=
domU.cfg
> +xl restore /root/domU.cfg save.dat
> +xl list | grep -q domU
> +rm -f save.dat
> +xl console "$(xl list | awk '$1=3D=3D"domU" { print $2 }')"
> +EOF
> +chmod +x root/save_restore_test
> +
>  find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
>  cd ../..
> =20
> @@ -70,9 +92,23 @@ export TEST_CMD=3D"qemu-system-x86_64 \
>      -device virtio-net-pci,netdev=3Dn0 \
>      -netdev user,id=3Dn0,tftp=3Dbinaries,bootfile=3D/pxelinux.0"
> =20
> +# Sequence of expect/send strings:
> +# 1. wait domain start and close console;
> +# 2. wait login prompt and login as root
> +# 3. wait login and launch save/restore test;
> +# 4. wait restore from domain console and send a command.

Why doing this interactively over serial, instead of adding to
etc/local.d/xen.start and then printing test result at the end?

> +gs=3D$'\x1d'
> +export EXPECT_TEXTS=3D"BusyBox
> +$gs $gs
> +login:
> +root
> +login on
> +/root/save_restore_test
> +Restarting tasks
> +dmesg | grep suspending | tr o 0"
> +
>  export TEST_LOG=3D"smoke.serial"
>  export BOOT_MSG=3D"Latest ChangeSet: "
> -export LOG_MSG=3D"Domain-0"
> -export PASSED=3D"BusyBox"
> +export PASSED=3D"suspending xenst0re"
> =20
>  ./automation/scripts/console.exp |& sed 's/\r\+$//'
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TDtZEqwh2qedq+2U
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpyJ+0ACgkQ24/THMrX
1yy04Qf/fuaUVKZY9577YfoGDDwlo7DXrIjWgmukGdGCrtup38i8D6Mu4m0ME0s3
vTO/fPgEzFhH1D3Jeusu8CUA4XBoC3jcQl+4Sq6h9/ESP0qPS95o/jbQVnLA5wt7
qOSgHiaHxBgtkv7w6qFNqEANHuUk0L+8ARi6Yqr2ILhEwyK9Qu7bo+rCpkwVdgmp
mFxyJknlRbmZVumbdEzKHk+C8GDrkZ4SvnQ50U5/xAhIkxu6PJ6uDg4Tv+oDB9tq
0ofwAFVf7NiNqkal8KfkdeiMUNGWD3eiB4kebncPueNSKVh/3GQjERb+XPIInCfF
yMH/UVS0dsAPyFbl2JQrO/JKkzOzkQ==
=qhiS
-----END PGP SIGNATURE-----

--TDtZEqwh2qedq+2U--

