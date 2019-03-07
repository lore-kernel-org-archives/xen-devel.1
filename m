From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 0/6] iomem cacheability
Date: Thu, 7 Mar 2019 10:04:49 +0000
Message-ID: <af846001-3098-120b-ed31-d4b4b19709c9@arm.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <CABHD4K-UAuyv0Cwmk1d-SBUgGvUarWq-fsAsJATbg3r+ovGLrg@mail.gmail.com>
 <alpine.DEB.2.10.1903051321390.17552@sstabellini-ThinkPad-X260>
 <CAF3u54Di61CufwzwJ35sqPrBRVt2ewrmR=siDHPWA8ur29db7Q@mail.gmail.com>
 <CABHD4K8JQdhi8P4ZbYndUFs90w0eH9QqMAa_XDPJM-QA_yr=QA@mail.gmail.com>
 <alpine.DEB.2.10.1903061429230.17248@sstabellini-ThinkPad-X260>
 <7b7c45ee-745f-1ede-1063-7fd66449194b@arm.com>
 <CABHD4K-Pxq2ZSRpa-Fpiis1gKe8=sVKaxzFcyvcC_awCR9vmrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uy23=RK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h1ptX-0006wy-3w
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:04:55 +0000
In-Reply-To: <CABHD4K-Pxq2ZSRpa-Fpiis1gKe8=sVKaxzFcyvcC_awCR9vmrQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "ian.jackson@citrix.com" <ian.jackson@citrix.com>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNy8wMy8yMDE5IDA4OjQyLCBBbWl0IFRvbWVyIHdyb3RlOgo+IEhpLAo+IAo+PiBOb3Qg
cmVhbGx5LCB0aGUgRFQgcHJvdmlkZWQgYnkgQW1pdCBpcyBmb3IgdGhlIGhvc3QuIFRoZSBtZW1v
cnkgbm9kZQo+PiB3aWxsIGJlIHJld3JpdHRlbiBieSBYZW4gZm9yIERvbTAgIGFuZCBkb2VzIG5v
dCBpbmNsdWRlIHRoZQo+PiByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBzbyBmYXIuCj4+Cj4gVGhh
bmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4KPiAKPiBJcyBpdCBsaWtlIHdlIG5lZWQgdG8gY3Jl
YXRlICJzZXBhcmF0ZSIgcmVzZXJ2ZS1tZW1vcnkKPiBub2RlKG1ha2VfcmVzZXJ2ZWQtbWVtb3J5
X25vZGUpIHdoZW4KPiBtZW1vcnkgbm9kZSBpcyBlbmNvdW50ZXJlZD8KClNvcnJ5IEkgZG9uJ3Qg
dW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLgoKV2hhdCBJIG1lYW50IGlzIHJlc2VydmVkLXJlZ2lv
bnMgaXMgc29tZSBtZW1vcnkgdGhhdCBoYXZlIGJlZW4gY2FydmVkIG91dCBmcm9tIAp0aGUgUkFN
LiBTbyB0aGUgcmVzZXJ2ZWQtcmVnaW9ucyBuZWVkcyB0byBiZSBkZXNjcmliZWQgaW4gdGhlIG1l
bW9yeSBub2RlIAoobWVtb3J5QDxhZGRyPikuIFdlIGNhbiBlaXRoZXIgYXBwZW5kIHRoZW0gdG8g
dGhlIG1lbW9yeSBub2RlIGNyZWF0ZWQgYnkgCm1ha2VfbWVtb3J5X25vZGUuIE9yIGludHJvZHVj
ZSBuZXcgb25lcy4KCkkgaGF2ZW4ndCB5ZXQgdGhvdWdodCB3aGljaCBvbmUgaXMgbW9yZSBzdWl0
YWJsZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
