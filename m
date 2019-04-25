Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60A8C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:06:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF0E3206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF0E3206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbH9-0005k1-Mg; Thu, 25 Apr 2019 10:06:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbH8-0005js-OF
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:06:42 +0000
X-Inumbo-ID: d10bd726-6741-11e9-9420-bb81db310c45
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d10bd726-6741-11e9-9420-bb81db310c45;
 Thu, 25 Apr 2019 10:06:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 04:06:38 -0600
Message-Id: <5CC186A70200007800228F49@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 04:06:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904151515180.29275@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1904151515180.29275@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
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
Cc: Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425100631.hllbCY6f1KBhqhjMMMmcAdldrk34NCRet7S71FF_Je0@z>

Pj4+IE9uIDE2LjA0LjE5IGF0IDAwOjE3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gV2VkLCAxMyBNYXIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4gQEAgLTIxNSw2
ICsyMTYsOSBAQCB2b2lkIF9faHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21h
aW4gKmQpCj4+ID4gICAgICAgICAgLyogVXNlIHdoaWxlLWJyZWFrIHRvIGF2b2lkIGNvbXBpbGVy
IHdhcm5pbmcgKi8KPj4gPiAgICAgICAgICB3aGlsZSAoIGlvbW11X2lvdGxiX2ZsdXNoX2FsbChk
LCBmbHVzaF9mbGFncykgKQo+PiA+ICAgICAgICAgICAgICBicmVhazsKPj4gPiArI2Vsc2UKPj4g
PiArICAgICAgICByYyA9IC1FTk9TWVM7Cj4+IAo+PiAtRU9QTk9UU1VQUCBwbGVhc2UuCj4gCj4g
VGhlIHBhdGNoIGlzIGZpbmUgYnkgbWUgYW5kIEkgYW0gYWxzbyBmaW5lIHdpdGggSmFuJ3MgY29t
bWVudHMuCj4gCj4gSSBvbmx5IHdhbnQgdG8gcG9pbnQgb3V0IHRoYXQgd2UgaGF2ZW4ndCBiZWVu
IGVudGlyZWx5IGNvbnNpc3RlbnQgd2l0aAo+IC1FTk9TWVMgYW5kL29yIC1FT1BOT1RTVVBQLiBX
ZSBoYXZlIGxvdHMgb2YgcGxhY2VzIHRoYXQgcmV0dXJuIC1FTk9TWVMuCj4gU2hvdWxkIHdlIGNo
YW5nZSB0aGVtIHRvIC1FT1BOT1RTVVBQIGdvaW5nIGZvcndhcmQ/CgpJZGVhbGx5IHdlIHdvdWxk
LCBidXQgaWlyYyBhIHNtYWxsIHN0ZXAgSSBoYWQgb25jZSBtYWRlIGluIHRoYXQKZGlyZWN0aW9u
IGRpZCBmYWNlIHJlc2lzdGFuY2UuIEhlbmNlIEkndmUgY2hhbmdlZCB0byB0aGUgbW9kZQpvZiBz
aW1wbHkgdHJ5aW5nIHRvIGtlZXAgbmV3IGluc3RhbmNlcyBvZiBFTk9TWVMgYWJ1c2UgZnJvbQpn
b2luZyBpbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
