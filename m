From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 01/13] grant_table: use term 'mfn' for
 machine frame numbers...
Date: Tue, 10 Jul 2018 14:19:40 +0100
Message-ID: <dd14956a-a37a-667f-e468-134ad24a6f7f@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sxqp=j2=citrix.com=prvs=722797069=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fcsYS-0002te-TO
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:19:44 +0000
In-Reply-To: <20180707110526.35822-2-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDcvMjAxOCAxMjowNSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLnJhdGhlciB0
aGFuIG1vcmUgYW1iaWd1b3VzIHRlcm0gJ2ZyYW1lJy4KPiAKPiBUaGVyZSBhcmUgbWFueSBwbGFj
ZXMgaW4gdGhlIGdyYW50IHRhYmxlIGNvZGUgdGhhdCB1c2UgYSB2YXJpYWJsZSBvcgo+IGZpZWxk
IG5hbWUgJy4qZnJhbWUnIHRvIHJlZmVyIHRvIGEgcXVhbnRpdHkgdGhhdCBpcyBzdHJpY3RseSBh
biBNRk4sIGFuZAo+IGV2ZW4gaGFzIHR5cGUgbWZuX3QuCj4gVGhpcyBwYXRjaCBpcyBhIHB1cmVs
eSBjb3NtZXRpYyBwYXRjaCB0aGF0IHN1YnN0aXR1dGVzICdmcmFtZScgd2l0aCAnbWZuJwo+IGlu
IHRob3NlIHBsYWNlcyB0byBtYWtlIHRoZSBwdXJwb3NlIG9mIHRoZSB2YXJpYWJsZSBvciBmaWVs
ZCBuYW1lIG1vcmUKPiBvYnZpb3VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpMb29rcyBnb29kLiAgT25lIG1pbm9yIGNvbW1lbnQu
Li4KCj4gQEAgLTIzMjAsNyArMjMyMCw3IEBAIHJlbGVhc2VfZ3JhbnRfZm9yX2NvcHkoCj4gICAg
ICBzdHJ1Y3QgZ3JhbnRfdGFibGUgKnJndCA9IHJkLT5ncmFudF90YWJsZTsKPiAgICAgIGdyYW50
X2VudHJ5X2hlYWRlcl90ICpzaGE7Cj4gICAgICBzdHJ1Y3QgYWN0aXZlX2dyYW50X2VudHJ5ICph
Y3Q7Cj4gLSAgICBtZm5fdCByX2ZyYW1lOwo+ICsgICAgbWZuX3QgbWZuOwo+ICAgICAgdWludDE2
X3QgKnN0YXR1czsKPiAgICAgIGdyYW50X3JlZl90IHRyYW5zX2dyZWY7Cj4gICAgICBzdHJ1Y3Qg
ZG9tYWluICp0ZDsKCklmIHlvdSBlbmQgdXAgcmVzcGlubmluZyB0aGlzLCB5b3UgbWlnaHQgY29u
c2lkZXIgbWFraW5nIHRoaXMgJ3JtZm4nIG9yCnNvbWV0aGlnbiwganVzdCBiZWNhdXNlIGV2ZXJ5
dGhpbmcgaW4gdGhpcyBmdW5jdGlvbiBzZWVtcyB0byBoYXZlIHRoZQoncicgcHJlZml4LgoKQnV0
IGVpdGhlciB3YXk6CgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
