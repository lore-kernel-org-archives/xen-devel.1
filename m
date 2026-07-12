Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF892C43458
	for <xen-devel@archiver.kernel.org>; Sun, 12 Jul 2026 16:17:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1361182.1613614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiwrw-0002uQ-G0; Sun, 12 Jul 2026 16:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361182.1613614; Sun, 12 Jul 2026 16:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiwrw-0002uJ-D6; Sun, 12 Jul 2026 16:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1361182;
 Sun, 12 Jul 2026 16:17:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bblank@thinkmo.de>) id 1wiwru-0002uD-Fi
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:17:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiwrt-004WvV-4R
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 18:17:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bblank@thinkmo.de>)
 id 6a53bde0-5cb7-0a2a0a5109dd-0a2a4509ea18-26
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 18:17:25 +0200
Received: from [162.55.237.202] (helo=mail.thinkmo.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <bblank@thinkmo.de>)
 id 6a53be14-b440-0a2a45090019-a237edcaa0a0-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 18:17:24 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.thinkmo.de (Postfix) with ESMTP id 4gyrLr4rBkzyf1;
 Sun, 12 Jul 2026 16:17:24 +0000 (UTC)
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Wi6snuOvNhC; Sun, 12 Jul 2026 16:17:24 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de
 [IPv6:2a01:4f8:271:3f5c:0:22:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by mail.thinkmo.de (Postfix) with ESMTPS id 4gyrLr49LJzyZr;
 Sun, 12 Jul 2026 16:17:24 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail202312 header.d=thinkmo.de header.i="@thinkmo.de" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:From:Date:Received:Received"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thinkmo.de; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail202312; t=1783873044; bh=2Yk
	THO+c8W8ArBOBPzv0PE/7ai2ymP/Klh7FBU8dV2g=; b=aFO4SbV9QoH1FiNAT6C
	0ZLek7Ve6F/8xKORmGviM/P+fxd926EGkgLj0J9pSfMce+a3T6vELgUJK7iIuBkb
	+kNiBj3NzL4qsJb4dj2Fg1oRl5zJAdcILnxNtSn8pcBjiM86FpocHDKtmT/mZWL5
	G3GmimfhDaGne5cdL/5xwKVPs9gBt7FHCC9Ce+Dpn06LU28Ci10rwXfp4LnE5TrG
	SYpYMGVn2VrsKoylR3eiCuyn7iGRht1+R9xPDQIhCC02poE/8Gif8h6fnnUZzef3
	s4fAKQJ+Xtx1ZGsSODHWUdo6V6+GFw0uMoqWTQTX1cOUFXOO4xIDjBkyZgwIGaUL
	2hQ==
X-Virus-Scanned: Debian amavis at 
Date: Sun, 12 Jul 2026 18:17:21 +0200
From: Bastian Blank <bblank@thinkmo.de>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata()'
Message-ID: <5hndddlv4aaa2szgnsfpor4shbfr3tolegiz7w6izqi26vche6@qnhcwjjiy5sc>
Mail-Followup-To: Bastian Blank <bblank@thinkmo.de>, 
	Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
 <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
X-purgate-ID: tlsNG-bad1c0/1783873045-54B78A0B-F5D7E2E2/0/0
X-purgate-type: clean
X-purgate-size: 729

On Sun, Jul 12, 2026 at 02:04:44PM +0000, Dmytro Prokopchuk1 wrote:
> +       Clash between hypfs_alloc_dyndata() function and macro names is allowed
> +       because the macro is a typed convenience wrapper around the size-based
> +       allocation function.

Is this really the whole reason for this?  The macro is a wrapper to the
function, so it must be named the same?

If there is a deeper meaning, this should be documented here.  Looking
at the current code, there is no documention at least in the code
directly.  And the function is used once?!?

Bastian

-- 
... The prejudices people feel about each other disappear when they get
to know each other.
		-- Kirk, "Elaan of Troyius", stardate 4372.5

