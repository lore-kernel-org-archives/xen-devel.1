Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDABBC9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 06:45:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433420.1654006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9zfW-0008Lq-63; Fri, 25 Sep 2026 06:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433420.1654006; Fri, 25 Sep 2026 06:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9zfW-0008Li-14; Fri, 25 Sep 2026 06:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1433420;
 Fri, 25 Sep 2026 06:44:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arnd@arndb.de>) id 1x9zfU-0008Lc-NL
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 06:44:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9zfT-000uh3-9w
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 08:44:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arnd@arndb.de>)
 id 6ab61834-e002-0a2a0a5209dd-0a2a4501e45c-42
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 08:44:23 +0200
Received: from [103.168.172.154] (helo=fhigh-a3-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arnd@arndb.de>)
 id 6ab61845-5984-0a2a45010019-67a8ac9aae17-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 08:44:22 +0200
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 33DC71400150;
 Fri, 25 Sep 2026 02:44:20 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
 by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 02:44:20 -0400
Received: by mailuser.ams.internal (Postfix, from userid 501)
 id 7288232A0087; Fri, 25 Sep 2026 02:44:14 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=arndb.de header.i="@arndb.de" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790318659;
	 x=1790405059; bh=NaZmI7t4xspdCcSwZ61TEkj8dOh5uZ/p24PV+ZMnDZw=; b=
	Nu0oj7UlIMonbzdFuiOnXEWPF2hJYzyzOAljnTNeALWZYE+crT5NlZVumdUphWuo
	RZfkszIAbYJ63RItV/vEeOiQ74DLVVtT9yETf+2AJF3Il3Eex3n0xgcWnaeuY6cY
	6wAQ652I4qv5mzSSgasKwoKYU+wCzLh52vxBQtMU0A1NGLzTkU08uoOOv1YJHDNS
	ckaCEp+UHTtrcaBH6hQjxny3jF7C9TpRGj0uTrpkGWUCUr66kKW6kP3H8y7Ud+l1
	gwVry7mP+a34dtogloyKtXCbn8Yshbn9oEBHJaRjbb4wzCv636+Ld2fSI4+wZHCL
	bp3lDOJZ7vw0Y/KnzuS3FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790318659; x=
	1790405059; bh=NaZmI7t4xspdCcSwZ61TEkj8dOh5uZ/p24PV+ZMnDZw=; b=B
	gM0Gyvv3PiGDCIXQOHuxl6hJHi3qhgh7HkwPgl/OcTXEjOB3+UqitNM84mISi+iz
	+ycfiYljhdmWBwO0wKZRXBfXuBfOqTioznIm+HWkfsKX23zU2Sb00pQljzDUbuIr
	HkCvLt+gVhdFM5OfjBUcWNpyOT7+RVLygdng5266IoTu+8jNHrxCxDIzdsBEBvPw
	++iA2YoJUtZuy7QvTTU1Uv+PgEFSueGgJvqQzKnpBprx9voPJ3rNvJQFKBk96l2m
	O0NqblZtGOUxFcZGNEIVKtIRSuIVTPDsCyZDqC1Ue/3ZAE0DCEy27p98K+Oq1l3t
	kwmxWfaZ1uuOee0Vrj96Q==
X-ME-Sender: <xms:Phi2apPO9ujYSIDasbhJpnMTzke4qSpbwvrwzhlkXuIAI7-cnSWZfw>
    <xme:Phi2amzawLOHn6D_TcxFB_sryNZBvDNGlXG3Mk5xGBUhjGYtjqB5YZpcBGi2Vvxu4
    LO4jainLSHlBfr9xfRwMoKueRag02HeC2zWkT5k5Me375Lln4hJE4Xm>
X-ME-Proxy-Cause: dmFkZTFwSDqkQ+iCgv9bfoZ7OnGDv2/E32uPE8Fd0Y8/G3hqdMfXKGBRJsqwYtMQUVYQrL
    6rBdD5WBkmP95rwBjb56UCQmEFVpH1MQeNf2EH79A9tcFirxDEH49FPSDtgesI6qTlZLhS
    FyGt8jwZs6/BRCK8WQBtj8/8wSniM5z0sAeYIZUw6RfTL0VgIo3U3fygtLYZE95pxCSHFZ
    WepR8wEVKtPNAYRuRFUV+Y6YLWfdH1/Sqbu3qA9d12FobAwCl+aIFvcISyJveD7NAd69ne
    nat+mzAMqvQmRT39Um5yv7DBEV4FS8+RYnZbN6r0+WRL47rc70az+oyh1zU2Ychr2GGWJK
    u2fZydkW07nhk+soJMbSuvqR99kgSdHxX+7M/qJVrV5nxIlqC/RPoPvuKCMjyhYck5Mn+f
    AdFbaAQW7BZ/q/bJBeQ9EqwX0ccvLKpZIf0UH39rOJ8ygTbhJoyyJz7XCaowgaxqDiq2/t
    d7BY1jleB6/ow+3+ojRHL8gX24SKUACYZjIQrd7G0Brdt9XWe0nPXJMcfi9IIQWoiFdlP5
    UsrXZxRyK7FVGTK3USyOhdqLn7j9uBACH1EQaZAZnz0Wxhmaz8p7Rx9+/rfD741yv1TZ5H
    xDqojH1YmlZuRqBLUIoKWOM7MzgbFiWpplx5yWj8NVeSv+K0ybsfoQUp/sgQ
X-ME-Proxy: <xmx:QBi2aks9cVmtVVgDWOpZQLMYJnnq0WiDCmfwfRCxnKtd462F6IWytw>
    <xmx:QBi2akh84Y1eWIqTMNJITEkMXmXRjN7zw_8ZM-RSgwQZXQSLDngT3Q>
    <xmx:QBi2aqZyKF1u83uvY6x5VtDegQdByG0waYvUbau_-OqIjkhMPjJFWg>
    <xmx:QBi2ajZsRH8i_I6LnZImUEKiEH8hyvZa7XSe454pHywC3zynHKSWFA>
    <xmx:Qxi2aoPDxdGsEJ87ytSqbbO4qDTPCBr6tYWu0Df0M_3PB94lWMJwcP_a>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Am_z2EeL-WEB
Date: Fri, 25 Sep 2026 08:43:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Juergen Gross" <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>
In-Reply-To: <202609241805.VsLzGPLn-lkp@intel.com>
References: <202609241805.VsLzGPLn-lkp@intel.com>
Subject: Re: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift to zero:
 expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1790318663-1E465757-9313D126/0/0
X-purgate-type: clean
X-purgate-size: 1059

On Thu, Sep 24, 2026, at 21:39, Dan Carpenter wrote:

>    489                          return -EFAULT;
>    490                  break;
>    491          case 2:
>    492                  if (copy_from_user(&m, udata, sizeof(struct 
> privcmd_mmapbatch_v2)))
>    493                          return -EFAULT;
>    494                  /* Returns per-frame error code in m.err. */
>    495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
>                                               ^^^^^^^^^^^^^^^^^^^^^^^
> These integer overflow bugs are from 2012, but I guess your patch 
> exposed
> the arm32 build to the zero day bot.  The bugs only affect 32bit 
> systems.

Right, the randconfig came up with an ARMv6 Xen build, which was not
possible before my patch. I'm sure this was reported for other configs
before and just showed up as introduced by my patch here.

This is clearly a bug but it does look harmless to me, as it only
results in the userspace corrupting itself when passing invalid
data.

      Arnd

