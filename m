Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73360C55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 21:59:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382660.1625990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrNA7-0001nQ-3T; Tue, 04 Aug 2026 21:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382660.1625990; Tue, 04 Aug 2026 21:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrNA7-0001nJ-0x; Tue, 04 Aug 2026 21:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1382660;
 Tue, 04 Aug 2026 21:59:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wrNA6-0001nC-DA
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 21:59:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrNA4-001qb7-7a
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 23:59:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7260a4-2eae-0a2a0a5409dd-0a2a4507d66c-0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:59:00 +0200
Received: from [74.125.224.45] (helo=mail-yx1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7260a3-b4ea-0a2a45070019-4a7de02de46f-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:58:59 +0200
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-664ce3000e6so295227d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:58:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1785880738; cv=none;
        d=google.com; s=arc-20260327;
        b=ocwEMswJr5/W5jBxixVcX9Vd3b+FhPofoJmEYAiNFQyfGRTh71cegqBR45pfB2aCbs
         Yd3DF+y0uLpYGPXvTnKifMd9Fe2kc1JtpS7lLwflnPcIX9RA8MI+lzmOA6Tb90xqCAyV
         WgwG1dfgZJR6FjsU3ze5MxjQlJccsPpLzD+7aUIpzemPbJQGA69CR4mWAaIIK56JwFoh
         4ym3GMqE14g5gnjiCz9F3Xrrj7kl9XQjDa5TxX7fVx6SOFNVdV2nn3kfQB5Ir4Hx7Q6Q
         pObIl98p/v/FWdGauZbou7ik/vl/wH2k5d3orixcKi3tghSLzp3s1W2dbyCocSEmUmVy
         oFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVNb0qH2KaqSSA1wdzQ35ti5zCobKv53Fc4eqYo5Z2E=;
        fh=S7vaYQF6ldLkXu1uh42X3MXXcRRChuuDlJZSyF3Eswo=;
        b=npzm6QPk7iYEhS0tnki6E4Y6MwXEiwYqwRdGk+cLPOETYv8A8SiqhxfPcM7woiBfE5
         Kbh7ovsCXSd96EgC6Gxy9eWTaEmEhXBpv35PQxXdCkjFoDI6VEcZcoYZd5PmSH2+pGDu
         29phw1nsS4oRPsuKpr27YZ7s0xnujt9vKfXrhCkS534e+nlMlPW12NP8yKQB9sMKba+Q
         oS5oGT6Lc/heUAm19s3zI5qr5mxUKOcEVVwS331OUSF4TYRFq9/nF+vWvXC0Z+Pkvjks
         o5NTaYxss+v3APe5k+gjT8R+RU0jqs3LoCOJdCGl3z4rUcQjUnAyo2f5puJtdWYme+yZ
         p7IQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785880738; x=1786485538; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVNb0qH2KaqSSA1wdzQ35ti5zCobKv53Fc4eqYo5Z2E=;
        b=lGryzvdd4RipRBZWPyiGBo7dA+b13Z21+Rpdy/LqRqPp5JP+txPJNrPXVnMC6ZCrMf
         lTlqcTy9bdmE9m6vqPXrkFzFYkUcCvc7wuTDL+caPznj2YgjfXDntY1YFmzddkn21xAx
         uyWlnhYkyC4uxEO1XyxvKt2hp5OqL/BL0ytmEROhvnjQ9SBDM2yIg2p8z2+5J6fx/o5/
         qEgu6fmx5a7DSXyV4qRAM5RBRPskeyJx4gqjrvmoa/h3lSYl6lSDEjcpY83RkJSSzvfL
         HfGEEjoDWXDSloBwycLjQtS4EHEUKk3eT7mY+RRC5/BqkJQyIhCxAGxqd5YSlBvk+NHY
         rdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880738; x=1786485538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVNb0qH2KaqSSA1wdzQ35ti5zCobKv53Fc4eqYo5Z2E=;
        b=LOSV7/4rwDsR5Q2QPFtCwp0uJMbWcdEk2aki25pVcoEKU2FYKr/d+zZRVRW27C5pEm
         1vLubSNTxL38UcWVRxnEhmQfTFdpXTozXI/UvFjkVgjUcl+iyYGuctInrteAVXklL677
         svJz6rDeiSmKl+D4p82+gNXxrYOBGi1bw1fHJqjuVjDZXU0Xd7xWBPTl4MivT5cQbNvU
         VXzB3c+YiVr4+49EmJWAIxFaUplzek76xlsPBu7gTYM6drnmJJtRH1rKAD+11vnkeOY1
         RcnsfwuvhPr2ssbeCYeY1fa9Xss4SFPPUUBZG2aKFPAM4KxK9SJRd0KxePsILm7q2rSs
         C8GA==
X-Forwarded-Encrypted: i=1; AHgh+RrK1gTr2+xfklulqeShPslptjub+h9S24WhwEATbux6rXUhNzLZ397TB8sGzejQzYVKmWEwKvigGos=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJ3GwHYjinGC59vD8ic0AiMzWJJIU0Phi57lp0F1oHt70999Yp
	oZp/OYzEwPVL9lWYYhi+hUv44vLNZ90e9R8lR7ijYdTTtrdJlL7+MSRZV6o1hn19S9kKxSKbWau
	MEl2km1+SbYuRXqBJh3PUtmnRitFfRFA=
X-Gm-Gg: AR+sD123g1DZ4DR9fcjTs71xkvjwAFnnMYuomTDvQbY3xb1twfxbRvP0YB/KJWTyOTC
	JEW/vg77W5cQP6c5sCI1gkyFE+0q1VD+7pgxWHW/bHTkXZHir2WQAbGfl2SECStHwAEPFuQkEdi
	Q1o07Ehud2HPehwHHG54EMJvU8NTCFzEIiRuMUmUJVyIQtItX3qWIhRaXtpM1jsZK59PDyyNEOz
	/yKaOyJz5xVOctYnbQihIotYTFvSsVTUl6MAEADVVCMS+eevas/NWBSebhmhzQfp2fbsB7uTmry
	D4IVCmpxAJg4VfniMH987VzbymFgz2aZCv9TW4JKJaZX06AWi/fVRc3OieziA/6G7u+Nh3ygjwC
	sHyqJpjKXI3s=
X-Received: by 2002:a05:690e:454b:20b0:667:be4a:4b5f with SMTP id
 956f58d0204a3-6699aa26209mr991834d50.15.1785880738304; Tue, 04 Aug 2026
 14:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-3-frediano.ziglio@citrix.com> <anIn7VAt2oQJ90Js@mail-itl>
 <CAHt6W4eCdqp2NDzjHyQ9vdezJkjVyxTwJH7HuReVxVSihox0Rw@mail.gmail.com>
 <9dc1d91c-52e2-4cd9-a234-6d6ca6ecceb8@citrix.com> <anI6zLWzX8kDi7oC@mail-itl>
In-Reply-To: <anI6zLWzX8kDi7oC@mail-itl>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 4 Aug 2026 22:58:47 +0100
X-Gm-Features: AUfX_mzb93PcOca-QY5WJwRP4CkmwxCGy172nhyS-381muC9Oe8YoQ9qKC2mPWE
Message-ID: <CAHt6W4enqcBQwEzq3w4PyzfUOnfveFa=KGbGfYK92nspf6eH9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of qemu-alpine-x86_64
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1785880740-34AC8AE4-AFEBA6B6/0/0
X-purgate-type: clean
X-purgate-size: 5514

On Tue, 4 Aug 2026 at 20:17, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Aug 04, 2026 at 07:55:24PM +0100, Andrew Cooper wrote:
> > On 04/08/2026 7:48 pm, Frediano Ziglio wrote:
> > > On Tue, 4 Aug 2026 at 18:57, Marek Marczykowski-G=C3=B3recki
> > > <marmarek@invisiblethingslab.com> wrote:
> > >> On Tue, Aug 04, 2026 at 06:42:18PM +0100, Frediano Ziglio wrote:
> > >>> Make sure that save/restore continue to work.
> > >>> The check save and restore twice to check for corrupted status.
> > >>> Also a command is launched in the guest to make sure that the
> > >>> machine is not crashed but working.
> > >>>
> > >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > >>> ---
> > >>>  automation/scripts/console.exp           |  8 +++++
> > >>>  automation/scripts/qemu-alpine-x86_64.sh | 40 ++++++++++++++++++++=
++--
> > >>>  2 files changed, 46 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/automation/scripts/console.exp b/automation/scripts/co=
nsole.exp
> > >>> index e27886bbef..ff58ed29b8 100755
> > >>> --- a/automation/scripts/console.exp
> > >>> +++ b/automation/scripts/console.exp
> > >>> @@ -58,6 +58,14 @@ if {[info exists env(WAKEUP_CMD)]} {
> > >>>      system "$env(WAKEUP_CMD)"
> > >>>  }
> > >>>
> > >>> +if {[info exists env(EXPECT_TEXTS)]} {
> > >>> +    set lines [split "$env(EXPECT_TEXTS)" "\n"]
> > >>> +    foreach {exp snd} $lines {
> > >>> +        expect -re "$exp"
> > >>> +        send "$snd\n"
> > >>> +    }
> > >>> +}
> > >>> +
> > >>>  if {[info exists env(LOG_MSG)]} {
> > >>>      expect {
> > >>>          -notransfer -re "$env(PASSED)" {
> > >>> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/=
scripts/qemu-alpine-x86_64.sh
> > >>> index 60f5cc49fc..409a601c34 100755
> > >>> --- a/automation/scripts/qemu-alpine-x86_64.sh
> > >>> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > >>> @@ -48,6 +48,28 @@ xl -vvv create -c /root/domU.cfg
> > >>>
> > >>>  " > etc/local.d/xen.start
> > >>>  chmod +x etc/local.d/xen.start
> > >>> +
> > >>> +# Script to test save and restore.
> > >>> +# It saves and restores domU domain twice to check if the domain w=
as corrupted
> > >>> +# during the first sequence.
> > >>> +# At the end open the console to check if the domain is working.
> > >>> +cat > root/save_restore_test << "EOF"
> > >>> +#!/bin/sh
> > >>> +set -ex
> > >>> +xl list | grep -q domU
> > >>> +rm -f save.dat
> > >>> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat =
/root/domU.cfg
> > >>> +xl restore /root/domU.cfg save.dat
> > >>> +xl list | grep -q domU
> > >>> +rm -f save.dat
> > >>> +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat =
/root/domU.cfg
> > >>> +xl restore /root/domU.cfg save.dat
> > >>> +xl list | grep -q domU
> > >>> +rm -f save.dat
> > >>> +xl console "$(xl list | awk '$1=3D=3D"domU" { print $2 }')"
> > >>> +EOF
> > >>> +chmod +x root/save_restore_test
> > >>> +
> > >>>  find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
> > >>>  cd ../..
> > >>>
> > >>> @@ -70,9 +92,23 @@ export TEST_CMD=3D"qemu-system-x86_64 \
> > >>>      -device virtio-net-pci,netdev=3Dn0 \
> > >>>      -netdev user,id=3Dn0,tftp=3Dbinaries,bootfile=3D/pxelinux.0"
> > >>>
> > >>> +# Sequence of expect/send strings:
> > >>> +# 1. wait domain start and close console;
> > >>> +# 2. wait login prompt and login as root
> > >>> +# 3. wait login and launch save/restore test;
> > >>> +# 4. wait restore from domain console and send a command.
> > >> Why doing this interactively over serial, instead of adding to
> > >> etc/local.d/xen.start and then printing test result at the end?
> > >>
> > > I'm using expect to interact with the console. expect is not availabl=
e
> > > inside the alpine root filesystem.
> > > Some failure I had during migration is that the VM crashed. In the
> > > script I interact with the console to check that the VM is still able
> > > to run commands.
> >
> > We can add `expect` to the dom0 root filesystem if we find a need for
> > it, and it looks like this might be a good enough reason.  You want a
> > patch to https://gitlab.com/xen-project/hardware/test-artifacts
> > images/alpine/*-x86_64-base.dockerfile to get it included.
>
> FWIW, my suspend test (which tests a similar thing) uses ping to check
> if domU is still alive:
> https://gitlab.com/xen-project/people/marmarek/xen/-/blob/2184be51d426b60=
f5e1a7e6e891d0f40e9488fc7/automation/scripts/qemu-alpine-domU-suspend-x86_6=
4.sh
>

Are you going to upstream the test?
Why sleep between commands? Worrying about possible races? Probably
there should be no race after the command exited so I personally would
remove.

Using the network seems like a good idea. I also discovered that there
is nc and bash installed so something like

    # nc -lk -p 8888 -e sh -c "echo Still alive"

and

    # bash -c 'read -t 1 line < /dev/tcp/localhost/8888; echo $line'
    Still alive

would even test if userspace is still working correctly

>
> > But, for migration testing, this really wants to run on the real
> > hardware.  Besides the main memory image, there's variations in registe=
r
> > state and validity which will vary between hardware.
>

Which scripts/jobs are run on real hardware (well, I suppose all that
starts with zen, kbl, xilink or adl). Are they all run for every
build?
--
Frediano

