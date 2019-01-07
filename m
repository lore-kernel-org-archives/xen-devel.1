From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 3/4] xen/x86: use SYMBOL when required
Date: Mon, 07 Jan 2019 03:15:04 -0700
Message-ID: <5C3326A8020000780020AC0A@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901031114230.800@sstabellini-ThinkPad-X260>
 <1546543191-9206-3-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggRw8-0003GR-1H
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 10:15:12 +0000
In-Reply-To: <1546543191-9206-3-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjAxLjE5IGF0IDIwOjE5LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2FsdGVybmF0aXZlLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
YWx0ZXJuYXRpdmUuYwo+IEBAIC0xOTQsNyArMTk0LDcgQEAgdm9pZCBpbml0X29yX2xpdmVwYXRj
aCBhcHBseV9hbHRlcm5hdGl2ZXMoc3RydWN0IGFsdF9pbnN0ciAqc3RhcnQsCj4gICAgICAgKiBT
byBiZSBjYXJlZnVsIGlmIHlvdSB3YW50IHRvIGNoYW5nZSB0aGUgc2NhbiBvcmRlciB0byBhbnkg
b3RoZXIKPiAgICAgICAqIG9yZGVyLgo+ICAgICAgICovCj4gLSAgICBmb3IgKCBhID0gYmFzZSA9
IHN0YXJ0OyBhIDwgZW5kOyBhKysgKQo+ICsgICAgZm9yICggYSA9IGJhc2UgPSBzdGFydDsgKHVu
c2lnbmVkIGxvbmcpYSA8IFNZTUJPTChlbmQpOyBhKysgKQoKQXMgc2FpZCBiZWZvcmUsIGltbyBT
WU1CT0woKSBzaG91bGQgb25seSBldmUgYmUgYXBwbGllZCBfZGlyZWN0bHlfCnRvIG9uZSBvZiB0
aGUgKGNvbW1vbmx5IGxpbmtlciBzY3JpcHQgZ2VuZXJhdGVkKSBzeW1ib2xzIGxpc3RlZCBhYm92
ZSwKbmV2ZXIgdG8gYW55IGRlcml2YXRpdmVzLgoKPiBAQCAtMTM4Miw3ICsxMzgzLDggQEAgdm9p
ZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAg
IH0KPiAgI2VuZGlmCj4gIAo+IC0gICAgeGVuX3ZpcnRfZW5kID0gKCh1bnNpZ25lZCBsb25nKV9l
bmQgKyAoMVVMIDw8IEwyX1BBR0VUQUJMRV9TSElGVCkgLSAxKSAmCj4gKyAgICB4ZW5fdmlydF9l
bmQgPSAoU1lNQk9MKF9lbmQpICsKPiArICAgICAgICAgICAgICAgICAgICAoMVVMIDw8IEwyX1BB
R0VUQUJMRV9TSElGVCkgLSAxKSAmCj4gICAgICAgICAgICAgICAgICAgICB+KCgxVUwgPDwgTDJf
UEFHRVRBQkxFX1NISUZUKSAtIDEpOwoKTm8gbmVlZCBmb3IgdGhlIGV4dHJhIGxpbmUgc3BsaXQu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
