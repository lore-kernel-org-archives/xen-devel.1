Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05112C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 10:08:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416238.1645386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yB9-0007KO-As; Fri, 11 Sep 2026 10:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416238.1645386; Fri, 11 Sep 2026 10:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yB9-0007KH-8A; Fri, 11 Sep 2026 10:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1416238;
 Fri, 11 Sep 2026 10:08:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.syms@citrix.com>) id 1x4yB8-0007J2-7L
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:08:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4yB7-00B44n-Br
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:08:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.syms@citrix.com>)
 id 6aa3d308-2eae-0a2a0a5409dd-0a2a4507d0e4-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:08:17 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.syms@citrix.com>)
 id 6aa3d30f-b4ea-0a2a45070019-a0658309b0a4-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:08:17 +0200
Received: from mewpvdipd1070.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id E284D84D50E3;
 Fri, 11 Sep 2026 06:06:07 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Mark Syms <mark.syms@citrix.com>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Edgar E. Iglesias <edgar.iglesias@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [BUG] hw/xen: features published after InitWait since 240cc11369fc
Date: Fri, 11 Sep 2026 11:08:12 +0100
Message-ID: <178912129220.24041.799369954881004447@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-purgate-ID: tlsNG-ef75cf/1789121297-A6AD8AE4-C2F8151B/0/0
X-purgate-type: clean
X-purgate-size: 6271

Hi,

We think there is an ordering regression in the Xen PV backend setup
path, introduced by a commit that was itself fixing a genuine crash. We
are reporting rather than patching, for reasons at the end.

## Symptom

A blkif VBD hot plugged into a running Linux guest silently negotiates
a single page (order 0) ring instead of the eight pages the backend is
willing to offer. That is 32 request slots instead of 256.

Nothing reports this. The disk attaches, works, and is simply eight
times shallower. We found it on XenServer 9 (qemu 10.2.2, Linux 6.1
guest) while setting up an unrelated performance measurement, and lost
some measurement time before noticing the ring depth was not what we
had configured.

The same VBD attached at guest boot gets the full order 3 ring every
time. Hot plugged, in 20 unplug/plug cycles, it took the 32 slot ring
20 times out of 20. It is not an occasional race; hot plug loses it
essentially always.

## Cause, as far as we can tell

`xen_device_realize()` in hw/xen/xen-bus.c currently advertises the
backend state before the device's `realize` has written its feature
nodes:

    xen_device_backend_set_state(xendev, XenbusStateInitWait);
    ...
    xendev_class->realize(xendev, errp);

and for xen-block it is that `realize` which writes the feature nodes,
in `xen_block_realize()`:

    if (qemu_xen_gnttab_can_map_multi()) {
        xen_device_backend_printf(xendev, "max-ring-page-order", "%u",
                                  blockdev->props.max_ring_page_order);
    }

Our understanding of the xenbus handshake is that `InitWait` is the
signal that the backend's parameters are readable. A frontend which
acts on it promptly can therefore look before those nodes exist.

Linux blkfront reads the key with no wait and no retry:

    max_page_order =3D xenbus_read_unsigned(info->xbdev->otherend,
                                          "max-ring-page-order", 0);
    ring_page_order =3D min(xen_blkif_max_ring_order, max_page_order);

`xenbus_read_unsigned(..., 0)` returns 0 when the key is absent, so
losing the race is indistinguishable from talking to a backend that
does not support multipage rings.

That also explains why only hot plug is affected. A booting guest takes
seconds to reach blkfront probe, by which time the backend has long
since finished writing. A VBD hot plugged into a running guest is
answered in microseconds.

`max-ring-page-order` is simply the one we noticed. Everything
`xen_block_realize()` writes after the state transition looks equally
exposed, including `feature-discard`, `discard-granularity`,
`feature-flush-cache`, `info` and `mode`.

## Where it came from

This was not always the case. The order was inverted by:

    240cc11369fc ("hw/xen: Avoid crash when backend watch fires too
                   early", Jan 2023)

Before that commit `xendev_class->realize()` ran before
`set_state(XenbusStateInitWait)`, so the feature nodes were published
first and the handshake was correct.

We want to be clear that commit was fixing a real bug, and a nastier
one than this. Quoting it:

    The xen-block code ends up calling aio_poll() through
    blkconf_geometry(), which means we see watch events during the
    indirect call to xendev_class->realize() in xen_device_realize().
    Unfortunately this call is made before populating the initial
    frontend and backend device nodes in xenstore and hence
    xen_block_frontend_changed() (which is called from a watch event)
    fails to read the frontend's 'state' node, and hence believes the
    device is being torn down.

Moving `realize` after node population fixed that crash. It also moved
it after `set_state(InitWait)`, because that call happens to sit in the
same block. We think that side effect is the regression, rather than
anything wrong with the intent.

## Why we are not sending a patch

The obvious change, moving `realize` back above the state transition,
would reintroduce the 2023 crash, so please do not take that as our
suggestion. The two constraints look reconcilable: `realize` needs the
frontend and backend path nodes to exist before it runs, and the
feature nodes need to be published before `InitWait`, and those only
conflict because a single `set_state()` call sits inside the block that
`realize` was moved after.

Whether it is safe to defer only that call, and whether any backend
depends on the state already being `InitWait` during its `realize`, is
a judgement for people who know this code better than we do. We have
not tested any such change.

Separately, and the reason there is no patch attached to this mail at
all: this work made extensive use of Claude Opus 5, and we understand
qemu will not accept code produced that way. That constraint applies to
the fix regardless of how small it is. We are sending the report
because the defect seemed worth your knowing about even if we cannot
contribute the change ourselves.

## Confirmation

We tested the diagnosis rather than leaving it as a reading of the
source. Deferring only the `set_state(XenbusStateInitWait)` call until
after `xendev_class->realize()`, and leaving the node writes and
`set_online()` where they are so that 240cc11369fc's crash fix is
undisturbed, gives:

    stock ordering            order 0 in 20 of 20 hot plugs
    InitWait deferred         order 3 in 20 of 20 hot plugs

Same guest, same VBD, same script, back to back. We are describing that
result rather than offering the change, for the reason above.

We did not check whether any other `XenDeviceClass` backend depends on
the backend state already being `InitWait` during its `realize`; we only
exercised xen-block. That is the part we would expect you to want to
verify.

## What we have not established

We have not instrumented the frontend to catch the read of the missing
key directly, so the mechanism is inferred from the ordering plus the
A/B above rather than observed in blkfront. We also have not measured
how wide the window is, or whether other frontends behave differently.

Happy to run further experiments on our side if that would help.

Regards,

Mark
XenServer Storage Engineering

