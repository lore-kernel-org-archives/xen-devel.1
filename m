Return-Path: <SRS0=wQWC=4O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E8DC4BA10
	for <xen-devel@archiver.kernel.org>; Wed, 26 Feb 2020 13:02:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0ACF2467B
	for <xen-devel@archiver.kernel.org>; Wed, 26 Feb 2020 13:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0ACF2467B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6wKW-0005GB-E3; Wed, 26 Feb 2020 13:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6wKV-0005G5-Og
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 13:02:23 +0000
X-Inumbo-ID: 3a6aa313-5898-11ea-941b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a6aa313-5898-11ea-941b-12813bfff9fa;
 Wed, 26 Feb 2020 13:02:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E0EAB133;
 Wed, 26 Feb 2020 13:02:22 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200226121921.28627-1-roger.pau@citrix.com>
 <20200226121921.28627-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5b6caee-8307-e15a-6f54-abea9c8d5259@suse.com>
Date: Wed, 26 Feb 2020 14:02:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226121921.28627-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/4] x86: track when in NMI context
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzoxOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFkZCBoZWxwZXJz
IHRvIHRyYWNrIHdoZW4gcnVubmluZyBpbiBOTUkgaGFuZGxlciBjb250ZXh0LiBUaGlzIGlzCj4g
bW9kZWxlZCBhZnRlciB0aGUgaW5faXJxIGhlbHBlcnMuCj4gCj4gVGhlIFNETSBzdGF0ZXMgdGhh
dCBubyBOTUkgY2FuIGJlIGRlbGl2ZXJlZCB3aGlsZSBoYW5kbGluZyBhIE5NSQo+IHVudGlsIHRo
ZSBwcm9jZXNzb3IgaGFzIGV4ZWN1dGVkIGFuIGlyZXQgaW5zdHJ1Y3Rpb24uIEl0J3MgcG9zc2li
bGUKPiBob3dldmVyIHRoYXQgYW5vdGhlciBmYXVsdCBpcyByZWNlaXZlZCB3aGlsZSBoYW5kbGlu
ZyB0aGUgTk1JIChhICNNQwo+IGZvciBleGFtcGxlKSwgYW5kIHRodXMgdGhlIGlyZXQgZnJvbSB0
aGF0IGZhdWx0IHdvdWxkIGFsbG93IGZ1cnRoZXIKPiBOTUlzIHRvIGJlIGluamVjdGVkIHdoaWxl
IHN0aWxsIHByb2Nlc3NpbmcgdGhlIHByZXZpb3VzIG9uZSwgYW5kCj4gaGVuY2UgYW4gaW50ZWdl
ciBpcyBuZWVkZWQgaW4gb3JkZXIgdG8ga2VlcCB0cmFjayBvZiBpbiBzZXJ2aWNlIE5NSXMuCj4g
VGhlIGFkZGVkIG1hY3JvcyBvbmx5IHRyYWNrIHdoZW4gdGhlIGV4ZWN1dGlvbiBjb250ZXh0IGlz
IGluIHRoZSBOTUkKPiBoYW5kbGVyLCBidXQgdGhhdCBkb2Vzbid0IG1lYW4gTk1JcyBhcmUgYmxv
Y2tlZCBmb3IgdGhlIHJlYXNvbnMgbGlzdGVkCj4gYWJvdmUuCj4gCj4gTm90ZSB0aGF0IHRoZXJl
IGFyZSBubyB1c2VycyBvZiBpbl9ubWlfaGFuZGxlcigpIGludHJvZHVjZWQgYnkgdGhlCj4gY2hh
bmdlLCBmdXJ0aGVyIHVzZXJzIHdpbGwgYmUgYWRkZWQgYnkgZm9sbG93dXAgY2hhbmdlcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
