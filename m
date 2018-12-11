From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Question about making system thread like kthread in
 Linux kernel
Date: Tue, 11 Dec 2018 13:17:06 +0000
Message-ID: <20181211131706.l23mh6wzzenxixwf@zion.uk.xensource.com>
References: <CAFX_q-Go=NXvmRyd9aHC_FVcZjCxa=fG60KPq03kMGJ13Y5yAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DjN1=OU=citrix.com=prvs=8762858e5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gWhuQ-00051n-H5
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 13:17:10 +0000
Content-Disposition: inline
In-Reply-To: <CAFX_q-Go=NXvmRyd9aHC_FVcZjCxa=fG60KPq03kMGJ13Y5yAg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Minjun Hong <nickeysgo@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMDk6NDA6MzVQTSArMDkwMCwgTWluanVuIEhvbmcgd3Jv
dGU6Cj4gSGkuIFdoaWxlIEkgcmV2aWV3IHRoZSByZXN1bHQgb2YgbXkgcmVzZWFyY2gsIHN1ZGRl
bmx5IGEgZ29vZCBpZGVhIGNvbWVzCj4gdXAsIGFuZCBJIGFtIGxvb2tpbmcgZm9yIGhvdyB0byBt
YWtlIHRocmVhZHMgaW4gWGVuIGxpa2Uga3RocmVhZCBpbiBMaW51eAo+IGtlcm5lbC4KPiAKPiBI
b3dldmVyLCBhZnRlciBnb29nbGluZyBhbmQgc2VhcmNoaW5nIGZvciB0aGUgc291cmNlIGNvZGUg
YnkgZ3JlcCwgSSBoYXZlCj4gZm91bmQgb25seSBzb21lIGluZm9ybWF0aW9uIHJlZ2FyZGluZyBz
dHViIGRvbWFpbiBhbmQgZGFlbW9ucywgc3VjaCBhcwo+IHhlbmNvbnNvbGVkIGFuZCB4ZW5idXMu
Cj4gCj4gSSB3YW50IGEgc2ltcGxlIHRocmVhZCBpbiBYZW4gdG8gb2ZmbG9hZCBzb21lIHdvcmtz
IHdoaWNoIGlzIGJlaW5nIGV4ZWN1dGVkCj4gaW4gdGhlIENyZWRpdCBzY2hlZHVsZXIuCj4gCj4g
SXMgdGhlcmUgYW55IGRhdGEgc3RydWN0dXJlIG9yIEFQSSBmb3IgdGhhdCBwdXJwb3NlIGluIHRo
ZSBYZW4gc291cmNlIGNvZGUgPwoKVGhlcmUgaXMgbm8gY29uY2VwdCBvZiB0aHJlYWRzIGluIFhl
bi4gIFlvdSBtYXkgYmUgYWJsZSB0byBvZmZsb2FkIHdvcmsKdG8gYSBzb2Z0aXJxLgoKQmVjYXVz
ZSBYZW4gZGVhbHMgd2l0aCBkb21haW5zIGFuZCB2Y3B1cywgYW5vdGhlciBpZGVhIGlzIHRvIGNy
ZWF0ZQoid29ya2VyIiBkb21haW5zIC8gdmNwdXMgaW5zaWRlIHRoZSBoeXBlcnZpc29yIHRvIGNh
cnJ5IG91dCB3b3JrLiBCdXQKdGhhdCB3b3VsZCBpbnZvbHZlIGEgbG90IG9mIGNoYW5nZXMgaWYg
eW91IHdhbnQgdG8gbWFrZSB0aGUgQVBJcwpnZW5lcmljLgoKV2VpLgoKPiAKPiBUaGFua3MhCj4g
UmVnYXJkcy4KCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
