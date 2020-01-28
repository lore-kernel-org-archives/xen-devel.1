Return-Path: <SRS0=JAFy=3R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171FBC2D0DB
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jan 2020 17:02:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E709C20663
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jan 2020 17:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E709C20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUFV-0002xv-39; Tue, 28 Jan 2020 17:02:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwUFU-0002xn-DY
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:02:00 +0000
X-Inumbo-ID: e5ea0fbc-41ef-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5ea0fbc-41ef-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 17:02:00 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwUFO-0005ML-Fb; Tue, 28 Jan 2020 17:01:54 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwUFO-0002cn-5R; Tue, 28 Jan 2020 17:01:54 +0000
Date: Tue, 28 Jan 2020 17:01:51 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128170151.x2xdb4hji6e6m7rd@debian>
References: <20200128154614.30572-1-olaf@aepfle.de>
 <20200128165910.tjbumoo4pngbmufx@debian>
 <9564e89c-38e2-cf21-1ce6-6cc027d9809b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9564e89c-38e2-cf21-1ce6-6cc027d9809b@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v1] x86/domctl: fix typo in comment
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDY6MDA6NDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDEuMjAyMCAxNzo1OSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFu
IDI4LCAyMDIwIGF0IDA0OjQ2OjE0UE0gKzAxMDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+ID4+IFRo
ZSBhcnJheSBpcyBuYW1lZCBtc3JfcG9saWN5Lgo+ID4+Cj4gPj4gRml4ZXMgY29tbWl0IDYwNTI5
ZGZlY2ExCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUu
ZGU+Cj4gPiAKPiA+IEFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gQmFja3BvcnQ6
IDQuMTIrCj4gCj4gV2h5PyBUaGlzIGtpbmQgb2YgYSBjaGFuZ2UgaGFyZGx5IHdhcnJhbnRzIGEg
YmFja3BvcnQgaW1vLgo+IAoKSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIGlmIHdlIGNhbiBrZWVw
IGl0IGluIHN5bmMsIGJ1dCBvZiBjb3Vyc2UgaXQgaXMKZmluZSB0byBub3QgYmFja3BvcnQgc3Vj
aCBmaXguCgpXZWkuCgo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
