From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 09/18] xsm, argo: XSM control for argo
 register; add argo_mac bootparam
Date: Thu, 20 Dec 2018 08:29:34 -0700
Message-ID: <5C1BB55E0200007800208228@prv1-mh.provo.novell.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
 <1545287955-27684-10-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ga0GZ-0000bB-KR
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:29:39 +0000
In-Reply-To: <1545287955-27684-10-git-send-email-christopher.w.clark@gmail.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDA3OjM5LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdv
LmMKPiBAQCAtMzUsNiArMzUsMjIgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2FyZ29f
cmluZ190KTsKPiAgc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBvcHRfYXJnb19lbmFibGVkOwo+
ICBib29sZWFuX3BhcmFtKCJhcmdvIiwgb3B0X2FyZ29fZW5hYmxlZCk7Cj4gIAo+ICsvKiBYZW4g
Y29tbWFuZCBsaW5lIG9wdGlvbiBmb3IgY29uc2VydmF0aXZlIG9yIHJlbGF4ZWQgYWNjZXNzIGNv
bnRyb2wgKi8KPiArYm9vbCBfX3JlYWRfbW9zdGx5IGFyZ29fbWFjX2Jvb3RwYXJhbV9lbmZvcmNp
bmcgPSB0cnVlOwoKUGxlYXNlIGNhbiB5b3UgZm9sbG93IG91ciBuYW1pbmcgY29udmVudGlvbiwg
d2hpY2ggd291bGQKbWFrZSB0aGlzIHNvbWV0aGluZyBsaWtlIG9wdF9hcmdvX21hY19lbmZvcmNp
bmc/CgpBbmQgdGhlbiAtIGV4Y2VwdCBpbiB0aGUgcGFyc2luZyBmdW5jdGlvbiwgdGhlIHZhcmlh
YmxlIGlzIG5ldmVyCnVzZWQuCgo+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9hcmdvX21hY19w
YXJhbShjb25zdCBjaGFyICpzKQo+ICt7Cj4gKyAgICBpZiAoICFzdHJjbXAocywgImVuZm9yY2lu
ZyIpICkKPiArICAgICAgICBhcmdvX21hY19ib290cGFyYW1fZW5mb3JjaW5nID0gdHJ1ZTsKPiAr
ICAgIGVsc2UgaWYgKCAhc3RyY21wKHMsICJwZXJtaXNzaXZlIikgKQo+ICsgICAgICAgIGFyZ29f
bWFjX2Jvb3RwYXJhbV9lbmZvcmNpbmcgPSBmYWxzZTsKPiArICAgIGVsc2UKPiArICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICByZXR1cm4gMDsKPiArfQo+ICtjdXN0b21fcGFyYW0o
ImFyZ29fbWFjIiwgcGFyc2VfYXJnb19tYWNfcGFyYW0pOwoKTmV3IGNvbW1hbmQgbGluZSBvcHRp
b25zIG5lZWQgdG8gYmUgYWNjb21wYW5pZWQgYnkgYW4KYWRkaXRpb24gdG8gZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUubWFya2Rvd24uCgpBbHNvIHdlJ3ZlIG1vcmUgb3IgbGVzcyBzZXR0bGVk
IG9uIHVzaW5nIGRhc2hlcyBpbnN0ZWFkIG9mCnVuZGVyc2NvcmVzIGluIG5ldyBjb21tYW5kIGxp
bmUgb3B0aW9ucy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
