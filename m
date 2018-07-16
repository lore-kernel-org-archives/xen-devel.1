From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/13] libx86: Share struct cpuid_policy
 with userspace
Date: Mon, 16 Jul 2018 10:51:35 +0100
Message-ID: <c33d55a5-63e4-fa93-49c2-3fd8e9de4340@citrix.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-5-git-send-email-andrew.cooper3@citrix.com>
 <5B4C67AD02000078001D43AA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4C67AD02000078001D43AA@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTA6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEzLjA3LjE4IGF0
IDIyOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3Rvb2xz
L2luY2x1ZGUveGVuLXRvb2xzL2xpYnMuaAo+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi10b29s
cy9saWJzLmgKPj4gQEAgLTEzLDQgKzEzLDggQEAKPj4gICNkZWZpbmUgQVJSQVlfU0laRShhKSAo
c2l6ZW9mKGEpIC8gc2l6ZW9mKCphKSkKPj4gICNlbmRpZgo+PiAgCj4+ICsjaWZuZGVmIE1BWAo+
PiArI2RlZmluZSBNQVgoeCwgeSkgKCh4KSA+ICh5KSA/ICh4KSA6ICh5KSkKPj4gKyNlbmRpZgo+
IEkgZmluZCBhc3ltbWV0cmllcyBsaWtlIHRoaXMgb2RkOiBUaGVyZSBzaG91bGQgdGhlbiBhbHNv
IGJlIE1JTigpIGltby4KClBhdGNoIDcsIHdoZXJlIGl0IGlzIGZpcnN0IHVzZWQuCgo+Cj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgY3B1aWRfZmVhdHVyZXNldF90b19wb2xpY3koCj4+ICsgICAgY29u
c3QgdWludDMyX3QgZnNbRkVBVFVSRVNFVF9OUl9FTlRSSUVTXSwgc3RydWN0IGNwdWlkX3BvbGlj
eSAqcCkKPj4gK3sKPj4gKyAgICBwLT5iYXNpYy5fMWQgID0gZnNbRkVBVFVSRVNFVF8xZF07Cj4+
ICsgICAgcC0+YmFzaWMuXzFjICA9IGZzW0ZFQVRVUkVTRVRfMWNdOwo+PiArICAgIHAtPmV4dGQu
ZTFkICAgPSBmc1tGRUFUVVJFU0VUX2UxZF07Cj4+ICsgICAgcC0+ZXh0ZC5lMWMgICA9IGZzW0ZF
QVRVUkVTRVRfZTFjXTsKPj4gKyAgICBwLT54c3RhdGUuRGExID0gZnNbRkVBVFVSRVNFVF9EYTFd
Owo+PiArICAgIHAtPmZlYXQuXzdiMCAgPSBmc1tGRUFUVVJFU0VUXzdiMF07Cj4+ICsgICAgcC0+
ZmVhdC5fN2MwICA9IGZzW0ZFQVRVUkVTRVRfN2MwXTsKPj4gKyAgICBwLT5leHRkLmU3ZCAgID0g
ZnNbRkVBVFVSRVNFVF9lN2RdOwo+PiArICAgIHAtPmV4dGQuZThiICAgPSBmc1tGRUFUVVJFU0VU
X2U4Yl07Cj4+ICsgICAgcC0+ZmVhdC5fN2QwICA9IGZzW0ZFQVRVUkVTRVRfN2QwXTsKPj4gK30K
PiBJIHJlYWxpemUgdGhpcyBpcyBvbmx5IGNvZGUgbW92ZW1lbnQsIGJ1dCBzaW5jZSB5b3UgZGlk
bid0IGFuc3dlciB0aGUKPiBxdWVzdGlvbiByYWlzZWQgb24gdGhlIEludGVsIFByb2Nlc3MgVHJh
Y2UgdGhyZWFkICh2MiAwMy8xMCkgeWV0LCBJJ2xsCj4gcmFpc2UgaXQgaGVyZSBhZ2FpbjogU2hv
dWxkbid0IG90aGVyIGZpZWxkcyBvZiBwIGJlIHNldCB0byB6ZXJvIGhlcmU/CgpObyAtIHdoeSBz
aG91bGQgaXQ/CgooSW4gZmFjdCwgaXQgdmVyeSBkZWxpYmVyYXRlbHkgZG9lcyBub3QsIGFuZCBj
aGFuZ2luZyB0aGlzIHdpbGwgYnJlYWsKYWxsIG9mIHRoZSBwb2xpY3kgZGVyaXZhdGlvbiBsb2dp
Yy4pCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
