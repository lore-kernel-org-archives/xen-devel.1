Return-Path: <SRS0=hCD3=74=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3A3C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 11:32:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AAB20663
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 11:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AAB20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jknLp-0001lP-IA; Mon, 15 Jun 2020 11:32:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jknLo-0001lK-A7
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 11:32:28 +0000
X-Inumbo-ID: e3bb8fb2-aefb-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3bb8fb2-aefb-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 11:32:27 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qZwCAiv/Kn5qj7A/xgprBXLybuJOS1Mv7kLf91iJYu84ToylJ48/+dVw0shWj7xEzHfHuMJYDh
 jWepxSu2L33EIKWZTk3KsWiOWkXUdImyUREjRoj4jZedu3cwv1JaeOqCRt8qX92EZnz6+gS7Ht
 7qK4rheI/bbJEukZ7WBMZxELabpCQL4INeUL4hmhd3pYJUuzWtT+bWpVWaUIMjT4+1/Rz1vBNN
 gTTuN9mSWq5xCLUja1UTiu6PsVOjWVpR2FRvP4aCCuXU4OUCnnMcPuaTwifmf1gyN9o1NNkkxO
 6dE=
X-SBRS: 2.7
X-MesageID: 20347109
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20347109"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.23621.756554.824238@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 12:32:21 +0100
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH 1/3] tools/libxl: Grant VGA IO port permission for
 stubdom/target domain
In-Reply-To: <87d74a21bde95cfc7c53fad56bf8f0e47724953e.1592171394.git.gorbak25@gmail.com>
References: <cover.1592171394.git.gorbak25@gmail.com>
 <87d74a21bde95cfc7c53fad56bf8f0e47724953e.1592171394.git.gorbak25@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Wei Liu <wl@xen.org>, "jakub@bartmin.ski" <jakub@bartmin.ski>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "j.nowak26@student.uw.edu.pl" <j.nowak26@student.uw.edu.pl>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "contact@puzio.waw.pl" <contact@puzio.waw.pl>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Grzegorz Uriasz writes ("[PATCH 1/3] tools/libxl: Grant VGA IO port permission for stubdom/target domain"):
> When qemu is running inside a linux based stubdomain, qemu does not
> have the necessary permissions to map the ioports to the target domain.
> Currently, libxl is granting permissions only for the VGA RAM memory region
> and not passing the required ioports. This patch grants the required
> permission for the necessary vga io ports.

Thanks.

I'm afraid I don't know much about this.

The code looks plausible, although there is a minor breach of official
libxl coding style in the use of `ret' rather than `r' for the xc
return values, and retuerning that value rather than a libxl error
code.  I wouldn't regard that as a blocker considering the state of
the surrounding code.

I see from SUPPPORT.md that graphics passthrough seems to be security
supported.  Frankly this seems very surprising to me.

Given that, I think we need a review from someone who understood
graphics passthrough.

I think that applies to all 3 of these patches.

Ian.

