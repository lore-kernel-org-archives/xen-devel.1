From: "Bae, Chang Seok" <chang.seok.bae@intel.com>
Subject: Re: [v3 04/12] x86/fsgsbase/64: Enable FSGSBASE
 instructions in the helper functions
Date: Thu, 25 Oct 2018 07:32:27 +0000
Message-ID: <1EE75BE7-12C6-4BD9-9D31-E9C396D2015B__33302.4344793104$1540453269$gmane$org@intel.com>
References: <20181023184234.14025-1-chang.seok.bae@intel.com>
 <20181023184234.14025-5-chang.seok.bae@intel.com>
 <CALCETrVcJ08c6yf6y3ruOA_Hx_7srkHw5iYfx1c2p8_ySiL2WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mxk8=nf=intel.com=chang.seok.bae@srs-us1.protection.inumbo.net>)
 id 1gFa8B-0005Ad-0z
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 07:32:35 +0000
In-Reply-To: <CALCETrVcJ08c6yf6y3ruOA_Hx_7srkHw5iYfx1c2p8_ySiL2WA@mail.gmail.com>
Content-Language: en-US
Content-ID: <B7BDF3AA38B8144BA47A4B78884EAB1E@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, "Shankar,
 Ravi V" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, "Metzger, Markus T" <markus.t.metzger@intel.com>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

