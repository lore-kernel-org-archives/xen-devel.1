Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B4AC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:54:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE1D20679
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDE1D20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdtN-0003XT-72; Thu, 25 Apr 2019 12:54:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdtL-0003XA-0c
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:54:19 +0000
X-Inumbo-ID: 3b1e050a-6759-11e9-8fb0-b39ae9c81e36
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b1e050a-6759-11e9-8fb0-b39ae9c81e36;
 Thu, 25 Apr 2019 12:54:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 06:54:14 -0600
Message-Id: <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 06:54:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>,"Roger Pau Monne" <roger.pau@citrix.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
In-Reply-To: <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return
 error
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425125410.xQbuHrB6CHklJFxPmJUGhaZ_Id1q4rbP13ipdBoaahI@z>

Pj4+IE9uIDI0LjA0LjE5IGF0IDE2OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgQXByIDI0LCAyMDE5IGF0IDAyOjI3OjMyUE0gKzAwMDAsIEFsZXhhbmRydSBTdGVm
YW4gSVNBSUxBIHdyb3RlOgo+PiBAQCAtMTA1MywxNSArMTA1MywxMSBAQCBzdGF0aWMgdm9pZCBj
aGFuZ2VfdHlwZV9yYW5nZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+PiAgICAgICAqIFRoaXMg
c2hvdWxkIGJlIHJldmlzaXRlZCBsYXRlciwgYnV0IGZvciBub3cgcG9zdCBhIHdhcm5pbmcuCj4+
ICAgICAgICovCj4+ICAgICAgaWYgKCB1bmxpa2VseShlbmQgPiBob3N0X21heF9wZm4pICkKPj4g
LSAgICB7Cj4+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICJEb20lZCBsb2dkaXJ0
eSByYW5nZXNldCBjbGlwcGVkIHRvIG1heF9tYXBwZWRfcGZuXG4iLAo+PiAtICAgICAgICAgICAg
ICAgZC0+ZG9tYWluX2lkKTsKPj4gLSAgICAgICAgZW5kID0gaW52YWxpZGF0ZV9lbmQgPSBob3N0
X21heF9wZm47Cj4+IC0gICAgfQo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gIAo+PiAg
ICAgIC8qIElmIHRoZSByZXF1ZXN0ZWQgcmFuZ2UgaXMgb3V0IG9mIHNjb3BlLCByZXR1cm4gZG9p
bmcgbm90aGluZy4gKi8KPj4gICAgICBpZiAoIHN0YXJ0ID4gZW5kICkKPj4gLSAgICAgICAgcmV0
dXJuOwo+PiArICAgICAgICByZXR1cm4gMDsKPiAKPiBTaW5jZSB5b3UgYXJlIGFscmVhZHkgY2hh
bmdpbmcgdGhlIGJlaGF2aW9yIG9mIHRoZSBmdW5jdGlvbiBhYm92ZSB0aGlzCj4gc2hvdWxkIGFs
c28gcmV0dXJuIEVJTlZBTCBJTU8uCgpJIGRvbid0IHRoaW5rIEkgYWdyZWUuIFF1aXRlIHRoZSBv
dGhlciB3YXkgYXJvdW5kOiBJbiB0aGUgbGF0dGVyCmNhc2UgaXQncyBzaW1wbHkgYW4gZW1wdHkg
cmFuZ2UgdGhhdCBnZXRzIHJlcXVlc3RlZCwgd2hpY2ggaXMgYQpuby1vcCAoYW5kIGhlbmNlIG5v
IHJlYXNvbiB0byBmYWlsKS4gQXZvaWRpbmcgZW1wdHkgcmFuZ2VzIGluCnRoZSBjYWxsZXJzIG1h
eSByZXN1bHQgaW4gbGVzcyByZWFkYWJsZSBjb2RlIHRoZXJlLgoKRXZlbiBpbiB0aGUgZm9ybWVy
IGNhc2UgSSBkb24ndCB0aGluayByZXR1cm5pbmcgYW4gZXJyb3IgaXMKYXBwcm9wcmlhdGUsIHRo
ZSBtb3JlIHRoYXQgdGhlIGNvbW1lbnQgdGhlcmUgc2F5cyB0aGlzIGlzCnByb2JhYmx5IG5vdCB0
aGUgcmlnaHQgYmVoYXZpb3IuIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvCmxlYXZlIHRo
aXMgYWxvbmUgdW50aWwgd2UgaGF2ZSBzZXR0bGVkIG9uIHdoYXQgdGhlIHJpZ2h0CmJlaGF2aW9y
IGhlcmUgaXMuIEl0IGlzIGFuIGlzc3VlIGFueXdheSB0aGF0IGEgY2hhbmdlIGlzCm1hZGUgd2l0
aG91dCBzYXlpbmcgd2h5IHRoZSBuZXcgYmVoYXZpb3IgcHJlZmVyYWJsZSBvdmVyCnRoZSBjdXJy
ZW50IG9uZS4KCkluIGFueSBldmVudCB0aGUgY29tbWVudCB0aGVyZSB3b3VsZCBiZWNvbWUgc3Rh
bGUgd2l0aCB0aGUKcmVtb3ZhbCBvZiB0aGUgcHJpbnRrKCkuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
