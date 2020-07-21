Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF28C433E3
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 11:27:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02AB20658
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 11:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="OG55sptU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02AB20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxqQO-0002EQ-IG; Tue, 21 Jul 2020 11:27:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gK6X=BA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxqQO-0002EK-4L
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 11:27:08 +0000
X-Inumbo-ID: 1bb2517a-cb45-11ea-a0a0-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bb2517a-cb45-11ea-a0a0-12813bfff9fa;
 Tue, 21 Jul 2020 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595330827;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=knBH4Wq7fTbG0g3Y0Gjxljh4vvw18WcLtVeKIt6upK0=;
 b=OG55sptUenZeYLccEXcHZ/w3FIwFc6vCnYU9p2d3sEkXYOtwbXQrN8Ir
 ES4KthaHTcAv8drdk/VfhalgLnGwDceUMdwZv/m/65tyI5B0N+L9IPBp2
 VS9U3qWUgrKtSWs1BfsGou7+S9PpCkb4a0Q8AxV+CkeHc5lD4LZ3Wdppr Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qga5tWolNgSk0o0DOp7bexDU1g8wpC7XCDftGL5zwn7Qytwf7ufpAoY6kaDmhiLnXcsx8Gwbio
 2lH00iQKt3ymcwe12AP6Y0NOxx94nACWFZnjvygio8VwZ4hp3bUFOOuoAAIIURkdDHZF0VKn6l
 KmQzrNJ7OKd+PBIdyX0aZb+yVHvvTgG+MwjE9sytNoltIBI8Lko8YXQlDBa/mVokYSWrjmmqV9
 eDDlBayy7jdE57rkSatYIW+26w+E08z/pzilR6eoQDbVmYjjf+s2Da0FdFRLQqV6B/Tvr/hX6u
 Bu0=
X-SBRS: 2.7
X-MesageID: 23158730
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23158730"
Date: Tue, 21 Jul 2020 13:27:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/S3: put data segment registers into known state upon
 resume
Message-ID: <20200721112700.GN7191@Air-de-Roger>
References: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "M. Vefa Bicakci" <m.v.b@runbox.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 20, 2020 at 05:20:15PM +0200, Jan Beulich wrote:
> wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
> wakeup_start did set it to, and %gs at whatever BIOS did load into it.
> All of this may end up confusing the first load_segments() to run on
> the BSP after resume, in particular allowing a non-nul selector value
> to be left in %fs.
> 
> Alongside %ss, also put all other data segment registers into the same
> state that the boot and CPU bringup paths put them in.
> 
> Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wouldn't mind if the added chunk was placed before loading %ss, so
that the context of what's in %eax would be clearer.

Roger.

