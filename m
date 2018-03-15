From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/7] iommu: push use of type-safe BFN and
 MFN into iommu_ops
Date: Thu, 15 Mar 2018 10:15:47 -0600
Message-ID: <5AAAAA4302000078001B24FE@prv-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewVXo-0002P3-QW
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:15:56 +0000
In-Reply-To: <20180212104714.1922-4-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE4IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC02MTIsMTIgKzYxMiwxMiBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBpb21tdV9m
bHVzaF9pb3RsYihzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgIGlmICggaW9tbXVfZG9taWQg
PT0gLTEgKQo+ICAgICAgICAgICAgICBjb250aW51ZTsKPiAgCj4gLSAgICAgICAgaWYgKCBwYWdl
X2NvdW50ICE9IDEgfHwgYmZuID09IGJmbl94KElOVkFMSURfQkZOKSApCj4gKyAgICAgICAgaWYg
KCBwYWdlX2NvdW50ICE9IDEgfHwgYmZuX2VxKGJmbiwgSU5WQUxJRF9CRk4pICkKPiAgICAgICAg
ICAgICAgcmMgPSBpb21tdV9mbHVzaF9pb3RsYl9kc2koaW9tbXUsIGlvbW11X2RvbWlkLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBmbHVzaF9kZXZfaW90bGIp
Owo+ICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgcmMgPSBpb21tdV9mbHVzaF9pb3RsYl9w
c2koaW9tbXUsIGlvbW11X2RvbWlkLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAocGFkZHJfdCliZm4gPDwgUEFHRV9TSElGVF80SywKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKHBhZGRyX3QpYmZuX3goYmZuKSA8PCBQQUdFX1NISUZU
XzRLLAoKVGhlIGxhdGVzdCBhdCB0aGlzIHBvaW50IHlvdSdsbCBuZWVkIHRvIGludHJvZHVjZSBi
Zm5fdG9fYmFkZHIoKS4gSQphbHNvIGhhdmUgYSBoYXJkIHRpbWUgc2VlaW5nIGhvdyB0aGlzIGNh
biB0aGVuIHZhbGlkbHkgYmUgY2FzdCB0bwpwYWRkcl90LgoKPiBAQCAtNjc2LDcgKzY3Niw4IEBA
IHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGRtYV9wdGVfY2xlYXJfb25lKHN0cnVjdCBkb21haW4g
KmRvbWFpbiwgdTY0IGFkZHIpCj4gICAgICBpb21tdV9mbHVzaF9jYWNoZV9lbnRyeShwdGUsIHNp
emVvZihzdHJ1Y3QgZG1hX3B0ZSkpOwo+ICAKPiAgICAgIGlmICggIXRoaXNfY3B1KGlvbW11X2Rv
bnRfZmx1c2hfaW90bGIpICkKPiAtICAgICAgICByYyA9IGlvbW11X2ZsdXNoX2lvdGxiX3BhZ2Vz
KGRvbWFpbiwgYWRkciA+PiBQQUdFX1NISUZUXzRLLCAxKTsKPiArICAgICAgICByYyA9IGlvbW11
X2ZsdXNoX2lvdGxiX3BhZ2VzKGRvbWFpbiwgX2JmbihhZGRyID4+IFBBR0VfU0hJRlRfNEspLAoK
QW5kIGJhZGRyX3RvX2JmbigpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
