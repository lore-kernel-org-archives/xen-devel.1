Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6800AC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:03:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D27F20833
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D27F20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDsHY-0007Yh-H5; Tue, 09 Apr 2019 15:03:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDsHX-0007Yc-OM
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 15:03:27 +0000
X-Inumbo-ID: 9eb757ca-5ad8-11e9-b09d-93a87458e3db
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eb757ca-5ad8-11e9-b09d-93a87458e3db;
 Tue, 09 Apr 2019 15:03:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 09:03:22 -0600
Message-Id: <5CACB4370200007800225EEE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 09:03:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
 <e211a166-d1d7-344f-6f46-22e10c67c63f@citrix.com>
In-Reply-To: <e211a166-d1d7-344f-6f46-22e10c67c63f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409150319.Kc9eLXioEbkH2e_YhxXqy6EhWpKL4Cj-MXAyp2-OGhI@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE2OjM4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMDMvMjAxOSAxMzo1MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBAQCAtMTIx
NSw4ICsxMTk2LDExIEBAIHN0YXRpYyBib29sIHZteF9zZXRfZ3Vlc3RfYm5kY2ZncyhzdHJ1Y3Qg
dmNwdSAqdiwgdTY0IHZhbCkKPj4gICAgICByZXR1cm4gdHJ1ZTsKPj4gIH0KPj4gIAo+PiAtc3Rh
dGljIGJvb2wgdm14X2dldF9ndWVzdF9ibmRjZmdzKHN0cnVjdCB2Y3B1ICp2LCB1NjQgKnZhbCkK
Pj4gK3N0YXRpYyBib29sIHZteF9nZXRfZ3Vlc3RfYm5kY2Zncyhjb25zdCBzdHJ1Y3QgdmNwdSAq
Y3YsIHU2NCAqdmFsKQo+PiAgewo+PiArICAgIC8qIEdldCBhIG5vbi1jb25zdCBwb2ludGVyIGZv
ciB2bXhfdm1jc19lbnRlcigpICovCj4+ICsgICAgc3RydWN0IHZjcHUgKnYgPSBjdi0+ZG9tYWlu
LT52Y3B1W2N2LT52Y3B1X2lkXTsKPj4gKwo+IAo+IEknbSBzb3JyeSBub3QgaGF2aW5nIGdvdCBh
cm91bmQgdG8gcmV2aWV3aW5nIHRoaXMgc2VyaWVzIGluIGEgdGltZWx5Cj4gZmFzaGlvbiwgYnV0
IEkgYW0gZ29pbmcgdG8gc3BlY2lmaWNhbGx5IG5hY2sgZGUtY29uc3RpbmcgZ2FtZXMgbGlrZQo+
IHRoaXMuICBUaGVyZSBpcyBub3cgdmNwdSBzdGF0ZSBjb3JydXB0aW9uIHdoZW4gdGhlIE1TUiBp
cyBhY2Nlc3NlZAo+IHJlbW90ZWx5IC0gdGhpcyBob29rICptdXN0KiByZW1haW4gYSBtdXRhYmxl
IHZjcHUgcG9pbnRlci4KCldvdWxkIHlvdSBtaW5kIGVubGlnaHRlbmluZyBtZSBob3cgLyB3aGF0
IHZDUFUgc3RhdGUgY29ycnVwdGlvbgp0aGlzIGlzIGNhdXNpbmc/IFRoZXJlJ3Mgbm8gY2hhbmdl
IGluIHdoYXQgc3RydWN0IHZjcHUgaW5zdGFuY2UgaXMKYmVpbmcgYWN0ZWQgdXBvbiwgYWZ0ZXIg
YWxsLgoKPiBUaGVyZSBhcmUgYWxzbyBtdWx0aXBsZSBvdGhlciBmdW5jdGlvbmFsIGlzc3VlcyBh
bmQgcmVncmVzc2lvbnMKPiBpbnRyb2R1Y2VkIGJ5IHRoaXMgc2VyaWVzLiAgSSdtIHRyeWluZyB0
byBwdXQgdG9nZXRoZXIgYSBwYXRjaCB0byBmaXgKPiBhbGwgb2YgdGhlIGZhbGxvdXQsIGJ1dCBJ
IGFsc28gbWlnaHQgcmV2ZXJ0IHRoZSBzZXJpZXMgd2hvbGVzYWxlCj4gZGVwZW5kaW5nIG9uIHRo
ZSBldmVudHVhbCBjb21wbGV4aXR5LgoKSSdtIHNvcnJ5IGZvciBub3Qgc3BvdHRpbmcgYW55IG9m
IHRoZW07IEknbSBjdXJpb3VzIHRvIGxlYXJuIHdoYXQKSSd2ZSBtaXNzZWQuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
