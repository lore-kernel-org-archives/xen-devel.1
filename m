From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86: consolidate legacy FPU state loading
Date: Thu, 5 Jul 2018 15:38:58 +0100
Message-ID: <20180705143858.kcw7zvh5s2q4at5r@citrix.com>
References: <5B3E232302000078001D18BA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzas=jv=citrix.com=prvs=717a9f9c1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fb5PT-0000ZT-Ba
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 14:39:03 +0000
Content-Disposition: inline
In-Reply-To: <5B3E232302000078001D18BA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMDc6NTQ6NDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRmlyc3Qgb2YgYWxsIGludHJvZHVjZSBhIGhlbHBlciBmdW5jdGlvbiBpbnN0ZWFkIG9m
IHJlcGxpY2F0aW5nIGFsbW9zdAo+IHRoZSBzYW1lIGNvZGUgZm9yIFBWIGFuZCBIVk0uIFRoZSBk
aWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSB0d28gcGllY2VzIG9mCj4gY29kZSBhY3R1YWxseSBwb2lu
dHMgb3V0IGFuIGlzc3VlICh3aGljaCBpcyBhbHNvIGFkZHJlc3NlZCBoZXJlKTogSW4KPiB0aGUg
SFZNIGNhc2UgRkNXIHdvdWxkIG5vdCBoYXZlIGJlZW4gc2V0IHRvIEZDV19SRVNFVCBpbiBjZXJ0
YWluIGNhc2VzCj4gKG5vdGUgZm9yIGV4YW1wbGUgdGhhdCBYUlNUT1IgbG9hZHMgRkNXX0RFRkFV
TFQgcmF0aGVyIHRoZW4gRkNXX1JFU0VUCj4gd2hlbiB0aGUgcmVzcGVjdGl2ZSB4c3RhdGVfYnYg
Yml0IGlzIGNsZWFyKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
