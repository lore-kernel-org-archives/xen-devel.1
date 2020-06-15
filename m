Return-Path: <SRS0=hCD3=74=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0BAC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 11:14:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F98420679
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 11:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F98420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkn3k-0008OM-Fr; Mon, 15 Jun 2020 11:13:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkn3j-0008OH-9w
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 11:13:47 +0000
X-Inumbo-ID: 46f2113a-aef9-11ea-b7f4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46f2113a-aef9-11ea-b7f4-12813bfff9fa;
 Mon, 15 Jun 2020 11:13:45 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wYF8SK23NpXxXejiOJZOEZcReX0/O3yWik1Wb1AfZcpU8FlPW9D3HKTDuaKh0fAyjtVciPJCPn
 7izEINcpXMHOdyk/0RMg25MpSqnDjpkmI13NzLtadkozNPuCFddMiy8VoYTRn9JX2oTMQ+AGaJ
 VbIdIhkk/z3Mm2hoPR8bbQh9n/FNbbA19MgNAXRFCuv+jVzP4eh056x6ByBxjw++c/CsCH+GRO
 8DtpjWzuWK2eSwcyJZJ1G1PK6NzrC0EFt5ZZTKG3Fqxqd+ZyNFBeXgk7YsGZm5pWZpuCPBtEk6
 kdk=
X-SBRS: 2.7
X-MesageID: 20060624
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20060624"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.22498.780976.930384@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 12:13:38 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation
 of microcode load operation
In-Reply-To: <001001d640dc$db8704d0$92950e70$@xen.org>
References: <1591980255-18811-1-git-send-email-igor.druzhinin@citrix.com>
 <24291.45845.782250.165305@mariner.uk.xensource.com>
 <001001d640dc$db8704d0$92950e70$@xen.org>
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, 'Paul
 Durrant' <xadimgnik@gmail.com>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation of microcode load operation"):
> > -----Original Message-----
> > From: Ian Jackson <ian.jackson@citrix.com>
> > Paul, would you Release-ack a patch that replaced every `return errno'
> > with (say) exit(12) ?
> 
> Why 12?

I tend to use 12 to mean `things went wrong'.  1 is a poor choice for
this because you want to use smaller numbers for less severe errors
and you want some space for things like "everything went OK but the
thing you asked me to delete already didn't exist" or "I compared
these files like you asked, and they are different".

> >  Otherwise, fixing this program not to try to
> > fit errno into an exit status is future work.  Also I notice that the
> > program exits 0 if invoked wrongly.  Unhelpful!  I would want to fix
> > that too.
> 
> Agreed that is unhelpful. I'm happy in principle to release-ack
> something replacing the returns with exits.

Thanks,
Ian.

