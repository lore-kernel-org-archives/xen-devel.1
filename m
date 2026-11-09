Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73488606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 19:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=bMcOYkzJ
Received: from list by lists.xenproject.org with outflank-mailman.1480398.1684343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQVRk-0005pL-Ut; Mon, 09 Nov 2026 19:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480398.1684343; Mon, 09 Nov 2026 19:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQVRk-0005pE-S5; Mon, 09 Nov 2026 19:54:28 +0000
Received: by outflank-mailman (input) for mailman id 1480398;
 Mon, 09 Nov 2026 19:54:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=985f=I7=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 1xQVRi-0005p8-LF
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 19:54:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQVRh-00AZGT-IK
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 20:54:25 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <SRS0=985f=I7=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 6af224f1-e002-0a2a0a5209dd-0a2a45089834-0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 20:54:25 +0100
Received: from [121.127.44.73] (helo=smtp.forwardemail.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <SRS0=985f=I7=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 6af224f0-f659-0a2a45080019-797f2c493c51-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 20:54:25 +0100
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-9986f6528fdso1118194241.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:54:20 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fe-953a8a3ca9 header.d=ubuntu.com header.i="@ubuntu.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: Content-Type: Cc: To: Subject: Message-ID:
 Date: From: In-Reply-To: References: MIME-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1794254064;
 bh=IOCFYNciQHvtx08cpYRCyLbxi38Uywvz020WtE4frjk=;
 b=bMcOYkzJGLA2pSUTO8dtuiuMAWBAolUJEhYUPBUelJuPvKIPoW2o+igW7akFxKBdSaD/Mvxt2
 4ZO9kqx/O9WFmdEi8IrImId5/nprBZxQEDlLhDHXTXCtTwEFU1ymfQK72oceCtD4Lu8PvCgVyLJ
 lexDwyZih3FTv1O42j40TC9joJdWZ9gH7fo4xzTXgN1WgWoveN3fS11qQSwck/A/9rNlKKWfCid
 BUIb71oYdkJVkGFvF894Ekb6s0+Lrx46f+ubh5uFuQFX2rHqugpe6URC/kNn7glfadMkKVQI8yK
 7gP9p4NEOu5X6zaprVZ6N/Md6KSpvgeHyMJUmMp3B45w==
X-Forward-Email-ID: 6af224ed8d9afc9f40a4fd84
X-Forward-Email-Sender: rfc822; enr0n@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.18
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Gm-Message-State: APuU4Z+dwp5OuMjnxgwwCI8q4V4tBdcgZHOwRa/1EmGmZSvBne5MgNW4
	43PAMnjdIaW6tX+vXHdF2YqrK/cux1Pv0GTbu1qqeqT+ONNWToNCXxYdtUh3ZB/osh1b0M+j5RR
	jjlvi5BelcYhOAYxAavVWjfK5E8DBb0sNCV3fzuV6TcWgIaJJXWAVZVF0wkeGgUgN+L3Rsvu1II
	E5+ZBz4lqv8D+Rv2pq/xE30uV/XSVojCVylnS5SS1V9JDlp/RFlyGhLUnCa2o=
X-Gm-Gg: AYBFou22O6bnDla4j7Oje0Hs8zKCZSsOCjbkXDE5s6gxxGnma8KdipZTJNbK2dteGyR
	jtqvjUKxeohYT/cuUaWwgnklzqLoW07NVVXQg4A5kVx1bmDBGXMBmxv/fVT/7UU33CwQ6pWWhrz
	W8ZBCc6GTYa4YOaJwAhDCETeaBkaxj02fHL18V/Hjz+LArRNrmvUqH4zQ=
X-Received: by 2002:a05:6102:149d:b0:7cb:bd9b:4873 with SMTP id ada2fe7eead31-7d30111d350mr200843137.21.1794254059927;
        Mon, 09 Nov 2026 11:54:19 -0800 (PST)
X-Received: by 2002:a05:6102:149d:b0:7cb:bd9b:4873 with SMTP id
 ada2fe7eead31-7d30111d350mr200840137.21.1794254059730; Mon, 09 Nov 2026
 11:54:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106231526.482418-1-jason.andryuk@amd.com> <20261106231526.482418-4-jason.andryuk@amd.com>
In-Reply-To: <20261106231526.482418-4-jason.andryuk@amd.com>
From: Nick Rosbrook <enr0n@ubuntu.com>
Date: Mon, 9 Nov 2026 14:54:08 -0500
X-Gmail-Original-Message-ID: <CAEN5XSEMV0TaDmJGDtgr3qqBSVsNEvTAwCod33_nR_30+OE8LA@mail.gmail.com>
X-Gm-Features: AclHuK8655NMtlE3Zag2nV3trwLE63OlWXNbCPyvA5ZE8NPYqQJA4mcVhU0oclU
Message-ID: <CAEN5XSEMV0TaDmJGDtgr3qqBSVsNEvTAwCod33_nR_30+OE8LA@mail.gmail.com>
Subject: Re: [PATCH 3/4] tools/libxl: add emulated TPM support backed by swtpm
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	George Dunlap <gwd@xenproject.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1794254065-CD74B87B-16760373/0/0
X-purgate-type: clean
X-purgate-size: 1496
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 6:15=E2=80=AFPM Jason Andryuk <jason.andryuk@amd.com=
> wrote:
>
> Add support for an emulated TPM.  QEMU emulates the device and uses
> swtpm for the backend.  swtpm is started first and QEMU connects to it.
>
> Add the xl.cfg options are:
> tpm_version
> tpm_statedir
> tpm_statefile
> tpm_interface
> tpm_loglevel
> tpm_swtpm_override
>
> When tpm_version is absent, no TPM is configured.  tpm_version must be 1
> or 2, and exactly one of tpm_statedir or tpm_statefile must be
> specified.  tpm_statefile is only supported for swtpm 0.7 and later, so
> tpm_statedir is provided for compatiblity.  tpm_interface can be either
> tis or crb.  tpm_loglevel is passed to swtpm when non-zero, with swtpm
> logging to /var/log/xen/swtpm-<domain>.log.  tpm_swtpm_override specifies
> the swtpm executable path; otherwise swtpm is found via PATH.
>
> On x86, TPM 1.2 only supports TIS, while TPM 2.0 may use either and
> defaults to CRB.
>
> libxl typically tracks spawned daemons through xenstore keys - like QEMU
> writing its "state" key as "running".  swtpm does not write to
> xenstores, so that is not used.  Instead the daemon is launched first
> and then QEMU launches and connects to it.  If there is a failure,
> the QEMU log messages will list tpm in the error message.
>
> `interface` is a Go keyword, so the binding generator needs to specify
> that.
>

For the tools/golang changes:

Acked-by: Nick Rosbrook <enr0n@ubuntu.com>

