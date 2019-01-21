From: Julien Grall <julien.grall@arm.com>
Subject: Re: Backport candidate for Arm
Date: Mon, 21 Jan 2019 18:18:53 +0000
Message-ID: <cc1466b5-fbc3-0e1f-6092-4f559866337c@arm.com>
References: <80edd4d5-e2b7-bcb5-32ac-9d2c9096299f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rLzG=P5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gleAR-0007O6-C7
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 18:19:27 +0000
In-Reply-To: <80edd4d5-e2b7-bcb5-32ac-9d2c9096299f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpQaW5nPwoKQ2hlZXJzLAoKT24gMzAvMTEvMjAxOCAxNzoyNSwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IEJlbG93IGEgbGlzdCBvZiBiYWNrcG9ydCBjYW5kaWRhdGUgZm9yIEFy
bS4KPiAKPiAKPiBGb3IgWGVuIDQuMTArIHRvIGhhbmRsZSBjb3JyZWN0bHkgU01DIGNhbGwgcGFy
YW1ldGVycyBhbmQgcmVzdWx0Cj4gCj4gMzVmYzYwODYxMsKgwqDCoCB4ZW4vYXJtOiBzbWNjYy0x
LjE6IE1ha2UgcmV0dXJuIHZhbHVlcyB1bnNpZ25lZCBsb25nCj4gZmE3OTc0Zjc0M8KgwqDCoMKg
wqAgeGVuL2FybTogc21jY2MtMS4xOiBIYW5kbGUgZnVuY3Rpb24gcmVzdWx0IGFzIHBhcmFtZXRl
cnMKPiAKPiBGb3IgWGVuIDQuOSsgdG8gYXZvaWQgRG9tMCBjcmFzaCB3aGVuIHVzaW5nIGxlc3Mg
dkNQVXMgdGhhbiBwQ1BVcyBvbiBHSUN2Mwo+IAo+IDcwM2Q5ZDVlYzHCoMKgwqDCoMKgIHhlbi9h
cm06IHZnaWMtdjM6IERlbGF5IHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgZG9tYWluIAo+IGlu
Zm9ybWF0aW9uCj4gNTRlYzU5ZjZiMMKgwqDCoMKgwqDCoCB4ZW4vYXJtOiB2Z2ljLXYzOiBEb24n
dCBjcmVhdGUgZW1wdHkgcmUtZGlzdHJpYnV0b3IgcmVnaW9ucwo+IAo+IFRoZSBmb2xsb3dpbmcg
cGF0Y2ggaXMgcmVxdWlyZWQgaW4gWGVuIDQuMTEgdG8gYXZvaWQgYnJlYWtpbmcgdGhlIG5ldyB2
R0lDIGFmdGVyIAo+IGFwcGx5aW5nIHRoZSAyIHByZXZpb3VzIHBhdGNoZXMuCj4gCj4gNjJhYTll
N2YxYsKgwqDCoCB4ZW4vYXJtOiBEb24ndCBidWlsZCBHSUN2MyB3aXRoIHRoZSBuZXcgdkdJQwo+
IAo+IEZvciA0LjkrIHRvIG1ha2UgdGhlIGludGVycnVwdCBwYXRoIHNhZmVyIGJ5IGFkZGluZyBt
aXNzaW5nIGJhcnJpZXJzCj4gCj4gMTc3YWZlYzQ1NcKgwqDCoCB4ZW4vYXJtOiBnaWM6IEVuc3Vy
ZSB3ZSBoYXZlIGFuIElTQiBiZXR3ZWVuIGFjayBhbmQgZG9fSVJRKCkKPiA1NTVlNWYxYmQywqDC
oMKgwqDCoCB4ZW4vYXJtOiBnaWM6IEVuc3VyZSBvcmRlcmluZyBiZXR3ZWVuIHJlYWQgb2YgSU5U
QUNLIGFuZCBzaGFyZWQgCj4gZGF0YQo+IAo+IEZvciA0LjkrIHRvIGNvbXBseSB3aXRoIHRoZSBi
aW5kaW5nIGRlc2NyaXB0aW9uCj4gCj4gMzY4OWM1NDYzMMKgwqDCoCB4ZW4vYXJtOiBjaGVjayBm
b3IgbXVsdGlib290IG5vZGVzIG9ubHkgdW5kZXIgL2Nob3Nlbgo+IAo+IENoZWVycywKPiAKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
