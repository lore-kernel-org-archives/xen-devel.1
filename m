Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAD4C55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 22:44:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382680.1626010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrNrX-0000eT-Ph; Tue, 04 Aug 2026 22:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382680.1626010; Tue, 04 Aug 2026 22:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrNrX-0000eM-L7; Tue, 04 Aug 2026 22:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1382680;
 Tue, 04 Aug 2026 22:43:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrNrW-0000eG-HY
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 22:43:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrNrU-001w5C-Lw
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 00:43:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a726b1d-5cb7-0a2a0a5109dd-0a2a450882c6-10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 00:43:52 +0200
Received: from [103.168.172.157] (helo=fhigh-a6-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a726b26-f659-0a2a45080019-67a8ac9db42f-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 00:43:51 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 71EA214000ED;
 Tue,  4 Aug 2026 18:43:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 04 Aug 2026 18:43:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 18:43:48 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785883430;
	 x=1785969830; bh=PBhPzA2xvYXBdzZGUAFISn9I3/g+BWXV5uO0PtXXq9g=; b=
	SzCu0Upv6WNBaN9gpFyLomh8ZtqoSP0Ow5OwA6dVxgg/2u2TXQqrcSah9OqPgZSz
	Le0P21RChZI1hVNDF+hxO+1GPNDYP8f8+r8fspubCu5jlgk0K2D/RQcEOHlnvVE7
	MEU3bkTSVGQ88iulAD6tROVIP0eStmQFxta0DyuO5wo60gpV/raIFyxJa6obQyt5
	WF3EHOAInLKcRLiBhjjZLKNX8sN2e8NSBx711pSnhgZHHyLyBXG1ychQWu9iqWvH
	k0vSD8e44l3ON7ggeScmhd3id5qM1GrUqCmMtRBBYjO5CtXOfs13nda7jsp7qxQm
	jOj0pE21kcOOtkK/JcX4eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785883430; x=1785969830; bh=PBhPzA2xvYXBdzZGUAFISn9I3/g+BWXV5uO
	0PtXXq9g=; b=eLpaMKTwaDRi72weq/KQQ3cwRTvYsqhRVYIM7JZwqHl3wGIcMwv
	eR3p1XaP6xqJ+5v/WV+cAUY6+CNE5TA4mjJa3bQatEOdFkBOdnVYTOggl60MIYko
	qH0NKMY6PkxYcEOfCbnAFIsHOAtUuH0byXmTcWpWM9pgpA7ICa+nkJVh+vE7y/yD
	YqnFSr3P5M2PlZ6ls/vhQhs35biIcwTwI0rk1WMjK/tY25HujSYD0DT8D6NTVkUz
	4qDCpxMN0aCwf72DIKGn+F40MtU+j42E2zzRU0734TvCQOVcCgl5IQ3fzHRo/A4i
	vZahCw79VB5GkpVZSSZna5xkyMz2scAValw==
X-ME-Sender: <xms:Jmtyambwps3niato23dDY6Zv7e0HhCwqMrIJue2oJ1shVFHFTRLrEA>
    <xme:JmtyaroD5pyJDqIB_JnUtUT0HTkWZD6rUTrpuoBdvhTkR9TnQ_KhB9_-lNjGi4CtQ
    4raP7bYKm_OD7HzG96z5nmSD0wGyJ81NvT9g5uMYqP85wTNpf8>
X-ME-Received: <xmr:JmtyajOOBByPixnWCBCi472lwJx6y-VikbYOUR7JiSKah45tuvl4Oc5oIfi4TGquEFRSM1vBT0JfWTfXIUqmv1HchtptN__SzpU>
X-ME-Proxy-Cause: dmFkZTGpO0qsetRC26UsHWYpTodxhX3ZapQLjdNWY4FX1lbwq3qXfQfO90ne/DfjimpOGF
    xEwN/cIW+oGV9janrS44GhAZhmmbHuMUhPwv1H5hyWbefB7WedltbR92AgzCy4L3IOMGKZ
    3/nj6ZO7Lqh2slbOH5OXawjn5xAio7Msasl5+tpGzP4udQQwva0cK7jvS4N1pW+1PadOGl
    QMOUhKEsVSq4b5+iuWXAHzwXr4BI6TAhieCXnKR/JtoJ0WWeqr8tCa2zicIL4V6AmKC6D7
    PcUtd+vzoYotoIq48t/Bl+Mn/a19HW/BEM8OXTHpB4fLWoS4A3KKwqHY4P0mT7BwhXYxNn
    nmQcGeBVBPkOwg4HyFrBzbu0ZiYGL1YMGB0d1jL1G4KMcI4QisyCOVcMRGidWdJbVo2RrL
    xwn0n3dNCYcTpm5GnB5HHH3qO5gbDEJ72zQp2Deia/42QCnDyvlXecaM9GC0Y7mwV6KzjF
    srfOwOC7x93jzFA3biMO19H+zB++TMT5Lvl/seA4aVDNwQCZ6W4GRZXu0sf/oneuh+oV9/
    OwQoRji45DMVcNxjIBSEYF3LI+bIkD2cxlDoHY7rTw7V9o5ozZxUieAdv0r/UdorOWQaow
    SdmguRWZ57TCKjgxb2wsRnRDK9oqI9Uq2Igf+zuhNgIh8ojuM+FZgGQzhFOw
X-ME-Proxy: <xmx:JmtyaurLZeUI75lrKE1vLcedZb6bhBqqiedaYvKdRlyb9yR9wLze8g>
    <xmx:Jmtyagfj-FAIb_hAzL85LvcarIRDbyWr-m2YPPP6KZQXAomMcs-ppg>
    <xmx:JmtyasRTssR7l7gLx5VWjNhRfJSwGC7PaNllbwat-pvbTKO6DZ2Zjw>
    <xmx:JmtyahYeupvuhPAo-UPOeVSjEWNn8Hxl3GorckrcfFfDuQ038_lfwg>
    <xmx:JmtyamjnaDcphCufIx6oFtOpfBVNr8Vn29tNPOnJJ2XmekZ69PHEVrch>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 5 Aug 2026 00:43:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of
 qemu-alpine-x86_64
Message-ID: <anJrIkkkPqY1bg1J@mail-itl>
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-3-frediano.ziglio@citrix.com>
 <anIn7VAt2oQJ90Js@mail-itl>
 <CAHt6W4eCdqp2NDzjHyQ9vdezJkjVyxTwJH7HuReVxVSihox0Rw@mail.gmail.com>
 <9dc1d91c-52e2-4cd9-a234-6d6ca6ecceb8@citrix.com>
 <anI6zLWzX8kDi7oC@mail-itl>
 <CAHt6W4enqcBQwEzq3w4PyzfUOnfveFa=KGbGfYK92nspf6eH9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PkvxQL4DZhCcODI5"
Content-Disposition: inline
In-Reply-To: <CAHt6W4enqcBQwEzq3w4PyzfUOnfveFa=KGbGfYK92nspf6eH9g@mail.gmail.com>
X-purgate-ID: tlsNG-c1860d/1785883432-D7B5987B-E0D1FDAD/0/0
X-purgate-type: clean
X-purgate-size: 7789

--PkvxQL4DZhCcODI5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Aug 2026 00:43:46 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of
 qemu-alpine-x86_64

On Tue, Aug 04, 2026 at 10:58:47PM +0100, Frediano Ziglio wrote:
> On Tue, 4 Aug 2026 at 20:17, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Tue, Aug 04, 2026 at 07:55:24PM +0100, Andrew Cooper wrote:
> > > On 04/08/2026 7:48 pm, Frediano Ziglio wrote:
> > > > On Tue, 4 Aug 2026 at 18:57, Marek Marczykowski-G=C3=B3recki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > >> On Tue, Aug 04, 2026 at 06:42:18PM +0100, Frediano Ziglio wrote:
> > > >>> Make sure that save/restore continue to work.
> > > >>> The check save and restore twice to check for corrupted status.
> > > >>> Also a command is launched in the guest to make sure that the
> > > >>> machine is not crashed but working.
> > > >>>
> > > >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > > >>> ---
> > > >>>  automation/scripts/console.exp           |  8 +++++
> > > >>>  automation/scripts/qemu-alpine-x86_64.sh | 40 ++++++++++++++++++=
++++--
> > > >>>  2 files changed, 46 insertions(+), 2 deletions(-)
> > > >>>
> > > >>> diff --git a/automation/scripts/console.exp b/automation/scripts/=
console.exp
> > > >>> index e27886bbef..ff58ed29b8 100755
> > > >>> --- a/automation/scripts/console.exp
> > > >>> +++ b/automation/scripts/console.exp
> > > >>> @@ -58,6 +58,14 @@ if {[info exists env(WAKEUP_CMD)]} {
> > > >>>      system "$env(WAKEUP_CMD)"
> > > >>>  }
> > > >>>
> > > >>> +if {[info exists env(EXPECT_TEXTS)]} {
> > > >>> +    set lines [split "$env(EXPECT_TEXTS)" "\n"]
> > > >>> +    foreach {exp snd} $lines {
> > > >>> +        expect -re "$exp"
> > > >>> +        send "$snd\n"
> > > >>> +    }
> > > >>> +}
> > > >>> +
> > > >>>  if {[info exists env(LOG_MSG)]} {
> > > >>>      expect {
> > > >>>          -notransfer -re "$env(PASSED)" {
> > > >>> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automatio=
n/scripts/qemu-alpine-x86_64.sh
> > > >>> index 60f5cc49fc..409a601c34 100755
> > > >>> --- a/automation/scripts/qemu-alpine-x86_64.sh
> > > >>> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > > >>> @@ -48,6 +48,28 @@ xl -vvv create -c /root/domU.cfg
> > > >>>
> > > >>>  " > etc/local.d/xen.start
> > > >>>  chmod +x etc/local.d/xen.start
> > > >>> +
> > > >>> +# Script to test save and restore.
> > > >>> +# It saves and restores domU domain twice to check if the domain=
 was corrupted
> > > >>> +# during the first sequence.
> > > >>> +# At the end open the console to check if the domain is working.
> > > >>> +cat > root/save_restore_test << "EOF"
> > > >>> +#!/bin/sh
> > > >>> +set -ex
> > > >>> +xl list | grep -q domU
> > > >>> +rm -f save.dat
> > > >>> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.da=
t /root/domU.cfg
> > > >>> +xl restore /root/domU.cfg save.dat
> > > >>> +xl list | grep -q domU
> > > >>> +rm -f save.dat
> > > >>> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.da=
t /root/domU.cfg
> > > >>> +xl restore /root/domU.cfg save.dat
> > > >>> +xl list | grep -q domU
> > > >>> +rm -f save.dat
> > > >>> +xl console "$(xl list | awk '$1=3D=3D"domU" { print $2 }')"
> > > >>> +EOF
> > > >>> +chmod +x root/save_restore_test
> > > >>> +
> > > >>>  find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
> > > >>>  cd ../..
> > > >>>
> > > >>> @@ -70,9 +92,23 @@ export TEST_CMD=3D"qemu-system-x86_64 \
> > > >>>      -device virtio-net-pci,netdev=3Dn0 \
> > > >>>      -netdev user,id=3Dn0,tftp=3Dbinaries,bootfile=3D/pxelinux.0"
> > > >>>
> > > >>> +# Sequence of expect/send strings:
> > > >>> +# 1. wait domain start and close console;
> > > >>> +# 2. wait login prompt and login as root
> > > >>> +# 3. wait login and launch save/restore test;
> > > >>> +# 4. wait restore from domain console and send a command.
> > > >> Why doing this interactively over serial, instead of adding to
> > > >> etc/local.d/xen.start and then printing test result at the end?
> > > >>
> > > > I'm using expect to interact with the console. expect is not availa=
ble
> > > > inside the alpine root filesystem.
> > > > Some failure I had during migration is that the VM crashed. In the
> > > > script I interact with the console to check that the VM is still ab=
le
> > > > to run commands.
> > >
> > > We can add `expect` to the dom0 root filesystem if we find a need for
> > > it, and it looks like this might be a good enough reason.  You want a
> > > patch to https://gitlab.com/xen-project/hardware/test-artifacts
> > > images/alpine/*-x86_64-base.dockerfile to get it included.
> >
> > FWIW, my suspend test (which tests a similar thing) uses ping to check
> > if domU is still alive:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/blob/2184be51d426b=
60f5e1a7e6e891d0f40e9488fc7/automation/scripts/qemu-alpine-domU-suspend-x86=
_64.sh
> >
>=20
> Are you going to upstream the test?

Yes, this branch (including a few more tests) waits for the other series
to test-artifacts (already acked) to be pushed. Otherwise, it needs a
hack with switching to alternative repos to work...
I guess I can post it anyway, just with a disclaimer about pushing
order...

> Why sleep between commands? Worrying about possible races? Probably
> there should be no race after the command exited so I personally would
> remove.

To cover also cases where crash happens only a moment later, not in the
very second it's resumed. I had also a case where only one vcpu crashed,
but otherwise domU appeared functional (this I solved with oops=3Dpanic on
kernel cmdline, added in an earlier commit).

> Using the network seems like a good idea. I also discovered that there
> is nc and bash installed so something like
>=20
>     # nc -lk -p 8888 -e sh -c "echo Still alive"
>=20
> and
>=20
>     # bash -c 'read -t 1 line < /dev/tcp/localhost/8888; echo $line'
>     Still alive
>=20
> would even test if userspace is still working correctly

Looks like a good idea.

> > > But, for migration testing, this really wants to run on the real
> > > hardware.  Besides the main memory image, there's variations in regis=
ter
> > > state and validity which will vary between hardware.
> >
>=20
> Which scripts/jobs are run on real hardware (well, I suppose all that
> starts with zen, kbl, xilink or adl). Are they all run for every
> build?

Yes.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PkvxQL4DZhCcODI5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpyayIACgkQ24/THMrX
1yzH5wgAmZRzBema58TF1UQ6vJYm2229+7l8+o6tAnn9c2FtTvroOwskei0ZlrHZ
9xs3eaCWVyRIvVWrkl39dXF8CT7lwNa8F1CCJf391DGhwxT5pfwhULi6l6ylW+GM
QpcYn9N3bgEFYdrDxcUeQf+VAOyNcEKutErtaFwb2BIhGbH6iPLQjBuZAm1Np1ZM
GyEgEzKWJN6o4YUJ+NwHUvvV+1c/t+UCVhj9Ac0juGZ519wKOzxrU6XNTwvoW72E
PLpkVL8O+kM4xEk3ICyDoGAkOVUv/W4XJkGyvfA6ut26u05/4gHZYzXvBFzXes3D
TU0fuoxyU5sk57gyL8DtSCK3cCRs6w==
=+wM4
-----END PGP SIGNATURE-----

--PkvxQL4DZhCcODI5--

