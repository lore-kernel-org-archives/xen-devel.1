From: Eric Blake <eblake@redhat.com>
Subject: Re: [libvirt] Likely build race,
 "/usr/bin/ld: cannot find -lvirt"
Date: Tue, 12 Jun 2018 07:57:40 -0500
Message-ID: <40ae06c8-3f75-42e4-b559-ee8cab4a209e__7708.56627864322$1528808198$gmane$org@redhat.com>
References: <23301.35254.157281.663042@mariner.uk.xensource.com>
 <23302.37799.818992.987166@mariner.uk.xensource.com>
 <3b9e420b-80c3-e18b-a2a7-4a43f8afffa2@suse.com>
 <20180612111145.GH875401@orkuz.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=elvj=i6=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fSirq-0008Qa-9r
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 12:57:46 +0000
In-Reply-To: <20180612111145.GH875401@orkuz.home>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jiri Denemark <jdenemar@redhat.com>, Jim Fehlig <jfehlig@suse.com>
Cc: libvir-list@redhat.com, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAwNjoxMSBBTSwgSmlyaSBEZW5lbWFyayB3cm90ZToKCj4gSSBoaXQgdGhl
IHNhbWUgcmFjZSB0d2ljZSBvbiBhYXJjaDY0IGFuZCBwcGM2NCBhbmQgSSBjYW4gY29uZmlybSB0
aGUKPiBpbnN0YWxsYXRpb24gcGhhc2UgZmFpbHMgaWYgbGlidmlydC5sYSBpcyBpbnN0YWxsZWQg
bGF0ZXIgdGhhbiBsaWJyYXJpZXMKPiB3aGljaCBsaW5rIHRvIGl0LiBIb3dldmVyLCB0aGUgZGVw
ZW5kZW5jaWVzIHNlZW0gdG8gYmUgc2V0IGNvcnJlY3RseSBpbgo+IHRoZSBNYWtlZmlsZXMuIEJ1
dCBpdCBsb29rcyBsaWtlIHRoZXkgYXJlIG9ubHkgaG9ub3JlZCB3aGVuIGxpbmtpbmcgdGhlCj4g
bGlicmFyeSBkdXJpbmcgdGhlIGJ1aWxkIHBoYXNlLiBEdXJpbmcgbWFrZSBpbnN0YWxsIGxpYnZp
cnQubGEgYW5kCj4gbGlicmFyaWVzIHdoaWNoIGxpbmsgdG8gaXQgYXJlIGluc3RhbGxlZCBpbmRl
cGVuZGVudGx5LiBUaGF0IGlzLAo+IGluc3RhbGwtbW9kTFRMSUJSQVJJRVMgZG9lcyBub3QgZGVw
ZW5kIG9uIGFueXRoaW5nIGV4Y2VwdCBmb3IgdGhlCj4gbW9kX0xUSUJSQVJJRVMgdGhlbXNlbHZl
cy4gVGh1cyB3aGVuIGxpYnRvb2wgZGVjaWRlcyB0byByZWxpbmsgdGhlCj4gbGlicmFyaWVzIGxp
YnZpcnQubGEgbWF5IHN0aWxsIGJlIG1pc3NpbmcgYXQgdGhpcyBwb2ludC4gTWFudWFsbHkKPiBj
aGFuZ2luZwo+IAo+ICAgICAgaW5zdGFsbC1tb2RMVExJQlJBUklFUzogJChtb2RfTFRMSUJSQVJJ
RVMpCj4gCj4gdG8KPiAKPiAgICAgIGluc3RhbGwtbW9kTFRMSUJSQVJJRVM6ICQobW9kX0xUTElC
UkFSSUVTKSBpbnN0YWxsLWxpYkxUTElCUkFSSUVTCj4gCj4gZml4ZWQgdGhlIHByb2JsZW0gZm9y
IG1lICh0ZXN0ZWQgd2l0aCBhbiBhcnRpZmljaWFsIGRlbGF5IGFkZGVkIHRvCj4gaW5zdGFsbC1s
aWJMVExJQlJBUklFUyB0YXJnZXQpLCBidXQgSSBoYXZlIG5vIGlkZWEgaG93IHRvIHBlcnN1YWRl
Cj4gYXV0b21ha2UgdG8gZ2VuZXJhdGUgc29tZXRoaW5nIGxpa2UgdGhhdCBmb3IgdXMuCj4gCj4g
RXJpYywgaXMgbXkgaW52ZXN0aWdhdGlvbiBjb3JyZWN0IGFuZCBkbyB5b3UgaGF2ZSBhbnkgaWRl
YXMgb24gaG93IHRvCj4gZml4IHRoZSByYWNlPwoKQ2FuIHlvdSBhZGQgdGhhdCBsaW5lIGRpcmVj
dGx5IGludG8gTWFrZWZpbGUuYW0sIG9yIGRvZXMgZG9pbmcgdGhhdCAKY2F1c2UgYXV0b21ha2Ug
dG8gY29tcGxhaW4gYW5kL29yIG9taXQgaXRzIG5vcm1hbCBydWxlcyBiZWNhdXNlIGl0IAp0aGlu
a3MgeW91IGFyZSBvdmVycmlkaW5nIGl0cyBkZWZhdWx0cz8KCkkga25vdyB0aGF0IGdldHRpbmcg
YXV0b21ha2UgdG8gYWRkIGEgZGVwZW5kZW5jeSBpcyBub3QgYWx3YXlzIHRyaXZpYWwsIApidXQg
dGhhdCBpdCBzaG91bGQgYmUgcG9zc2libGUgKG15IHN0cmVuZ3RocyBsaWUgbW9yZSBvbiBhdXRv
Y29uZiB0aGFuIApvbiBhdXRvbWFrZSkuCgotLSAKRXJpYyBCbGFrZSwgUHJpbmNpcGFsIFNvZnR3
YXJlIEVuZ2luZWVyClJlZCBIYXQsIEluYy4gICAgICAgICAgICsxLTkxOS0zMDEtMzI2NgpWaXJ0
dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
