Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C814C433EF
	for <xen-devel@archiver.kernel.org>; Thu, 12 May 2022 14:52:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.327808.550696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npAAb-0002o0-VD; Thu, 12 May 2022 14:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327808.550696; Thu, 12 May 2022 14:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npAAb-0002nt-R0; Thu, 12 May 2022 14:52:01 +0000
Received: by outflank-mailman (input) for mailman id 327808;
 Thu, 12 May 2022 14:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QW/r=VU=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1npAAa-0002nl-As
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 14:52:00 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b0ce3ff-d203-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 16:51:48 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1npAAW-00033H-38; Thu, 12 May 2022 15:51:56 +0100
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
X-Inumbo-ID: 0b0ce3ff-d203-11ec-8fc4-03012f2f19d4
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <25213.7948.2636.838505@chiark.greenend.org.uk>
Date: Thu, 12 May 2022 15:51:56 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] osstest: update Debian Buster install CD media to 10.12
In-Reply-To: <20220502151448.19578-1-roger.pau@citrix.com>
References: <20220502151448.19578-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH] osstest: update Debian Buster install =
CD media to 10.12"):
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

Is this just a routine update, OOI, or was this to fix something ?

Thanks,
Ian.

