Return-Path: <SRS0=3NK1=YR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96448CA9EAF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Oct 2019 10:49:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685B720679
	for <xen-devel@archiver.kernel.org>; Thu, 24 Oct 2019 10:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 685B720679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNafv-00056w-Gr; Thu, 24 Oct 2019 10:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D++P=YR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNafu-00056h-Fi
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 10:49:02 +0000
X-Inumbo-ID: e30af062-f64b-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e30af062-f64b-11e9-a531-bc764e2007e4;
 Thu, 24 Oct 2019 10:49:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C9BBBBC20;
 Thu, 24 Oct 2019 10:48:59 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
 <20191023164837.2700240-2-anthony.perard@citrix.com>
 <1ef3e120-a68b-117a-e259-f3ec5a7945d0@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ca0bec60-0491-28c3-f416-75dc00f3fe71@suse.com>
Date: Thu, 24 Oct 2019 12:48:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1ef3e120-a68b-117a-e259-f3ec5a7945d0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 01/23] xen: Fix strange byte in
 common/Kconfig
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMTI6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjMvMTAvMjAxOSAx
Nzo0OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IEN1cnJlbnQgZGVzY3JpcHRpb24gb2YgdGhl
IGZpbGUgYnkgYGZpbGVgOgo+PiAgICAgIGNvbW1vbi9LY29uZmlnOiBOb24tSVNPIGV4dGVuZGVk
LUFTQ0lJIHRleHQKPj4KPj4gQ2hhbmdlIHRoYXQgYnl0ZSB0byBhbiBhc2NpaSBxdW90ZSBzbyB0
aGUgZmlsZSBjYW4gYmVjb21lIHByb3Blcmx5Cj4+IGVuY29kZWQsIGFuZCBhbGwgQVNDSUkuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gCj4gSSBzZWUgImFib3V0IFhlbn5ScyBleGVjdXRpb24iIGluIG1lbnVjb25maWcsIGFu
ZCB0aGlzIGlzIG5ldyBjb250ZW50IGluIAo+IDQuMTMgc28gd2FudHMgZml4aW5nLgoKQWdyZWVk
LgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
