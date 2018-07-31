From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] xenconsole: add option to avoid escape
 sequences in log
Date: Tue, 31 Jul 2018 10:10:10 +0100
Message-ID: <20180731091010.chflw6m32uqeatsq@citrix.com>
References: <20180731031532.11752-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mxhy=kp=citrix.com=prvs=7433d6730=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fkQfZ-0008FI-20
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 09:10:17 +0000
Content-Disposition: inline
In-Reply-To: <20180731031532.11752-1-marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDU6MTU6MzJBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IEFkZCAtLXJlcGxhY2UtZXNjYXBlIG9wdGlvbiB0byB4ZW5j
b25zb2xlZCwgd2hpY2ggcmVwbGFjZXMgRVNDIHdpdGgKPiAnLicgaW4gY29uc29sZSBvdXRwdXQg
d3JpdHRlbiB0byBsb2cgZmlsZS4gVGhpcyBtYWtlcyBpdCBzbGlnaHRseSBzYWZlcgo+IHRvIGRv
IHRhaWwgLWYgb24gYSBjb25zb2xlIG91dHB1dCBvZiB1bnRydXN0ZWQgZ3Vlc3QuCj4gVGhlIHB0
eSBvdXRwdXQgaXMgdW5hZmZlY3RlZCBieSB0aGlzIG9wdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCi4uLiB0aG91
Z2ggSSB3b3VsZCBsaWtlIHRvIG1ha2UgYSBtaW5vciBtb2RpZmljYXRpb24gd2hlbiBjb21taXR0
aW5nLgpTZWUgYmVsb3cuCgo+ICBzdGF0aWMgaW50IHdyaXRlX2FsbChpbnQgZmQsIGNvbnN0IGNo
YXIqIGJ1Ziwgc2l6ZV90IGxlbikKPiAgewo+ICsJY2hhciBidWZfcmVwbGFjZWRbMTAyNF07Cj4g
KwlzaXplX3QgdGhpc19yb3VuZDsKClRoZXNlIHR3byBjYW4gYmUgbW92ZWQgaW50byAuLi4gCgo+
ICsKPiAgCXdoaWxlIChsZW4pIHsKPiAtCQlzc2l6ZV90IHJldCA9IHdyaXRlKGZkLCBidWYsIGxl
bik7Cj4gKwkJc3NpemVfdCByZXQ7Cj4gKwkJaWYgKHJlcGxhY2VfZXNjYXBlKSB7CgouLi4gaGVy
ZS4KCkxldCBtZSBrbm93IGlmIHlvdSBkaXNhZ3JlZS4KCj4gKwkJCWlmIChsZW4gPiBzaXplb2Yo
YnVmX3JlcGxhY2VkKSkKPiArCQkJCXRoaXNfcm91bmQgPSBzaXplb2YoYnVmX3JlcGxhY2VkKTsK
PiArCQkJZWxzZQo+ICsJCQkJdGhpc19yb3VuZCA9IGxlbjsKPiArCQkJZG9fcmVwbGFjZV9lc2Nh
cGUoYnVmLCBidWZfcmVwbGFjZWQsIHRoaXNfcm91bmQpOwo+ICsJCQlyZXQgPSB3cml0ZShmZCwg
YnVmX3JlcGxhY2VkLCB0aGlzX3JvdW5kKTsKPiArCQl9IGVsc2UKPiArCQkJcmV0ID0gd3JpdGUo
ZmQsIGJ1ZiwgbGVuKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
