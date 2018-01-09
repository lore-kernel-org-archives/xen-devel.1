From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 53/74] xen/pvshim: modify Dom0
 builder in order to build a DomU
Date: Tue, 09 Jan 2018 02:06:31 -0700
Message-ID: <5A549427020000780019C961@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-54-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o7xp=ee=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYprf-0006lr-AB
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 09:06:35 +0000
In-Reply-To: <20180104130625.28605-54-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
K3ZvaWQgX19pbml0IHB2X3NoaW1fc2V0dXBfZG9tKHN0cnVjdCBkb21haW4gKmQsIGw0X3BnZW50
cnlfdCAqbDRzdGFydCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyB2YV9zdGFydCwgdW5zaWduZWQgbG9uZyBzdG9yZV92YSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBjb25zb2xlX3ZhLCB1bnNpZ25lZCBsb25nIHZw
aHlzbWFwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydF9pbmZvX3QgKnNp
KQo+ICt7Cj4gKyAgICB1aW50NjRfdCBwYXJhbSA9IDA7Cj4gKyAgICBsb25nIHJjOwo+ICsKPiAr
I2RlZmluZSBTRVRfQU5EX01BUF9QQVJBTShwLCBzaSwgdmEpICh7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHJjID0geGVuX2h5cGVyY2FsbF9odm1fZ2V0
X3BhcmFtKHAsICZwYXJhbSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
IGlmICggcmMgKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICBwYW5pYygiVW5hYmxlIHRvIGdldCAiICNw
ICJcbiIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIChz
aSkgPSBwYXJhbTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgIGlmICggdmEgKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgICAgICBCVUdfT04odW5zaGFyZV94ZW5fcGFnZV93aXRoX2d1
ZXN0KG1mbl90b19wYWdlKHBhcmFtKSwgZG9tX2lvKSk7ICAgICAgIFwKPiArICAgICAgICBzaGFy
ZV94ZW5fcGFnZV93aXRoX2d1ZXN0KG1mbl90b19wYWdlKHBhcmFtKSwgZCwgWEVOU0hBUkVfd3Jp
dGFibGUpOyAgIFwKPiArICAgICAgICByZXBsYWNlX3ZhKGQsIGw0c3RhcnQsIHZhLCBwYXJhbSk7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICBkb20wX3Vw
ZGF0ZV9waHlzbWFwKGQsICh2YSAtIHZhX3N0YXJ0KSA+PiBQQUdFX1NISUZULCBwYXJhbSwgdnBo
eXNtYXApO1wKCkNvc21ldGljIHJlbWFyazogdmEgd2FudHMgdG8gYmUgcGFyZW50aGVzaXplZCBo
ZXJlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
