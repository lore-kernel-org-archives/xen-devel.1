From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/hvm: remove default ioreq server
Date: Wed, 8 Aug 2018 12:38:52 +0100
Message-ID: <d7c86002-171c-b9c6-a8fe-dc34f724331e@citrix.com>
References: <20180807154201.13943-1-paul.durrant@citrix.com>
 <5B6AC1D102000078001DBEDC@prv1-mh.provo.novell.com>
 <762f1ad90c794a358c848fb3f5f9c9f2@AMSPEX02CL03.citrite.net>
 <5B6ACA9502000078001DBF64@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rtkw=kx=citrix.com=prvs=751d397f3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fnMnq-0002Pz-Is
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 11:38:58 +0000
In-Reply-To: <5B6ACA9502000078001DBF64@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDgvMTggMTE6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjA4LjE4IGF0
IDEyOjM5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gRnJvbTogSmFuIEJl
dWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4+IFNlbnQ6IDA4IEF1Z3VzdCAyMDE4
IDExOjExCj4+Pgo+Pj4+Pj4gT24gMDcuMDguMTggYXQgMTc6NDIsIDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9wYXJhbXMu
aAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vcGFyYW1zLmgKPj4+PiBAQCAtODEs
OSArODEsMTMgQEAKPj4+PiAgI2RlZmluZSBIVk1fUEFSQU1fUEFFX0VOQUJMRUQgIDQKPj4+Pgo+
Pj4+ICAjZGVmaW5lIEhWTV9QQVJBTV9JT1JFUV9QRk4gICAgNQo+Pj4+IC0KPj4+PiAgI2RlZmlu
ZSBIVk1fUEFSQU1fQlVGSU9SRVFfUEZOIDYKPj4+PiArCj4+Pj4gKyNpZmRlZiBfX1hFTl9fCj4+
Pj4gKy8qIFRoZXNlIHBhcmFtZXRlcnMgaXMgZGVwcmVjYXRlZCBhbmQgaXRzIG1lYW5pbmcgaXMg
dW5kZWZpbmVkICovCj4+Pj4gKyNkZWZpbmUgSFZNX1BBUkFNX0RNX0RPTUFJTiAxMwo+Pj4+ICAj
ZGVmaW5lIEhWTV9QQVJBTV9CVUZJT1JFUV9FVlRDSE4gMjYKPj4+PiArI2VuZGlmCj4+PiBUaGUg
Y29tbWVudCB3YXMgb25seSBwYXJ0bHkgc3dpdGNoZWQgdG8gcGx1cmFsLgo+Pj4KPj4gT2gsIHNv
IGl0IHdhcy4gSSBndWVzcyB0aGlzIGNhbiBiZSBmaXhlZCBvbiBjb21taXQgdW5sZXNzIHlvdSdk
IHByZWZlciBJIAo+PiBzZW5kIGEgdjQuCj4gT2gsIG9mIGNvdXJzZSBpdCBjYW4gLSBJIG1lYW50
IHRvIHNheSBzbywgYnV0IHRoZW4gZm9yZ290LgoKT25lIG5vdGUgaG93ZXZlci7CoCBUaGlzIHBh
dGNoIGNhbm5vdCBiZSBjb21taXR0ZWQgdW50aWwgdGhlIGFzc29jaWF0ZWQKcGF0Y2ggaXMgY29t
bWl0dGVkIGludG8gcWVtdS10cmFkLCB3aGljaCBpcyB3YWl0aW5nIG9uIElhbkogYXMgdGhlCm1h
aW50YWluZXIgb2YgdGhhdCB0cmVlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
