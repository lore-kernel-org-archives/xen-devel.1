From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 06/74] tools/libelf: fix elf notes
 check for PVH guest
Date: Thu, 04 Jan 2018 07:37:20 -0700
Message-ID: <5A4E4A30020000780019B179@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-7-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=q53i=d7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eX6e4-0000vw-1f
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 14:37:24 +0000
In-Reply-To: <20180104130625.28605-7-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
UFZIIG9ubHkgcmVxdWlyZXMgUEhZUzMyX0VOVFJZIHRvIGJlIHNldC4gUmV0dXJuIGltbWVkaWF0
ZWx5IGlmIHRoYXQncwo+IHRoZSBjYXNlLgoKU28gSSBndWVzcyB0aGUgYnVnKD8pIGJlaW5nIGZp
eGVkIGlzIHRoYXQgc28gZmFyIGxvYWRlciBvciBndWVzdF9vcywKYW5kIHhlbl92ZXIgc2V0dGlu
Z3MgYXJlIGFsc28gcmVxdWlyZWQuIEhvd2V2ZXIsIHlvdSBmYWlsIHRvIG1lbnRpb24KX3doeV8g
eW91IHRoaW5rIHRoZXkncmUgbm90IHJlcXVpcmVkLiBJIGNhbiBzb3J0IG9mIHNlZSB0aGlzIGZv
cgpsb2FkZXIgYW5kIG1heWJlIGd1ZXN0X29zLCBidXQgZm9yIHRoZSBYZW4gdmVyc2lvbiB0aGlz
IGlzbid0IGFzCm9idmlvdXMsIG1haW5seSBiZWNhdXNlIGFueSBhcmd1bWVudHMgSSBjYW4gdGhp
bmsgb2YgcmlnaHQgbm93CndvdWxkIGVxdWFsbHkgYXBwbHkgdG8gUFYuCgo+IC0tLSBhL3hlbi9j
b21tb24vbGliZWxmL2xpYmVsZi1kb21pbmZvLmMKPiArKysgYi94ZW4vY29tbW9uL2xpYmVsZi9s
aWJlbGYtZG9taW5mby5jCj4gQEAgLTM4MSw2ICszODEsMTMgQEAgc3RhdGljIGVsZl9lcnJvcnN0
YXR1cyBlbGZfeGVuX25vdGVfY2hlY2soc3RydWN0IGVsZl9iaW5hcnkgKmVsZiwKPiAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gICAgICB9Cj4gIAo+ICsgICAgLyogUFZIIG9ubHkgcmVxdWlyZXMgb25l
IEVMRiBub3RlIHRvIGJlIHNldCAqLwo+ICsgICAgaWYgKCBwYXJtcy0+cGh5c19lbnRyeSAhPSBV
TlNFVF9BRERSMzIgKQo+ICsgICAgewo+ICsgICAgICAgIGVsZl9tc2coZWxmLCAiRUxGOiBGb3Vu
ZCBQVkggaW1hZ2VcbiIpOwo+ICsgICAgICAgIHJldHVybiAwOwo+ICsgICAgfQoKSWYgdGhlIG90
aGVyIGVudHJpZXMgYXJlIG9mIG5vIGludGVyZXN0IGZvciBQVkgsIEkgdGhpbmsgdGhhdCB0aGlz
CnRoZW4gY2FsbHMgZm9yIGRyb3BwaW5nIHRoZWlyIGxvZ2dpbmcgZnJvbSBwdmhfbG9hZF9rZXJu
ZWwoKS4KSSdtIGFsc28gc3VycHJpc2VkIHRoYXQgSSBjYW4ndCBmaW5kIGFueSB1c2Ugb2YgYW55
IG9mIHRoZSB0aHJlZQp2YWx1ZXMgY2hlY2tlZCBpbiBsaWJ4Yy4KCkphbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
