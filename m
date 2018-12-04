From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 06/25] argo: Xen command line parameter
 'argo': bool to enable/disable
Date: Tue, 04 Dec 2018 04:35:19 -0700
Message-ID: <5C0666770200007800202A44@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-7-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gU8z8-0004oR-E4
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 11:35:26 +0000
In-Reply-To: <1543627984-21394-7-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdv
LmMKPiBAQCAtMjgsNiArMjgsMTAgQEAKPiAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoYXJnb19h
ZGRyX3QpOwo+ICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShhcmdvX3JpbmdfdCk7Cj4gIAo+ICsv
KiBYZW4gY29tbWFuZCBsaW5lIG9wdGlvbiB0byBlbmFibGUgYXJnbyAqLwo+ICtzdGF0aWMgYm9v
bCBfX3JlYWRfbW9zdGx5IG9wdF9hcmdvX2VuYWJsZWQgPSAwOwoKVGhlIGluaXRpYWxpemVyIGlz
IHBvaW50bGVzcyBoZXJlLCBhbmQgaWYgdGhlcmUgd2FzIG9uZSB0aGVuIGl0CnNob3VsZCBiZSB0
cnVlIG9yIGZhbHNlLgoKPiBAQCAtMjIzLDYgKzIyNywxMyBAQCBkb19hcmdvX21lc3NhZ2Vfb3Ao
aW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcxLAo+ICAgICAgYXJnb19k
cHJpbnRrKCItPmRvX2FyZ29fbWVzc2FnZV9vcCglZCwlcCwlcCwlZCwlZClcbiIsIGNtZCwKPiAg
ICAgICAgICAgICAgICAgICAodm9pZCAqKWFyZzEucCwgKHZvaWQgKilhcmcyLnAsIChpbnQpIGFy
ZzMsIChpbnQpIGFyZzQpOwo+ICAKPiArICAgIGlmICggdW5saWtlbHkoIW9wdF9hcmdvX2VuYWJs
ZWQpICkKPiArICAgIHsKPiArICAgICAgICByYyA9IC1FTk9TWVM7Cj4gKyAgICAgICAgYXJnb19k
cHJpbnRrKCI8LWRvX2FyZ29fbWVzc2FnZV9vcCgpPSVsZFxuIiwgcmMpOwoKV2hpbGUgSSBjYW4g
c2VlIGRlYnVnZ2luZyBwcmludGsoKXMgdG8gYmUgdXNlZnVsIGluIGNlcnRhaW4gcGxhY2VzLApJ
IHF1ZXN0aW9uIHRoZSB1dGlsaXR5IG9mIHRoaXMgYW5kIHRoZSBvdGhlciBvbmUuIEkgYWxzbyBx
dWVzdGlvbiB0aGUKdXNlIG9mIC1FTk9TWVMgLSBJIHRoaW5rIHlvdSBtZWFuIGUuZy4gLUVPUE5P
VFNVUFAuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
