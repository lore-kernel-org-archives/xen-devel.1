From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] common: make sure symbols-dummy.o gets
 rebuilt when needed
Date: Thu, 22 Nov 2018 16:20:57 +0000
Message-ID: <20181122162057.krmfjux2w7xu3qle@zion.uk.xensource.com>
References: <5BF6894D02000078001FECE2@prv1-mh.provo.novell.com>
 <20181122153049.gu6jbtkm7muqvzz4@zion.uk.xensource.com>
 <5BF6D57C02000078001FF10D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKve=OB=citrix.com=prvs=857cca76a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gPrix-0004Jm-E2
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 16:21:03 +0000
Content-Disposition: inline
In-Reply-To: <5BF6D57C02000078001FF10D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDk6MTI6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjExLjE4IGF0IDE2OjMwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUaHUsIE5vdiAyMiwgMjAxOCBhdCAwMzo0Nzo0MUFNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiAtLS0gYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUKPiA+PiArKysgYi94
ZW4vYXJjaC9hcm0vTWFrZWZpbGUKPiA+PiBAQCAtMTAwLDkgKzEwMCw2IEBAIHByZWxpbmsubzog
JChBTExfT0JKUykKPiA+PiAgCSQoTEQpICQoTERGTEFHUykgLXIgLW8gJEAgJF4KPiA+PiAgZW5k
aWYKPiA+PiAgCj4gPj4gLSQoQkFTRURJUikvY29tbW9uL3N5bWJvbHMtZHVtbXkubzoKPiA+PiAt
CSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyAkKEJBU0VESVIpL2NvbW1vbiBzeW1i
b2xzLWR1bW15Lm8KPiA+PiAtCj4gPj4gICQoVEFSR0VUKS1zeW1zOiBwcmVsaW5rLm8geGVuLmxk
cyAkKEJBU0VESVIpL2NvbW1vbi9zeW1ib2xzLWR1bW15Lm8KPiA+IAo+ID4gQXMgZGlzY3Vzc2Vk
IG9uIElSQyBkaXJlY3QgZGVwZW5kZW5jaWVzIG9uIHN5bWJvbHMtZHVtbXkubyBzaG91bGQgYmUK
PiA+IGRlbGV0ZWQuCj4gCj4gSSdsbCBkcm9wIHRoZW0sIGJ1dCBJJ20gaGF2aW5nIHRyb3VibGUg
c2VlaW5nIGhvdyB0aGVpciBwcmVzZW5jZQo+IHdvdWxkIGJyZWFrIHRoaW5ncy4gV2UgcmVjdXJz
ZSBpbnRvIGNvbW1vbi8gbm9ybWFsbHkgYW55d2F5Lgo+IAoKTWFrZSB0cmllcyB0byBidWlsZCAk
KEJBU0VESVIpL2NvbW1vbi9zeW1ib2xzLWR1bW15Lm8gYmVmb3JlIHJlY3Vyc2luZwppbnRvIGNv
bW1vbS8uIElmIHlvdSBsb29rIGF0IHRoZSBnZW5lcmF0ZWQgZGVwZW5kZW5jeSBmaWxlLCBpdCBj
b250YWlucwp0aGUgZnVsbCBwYXRoIG9iamVjdCBmaWxlIGFzIHRhcmdldC4KCldlaS4KCj4gSmFu
Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
