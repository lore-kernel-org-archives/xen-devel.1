Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10410C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 15:27:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C3720801
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 15:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C3720801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjla1-0003Zl-T9; Fri, 12 Jun 2020 15:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjla1-0003Zg-AA
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:26:53 +0000
X-Inumbo-ID: 23c4b710-acc1-11ea-b5e1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23c4b710-acc1-11ea-b5e1-12813bfff9fa;
 Fri, 12 Jun 2020 15:26:52 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DI+pjL4dvpHEJgezwSfZX9iLTzdW2HCD4Sdh/UvCMgrnmIxNbmKyCLP+qYrOLAZHAPkx148IEa
 +sMK2qCoonwF4s8KfIKsbmRHx/IY6CIDo7zvPc66V+OLGPVtIybqCBd1rSalgm3M2L43HufPd4
 NJAj6voEeLUOAsZZ2UFJHIzfcLR0+XAazZEyqVcxi8JsJ5ix1no8wr/40Bu7nYBpuihx/XWFrM
 gqDtVsyWkhIpVZeZiMgjh0vD1PhWhIgjmMpaWcph01wDgAZfDhvc3atfasD+8qlAD+TA+yS/N1
 rqs=
X-SBRS: 2.7
X-MesageID: 19931883
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="19931883"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24291.40630.574838.139876@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 16:26:46 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
In-Reply-To: <20200610114004.30023-1-andrew.cooper3@citrix.com>
References: <20200610114004.30023-1-andrew.cooper3@citrix.com>
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
Cc: Juergen
 Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH for-4.14] tools: fix error path of xendevicemodel_open()"):
> c/s 6902cb00e03 "tools/libxendevicemodel: extract functions and add a compat
> layer" introduced calls to both xencall_open() and osdep_xendevicemodel_open()
> but failed to fix up the error path.
> 
> c/s f68c7c618a3 "libs/devicemodel: free xencall handle in error path in
> _open()" fixed up the xencall_open() aspect of the error path (missing the
> osdep_xendevicemodel_open() aspect), but positioned the xencall_close()
> incorrectly, creating the same pattern proved to be problematic by c/s
> 30a72f02870 "tools: fix error path of xenhypfs_open()".
> 
> Reposition xtl_logger_destroy(), and introduce the missing
> osdep_xendevicemodel_close().

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I notice that the tail of xendevicemodel_open is now identical to
xendevicemodel_close.  I think this is expected, and that it would be
better to combine the two sets of code.  If they hadn't been separate
then we might have avoided this bug...

Ian.

