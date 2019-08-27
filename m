Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA692C3A5A4
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 15:53:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78F72070B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 15:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78F72070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2dmU-0000dL-S1; Tue, 27 Aug 2019 15:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2dmT-0000dG-Kg
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:53:13 +0000
X-Inumbo-ID: c5e70638-c8e2-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5e70638-c8e2-11e9-951b-bc764e2007e4;
 Tue, 27 Aug 2019 15:53:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E282AFDF;
 Tue, 27 Aug 2019 15:53:11 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <61bcef1a-aa70-067f-b2a4-06580b00fe40@suse.com>
 <596e6cf6-ced2-1993-a7ff-7e865126730f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <965b2135-26b3-99d1-d5ea-9e8c69201ba7@suse.com>
Date: Tue, 27 Aug 2019 17:53:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <596e6cf6-ced2-1993-a7ff-7e865126730f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] x86emul: support INVPCID
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMjAxOSAxNzozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8wNy8yMDE5
IDEyOjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVs
YXRlL3g4Nl9lbXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9l
bXVsYXRlLmMKPj4gQEAgLTkxMjQsNiArOTEyNiw0OCBAQCB4ODZfZW11bGF0ZSgKPj4gICAgICAg
ICAgICBBU1NFUlQoIXN0YXRlLT5zaW1kX3NpemUpOwo+PiAgICAgICAgICAgIGJyZWFrOwo+PiAg
ICAKPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDXzY2KDB4MGYzOCwgMHg4Mik6IC8qIGludnBjaWQg
cmVnLG0xMjggKi8KPj4gKyAgICAgICAgdmNwdV9tdXN0X2hhdmUoaW52cGNpZCk7Cj4+ICsgICAg
ICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihlYS50eXBlICE9IE9QX01FTSwgRVhDX1VEKTsKPj4g
KyAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCFtb2RlX3JpbmcwKCksIEVYQ19HUCwgMCk7
Cj4+ICsKPj4gKyAgICAgICAgaWYgKCAocmMgPSBvcHMtPnJlYWQoZWEubWVtLnNlZywgZWEubWVt
Lm9mZiwgbW12YWxwLCAxNiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3R4dCkp
ICE9IFg4NkVNVUxfT0tBWSApCj4+ICsgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gCj4gVGhlIGFj
dHVhbCBiZWhhdmlvdXIgaW4gaGFyZHdhcmUgaXMgdG8gbm90IGV2ZW4gcmVhZCB0aGUgbWVtb3J5
IG9wZXJhbmQKPiBpZiBpdCBpcyB1bnVzZWQuwqAgWW91IGNhbiBkZW1vbnN0cmF0ZSB0aGlzIGJ5
IGRvaW5nIGFuIEFMTF9JTkNfR0xPQkFMCj4gZmx1c2ggd2l0aCBhIG5vbi1jYW5vbmljYWwgbWVt
b3J5IG9wZXJhbmQuCgpPaCwgdGhhdCdzIHNvcnQgb2YgdW5leHBlY3RlZC4KCj7CoCBJbiBwYXJ0
aWN1bGFyLCBJIHdhcwo+IGludGVuZGluZyB0byB1c2UgdGhpcyBiZWhhdmlvdXIgdG8gc3BlZWQg
dXAgaGFuZGxpbmcgb2YgSU5We0VQVCxWUElEfQo+IHdoaWNoIHRyYXAgdW5jb25kaXRpb25hbGx5
LgoKV2hpY2ggd291bGQgcmVxdWlyZSB0aGUgb2JzZXJ2ZWQgYmVoYXZpb3IgdG8gYWxzbyBiZSB0
aGUgU0RNCm1hbmRhdGVkIG9uZSwgd291bGRuJ3QgaXQ/Cgo+IEhvd2V2ZXIsIHRoaXMgaXMgaG93
IHRoZSBpbnN0cnVjdGlvbiBpcyBkZXNjcmliZWQgaW4gdGhlIFNETSwgYW5kCj4gSU5WUENJRCBz
aG91bGQgdXN1YWxseSBleGVjdXRlIHdpdGhvdXQgdHJhcHBpbmcsIHNvIHRoZSB1bmNvbmRpdGlv
bmFsCj4gcmVhZCBzaG91bGQgYmUgZmluZS4KPiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5rcy4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
