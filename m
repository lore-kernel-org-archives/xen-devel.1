Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75822C432C0
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 14:52:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 464DA20684
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 14:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 464DA20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9XY-0001lM-ED; Tue, 03 Dec 2019 14:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic9XX-0001lG-Rp
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:52:35 +0000
X-Inumbo-ID: 8a7ccd0c-15dc-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a7ccd0c-15dc-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 14:52:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55B52BD6B;
 Tue,  3 Dec 2019 14:52:34 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-7-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6da5cf63-3db8-f16f-7236-3e28683178ec@suse.com>
Date: Tue, 3 Dec 2019 15:52:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191130115737.15752-7-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 6/8] x86: switch xen guest implementation
 to use hypervisor framework
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTEuMjAxOSAxMjo1NywgV2VpIExpdSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KYWdhaW4gd2l0aCBvbmUgbW9yZSByZW1hcms6Cgo+IEBAIC0zMjYsNiArMzEw
LDMxIEBAIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKPiAgICAgICAgICBwdl9jb25zb2xl
X2luaXQoKTsKPiAgfQo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyB4
Z19vcHMgPSB7CgpBbG9uZyB3aXRoIG90aGVyIHN0YXRpYyB2YXJpYWJsZSBub3QgaGF2aW5nIGFu
IHhnXyBwcmVmaXgsCnRoaXMgb25lIGNvdWxkIGxvc2UgaXRzIG9uZSwgdG9vLiBCdXQgSSdtIG5v
dCBnb2luZyB0byBtYWtlCnRoaXMgYSByZXF1aXJlbWVudC4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
