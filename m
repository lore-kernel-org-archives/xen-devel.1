Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BC3C55ABA
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 19:17:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382596.1625947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKdx-0004mb-6o; Tue, 04 Aug 2026 19:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382596.1625947; Tue, 04 Aug 2026 19:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKdx-0004mU-3V; Tue, 04 Aug 2026 19:17:41 +0000
Received: by outflank-mailman (input) for mailman id 1382596;
 Tue, 04 Aug 2026 19:17:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrKdw-0004mO-5i
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:17:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrKdu-001ZEk-MB
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 21:17:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a723ac1-5cb7-0a2a0a5109dd-0a2a450991aa-20
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:17:38 +0200
Received: from [103.168.172.155] (helo=fhigh-a4-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a723ad0-be1a-0a2a45090019-67a8ac9ba8af-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:17:37 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 99B98140003C;
 Tue,  4 Aug 2026 15:17:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Tue, 04 Aug 2026 15:17:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 15:17:34 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785871056;
	 x=1785957456; bh=M/edlRurpgP0Tl8VkZ8RyPV4qAksso5dpsJdKhGE39U=; b=
	FNN5lzzVzAPEd9kn2HyNaBsujZACMLlDtYxTDQiT0dzZ8awGOz8Rk7+2MIIVbVEj
	Etc0OeMQ21jn8WhCtRBFal3nXbh2ok8LQkCTQjeoQkTpAmPoZf7zuiqsaZV8D4Vi
	/SJy1YqnReOGJIyOR8beaWutZXKI59F4ScfRlzxLytwSz1YiZM+uH4a8n92+krcc
	k0Gzfnk5a64AnGNLW58sbFTLe7QLqJzigZ1jjVtqCiGuhzndludlJ1IBLqZH6OoV
	ruh6zP6f4gRgoU1yntQuNZaq10Qw75UY+ggGIxO8Y89PEZg6IfMlzyXTWQay8hZ+
	5/Ou2AAEHbG1CBoK4eIcSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785871056; x=1785957456; bh=M/edlRurpgP0Tl8VkZ8RyPV4qAksso5dpsJ
	dKhGE39U=; b=CTZnioEQ64TFHLcoTa9PVnPoon2QEtDWKqEoTeWDFnDilw8n9fV
	iCCcjaV0D2460aHgi7F8R7P+J6u0zl1NmVGdE10cOswB2Nq7mEsBUKRQjygPwxJL
	Ouo8ak7zvpn/Gqfzchn7oZ/xR9kaqoaUB/JF5lV2+QW5Ltq1iGL/0BGzGMi0QSor
	21EM4zsMwVMxBsMHcQo5cNvZ8kyD+WNOYz90WomAXCnCqfFChL1rQFPmlLFsG4k7
	lsHZLPHAdidjN6v1ysyAFFg0L5QkE1j2EIY9VrYNjA316kuhkAq7JRnGaZCVjqv/
	V64gQhGk8FUM19elq863BhTT7Q+zmEd6UOg==
X-ME-Sender: <xms:0DpyajpA6GbvvawxZLEPAZSOwr55fFGdFwswEy_H4zNiKL2lJ0XQcg>
    <xme:0DpyarNQU-dQNMnkie_eXViWmYLbM2uQiJo8RpBPnUm-1HkDg_pYo78LvqhCbgVB_
    6fYdhor20jpMZD6Ii-mF3Ys9ZmYXaYDgQoTtn0dKXPOrXYfdtk>
X-ME-Received: <xmr:0DpyamqcrYay4ffLWgTMIp2yZX71RkLMExIerdCqhWG90sgzhzprCJS6iXt-qdptjGjEihn9E3_66wUIXcXq7ODaw7uG--wnjTc>
X-ME-Proxy-Cause: dmFkZTFK/HNVRU9POJZ7muAO4IuQz06udRuTBk9a2svdjpaXCu7y0fu4q5+jNf4Nd9PP9u
    lRgIXJzXxCgD1zgHfD3THiV9eLVR4sO9C67JR78Ru9NZIPpKCKDw8WTy/90Z7WV1iiXE71
    xjiU/1XQxW1i/L8o60OFHRBtK5D4JnD84vUO/dE96RWRQCC0WWcjt2VnejpYPo8gbIfa8N
    ZXl+yEcSleJSMgnRQPnAfpIA1vLLQ2xyWFnAiRm0shjcxM/bFYEMJZrPSpl0iimcbyNDxE
    6o30zGwmiPPcYw6UuoZz1zeJxPhlzWODW1uEg/p2tqkImsxEKbG+ueI1T/zOaPTSdd7zFi
    ++gQ3P7Yr7ZusYXFWVv8T52RJB4il8Vm8dgs4OAQTt/Uy82ZWuIcu+Ou0SjUeyorscaso0
    DgtYv/jS5dl3XZep1H0bgNZbJ8ZZLt3vuHnTv0z7a6m8Qq/OTUhLGFIezsF7CeKdIxgCva
    6aLM1Hw05hFKvqR+TPx6UYTZqkx+T9zUrDpwtfMYZMOUTiJHanoILxq+1zvB5Pja0k9aP+
    dQ4wxqv8h51bXjmHyJ00DxKAC0RG5T+KNU1pIeTyg/PUi+kGozK9M2D8H5FdyqdzhqlKvQ
    KaS1OPhBCGsMjWJYHKNPNsiah92uk8uu2RlIbg8TLURWNPyFJ5dvOw4D4vrg
X-ME-Proxy: <xmx:0Dpyaoep37djQena_0-ngkXGj1OaiJ70yWslCsG7TkpxVNseESAG4A>
    <xmx:0DpyakTYS-lYEBaBTPJJLc5lXHdUZyTKe0Cch23V_cy55UogczRDqg>
    <xmx:0DpyapaIIkR98qLn2UNBBdFxpmmYI0DKih2iupL9GATSTgrSFBtpYQ>
    <xmx:0DpyavfmG5Z-9GmTatbcWQLFtD0mvBcGltjlX5vc-bL8wjxChheMBg>
    <xmx:0DpyarFyrgNcNdVOabHI-fAkgos97n6zMXFDn11Ai6et_qoaNYOCGWUx>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 4 Aug 2026 21:17:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of
 qemu-alpine-x86_64
Message-ID: <anI6zLWzX8kDi7oC@mail-itl>
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-3-frediano.ziglio@citrix.com>
 <anIn7VAt2oQJ90Js@mail-itl>
 <CAHt6W4eCdqp2NDzjHyQ9vdezJkjVyxTwJH7HuReVxVSihox0Rw@mail.gmail.com>
 <9dc1d91c-52e2-4cd9-a234-6d6ca6ecceb8@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hQuFwtfgOO6JM1Yo"
Content-Disposition: inline
In-Reply-To: <9dc1d91c-52e2-4cd9-a234-6d6ca6ecceb8@citrix.com>
X-purgate-ID: tlsNG-bad1c0/1785871058-3AAD8034-BA37ACC5/0/0
X-purgate-type: clean
X-purgate-size: 5921

--hQuFwtfgOO6JM1Yo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 4 Aug 2026 21:17:32 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of
 qemu-alpine-x86_64

On Tue, Aug 04, 2026 at 07:55:24PM +0100, Andrew Cooper wrote:
> On 04/08/2026 7:48 pm, Frediano Ziglio wrote:
> > On Tue, 4 Aug 2026 at 18:57, Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> >> On Tue, Aug 04, 2026 at 06:42:18PM +0100, Frediano Ziglio wrote:
> >>> Make sure that save/restore continue to work.
> >>> The check save and restore twice to check for corrupted status.
> >>> Also a command is launched in the guest to make sure that the
> >>> machine is not crashed but working.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> >>> ---
> >>>  automation/scripts/console.exp           |  8 +++++
> >>>  automation/scripts/qemu-alpine-x86_64.sh | 40 ++++++++++++++++++++++=
--
> >>>  2 files changed, 46 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/automation/scripts/console.exp b/automation/scripts/cons=
ole.exp
> >>> index e27886bbef..ff58ed29b8 100755
> >>> --- a/automation/scripts/console.exp
> >>> +++ b/automation/scripts/console.exp
> >>> @@ -58,6 +58,14 @@ if {[info exists env(WAKEUP_CMD)]} {
> >>>      system "$env(WAKEUP_CMD)"
> >>>  }
> >>>
> >>> +if {[info exists env(EXPECT_TEXTS)]} {
> >>> +    set lines [split "$env(EXPECT_TEXTS)" "\n"]
> >>> +    foreach {exp snd} $lines {
> >>> +        expect -re "$exp"
> >>> +        send "$snd\n"
> >>> +    }
> >>> +}
> >>> +
> >>>  if {[info exists env(LOG_MSG)]} {
> >>>      expect {
> >>>          -notransfer -re "$env(PASSED)" {
> >>> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/sc=
ripts/qemu-alpine-x86_64.sh
> >>> index 60f5cc49fc..409a601c34 100755
> >>> --- a/automation/scripts/qemu-alpine-x86_64.sh
> >>> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> >>> @@ -48,6 +48,28 @@ xl -vvv create -c /root/domU.cfg
> >>>
> >>>  " > etc/local.d/xen.start
> >>>  chmod +x etc/local.d/xen.start
> >>> +
> >>> +# Script to test save and restore.
> >>> +# It saves and restores domU domain twice to check if the domain was=
 corrupted
> >>> +# during the first sequence.
> >>> +# At the end open the console to check if the domain is working.
> >>> +cat > root/save_restore_test << "EOF"
> >>> +#!/bin/sh
> >>> +set -ex
> >>> +xl list | grep -q domU
> >>> +rm -f save.dat
> >>> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat /r=
oot/domU.cfg
> >>> +xl restore /root/domU.cfg save.dat
> >>> +xl list | grep -q domU
> >>> +rm -f save.dat
> >>> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat /r=
oot/domU.cfg
> >>> +xl restore /root/domU.cfg save.dat
> >>> +xl list | grep -q domU
> >>> +rm -f save.dat
> >>> +xl console "$(xl list | awk '$1=3D=3D"domU" { print $2 }')"
> >>> +EOF
> >>> +chmod +x root/save_restore_test
> >>> +
> >>>  find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
> >>>  cd ../..
> >>>
> >>> @@ -70,9 +92,23 @@ export TEST_CMD=3D"qemu-system-x86_64 \
> >>>      -device virtio-net-pci,netdev=3Dn0 \
> >>>      -netdev user,id=3Dn0,tftp=3Dbinaries,bootfile=3D/pxelinux.0"
> >>>
> >>> +# Sequence of expect/send strings:
> >>> +# 1. wait domain start and close console;
> >>> +# 2. wait login prompt and login as root
> >>> +# 3. wait login and launch save/restore test;
> >>> +# 4. wait restore from domain console and send a command.
> >> Why doing this interactively over serial, instead of adding to
> >> etc/local.d/xen.start and then printing test result at the end?
> >>
> > I'm using expect to interact with the console. expect is not available
> > inside the alpine root filesystem.
> > Some failure I had during migration is that the VM crashed. In the
> > script I interact with the console to check that the VM is still able
> > to run commands.
>=20
> We can add `expect` to the dom0 root filesystem if we find a need for
> it, and it looks like this might be a good enough reason.=C2=A0 You want a
> patch to https://gitlab.com/xen-project/hardware/test-artifacts
> images/alpine/*-x86_64-base.dockerfile to get it included.

FWIW, my suspend test (which tests a similar thing) uses ping to check
if domU is still alive:
https://gitlab.com/xen-project/people/marmarek/xen/-/blob/2184be51d426b60f5=
e1a7e6e891d0f40e9488fc7/automation/scripts/qemu-alpine-domU-suspend-x86_64.=
sh


> But, for migration testing, this really wants to run on the real
> hardware.=C2=A0 Besides the main memory image, there's variations in regi=
ster
> state and validity which will vary between hardware.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hQuFwtfgOO6JM1Yo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpyOswACgkQ24/THMrX
1yyZZwgAk+x0JJUH7L6xO6AueJRPcm/8FB/EEIhmJn9UTrsz/AArwo1pHd24NhAn
vDwM5cw4bkNAo8qqm9wkVI1UctRLdrR1yoj9nebEosm9969h5W8QfqX1BEZfjeB4
FcRVypbfDHXoeWRhA9f/k9Ixz/LAVxRbCmc3steaE8bGnnGH/U2K3zbqWYvXSDSF
yNR2qQizmZpASTAdaeQv8ann8hfz7mqDAYMhfuAQ0iPn8GxzaksoYKlflr68nJd6
ZichuKBc4Vwjtp/8odC1uDEnYEwnbKxmQumnduCUcDi98ZZ8vjy9xOGeTkAzxYS6
fdDSeGVaCnX6PnruOVJtv85ohK9bUg==
=lREV
-----END PGP SIGNATURE-----

--hQuFwtfgOO6JM1Yo--

