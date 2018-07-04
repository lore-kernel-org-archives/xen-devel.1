From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Wed, 4 Jul 2018 15:22:13 +0300
Message-ID: <20180704122213.GB3652@hel>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <8021d5e7-c6c6-f1ff-dbe1-9ba564d15526@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iov=ju=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fagnX-0003O9-7j
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 12:22:15 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 5ED4E308628F
 for <xen-devel@lists.xenproject.org>; Wed,  4 Jul 2018 16:38:25 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id AA7067FBD9
 for <xen-devel@lists.xenproject.org>; Wed,  4 Jul 2018 15:22:13 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <8021d5e7-c6c6-f1ff-dbe1-9ba564d15526@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpPbiBNb24sIEp1bCAwMiwgMjAxOCBhdCAxMjowMTowMVBNICswMTAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMDYvMjgvMjAxOCAwMjowMCBQTSwgQWRyaWFuIFBv
cCB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIGIveGVu
L2FyY2gvYXJtL21lbV9hY2Nlc3MuYwo+ID4gaW5kZXggYWUyNjg2ZmZhMi4uYmE5ZTUwZTdmNiAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS9tZW1fYWNjZXNzLmMKPiA+IEBAIC0yMzYsNyArMjM2LDcgQEAgYm9vbCBwMm1fbWVt
X2FjY2Vzc19jaGVjayhwYWRkcl90IGdwYSwgdmFkZHJfdCBnbGEsIGNvbnN0IHN0cnVjdCBucGZl
YyBucGZlYykKPiA+ICAgICAgIGlmICggIXAybS0+bWVtX2FjY2Vzc19lbmFibGVkICkKPiA+ICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+IC0gICAgcmMgPSBwMm1fZ2V0X21lbV9hY2Nlc3Modi0+
ZG9tYWluLCBnYWRkcl90b19nZm4oZ3BhKSwgJnhtYSk7Cj4gPiArICAgIHJjID0gcDJtX2dldF9t
ZW1fYWNjZXNzKHYtPmRvbWFpbiwgZ2FkZHJfdG9fZ2ZuKGdwYSksICZ4bWEsIDApOwo+ID4gICAg
ICAgaWYgKCByYyApCj4gPiAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiBAQCAtNDQwLDggKzQ0
MCw5IEBAIGxvbmcgcDJtX3NldF9tZW1fYWNjZXNzX211bHRpKHN0cnVjdCBkb21haW4gKmQsCj4g
PiAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiAgIH0KPiA+ICsvKiBUaGUgYWx0cDJtX2lk
eCBhcmd1bWVudCBpcyBub3QgdXNlZCBvbiBBUk0uICovCj4gCj4gcy9BUk0vQXJtLyBwbGVhc2Uu
Cj4gCj4gQWxzbywgSSBndWVzcyBhbHRwMm1faWR4IHNob3VsZCBhbHdheXMgYmUgMCB1bnRpbCBh
bHRwMm0gaXMgaW1wbGVtZW50ZWQgZm9yCj4gQXJtLiBJZiBzbywgSSB3b3VsZCBsaWtlIHRvIHNl
ZSBhIGNoZWNrIG9uIHRoZSB2YXJpYWJsZSBhbmQgcmV0dXJuIC1FSU5WQUwKPiBvbiBlcnJvci4K
CkFsbCByaWdodC4gIFRoYW5rIHlvdSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
