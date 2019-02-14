From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] viridian: fix the
 HvFlushVirtualAddress/List hypercall implementation
Date: Thu, 14 Feb 2019 06:19:25 -0700
Message-ID: <5C656ADD0200007800216B52@prv1-mh.provo.novell.com>
References: <20190214124907.12011-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guGvN-00049Q-Rz
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:19:33 +0000
In-Reply-To: <20190214124907.12011-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE5IGF0IDEzOjQ5LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCj4gQEAgLTM5NjQsMjYgKzM5NjQsMjggQEAgc3RhdGljIHZvaWQgaHZtX3MzX3Jlc3Vt
ZShzdHJ1Y3QgZG9tYWluICpkKQo+ICAgICAgfQo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGh2bW9w
X2ZsdXNoX3RsYl9hbGwodm9pZCkKPiArYm9vbCBodm1fZmx1c2hfdmNwdV90bGIoYm9vbCAoKmZs
dXNoX3ZjcHUpKHZvaWQgKmN0eHQsIHN0cnVjdCB2Y3B1ICp2KSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgdm9pZCAqY3R4dCkKPiAgewo+ICsgICAgc3RhdGljIERFRklORV9QRVJfQ1BVKGNw
dW1hc2tfdCwgZmx1c2hfY3B1bWFzayk7Cj4gKyAgICBjcHVtYXNrX3QgKm1hc2sgPSAmdGhpc19j
cHUoZmx1c2hfY3B1bWFzayk7Cj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9t
YWluOwo+ICAgICAgc3RydWN0IHZjcHUgKnY7Cj4gIAo+IC0gICAgaWYgKCAhaXNfaHZtX2RvbWFp
bihkKSApCj4gLSAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gLQo+ICAgICAgLyogQXZvaWQgZGVh
ZGxvY2sgaWYgbW9yZSB0aGFuIG9uZSB2Y3B1IHRyaWVzIHRoaXMgYXQgdGhlIHNhbWUgdGltZS4g
Ki8KPiAgICAgIGlmICggIXNwaW5fdHJ5bG9jaygmZC0+aHlwZXJjYWxsX2RlYWRsb2NrX211dGV4
KSApCj4gLSAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsKPiArICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gIAo+ICAgICAgLyogUGF1c2UgYWxsIG90aGVyIHZjcHVzLiAqLwo+ICAgICAgZm9yX2VhY2hf
dmNwdSAoIGQsIHYgKQo+IC0gICAgICAgIGlmICggdiAhPSBjdXJyZW50ICkKPiArICAgICAgICBp
ZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKPiAgICAgICAgICAgICAg
dmNwdV9wYXVzZV9ub3N5bmModik7Cj4gIAo+ICsgICAgY3B1bWFza19jbGVhcihtYXNrKTsKCkkn
ZCBwcmVmZXIgaWYgdGhpcyB3YXMgcHVsbGVkIGZ1cnRoZXIgZG93biBhcyB3ZWxsLCBpbiBwYXJ0
aWN1bGFyIG91dHNpZGUgdGhlCmxvY2tlZCByZWdpb24uIFdpdGggdGhpcywgd2hpY2ggaXMgZWFz
eSBlbm91Z2ggdG8gZG8gd2hpbGUgY29tbWl0dGluZywKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCkNjLWluZyBKw7xyZ2VuIGluIHRoZSBob3BlcyBmb3IgaGlz
IFItYS1iLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
