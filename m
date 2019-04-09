From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] timers: limit heap size
Date: Tue, 9 Apr 2019 17:22:37 +0100
Message-ID: <d19d69ba-2930-c66d-a42e-0ca344e2f923@arm.com>
References: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
 <08968726-0f4a-f267-b1f7-c1e08893c5a6@citrix.com>
 <5CACB7900200007800225F17@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDtWE-0006Ai-1y
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:22:42 +0000
In-Reply-To: <5CACB7900200007800225F17@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8wNC8yMDE5IDE2OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwOS4wNC4x
OSBhdCAxNTozOCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAwOS8w
NC8yMDE5IDE0OjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEBAIC00NjMsOSArNDYzLDE0IEBA
IHN0YXRpYyB2b2lkIHRpbWVyX3NvZnRpcnFfYWN0aW9uKHZvaWQpCj4+PiAgICAgICBpZiAoIHVu
bGlrZWx5KHRzLT5saXN0ICE9IE5VTEwpICkKPj4+ICAgICAgIHsKPj4+ICAgICAgICAgICAvKiBv
bGRfbGltaXQgPT0gKDJebiktMTsgbmV3X2xpbWl0ID09ICgyXihuKzQpKS0xICovCj4+PiAtICAg
ICAgICBpbnQgb2xkX2xpbWl0ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+bGltaXQ7Cj4+PiAtICAg
ICAgICBpbnQgbmV3X2xpbWl0ID0gKChvbGRfbGltaXQgKyAxKSA8PCA0KSAtIDE7Cj4+PiAtICAg
ICAgICBzdHJ1Y3QgdGltZXIgKipuZXdoZWFwID0geG1hbGxvY19hcnJheShzdHJ1Y3QgdGltZXIg
KiwgbmV3X2xpbWl0ICsKPj4gMSk7Cj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgb2xkX2xpbWl0
ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+bGltaXQ7Cj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQg
bmV3X2xpbWl0ID0gKChvbGRfbGltaXQgKyAxKSA8PCA0KSAtIDE7Cj4+PiArICAgICAgICBzdHJ1
Y3QgdGltZXIgKipuZXdoZWFwID0gTlVMTDsKPj4+ICsKPj4+ICsgICAgICAgIC8qIERvbid0IGdy
b3cgdGhlIGhlYXAgYmV5b25kIHdoYXQgaXMgcmVwcmVzZW50YWJsZSBpbiBpdHMgbWV0YWRhdGEu
ICovCj4+PiArICAgICAgICBpZiAoIG5ld19saW1pdCA9PSAodHlwZW9mKGhlYXBfbWV0YWRhdGEo
aGVhcCktPmxpbWl0KSluZXdfbGltaXQgJiYKPj4+ICsgICAgICAgICAgICAgbmV3X2xpbWl0ICsg
MSApCj4+PiArICAgICAgICAgICAgbmV3aGVhcCA9IHhtYWxsb2NfYXJyYXkoc3RydWN0IHRpbWVy
ICosIG5ld19saW1pdCArIDEpOwo+Pgo+PiBJdCB3b3VsZCBwcm9iYWJseSBiZSBoZWxwZnVsIHRv
IGhhdmUgYSB3YXJuX29uY2UvcHJpbnRfb25jZSBpbiB0aGUgY2FzZQo+PiB0aGF0IHdlIGRvIGhp
dCB0aGUgbWV0YWRhdGEgbGltaXQKPiAKPiBJIGNhbiBkbyB0aGlzLCBhbGJlaXQgdGhlIGxhY2sg
b2YgdGhlIGNvbnN0cnVjdHMgeW91IHN1Z2dlc3Qgd2lsbAo+IG1ha2UgdGhpcyBhIGxpdHRsZSB1
Z2x5LgoKTWFjcm9zIGltcGxlbWVudGluZyBzdWNoIGJlaGF2aW9yIHdvdWxkIGJlIG1vcmUgdGhh
biB3ZWxjb21lZC4gV2UgdGVuZCB0byAKb3Blbi1jb2RlIFdBUk5fT05DRS9QUklOVF9PTkNFIGxv
Z2ljIGluIGV2ZXJ5IHBsYWNlIHdoaWNoIGlzIG5vdCB2ZXJ5IG5pY2UuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
