Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595CE60A260A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=hYrsICLq
Received: from list by lists.xenproject.org with outflank-mailman.1464937.1675871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSfL-0007zg-Fl; Thu, 29 Oct 2026 16:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464937.1675871; Thu, 29 Oct 2026 16:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSfL-0007zZ-CT; Thu, 29 Oct 2026 16:07:47 +0000
Received: by outflank-mailman (input) for mailman id 1464937;
 Thu, 29 Oct 2026 16:07:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1886abd5a000f79f@swg.vates.tech>)
 id 1xMSfK-0007zT-Gb
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 16:07:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMSfJ-0076jM-If
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 17:07:45 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1886abd5a000f79f@swg.vates.tech>)
 id 6ae36f4d-bab6-0a2a0a5309dd-0a2a450ac2a2-8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 17:07:45 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1886abd5a000f79f@swg.vates.tech>)
 id 6ae36f51-f2d2-0a2a450a0019-b9ff1c229aaf-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 17:07:45 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1886abd5a000f79f.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 16:07:39 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 76C79829AA;
 Thu, 29 Oct 2026 17:07:38 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=jo9yEpFO5ky6kKPW38eVYVqfizMOrnDFcU5fX9kwinY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=hYrsICLqTHcQBV9Baiu4PYfab/hZ152AbdgxSuhuOu3jver4TKuA6E7Wkr3aa0wTTIaDF0kDG
 BRs5AcjCA2rUQSG1gjOH5nsPG6xPRyTrA9cIV7hcb1WXNYWzCiGIZcHM62UP6UrOukUSNpk/G2I
 LmdQs/26zwoakPgO55TMn4cqgFNaGiTcZU921aKauKE0d1RifykposMXZ1raQW5BMBwxBY9MaxY
 5clj92DgBje0dLQ3I9JUKGZNZzUZ83hR3f57qTvRWJdxP5iVRQi8EyuiKEaUXB3TiiTVKldMtXn
 7OygW5VIDlHZafsdLgREbMeRHWDuBUcm4o+A+maUWO/w==
X-Zone-Loop: 4d17cd1e80436a00959933217d86e87d335cb668c9fe
x-campaign-type: default
x-transaction-id: f49396c6-6cbb-4f8d-9318-4fe48504373f
x-swg-uid: 01-90a8bba6-c9f7-47b1-bf04-727169f86843
X-Mailer: Sweego
Message-ID:
 <1793290059.8631fc262581453bbf619ec5b2062170.1a1886abd5a000f79f@vates.tech>
x-swg-bid: 1793290059.8631fc262581453bbf619ec5b2062170.1a1886abd5a000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/6] automation/qtb: add QTB framework README
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1fcacfcb-2775-4a4f-ac38-d7ed9a143e99@gmail.com>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@vates.tech>
 <1fcacfcb-2775-4a4f-ac38-d7ed9a143e99@gmail.com>
Date: Thu, 29 Oct 2026 17:07:32 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793290052; l=3698;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=NiFKFYGFyVJwlRFNrCbl48tJrpDfI3ZIzTM0brlawqQ=;
 b=Yo07ydvF8D4qYU/1EmVlws9FCSLFGs8v9TWLQCzLUextKhVosBSGzkX3VTix/DJ5bhuU7Mla2
 eka6z095VwdCBDERVc9CsPibczVhDN8V7q4ON45uQfADdNQGvabKP0t
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793290058572
X-purgate-ID: tlsNG-4011c0/1793290065-50ECACFC-14EC7620/0/0
X-purgate-type: clean
X-purgate-size: 3698
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-27 18:32 +0100, Oleksii Kurochko wrote:
>
>
> On 8/27/26 11:42 AM, Baptiste Le Duc wrote:
> > Document the qtb riscv64 test framework in a README.
>
> I understand that you are trying to introduce things so they could be
> traceble. But probaly it makes mentioned in cover letter or somewhere
> else that thre is README which probably should be read first for easier
> understanding of the patch series.

Agreed, v3's cover letter will point to the README as the place to
start.

Note that in v3 the framework will run with pytest: the CLI, config.yaml, the
<type>.yaml files and the timeout/attempts logic are gone, and the
README is rewritten accordingly. Answers on the points that still apply
below.

> > +  config.yaml                The machine catalog (shared across test types)
> > +  dts/                       Jinja2 device-tree templates (host, common)
>
> There is only one template, qemu-host.dts.j2, nothing "common".

Right, the README now only describes qemu-host.dts.j2.

> > +- `qemu.qtb`, QEMU's Python package (`python/` in the QEMU tree)
>
> qemu.qtb isn't in QEMU's python/ (it isn't upstream yet, as the cover
> letter says), so this sends people to the wrong place. Please point to
> the fork and the commit used by the container in patch 1, or better,
> say that the simplest way to get all prerequisites is that container,
> and show how to run a test in it with containerize.

Done: the README says it is not upstream, points to the fork and the
commit pinned in the container's dockerfile, and recommends the
container, with a new "Running in the container" section showing how to
build it and run the tests through containerize.

> > +Run from `automation/scripts/`, or give the full path from the Xen tree root
> > +(`./automation/scripts/qemu_smoke_riscv64.py ...`), which is what CI does.
>
> Neither works without QTB_BINARIES_DIR unless xen is copied to
> automation/scripts/qtb/riscv/binaries/ (see my reply to patch 3), and
> the README doesn't say where to put it.

There is no default location any more: the directory holding the xen
binary is given with a required --binaries-dir option, which the README
documents and the container example uses. A test run without it fails
at setup with an explicit message.

> > +`--log-dir` (run only) collects the QEMU process log, the qtest log, and each
> > +console as `con<N>.log`: `con0.log` is Xen's own console, the only one wired
>
> There is no qtest log: QtbMachine passes "-qtest-log none". The
> riscv64-qtest-<pid>.log file is QEMU's stdout/stderr; "qtest" comes
> from the machine name.

Right, the README now describes riscv64-qtest-<pid>.log as QEMU's
stdout/stderr, named after the machine.

> > +`config.yaml` is the machine catalog. `binaries:` are build artifacts resolved
> > +under `binaries/` (overridable with `$QTB_BINARIES_DIR`); absolute paths pass
> > +through.
>
> This reads as binaries/ at the top of the tree, while it is actually
> automation/scripts/qtb/riscv/binaries/.

Gone with --binaries-dir, see above.

> > +- `mmu_type` (default `sv48`): Xen host MMU type.
>
> See my reply to patch 2: Xen doesn't use this.

Right, Xen only reads mmu-type from dom0less guest nodes. I dropped it
for host in MachineConfig and in dts in v3.

> > +3. bound each wait by `timeout` seconds, retrying a timed-out wait up to
> > +   `attempts` times
>
> See my reply to patch 3: nothing is retried, attempts only multiplies
> the timeout.

attempts is gone in v3: console-test waits for each expected string
with a single timeout.

Thanks,
Baptiste

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

