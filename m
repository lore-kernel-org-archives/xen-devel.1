From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 2/9] x86/vioapic: block
 speculative out-of-bound accesses
Date: Fri, 22 Feb 2019 06:02:13 -0700
Message-ID: <5C6FF2D502000078002192A9@prv1-mh.provo.novell.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-3-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAUy-0005KS-QS
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:04:16 +0000
In-Reply-To: <1550737003-25779-3-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDA5OjE2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBX
aGVuIGludGVyYWN0aW5nIHdpdGggaW8gYXBpYywgYSBndWVzdCBjYW4gc3BlY2lmeSB2YWx1ZXMg
dGhhdCBhcmUgdXNlZAo+IGFzIGluZGV4IHRvIHN0cnVjdHVyZXMsIGFuZCB3aG9zZSB2YWx1ZXMg
YXJlIG5vdCBjb21wYXJlZCBhZ2FpbnN0Cj4gdXBwZXIgYm91bmRzIHRvIHByZXZlbnQgc3BlY3Vs
YXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLiBUaGlzIGNoYW5nZQo+IHByZXZlbnRzIHRoZXNl
IHNwZWN1bGF0aXZlIGFjY2Vzc2VzLgo+IAo+IEZ1cnRoZXJtb3JlLCB2YXJpYWJsZXMgYXJlIGlu
aXRpYWxpemVkIGFuZCB0aGUgY29tcGlsZXIgaXMgYXNrZWQgdG8gbm90Cj4gb3B0aW1pemVkIHRo
ZXNlIGluaXRpYWxpemF0aW9ucywgYXMgdGhlIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIG1pZ2h0
IGJlCj4gdXNlZCBpbiBhIHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3MuIE91dCBvZiB0
aGUgZm91ciBpbml0aWFsaXplZAo+IHZhcmlhYmxlcywgdHdvIGFyZSBwb3RlbnRpYWxseSBwcm9i
bGVtYXRpYywgbmFtZWx5IG9uZXMgaW4gdGhlIGZ1bmN0aW9ucwo+IHZpb2FwaWNfaXJxX3Bvc2l0
aXZlX2VkZ2UgYW5kIHZpb2FwaWNfZ2V0X3RyaWdnZXJfbW9kZS4KPiAKPiBBcyB0aGUgdHdvIHBy
b2JsZW1hdGljIHZhcmlhYmxlcyBhcmUgYm90aCB1c2VkIGluIHRoZSBjb21tb24gZnVuY3Rpb24K
PiBnc2lfdmlvYXBpYywgdGhlIG1pdGlnYXRpb24gaXMgaW1wbGVtZW50ZWQgdGhlcmUuIEFzIHRo
ZSBhY2Nlc3MgcGF0dGVybgo+IG9mIHRoZSBjdXJyZW50bHkgbm9uLWd1ZXN0LWNvbnRyb2xsZWQg
ZnVuY3Rpb25zIG1pZ2h0IGNoYW5nZSBpbiB0aGUKPiBmdXR1cmUgYXMgd2VsbCwgdGhlIG90aGVy
IHZhcmlhYmxlcyBhcmUgaW5pdGlhbGl6ZWQgYXMgd2VsbC4KPiAKPiBUaGlzIGlzIHBhcnQgb2Yg
dGhlIHNwZWN1bGF0aXZlIGhhcmRlbmluZyBlZmZvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTm9y
YmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
