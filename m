Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF3EC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 16:47:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783CA20738
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 16:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783CA20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgA4F-0000EM-JA; Tue, 02 Jun 2020 16:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7Yl=7P=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jgA4E-0000EG-Bn
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 16:47:10 +0000
X-Inumbo-ID: b30cbf4a-a4f0-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b30cbf4a-a4f0-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 16:47:09 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ujbwwpWRYI4lp6XtfnrvdBbGL8PHUQFdC6lxYSro5hgMQzPRoxte6LGxLr2HVq2m07FWCRNsuc
 VtEzJi2gRN/IJZSeAaPL4BHlDJBC6EQRE5DhOgPSN+u2PhjqNhBUKTDGO3j45ekqlIEQCtpl5Y
 9ISJUkrJjW544TAi68yi7SW1vPASFhpuog04d8hPR6BPAu789IAPEbXMlvcD89f8BVy8JusEY8
 wfAMKcLkC3fBUj7ZbTWeaybZeQXR8hMSVmxnSMBKdq/RqtLVFhFjesOKjVHMtSJ8cjWl2zMMo6
 mCg=
X-SBRS: 2.7
X-MesageID: 19789751
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,465,1583211600"; d="scan'208";a="19789751"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24278.33416.384684.587646@mariner.uk.xensource.com>
Date: Tue, 2 Jun 2020 17:47:04 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [[PATCH v2 for-4.14]] m4: use test instead of []
In-Reply-To: <20200602092447.GV1195@Air-de-Roger>
References: <20200602090138.28656-1-wl@xen.org>
 <20200602092447.GV1195@Air-de-Roger>
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 "paul@xen.org" <paul@xen.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("Re: [[PATCH v2 for-4.14]] m4: use test instead of []"):
> There's a double [] enclosure in the subject
> 
> On Tue, Jun 02, 2020 at 09:01:38AM +0000, Wei Liu wrote:
> > It is reported that [] was removed by autoconf, which caused the
> > following error:
> > 
> >   ./configure: line 4681: -z: command not found
> > 
> > Switch to test. That's what is used throughout our configure scripts.
> > Also put the variable expansion in quotes.
> > 
> > Signed-off-by: Wei Liu <wl@xen.org>
> > Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Fixes: 8a6b1665d987 ("configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS")
> > Signed-off-by: Wei Liu <wl@xen.org>
> 
> There's a double SoB ;)
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Pushed, thanks.

Ian.

