Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5D9606A32C
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g32OpgCh
Received: from list by lists.xenproject.org with outflank-mailman.1468575.1677638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHR-0006YV-Qy; Mon, 02 Nov 2026 19:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468575.1677638; Mon, 02 Nov 2026 19:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHR-0006YN-NT; Mon, 02 Nov 2026 19:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1468575;
 Mon, 02 Nov 2026 19:01:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHQ-0006Lr-K0
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHP-00AdHl-Pe
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:15 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8dde7-2eae-0a2a0a5409dd-0a2a45058876-42
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:15 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8ddfa-4cb1-0a2a45050019-aa0a817cdd9b-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:15 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-575-E4xqKpLVMK2dlUp-UY1vEQ-1; Mon,
 02 Nov 2026 14:01:10 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B723B1800EF7; Mon,  2 Nov 2026 19:01:08 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2C911803A40; Mon,  2 Nov 2026 19:01:06 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793646074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VyOfMou4RcojGMLaXB+CopKG9bhWtmdPnTdEbY8HCZQ=;
	b=g32OpgChUgl7Ht0Xf/apovDr3h7H4Bf3WwQ4f9jvczQaGZjMeIaR2T9fPP4aROkoOcjdw0
	kvC9j19L/XUgoL6tQUpIxeURAg4LrB8xE8HY9zywC8RZudrhGtHoyuIx/zZ15sZDsmha4e
	rQLlAxUqqzDuS4NKGuAuPxFw77WTEuo=
X-MC-Unique: E4xqKpLVMK2dlUp-UY1vEQ-1
X-Mimecast-MFC-AGG-ID: E4xqKpLVMK2dlUp-UY1vEQ_1793646068
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Helge Deller <deller@gmx.de>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 00/25] Tracing patches
Date: Mon,  2 Nov 2026 13:58:06 -0500
Message-ID: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: m1xcjM4snOs1OYu2MhY34RGszGyR5_vkjgWeM8jNei0_1793646068
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793646075-F44A42A1-6355E75B/35/111497
X-purgate-type: clean
X-purgate-size: 6506
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 56afd82bd4db9688f1c1c9d0e2ea163b8cde3283:

  Merge tag 'qemu-sparc-20261101' of https://github.com/mcayland/qemu into staging (2026-11-01 08:37:48 -0800)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request

for you to fetch changes up to 3b68720390b98f21e26ffcff8874851b7b49b7b7:

  trace: remove 'trace_event_get_state' wrapper (2026-11-02 13:52:14 -0500)

----------------------------------------------------------------
Pull request

Daniel Berrangé's 'disable' property removal and associated cleanups.

----------------------------------------------------------------