DQo+IE9uIE9jdCAyNCwgMjAxOCwgYXQgMTI6MTYsIEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJu
ZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgT2N0IDIzLCAyMDE4IGF0IDExOjQzIEFNIENo
YW5nIFMuIEJhZSA8Y2hhbmcuc2Vvay5iYWVAaW50ZWwuY29tPiB3cm90ZToNCj4+IHZvaWQgeDg2
X2ZzYmFzZV93cml0ZV9jcHUodW5zaWduZWQgbG9uZyBmc2Jhc2UpDQo+PiB7DQo+PiAtICAgICAg
IC8qDQo+PiAtICAgICAgICAqIFNldCB0aGUgc2VsZWN0b3IgdG8gMCBhcyBhIG5vdGlvbiwgdGhh
dCB0aGUgc2VnbWVudCBiYXNlIGlzDQo+PiAtICAgICAgICAqIG92ZXJ3cml0dGVuLCB3aGljaCB3
aWxsIGJlIGNoZWNrZWQgZm9yIHNraXBwaW5nIHRoZSBzZWdtZW50IGxvYWQNCj4+IC0gICAgICAg
ICogZHVyaW5nIGNvbnRleHQgc3dpdGNoLg0KPj4gLSAgICAgICAgKi8NCj4+IC0gICAgICAgbG9h
ZHNlZyhGUywgMCk7DQo+PiAtICAgICAgIHdybXNybChNU1JfRlNfQkFTRSwgZnNiYXNlKTsNCj4+
ICsgICAgICAgaWYgKHN0YXRpY19jcHVfaGFzKFg4Nl9GRUFUVVJFX0ZTR1NCQVNFKSkgew0KPj4g
KyAgICAgICAgICAgICAgIHdyZnNiYXNlKGZzYmFzZSk7DQo+PiArICAgICAgIH0gZWxzZSB7DQo+
PiArICAgICAgICAgICAgICAgLyoNCj4+ICsgICAgICAgICAgICAgICAgKiBTZXQgdGhlIHNlbGVj
dG9yIHRvIDAgYXMgYSBub3Rpb24sIHRoYXQgdGhlIHNlZ21lbnQgYmFzZSBpcw0KPj4gKyAgICAg
ICAgICAgICAgICAqIG92ZXJ3cml0dGVuLCB3aGljaCB3aWxsIGJlIGNoZWNrZWQgZm9yIHNraXBw
aW5nIHRoZSBzZWdtZW50IGxvYWQNCj4+ICsgICAgICAgICAgICAgICAgKiBkdXJpbmcgY29udGV4
dCBzd2l0Y2guDQo+PiArICAgICAgICAgICAgICAgICovDQo+PiArICAgICAgICAgICAgICAgbG9h
ZHNlZyhGUywgMCk7DQo+PiArICAgICAgICAgICAgICAgd3Jtc3JsKE1TUl9GU19CQVNFLCBmc2Jh
c2UpOw0KPj4gKyAgICAgICB9DQo+PiB9DQo+PiANCj4+IHZvaWQgeDg2X2dzYmFzZV93cml0ZV9j
cHVfaW5hY3RpdmUodW5zaWduZWQgbG9uZyBnc2Jhc2UpDQo+PiB7DQo+PiAtICAgICAgIC8qIFNl
dCB0aGUgc2VsZWN0b3IgdG8gMCBmb3IgdGhlIHNhbWUgcmVhc29uIGFzICVmcyBhYm92ZS4gKi8N
Cj4+IC0gICAgICAgbG9hZHNlZyhHUywgMCk7DQo+PiAtICAgICAgIHdybXNybChNU1JfS0VSTkVM
X0dTX0JBU0UsIGdzYmFzZSk7DQo+PiArICAgICAgIGlmIChzdGF0aWNfY3B1X2hhcyhYODZfRkVB
VFVSRV9GU0dTQkFTRSkpIHsNCj4+ICsgICAgICAgICAgICAgICB3cl9pbmFjdGl2ZV9nc2Jhc2Uo
Z3NiYXNlKTsNCj4+ICsgICAgICAgfSBlbHNlIHsNCj4+ICsgICAgICAgICAgICAgICAvKiBTZXQg
dGhlIHNlbGVjdG9yIHRvIDAgZm9yIHRoZSBzYW1lIHJlYXNvbiBhcyAlZnMgYWJvdmUuICovDQo+
PiArICAgICAgICAgICAgICAgbG9hZHNlZyhHUywgMCk7DQo+PiArICAgICAgICAgICAgICAgd3Jt
c3JsKE1TUl9LRVJORUxfR1NfQkFTRSwgZ3NiYXNlKTsNCj4gDQo+IEkgc3RpbGwgZG9uJ3QgZ2V0
IHdoYXQgdGhpcyBjb2RlIGlzIHRyeWluZyB0byBkby4gIFNlZSBvdGhlciBlbWFpbC4gIEkNCj4g
dGhpbmsgaXQgd2lsbCBzdHJhaWdodCB1cCBjcmFzaCB0aGUga2VybmVsIG9uIHNvbWUgQ1BVcywg
c2luY2Ugd3JpdGluZw0KPiAwIHRvICUlZ3Mgd2lsbCB6ZXJvIG91dCB0aGUgKmFjdGl2ZSogYmFz
ZSBvbiBzb21lIENQVXMuDQo+IA0KDQpPbiB0aG9zZSBDUFVzLCBob3cgdGhlIG9sZCBkb19hcmNo
X3ByY3RsXzY0KCkgd29ya2VkPw0KbG9hZHNlZyhHUywgMCkgZXZlbnR1YWxseSBoaXRzIHRoZSBu
YXRpdmVfbG9hZF9nc19pbmRleCBlbnRyeSwgd2hlcmUgYWN0dWFsDQptb3Yg4oCmLCAlZ3MgaXMg
d3JhcHBlZCBieSB0d28gU1dBUEdTZXMuIFNvLCBpdCB3b27igJl0IGNhdXNlIHRoZSBzaWRlIGVm
ZmVjdA0Kb2Ygb3ZlcndyaXRpbmcgdGhlICphY3RpdmUqIGJhc2UsIEkgdGhpbmsuDQoNCj4gSSB0
aGluayB0aGF0LCBpZiB5b3UgcmVhbGx5IHdhbnQgc29tZSBmYW5jeSBvcHRpbWl6YXRpb24gZm9y
IHRoZQ0KPiBub24tRlNHU0JBU0UgY2FzZSwgeW91IG5lZWQgdG8gcHVsbCB0aGF0IG91dCBpbnRv
IHRoZSBjYWxsZXJzIG9mIHRoZXNlDQo+IGhlbHBlcnMuDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
