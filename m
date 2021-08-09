Return-Path: <SRS0=iN5S=NA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F00C4338F
	for <xen-devel@archiver.kernel.org>; Mon,  9 Aug 2021 16:06:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C5D560E76
	for <xen-devel@archiver.kernel.org>; Mon,  9 Aug 2021 16:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C5D560E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.165060.301646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD7nI-0001V1-17; Mon, 09 Aug 2021 16:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165060.301646; Mon, 09 Aug 2021 16:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD7nH-0001Uu-TN; Mon, 09 Aug 2021 16:06:27 +0000
Received: by outflank-mailman (input) for mailman id 165060;
 Mon, 09 Aug 2021 16:06:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gMyi=NA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mD7nH-0001Uo-2x
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 16:06:27 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d56706fd-fc20-4254-b296-f1217ba90d7a;
 Mon, 09 Aug 2021 16:06:26 +0000 (UTC)
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
X-Inumbo-ID: d56706fd-fc20-4254-b296-f1217ba90d7a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628525186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tuV4DCFslchSmpufH8gSP8UJv3df1hR2FfnxWxuXGmA=;
  b=eX/q27XKn1dkpMq6nRtzEOUUgFw0GQVqmrnM2q1igjq4hLhxf0XN7PwF
   bxCPt5dHp83lgBgC2VF58Jghhazplke8bz5O0e8XojEk4ORfD21mZNcCX
   uUnz1SCRfISjoJca9IMS0wVBt4+2o9NXwsu6ZeIgS2W0vt5ZJ+227M+O1
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uOnFCrcD17Iq35BzksWXAiJrIEC7v6Ql5ZjKuUQLhAGyMH7B9Kt3VbBFPAeIm+2m2vcrZaIfce
 AgtXj5h0DFlyOGSEsy/cw8c2Rww3qF/6JmLsFfU05TAjSUkJ4FS8Rk8AOQTQ4D7wVyxxvoi7YC
 oEEz/I9pzJTkv26tYQ8oxIxqonyiCaQwtpfJPdY4S8iA6iLw2lYyX+sKKT2VqGW84rlgg9sfma
 Yg/Ot+gq5DhHENlmVv1cm2CRQ8v+WjhpFmPJb2FtWSgxAiHCwSZf3rdnuUSYnqV1eZN42opvte
 SRgS4+PM0SGrheokCgb9zfc3
X-SBRS: 5.1
X-MesageID: 50076521
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Z/sSNq02qzggG+wbIUVwpAqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.84,307,1620705600"; 
   d="scan'208";a="50076521"
Date: Mon, 9 Aug 2021 17:02:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 25/31] build: remove unneeded deps of x86_emulate.o
Message-ID: <YRFRgq+h72Zenpum@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-26-anthony.perard@citrix.com>
 <1e337c91-4380-7a9b-8969-f326a9680e08@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1e337c91-4380-7a9b-8969-f326a9680e08@suse.com>

On Fri, Aug 06, 2021 at 06:06:37PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:10, Anthony PERARD wrote:
> > Those two dependencies already exist so make doesn't need to know
> > about them. The dependency will be generated by $(CC).
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Unless I'm mistaken this was actually an omission by 68b1230ae393
> ("Auto-build dependency files in hypervisor build tree"), which
> would again suggest this can go in independently of all of the
> earlier patches? In any event

That sound right. Yes.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

-- 
Anthony PERARD

