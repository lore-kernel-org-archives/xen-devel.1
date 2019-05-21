From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v1] x86/mm: Make change_type_range return
 error
Date: Tue, 21 May 2019 07:15:38 +0000
Message-ID: <3f0aa0e2-4a25-9d98-06ce-724882715d23@bitdefender.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
 <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
 <a5ff20d2-2968-9c81-1ee9-1bfee5b2a48f@bitdefender.com>
 <5CCBF624020000780022B83A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwKE=TV=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hSyzv-0005Qz-Gj
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 07:15:43 +0000
In-Reply-To: <5CCBF624020000780022B83A@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <65C6590AAEC44D4A9A59480E5A8BA187@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgR2VvcmdlLA0KDQpEaWQgeW91IGhhdmUgdGltZSB0byBsb29rIGF0IHRoaXMgcGF0Y2g/DQoN
ClJlZ2FyZHMsDQpBbGV4DQoNCk9uIDAzLjA1LjIwMTkgMTE6MDQsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+PiBPbiAwMy4wNS4xOSBhdCAwOTo1MywgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3
cm90ZToNCj4+IE9uIDI1LjA0LjIwMTkgMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IEl0
IGlzIGFuIGlzc3VlIGFueXdheSB0aGF0IGEgY2hhbmdlIGlzDQo+Pj4gbWFkZSB3aXRob3V0IHNh
eWluZyB3aHkgdGhlIG5ldyBiZWhhdmlvciBwcmVmZXJhYmxlIG92ZXINCj4+PiB0aGUgY3VycmVu
dCBvbmUuDQo+Pg0KPj4gU28gaXMgdGhlcmUgYSB3YXkgdG8gY29udGludWUgd2l0aCB0aGlzPw0K
PiANCj4gV2h5IG5vdCAtIEkndmUgbm90IHNhaWQgSSdtIGFnYWluc3QsIEkndmUganVzdCBhc2tl
ZCBmb3IgYW4gaW1wcm92ZWQNCj4gZGVzY3JpcHRpb24uIE9mIGNvdXJzZSwgaWYgaXQgdHVybnMg
b3V0IHRoZSBjaGFuZ2UgaXMgZG9uZSAianVzdCBpbg0KPiBjYXNlIiwgSSdtIG5vdCBzdXJlIEkg
c2VlIG11Y2ggdmFsdWUuIEJ1dCBhcyB5b3Ugc2F5LCBpdCdzIGZpcnN0IGFuZA0KPiBmb3JlbW9z
dCBHZW9yZ2UgdG8ganVkZ2UuDQo+IA0KPiBKYW4NCj4gDQo+IA0KPiANCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcg
bGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
