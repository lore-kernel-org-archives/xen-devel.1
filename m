From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC PATCH v2 16/17] libxl: access QMP socket via
 console for qemu-in-stubdomain
Date: Thu, 1 Nov 2018 17:38:13 +0000
Message-ID: <23515.14853.466712.244524@mariner.uk.xensource.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <896cb0d1a12094ac80a26af588fd50ac527fddca.1533608042.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvhc=nm=citrix.com=prvs=836b135c8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIGvH-00030V-5I
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:38:23 +0000
In-Reply-To: <896cb0d1a12094ac80a26af588fd50ac527fddca.1533608042.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltSRkMgUEFUQ0ggdjIgMTYvMTdd
IGxpYnhsOiBhY2Nlc3MgUU1QIHNvY2tldCB2aWEgY29uc29sZSBmb3IgcWVtdS1pbi1zdHViZG9t
YWluIik6Cj4gQWRkIHN1cHBvcnQgZm9yIHRhbGtpbmcgd2l0aCBxZW11IGluIHN0dWJkb21haW4g
dmlhIFFNUCBjb25uZWN0ZWQgdG8gYQo+IGNvbnNvbGUuIFNpbmNlIGEgY29uc29sZSBkb2Vzbid0
IGhhdmUgb3V0IG9mIGJhbmQgY29ubmVjdC9kaXNjb25uZWN0Cj4gc2lnbmFsaW5nLCB1c2UgKG5l
dykgcW1wX3Jlc2V0IGNvbW1hbmQgYXQgZXZlcnkgY29ubmVjdCwgdG8gZm9yY2UKPiByZW5lZ290
aWF0aW9uLgoKSSdtIGFmcmFpZCB0aGF0IHRoaXMgaXMgbm8gZ29vZCBiZWNhdXNlIGl0J3MgZGVh
bGluZyB3aXRoIHRoZSBvbGQKc3luY2hyb25vdXMgcW1wIGNvZGUgLSBjb2RlIHdoaWNoIEFudGhv
bnkgKENDJ2QpIGlzIHJlc3RydWN0dXJpbmcuCgpTaW5jZSBsaWJ4bCBtdXN0IG5vdCB0cnVzdCB0
aGUgcW1wIGNvbm5lY3Rpb24gdG8gYSBsaW51eCBzdHViIGRtLCBhbnkKbW9yZSB0aGFuIHRvIGEg
ZG9tMCBkZXByaXYgcWVtdSBkbSwgSSB0aGluayBBbnRob255J3Mgd29yayBpcyBhCnByZXJlcXVp
c2l0ZSBmb3IgTGludXggc3R1YmRvbWFpbiBzdXBwb3J0ICh1cHN0cmVhbSwgYXQgbGVhc3QpLgoK
U28gdGhpcyBwYXRjaCBpcyBjdXJyZW50bHkgYmxvY2tlZCBhbmQgd2lsbCBuZWVkIHRvIGJlIHJl
d29ya2VkIGluIGR1ZQpjb3Vyc2UuICBJJ20gaG9waW5nIGl0IHdpbGwgZ2V0IGEgbG90IHNpbXBs
ZXIgaWYgd2UgY2FuIHNvcnQgb3V0CihpKSBhc3luYyBxbXAgYWxvbmcgdGhlIGxpbmVzIG9mIEFu
dGhvbnkncyBzZXJpZXMgKGlpKSBwdiBjb25zb2xlIHN0dWZmLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
