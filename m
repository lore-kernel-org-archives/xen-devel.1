From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] VT-d: suppress individual flushes during
 hwdom setup
Date: Thu, 2 May 2019 15:08:52 +0200
Message-ID: <20190502130852.r3ohrwgr4wvfqfuf@Air-de-Roger>
References: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vuKL=TC=citrix.com=prvs=018794465=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMBUc-0002Rh-4e
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:11:18 +0000
Content-Disposition: inline
In-Reply-To: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDY6Mjg6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUncyBhbiBpbnZvY2F0aW9uIG9mIGlvbW11X2ZsdXNoX2FsbCgpIGltbWVkaWF0
ZWx5IGFmdGVyd2FyZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5j
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtMTMxMCw4
ICsxMzEwLDExIEBAIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBpbnRlbF9pb21tdV9od2QKPiAg
Cj4gICAgICBzZXR1cF9od2RvbV9wY2lfZGV2aWNlcyhkLCBzZXR1cF9od2RvbV9kZXZpY2UpOwo+
ICAgICAgc2V0dXBfaHdkb21fcm1ycihkKTsKPiArCj4gICAgICAvKiBNYWtlIHN1cmUgd29ya2Fy
b3VuZHMgYXJlIGFwcGxpZWQgYmVmb3JlIGVuYWJsaW5nIHRoZSBJT01NVShzKS4gKi8KPiArICAg
IHRoaXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90bGIpID0gdHJ1ZTsKPiAgICAgIGFyY2hfaW9t
bXVfaHdkb21faW5pdChkKTsKPiArICAgIHRoaXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90bGIp
ID0gZmFsc2U7CgpEb24ndCB5b3Ugd2FudCB0byBhbHNvIGF2b2lkIGZsdXNoZXMgaW4gc2V0dXBf
aHdkb21fcm1yciBhbmQKc2V0dXBfaHdkb21fcGNpX2RldmljZXM/CgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
