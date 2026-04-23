Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBD9F589DB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 14:48:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1292200.1570724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvLY-00048Y-Qs; Thu, 23 Apr 2026 14:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292200.1570724; Thu, 23 Apr 2026 14:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvLY-00048R-Nj; Thu, 23 Apr 2026 14:48:04 +0000
Received: by outflank-mailman (input) for mailman id 1292200;
 Thu, 23 Apr 2026 14:48:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbacfe0b3000f373@swg.vates.tech>)
 id 1wFvLX-00048J-Mn
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:48:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvLX-00BbIO-3Z
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:48:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbacfe0b3000f373@swg.vates.tech>)
 id 69ea311a-2eae-0a2a0a5409dd-0a2a4501845c-30
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:48:03 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbacfe0b3000f373@swg.vates.tech>)
 id 69ea3122-c1f2-0a2a45010019-b9ff1c2285a9-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:48:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbacfe0b3000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:47:58 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 21674873B3;
 Thu, 23 Apr 2026 16:47:58 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Wjam52wM4t5fu8hd5y0BF/RarPoTPN27K7lgxJnMIPI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=UZduqRR20nwRJmiN9CcpTBgYdRxY2oZ63RhcjSjxBUSE3gyUhca5N6EDDIuQFEzT0l9bJJzq7
 NYfe8UcRluB5nwDXlSNgDBRK2GZQf6pX28WO0eFVp8F1sVwMhO7RhvQabr9Y/coGItlW6OWE5sk
 Kn+GUqC967J8h1T2lxlgtFtFyr/nZgztBs/KbKE7HP9sP+mdrbS122dpnlpSyO5sE8mrd87/JQh
 0GFUnXUu3G6upzV0mHZt5Ldvpe+2lENmqmUpozUiOplIc3jfm0ev32LxfHSLQjqtDF2vdlJINAN
 rW1Qj+9aFxKHI3MUqtK6RkInReVvMR8YGcEmziAGb4Vg==
X-Zone-Loop: f71bce721eb1bad744635f2c584ac4462fc4330cfc57
x-campaign-type: default
x-transaction-id: e97d7f08-8e9c-4c73-ba48-479999152184
x-swg-uid: 01-264f490e-ffd8-46f0-b60b-b9301dad5ed6
X-Mailer: Sweego
Message-ID:
 <1776955678.8631fc262581453bbf619ec5b2062170.19dbacfe0b3000f373@vates.tech>
x-swg-bid: 1776955678.8631fc262581453bbf619ec5b2062170.19dbacfe0b3000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 23 Apr 2026 16:47:57 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Thierry Escande <thierry.escande@vates.tech>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] install.sh: Preserve symlinks in destination file
 system
References: <20260319165047.900047-1-thierry.escande@vates.tech>
 <c64842e7-9b13-4549-a57c-1a642d7e1803@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c64842e7-9b13-4549-a57c-1a642d7e1803@amd.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.273b.47cdd80120cedfb4.19dbacfde1a.a3521e772715a28a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955678234
X-purgate-ID: tlsNG-d62444/1776955683-BE265FF4-3B696FE4/0/0
X-purgate-type: clean
X-purgate-size: 1262

---=Part.273b.47cdd80120cedfb4.19dbacfde1a.a3521e772715a28a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 10:04:18AM -0400, Jason Andryuk wrote:
> On 2026-03-19 12:50, Thierry Escande wrote:
> > In various distros (i=2Ee=2E Debian), /lib is a symbolic link=2E The t=
ar
> > command in install=2Esh replaces the /lib symlink with a directory and
> > results in a non-functioning system=2E This has been introduced by the
> > installation of the systemd watchdog sleep script in /lib/systemd=2E
> >=20
> > This patch adds the tar option --dereference (-h for short) to preserv=
e
> > symlinks when extracting the dist archive=2E
> >=20
> > Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on=
 suspend/resume")
> > Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>=20
> Reviewed-by: Jason Andryuk <jason=2Eandryuk@amd=2Ecom>
> Tested-by: Jason Andryuk <jason=2Eandryuk@amd=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.273b.47cdd80120cedfb4.19dbacfde1a.a3521e772715a28a=---

