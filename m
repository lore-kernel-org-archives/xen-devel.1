Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3237C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 18:07:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427852.1650608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8iQP-00059R-9B; Mon, 21 Sep 2026 18:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427852.1650608; Mon, 21 Sep 2026 18:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8iQP-00059K-6H; Mon, 21 Sep 2026 18:07:33 +0000
Received: by outflank-mailman (input) for mailman id 1427852;
 Mon, 21 Sep 2026 18:07:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rafael@kernel.org>) id 1x8iQO-00059E-9d
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 18:07:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8iQN-007iEg-JP
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 20:07:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rafael@kernel.org>)
 id 6ab17256-e002-0a2a0a5209dd-0a2a450886e0-32
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 20:07:31 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rafael@kernel.org>)
 id 6ab17262-f659-0a2a45080019-ac6904fec8f4-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 20:07:31 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CACEC60008
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C171F00893
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:07:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3a20f06cce6so1573581fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:07:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790014049;
	bh=CXAb4qXyR2HfG3h9rl85FbZFF/8Yznox3qCpzfz2vLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KwmKbVo0csnD4CmZHT5I4JlGgwZz0kbNccMAmxxOhOHxFof1fwqdDWo2aSHrIL53T
	 HAO53hejB/8hedynkRgQJII8/yNDXorvZeBIn1tfrR7s65FFWSCqnVWIL9oXfmXkv+
	 aLOOnoEZFsHPIBCd0J+UgcDbaBl8KE0UHXrOHWgAhXHSieOkx8oUCviTjMBIDlPf6+
	 hi0DlflroupOUR+NBkgrT2nXpmCVHtnP55A6gFCQ2uaT+YH9Q8/ivFFnVxcb5uyobo
	 x78vn1XquG/M9pbaoeXM8hoV2aE7KcgzdAg4Rr5P7EpAzAPQZ+CdmCK8GT2cfOmfbV
	 zHgC8tu/PMH4g==
X-Forwarded-Encrypted: i=1; AKwUvBwYL1lc1WrBOgCuY4djiVMyovqyGrEX7Wnq21lJIkf0icLei7vKUUrb+7vmjIxHz9eyOLGq4V3ZFSc=@lists.xenproject.org
X-Gm-Message-State: AFuF++ksGVGqDrR2wJBE/a2kTCx7eVjm4SX0rIIZYxGzknbu3k2LIFUz
	SAJIxUqTUP48/MYXPBOWIOwVwxDkaKFq1P7O+I4XV4vgrnIBL13EsILCoYzE6Ug/LmQSrwpZM3a
	UZQdT7AFdTWlY1x16uu0vcX8WaZm8p08=
X-Received: by 2002:a05:651c:a332:b0:3a3:61ec:43c2 with SMTP id
 38308e7fff4ca-3a624db5e2fmr1038641fa.19.1790014047909; Mon, 21 Sep 2026
 11:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <905771062.272724286.1789919301858.JavaMail.zimbra@trinity-net.com>
 <CAJZ5v0gg7kBtEhagR9SYKaPNstPC6aSyP7W4xBjP1r-kzbcH1A@mail.gmail.com>
 <arFe7-xa3HtCUOHs@mail-itl> <750088883.289173062.1790012799166.JavaMail.zimbra@trinity-net.com>
In-Reply-To: <750088883.289173062.1790012799166.JavaMail.zimbra@trinity-net.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 21 Sep 2026 20:05:57 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0geSD8ig9_kcrPZp9FEzF+Oh34HV4F_aqyGF89TYVjDzw@mail.gmail.com>
X-Gm-Features: AcwNN1V_NwSYYWm7WSWXzLbFIgtKPrMvHv-S_2NNL56zDEZOELuQBCN1u-UNlmU
Message-ID: <CAJZ5v0geSD8ig9_kcrPZp9FEzF+Oh34HV4F_aqyGF89TYVjDzw@mail.gmail.com>
Subject: Re: [REGRESSION] ACPI processor/cpuidle change in 6.18.52 breaks
 bare-metal Xen dom0 boot
To: Support TRINITY <support@trinity-net.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>, regressions <regressions@lists.linux.dev>, 
	linux-acpi <linux-acpi@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1790014051-D795A87B-4B8000C6/0/0
X-purgate-type: clean
X-purgate-size: 695

On Mon, Sep 21, 2026 at 7:46=E2=80=AFPM Support TRINITY <support@trinity-ne=
t.com> wrote:
>
> Hello,
>
> Thank you, this matches what I see on the affected Alpine Xen dom0
> systems.
>
> I also tested Linux 6.18.52 with processor=3Dnocst on the Linux kernel
>
> Result: it still fails with the same black screen before dom0 userspace
> and networking come up.
>
> Marek's trace looks consistent with the failure mode I isolated: the
> crash happens from acpi_processor_power_init() while registering the
> cpuidle device.

I think I know what the problem is, see

https://lore.kernel.org/linux-acpi/CAJZ5v0h4giv53a2mPvJYT=3DfvBTj7vVXs=3Db7=
+qC2Q2L35qSTOSA@mail.gmail.com/

