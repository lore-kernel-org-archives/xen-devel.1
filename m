Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D60C2D0C3
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 12:05:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60F6D2072B
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 12:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60F6D2072B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihY4m-00059A-Id; Wed, 18 Dec 2019 12:05:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihY4l-000595-6W
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:05:11 +0000
X-Inumbo-ID: 9eaa017e-218e-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9eaa017e-218e-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 12:05:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 73791B03E;
 Wed, 18 Dec 2019 12:05:01 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <d3fb2800517d79a422acc62628ad362f919824ea.1576630344.git.elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eaaffb6f-b2b1-f81e-8643-ccc238914e52@suse.com>
Date: Wed, 18 Dec 2019 13:05:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d3fb2800517d79a422acc62628ad362f919824ea.1576630344.git.elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/microcode: avoid unnecessary
 xmalloc/memcpy of ucode data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAwMjozMiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gQEAgLTcyNSw3ICs3
MDEsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBtaWNyb2NvZGVfaW5pdCh2b2lkKQo+ICAgICAgICov
Cj4gICAgICBpZiAoIHVjb2RlX2Jsb2Iuc2l6ZSApCj4gICAgICB7Cj4gLSAgICAgICAgeGZyZWUo
dWNvZGVfYmxvYi5kYXRhKTsKPiArICAgICAgICBib290c3RyYXBfbWFwKE5VTEwpOwoKQXMgbXVj
aCBhcyBJIGxpa2UgdGhlIGNoYW5nZSwgSSB3aG9sZWhlYXJ0ZWRseSBkaXNhZ3JlZSB3aXRoIHRo
aXMKYXNwZWN0IG9mIGl0OiBZb3UgbWFrZSBpdCBsYXJnZWx5IHVucHJlZGljdGFibGUgd2hlbiB0
aGUgYm9vdAptYXBwaW5ncyB3aWxsIGdvIGF3YXkgLSBpdCBiZWNvbWVzIGVudGlyZWx5IGRlcGVu
ZGVudCB1cG9uIGxpbmsKb3JkZXIuIEFuZCBvZiBjb3Vyc2Ugd2UgcmVhbGx5IHdhbnQgdGhlc2Ug
bWFwcGluZ3MgdG8gYmUgZ29uZSwKdGhlIHZlcnkgbGF0ZXN0IChJIHRoaW5rKSwgYnkgdGhlIHRp
bWUgd2Ugc3RhcnQgYnJpbmdpbmcgdXAgQVBzCihidXQgZ2VuZXJhbGx5IHRoZSBzb29uZXIgdGhl
IGJldHRlcikuIFRoaXMgaXMgKG9uZSBvZj8pIHRoZSBtYWluCnJlYXNvbihzKSB3aHkgaXQgaGFk
bid0IGJlZW4gZG9uZSB0aGlzIHdheSB0byBiZWdpbiB3aXRoLiBUaGUKYWx0ZXJuYXRpdmUgaXMg
bW9yZSBjb21wbGljYXRlZCAoc2V0IHVwIGEgcHJvcGVyLCBsb25nIHRlcm0KbWFwcGluZyksIGJ1
dCBpdCdzIGdvaW5nIHRvIGJlIG1vcmUgY2xlYW4gKGluY2x1ZGluZyB0aGUgbWFwcGluZwp0aGVu
IGFsc28gYmVpbmcgc3VpdGFibGUgdG8gcG9zdC1ib290IENQVSBvbmxpbmluZykuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
