From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 4/5] iommu: introduce iommu_groups
Date: Fri, 31 May 2019 14:21:57 +0000
Message-ID: <effeb9ace857427993a30f5575dc3a27@AMSPEX02CL03.citrite.net>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
 <5CDC1F96020000780022F4BF@prv1-mh.provo.novell.com>
 <cb3fd070fa6748148dd4af032a7b6edc@AMSPEX02CL03.citrite.net>
 <5CF1368C02000078002340B4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q4nb=T7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hWiQ2-0006HX-KQ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 14:22:06 +0000
In-Reply-To: <5CF1368C02000078002340B4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+PiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaAo+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPj4gPiBA
QCAtNzUsNiArNzUsOSBAQCBzdHJ1Y3QgcGNpX2RldiB7Cj4gPj4gPiAgICAgIHN0cnVjdCBsaXN0
X2hlYWQgYWxsZGV2c19saXN0Owo+ID4+ID4gICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGRvbWFpbl9s
aXN0Owo+ID4+ID4KPiA+PiA+ICsgICAgc3RydWN0IGxpc3RfaGVhZCBncnBkZXZzX2xpc3Q7Cj4g
Pj4KPiA+PiBEb2VzIHRoaXMgc2VwYXJhdGUgbGlzdCBwcm92aWRlIG11Y2ggdmFsdWU/IFRoZSBk
ZXZpY2VzIGluIGEgZ3JvdXAKPiA+PiBhcmUgZ29pbmcgdG8gbW92ZSBiZXR3ZWVuIHR3byBkb21h
aW5fbGlzdC1zIGFsbCBpbiBvbmUgZ28sIHNvCj4gPj4gb25jZSB5b3Uga25vdyB0aGUgZG9tYWlu
IG9mIG9uZSB5b3UnbGwgYmUgYWJsZSB0byBmaW5kIHRoZSByZXN0IGJ5Cj4gPj4gaXRlcmF0aW5n
IHRoYXQgZG9tYWluJ3MgbGlzdC4gSXMgdGhlIGZlYXIgdGhhdCBzdWNoIGFuIGl0ZXJhdGlvbiBt
YXkKPiA+PiBiZSB0ZW5zIG9mIHRob3VzYW5kcyBvZiBlbnRyaWVzIGxvbmcsIGFuZCBoZW5jZSBi
ZWNvbWUgYW4gaXNzdWUKPiA+PiB3aGVuIHRyYXZlcnNlZD8gSSBoYXZlIG5vIGlkZWEgaG93IG1h
bnkgUENJIGRldmljZXMgdGhlIGJpZ2dlc3QKPiA+PiBzeXN0ZW1zIHRvZGF5IHdvdWxkIGhhdmUs
IGJ1dCBpZiB0cmF2ZXJzYWwgd2FzIGFuIGlzc3VlLCB0aGVuIGl0Cj4gPj4gd291bGQgYWxyZWFk
eSBiZSB3aXRoIHRoZSBjb2RlIHdlJ3ZlIGdvdCBub3cuCj4gPgo+ID4gSSdkIHByZWZlciB0byBr
ZWVwIGl0Li4uIEl0IG1ha2VzIHRoZSByZS1pbXBsZW1lbnRhdGlvbiBvZiB0aGUgZG9tY3RsIGlu
IHRoZQo+ID4gbmV4dCBwYXRjaCBtb3JlIHN0cmFpZ2h0Zm9yd2FyZC4KPiAKPiBJIGNhbiBhY2Nl
cHQgdGhpcyBhcyB0aGUgcG9zaXRpdmUgc2lkZS4gQnV0IHRoZXJlJ3MgZXh0cmEgc3RvcmFnZQo+
IG5lZWRlZCAobm90IG11Y2gsIGJ1dCBhbnl3YXkpLCBhbmQgdGhlIG1vcmUgKGluZGVwZW5kZW50
KQo+IGxpc3RzIHdlIGhhdmUgdGhhdCBkZXZpY2VzIGNhbiBiZSBvbiwgdGhlIG1vcmUgbGlrZWx5
IGl0J2xsIGJlIHRoYXQKPiBvbmUgb2YgdGhlbSBnZXRzIHNjcmV3ZWQgdXAgYXQgc29tZSBwb2lu
dCAoZS5nLiBieSBmb3JnZXR0aW5nCj4gdG8gcmVtb3ZlIGEgZGV2aWNlIGZyb20gb25lIG9mIHRo
ZW0gcHJpb3IgdG8gZGUtYWxsb2NhdGlvbikuCgpPaywgSSdsbCBkcm9wIHRoZSBsaXN0IGFuZCBq
dXN0IG1hdGNoIG9uIHRoZSBncnAgcG9pbnRlci4KCiAgUGF1bAoKPiAKPiBKYW4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
