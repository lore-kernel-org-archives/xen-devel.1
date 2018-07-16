From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 04/13] libx86: Share struct cpuid_policy
 with userspace
Date: Mon, 16 Jul 2018 03:38:53 -0600
Message-ID: <5B4C67AD02000078001D43AA@prv1-mh.provo.novell.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1531512194-6865-5-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA3LjE4IGF0IDIyOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvbGlicy5oCj4gKysrIGIvdG9vbHMv
aW5jbHVkZS94ZW4tdG9vbHMvbGlicy5oCj4gQEAgLTEzLDQgKzEzLDggQEAKPiAgI2RlZmluZSBB
UlJBWV9TSVpFKGEpIChzaXplb2YoYSkgLyBzaXplb2YoKmEpKQo+ICAjZW5kaWYKPiAgCj4gKyNp
Zm5kZWYgTUFYCj4gKyNkZWZpbmUgTUFYKHgsIHkpICgoeCkgPiAoeSkgPyAoeCkgOiAoeSkpCj4g
KyNlbmRpZgoKSSBmaW5kIGFzeW1tZXRyaWVzIGxpa2UgdGhpcyBvZGQ6IFRoZXJlIHNob3VsZCB0
aGVuIGFsc28gYmUgTUlOKCkgaW1vLgoKPiArc3RhdGljIGlubGluZSB2b2lkIGNwdWlkX2ZlYXR1
cmVzZXRfdG9fcG9saWN5KAo+ICsgICAgY29uc3QgdWludDMyX3QgZnNbRkVBVFVSRVNFVF9OUl9F
TlRSSUVTXSwgc3RydWN0IGNwdWlkX3BvbGljeSAqcCkKPiArewo+ICsgICAgcC0+YmFzaWMuXzFk
ICA9IGZzW0ZFQVRVUkVTRVRfMWRdOwo+ICsgICAgcC0+YmFzaWMuXzFjICA9IGZzW0ZFQVRVUkVT
RVRfMWNdOwo+ICsgICAgcC0+ZXh0ZC5lMWQgICA9IGZzW0ZFQVRVUkVTRVRfZTFkXTsKPiArICAg
IHAtPmV4dGQuZTFjICAgPSBmc1tGRUFUVVJFU0VUX2UxY107Cj4gKyAgICBwLT54c3RhdGUuRGEx
ID0gZnNbRkVBVFVSRVNFVF9EYTFdOwo+ICsgICAgcC0+ZmVhdC5fN2IwICA9IGZzW0ZFQVRVUkVT
RVRfN2IwXTsKPiArICAgIHAtPmZlYXQuXzdjMCAgPSBmc1tGRUFUVVJFU0VUXzdjMF07Cj4gKyAg
ICBwLT5leHRkLmU3ZCAgID0gZnNbRkVBVFVSRVNFVF9lN2RdOwo+ICsgICAgcC0+ZXh0ZC5lOGIg
ICA9IGZzW0ZFQVRVUkVTRVRfZThiXTsKPiArICAgIHAtPmZlYXQuXzdkMCAgPSBmc1tGRUFUVVJF
U0VUXzdkMF07Cj4gK30KCkkgcmVhbGl6ZSB0aGlzIGlzIG9ubHkgY29kZSBtb3ZlbWVudCwgYnV0
IHNpbmNlIHlvdSBkaWRuJ3QgYW5zd2VyIHRoZQpxdWVzdGlvbiByYWlzZWQgb24gdGhlIEludGVs
IFByb2Nlc3MgVHJhY2UgdGhyZWFkICh2MiAwMy8xMCkgeWV0LCBJJ2xsCnJhaXNlIGl0IGhlcmUg
YWdhaW46IFNob3VsZG4ndCBvdGhlciBmaWVsZHMgb2YgcCBiZSBzZXQgdG8gemVybyBoZXJlPwoK
SXJyZXNwZWN0aXZlIG9mIGJvdGggaXRlbXMgKGkuZS4gd2l0aCBvciB3aXRob3V0IHRoZW0gYWRk
cmVzc2VkKQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
