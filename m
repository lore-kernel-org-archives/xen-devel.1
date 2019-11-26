Return-Path: <SRS0=lwom=ZS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E996C432C0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 15:17:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AFF20722
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 15:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37AFF20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcaC-00062x-OM; Tue, 26 Nov 2019 15:16:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZcaB-00062p-VT
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:16:51 +0000
X-Inumbo-ID: c4c9b1aa-105f-11ea-a3a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4c9b1aa-105f-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:16:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5CF01B9E8;
 Tue, 26 Nov 2019 15:16:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
 <abdc01eb-de2a-c7ff-3803-e7dfd6c022d4@suse.com>
 <77017c06-c383-e511-c0dc-9b49944ae967@citrix.com>
 <1cb5b4cb-b7a4-14a1-ea11-fbc4b5075f64@suse.com>
 <2acf7a28-fdc9-8c06-7e9c-25b6b19864d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20570f64-58fc-9024-bf7e-3b66964cfdf2@suse.com>
Date: Tue, 26 Nov 2019 16:16:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2acf7a28-fdc9-8c06-7e9c-25b6b19864d7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNTozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8xMS8yMDE5
IDE0OjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjYuMTEuMjAxOSAxMzoyNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI2LzExLzIwMTkgMDg6NDIsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI1LjExLjIwMTkgMjI6MDUsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+PiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4+Pj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPj4+Pj4gQEAgLTEyNzks
NyArMTI3OSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFtZF9pb21tdV9zZXR1cF9kZXZpY2VfdGFi
bGUoCj4+Pj4+ICAgICAgICAgIGZvciAoIGJkZiA9IDAsIHNpemUgLz0gc2l6ZW9mKCpkdCk7IGJk
ZiA8IHNpemU7ICsrYmRmICkKPj4+Pj4gICAgICAgICAgICAgIGR0W2JkZl0gPSAoc3RydWN0IGFt
ZF9pb21tdV9kdGUpewo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAudiA9IHRydWUs
Cj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIC5pdiA9IHRydWUsCj4+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgIC5pdiA9IGlvbW11X2ludHJlbWFwLAo+Pj4+IFRoaXMgd2Fz
IHZlcnkgaW50ZW50aW9uYWxseSAidHJ1ZSIsIGFuZCBpZ25vcmluZyAiaW9tbXVfaW50cmVtYXAi
Ogo+Pj4gRGVsaWJlcmF0ZSBvciBub3QsIGl0IGlzIGEgcmVncmVzc2lvbiBmcm9tIDQuMTIuCj4+
IEkgYWNjZXB0IGl0J3MgYSByZWdyZXNzaW9uICh3aGljaCB3YW50cyBmaXhpbmcpLCBidXQgSSBk
b24ndCB0aGluawo+PiB0aGlzIGlzIHRoZSB3YXkgdG8gYWRkcmVzcyBpcy4gSSBjb3VsZCBiZSBj
b252aW5jZWQgYnkgZ29vZAo+PiBhcmd1bWVudHMsIHRob3VnaC4KPj4KPj4+IEJvb3Rpbmcgd2l0
aCBpb21tdT1uby1pbnRyZW1hcCBpcyBhIGNvbW1vbiBkZWJ1Z2dpbmcgdGVjaG5pcXVlLCBhbmQg
dGhhdAo+Pj4gbWVhbnMgbm8gaW50ZXJydXB0IHJlbWFwcGluZyBhbnl3aGVyZSBpbiB0aGUgc3lz
dGVtLCBldmVuIGZvcgo+Pj4gc3VwcG9zZWRseS11bnVzZWQgRFRFcy4KPj4gV2hldGhlciBJVj0x
IG9yIElWPTAsIHRoZXJlJ3Mgbm8gaW50ZXJydXB0IF9yZW1hcHBpbmdfIHdpdGggdGhpcwo+PiBv
cHRpb24gc3BlY2lmaWVkLiBUaGVyZSdzIHNvbWUgaW50ZXJydXB0IF9ibG9ja2luZ18sIHllcy4g
SXQncwo+PiBub3QgaW1tZWRpYXRlbHkgY2xlYXIgdG8gbWUgd2hldGhlciB0aGlzIGlzIGEgZ29v
ZCBvciBhIGJhZCB0aGluZy4KPiAKPiBZb3UncmUgYXR0ZW1wdGluZyB0byBhcmd1ZSBzZW1hbnRp
Y3MuwqAgQmxvY2tpbmcgaXMgYSBzcGVjaWFsIGNhc2UgcmVtYXBwaW5nLgo+IAo+ICJpb21tdT1u
by1pbnRyZW1hcCIgKGZvciBiZXR0ZXIgb3Igd29yc2UsIG5hbWluZyB3aXNlKSByZWZlcnMgdG8g
dGhlCj4gaW50ZXJydXB0IG1lZGlhdGlvbiBmdW5jdGlvbmFsaXR5IGluIHRoZSBJT01NVSwgYW5k
IG1lYW5zICJkb24ndCB1c2UgYW55Cj4gb2YgaXQiLsKgIEFueSBvdGhlciBiZWhhdmlvdXIgaXMg
YSByZWdyZXNzaW9uLgoKSSBjYW4gYWNjZXB0IHRoaXMgcG92LiBOZXZlcnRoZWxlc3MgSSdkIGxp
a2UgdG8gZmlyc3Qgc2VlIHdoZXRoZXIKd2UgY2FuJ3QgYWRkcmVzcyB0aGUgaXNzdWUgYXQgaGFu
ZCB3aXRoIGEgbGVzcyBiaWcgaGFtbWVyIHNvbHV0aW9uLgpXZSBjYW4gdGhlbiBhbHdheXMgZGVj
aWRlIHRvIHN0aWxsIHB1dCBpbiB0aGlzIGNoYW5nZS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
