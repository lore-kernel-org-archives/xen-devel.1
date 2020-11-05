Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68363C4741F
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 15:47:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1C4206FA
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 15:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="G8rMPk8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1C4206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19876.45337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahTu-0004af-8z; Thu, 05 Nov 2020 15:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19876.45337; Thu, 05 Nov 2020 15:47:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahTu-0004aY-60; Thu, 05 Nov 2020 15:47:22 +0000
Received: by outflank-mailman (input) for mailman id 19876;
 Thu, 05 Nov 2020 15:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrWA=EL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kahTs-0004aQ-Vb
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:47:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3474a805-f8fe-4f4c-bfac-b91a82f71e78;
 Thu, 05 Nov 2020 15:47:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BrWA=EL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kahTs-0004aQ-Vb
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:47:21 +0000
X-Inumbo-ID: 3474a805-f8fe-4f4c-bfac-b91a82f71e78
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3474a805-f8fe-4f4c-bfac-b91a82f71e78;
	Thu, 05 Nov 2020 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604591239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b6odJvh8DlCnhNfFQ3oF4vb47s500VoLN4BYBUdo5pY=;
  b=G8rMPk8Ltwr9K8QIwDMm/0t8qY012SSR1E7C97ZMR7s5a+vuXH0QfvGg
   NFuh0Y2wUUIIxS90+A9UEzeIywiZO1V7Zfz4zEmt8IlAFouwZKRQGbeh2
   aIQd6m0vPpkUTyKYzCGQRTdw2A19+kaqiDcyOaVpu9cykntq+fKnumKTv
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: knRTjxOZvHCQKunLra8HzW35lbu22WBeWpLW61Z9kY5RqiNZ2Amik6DAszNAw/3lx1YIYn0OkV
 0VWy/8UwwqlObtibf3J3idpj6opkNoU2mxDLvQnmBEvC8I4wETTklJgxy4I8Ay3azqS5QLwah9
 N13TtusNNJyHPvtDM2pupBJ2jrVEhVsSQLDa3uWqM9wmLJ2AbrEQGY4o0HuUxHGilb/33qoFdV
 0B9zMQoF6yBZ97IXtk1HdDyuBgtFxLboqb/ttvhImCkc5ziZQUgORsc8huwQH8tJxBFmEN2Kcf
 0rU=
X-SBRS: None
X-MesageID: 30892731
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,453,1596513600"; 
   d="scan'208";a="30892731"
Date: Thu, 5 Nov 2020 15:41:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Takahiro Akashi <takahiro.akashi@linaro.org>, Alex Benn??e
	<alex.bennee@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	<ian.jackson@eu.citrix.com>, <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: BUG: libxl vuart build order
Message-ID: <20201105154147.GJ2214@perard.uk.xensource.com>
References: <CAB5YjtCwbvYMVg-9YXjSFtC8KvjkJuYhJFSCHrJaRUKfg4NHYA@mail.gmail.com>
 <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s>
 <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa>
 <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa>
 <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s>
 <20201030025157.GA18567@laputa>
 <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s>

On Fri, Oct 30, 2020 at 10:46:37AM -0700, Stefano Stabellini wrote:
> On Fri, 30 Oct 2020, Takahiro Akashi wrote:
> > === after "xl console -t vuart" ===
> > U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest
> > 
> > Xen virtual CPU
> > Model: XENVM-4.15
> > DRAM:  128 MiB
> > 
> > In:    sbsa-pl011
> > Out:   sbsa-pl011
> > Err:   sbsa-pl011
> > ===
> > 
> > If possible, I hope that "xl create -c" command would accept "-t vuart"
> > option (or it should automatically selects uart type from the config).
> 
> I think a patch to add the "-t" option to "xl create" would be
> acceptable, right Anthony?

I don't know. Why `xl' isn't able to select the vuart as the default one?

Maybe a long option would be better in the cases where we would like to
connect to a "secondary" console? I could see `xl create --console=vuart'
been fine, I don't know if that's possible.

-- 
Anthony PERARD