Daniel P. Berrangé (25):
  osdep: add 'ignore_value(x)' macro
  trace: use 'ignore_value()' instead of a dummy variable
  trace: fix handling of char** in UST backend
  hw/xen: replace "long unsigned int" with "unsigned long " for dtrace
  trace: block use of "long int" for dtrace
  trace: drop unused trace_event_set_state_dynamic_init()
  trace: remove obsolete references to vcpu property
  trace: drop 'id' from TraceEvent struct when not required
  trace: change "DSTATE" variables from uint16_t to uint8_t
  trace: add testing of 'nop' trace backend
  trace: don't emit TraceEvent structs when 'nop' backend is used
  trace: add test of generation with all backends enabled
  trace: remove redundant headers from simple trace backend code
  trace: include probe name in Rust format strings
  trace: add missing newline in ftrace Rust format string
  trace: eliminate dupe trace_event_get_state_dynamic_by_id() calls
  audio: remove mistaken use of trace_event_get_state()
  hw/ppc: remove mistaken use of trace_event_get_state()
  monitor: remove mistaken use of trace_event_get_state()
  trace: include qemu_loglevel_mask(LOG_TRACE) in guard
  target/hppa: use PRIx64 in trace-events
  trace: remove "disable" property from trace files
  trace: stop tracking static disabled state
  trace: remove parsing of "disable" event property
  trace: remove 'trace_event_get_state' wrapper

 docs/devel/tracing.rst                       |  27 +----
 qapi/trace.json                              |   5 +-
 include/qemu/osdep.h                         |   8 ++
 tests/tracetool/all.h                        | 100 +++++++++++++++++++
 tests/tracetool/dtrace.h                     |   6 +-
 tests/tracetool/ftrace.h                     |  14 ++-
 tests/tracetool/log.h                        |  26 +++--
 tests/tracetool/nop.h                        |  25 +++++
 tests/tracetool/simple.h                     |  10 +-
 tests/tracetool/syslog.h                     |  14 ++-
 tests/tracetool/ust.h                        |   6 +-
 trace/control-internal.h                     |   8 +-
 trace/control.h                              |  49 +--------
 trace/event-internal.h                       |  19 +---
 audio/audio-mixeng-be.c                      |   2 +-
 hw/ppc/vof.c                                 |  13 +--
 monitor/qmp.c                                |   4 +-
 stubs/trace-control.c                        |   6 --
 tests/tracetool/all.c                        |  61 +++++++++++
 tests/tracetool/dtrace.c                     |  10 +-
 tests/tracetool/ftrace.c                     |  10 +-
 tests/tracetool/log.c                        |  10 +-
 tests/tracetool/nop.c                        |   7 ++
 tests/tracetool/simple.c                     |  12 +--
 tests/tracetool/syslog.c                     |  10 +-
 tests/tracetool/ust.c                        |  10 +-
 trace/control-target.c                       |  29 ------
 trace/control.c                              |  19 +---
 trace/ftrace.c                               |   3 +-
 trace/qmp.c                                  |  47 +++------
 trace/simple.c                               |   9 +-
 hw/display/trace-events                      |   2 +-
 hw/xen/trace-events                          |   4 +-
 scripts/tracetool/__init__.py                |  32 ++----
 scripts/tracetool/backend/__init__.py        |   7 +-
 scripts/tracetool/backend/dtrace.py          |   2 -
 scripts/tracetool/backend/ftrace.py          |   8 +-
 scripts/tracetool/backend/log.py             |  22 ++--
 scripts/tracetool/backend/simple.py          |   9 +-
 scripts/tracetool/backend/syslog.py          |   6 +-
 scripts/tracetool/format/c.py                |  68 ++++++-------
 scripts/tracetool/format/d.py                |   3 -
 scripts/tracetool/format/h.py                |  48 ++++-----
 scripts/tracetool/format/log_stap.py         |   3 -
 scripts/tracetool/format/rs.py               |  30 +++---
 scripts/tracetool/format/simpletrace_stap.py |   3 -
 scripts/tracetool/format/stap.py             |   3 -
 scripts/tracetool/format/ust_events_c.py     |   3 -
 scripts/tracetool/format/ust_events_h.py     |   7 +-
 target/hppa/trace-events                     |  28 +++---
 tests/tracetool/all.d                        |  10 ++
 tests/tracetool/all.log-stap                 |  15 +++
 tests/tracetool/all.rs                       |  98 ++++++++++++++++++
 tests/tracetool/all.simpletrace-stap         |  16 +++
 tests/tracetool/all.stap                     |  14 +++
 tests/tracetool/all.ust-events-c             |  14 +++
 tests/tracetool/all.ust-events-h             |  56 +++++++++++
 tests/tracetool/dtrace.rs                    |   6 +-
 tests/tracetool/ftrace.rs                    |  10 +-
 tests/tracetool/log.rs                       |  12 ++-
 tests/tracetool/meson.build                  |   4 +-
 tests/tracetool/nop.rs                       |  51 ++++++++++
 tests/tracetool/simple.rs                    |   6 +-
 tests/tracetool/syslog.rs                    |  10 +-
 tests/tracetool/tracetool-test.py            |  12 ++-
 65 files changed, 747 insertions(+), 454 deletions(-)
 create mode 100644 tests/tracetool/all.h
 create mode 100644 tests/tracetool/nop.h
 create mode 100644 tests/tracetool/all.c
 create mode 100644 tests/tracetool/nop.c
 create mode 100644 tests/tracetool/all.d
 create mode 100644 tests/tracetool/all.log-stap
 create mode 100644 tests/tracetool/all.rs
 create mode 100644 tests/tracetool/all.simpletrace-stap
 create mode 100644 tests/tracetool/all.stap
 create mode 100644 tests/tracetool/all.ust-events-c
 create mode 100644 tests/tracetool/all.ust-events-h
 create mode 100644 tests/tracetool/nop.rs

-- 
2.56.0


