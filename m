From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
Date: Thu, 11 Apr 2019 04:55:21 -0600
Message-ID: <5CAF1D1902000078002268F3@prv1-mh.provo.novell.com>
References: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
 <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEXOX-0006Zn-QU
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:57:25 +0000
In-Reply-To: <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE5IGF0IDEyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDQvMjAxOSAxMTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC02NDgs
NiArNjQ2LDggQEAgc3RhdGljIGludCBjcHVfY2FsbGJhY2soCj4+ICAgICAgY2FzZSBDUFVfVVBf
Q0FOQ0VMRUQ6Cj4+ICAgICAgY2FzZSBDUFVfREVBRDoKPj4gICAgICBjYXNlIENQVV9SRVNVTUVf
RkFJTEVEOgo+PiArICAgICAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShjcHUpOwo+PiArCj4+
ICAgICAgICAgIGlmICggIXBhcmtfb2ZmbGluZV9jcHVzICYmIHN5c3RlbV9zdGF0ZSAhPSBTWVNf
U1RBVEVfc3VzcGVuZCApCj4+ICAgICAgICAgICAgICBmcmVlX3BlcmNwdV90aW1lcnMoY3B1KTsK
Pj4gICAgICAgICAgYnJlYWs7Cj4gCj4gSSdtIHByZXR0eSBzdXJlIHlvdSBhbHNvIG5lZWQgYSBj
YWxsIGluIHRoZSBSRU1PVkVfQ0FTRS4gIFRoZSBjcHUgY29tZXMKPiBvbmxpbmUgZm9yIGxvbmcg
ZW5vdWdoIHRvIHBvdGVudGlhbGx5IGdhaW4gYSB0aW1lci4KCldoYXQgZG8geW91IG1lYW4gYnkg
ImNvbWVzIG9ubGluZSBmb3IgbG9uZyBlbm91Z2giPyBUaGVyZSdzCm5vIGNhbGwgc2l0ZSBmb3Ig
dGhlIG5vdGlmaWVyIHdpdGggQ1BVX1JFTU9WRSByaWdodCBub3csIHNvIHdoYXQKdGhlIGV2ZW50
dWFsIGJlaGF2aW9yIGlzIGdvaW5nIHRvIGJlIGlzIHNpbXBseSB1bmtub3duLiBJIGZvciBvbmUK
ZG9uJ3QgZXhwZWN0IHRoZSBDUFUgdG8gYmUgYnJvdWdodCBiYWNrIHVwIGFnYWluIGluIHRoYXQg
Y2FzZS4KSSdtIHdvbmRlcmluZyBpZiB5b3UncmUgbWl4aW5nIHRoaXMgdXAgd2l0aCBDUFVfUkVT
VU1FX0ZBSUxFRC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
