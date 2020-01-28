Return-Path: <SRS0=JAFy=3R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB8FC2D0DB
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jan 2020 17:01:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2694820663
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jan 2020 17:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2694820663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUEM-0002nf-7u; Tue, 28 Jan 2020 17:00:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwUEK-0002nQ-Dl
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:00:48 +0000
X-Inumbo-ID: ba3e310e-41ef-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba3e310e-41ef-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 17:00:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 23A0EAE9A;
 Tue, 28 Jan 2020 17:00:46 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200128154614.30572-1-olaf@aepfle.de>
 <20200128165910.tjbumoo4pngbmufx@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9564e89c-38e2-cf21-1ce6-6cc027d9809b@suse.com>
Date: Tue, 28 Jan 2020 18:00:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128165910.tjbumoo4pngbmufx@debian>
Content-Language: en-US
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
 Julien Grall <julien@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNzo1OSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAyOCwgMjAy
MCBhdCAwNDo0NjoxNFBNICswMTAwLCBPbGFmIEhlcmluZyB3cm90ZToKPj4gVGhlIGFycmF5IGlz
IG5hbWVkIG1zcl9wb2xpY3kuCj4+Cj4+IEZpeGVzIGNvbW1pdCA2MDUyOWRmZWNhMQo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4gCj4gQWNrZWQtYnk6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQmFja3BvcnQ6IDQuMTIrCgpXaHk/IFRoaXMga2luZCBv
ZiBhIGNoYW5nZSBoYXJkbHkgd2FycmFudHMgYSBiYWNrcG9ydCBpbW8uCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
