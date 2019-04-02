From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 04/15] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Tue, 2 Apr 2019 20:11:08 +0800
Message-ID: <e2465fe0-b0d4-5bfe-dd79-20b878d4b3ee@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <e82e93b090e004d2b9a679d656de96ca915e92da.1553935727.git.puwen@hygon.cn>
 <5CA1CD49020000780022376C@prv1-mh.provo.novell.com>
 <d6a0d0a4-4da2-fb62-3231-3c7da379f5a8@hygon.cn>
 <5CA3378B0200007800223D84@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tiqP=SE=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBIKz-0002vT-GV
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 12:16:21 +0000
In-Reply-To: <5CA3378B0200007800223D84@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzIgMTg6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjA0LjE5IGF0IDA4
OjQ2LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBPbiAyMDE5LzQvMSAxNjozNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAzMC4wMy4xOSBhdCAxMTo0MiwgPHB1d2VuQGh5Z29uLmNuPiB3
cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKPj4+PiArKysgYi94
ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKPj4+PiBAQCAtNTM4LDI4ICs1MzgsMTIgQEAgaW50
IHN2bV92cG11X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCj4+Pj4gICAgICAgIHJldHVybiAw
Owo+Pj4+ICAgIH0KPj4+PiAgICAKPj4+PiAtaW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZvaWQp
Cj4+Pj4gK3N0YXRpYyBpbnQgY29tbW9uX2luaXQodm9pZCkKPj4+Cj4+PiBfX2luaXQKPj4KPj4g
T2theSwgd2lsbCBhZGQgaXQgaW4gZnJvbnQgb2YgaW50Lgo+IAo+IFdoeSBpbiBmcm9udCBvZiBp
bnQ/IFRoZSBvbGQgbGluZSBvZiBjb2RlIGhlcmUgc2hvd3MgdGhlIGNhbm9uaWNhbAo+IG9yZGVy
aW5nIHdlIHVzZS4KClNvcnJ5LCBhZnRlciBpbnQuIDopCgpCeSB0aGUgd2F5LCBob3cgYWJvdXQg
dGhlIHBhdGNoIDAxLzE1IG9mIHRoaXMgc2VyaWVzPwpJZiBpdCdzIGZpbmUsIGNvdWxkIHlvdSBw
bGVhc2Ugb2ZmZXIgQWNrZWQtYnkgdGFnIGZvciBpdD8KCi0tIApSZWdhcmRzLApQdSBXZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
