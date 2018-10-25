From: "Bae, Chang Seok" <chang.seok.bae@intel.com>
Subject: Re: [v3 04/12] x86/fsgsbase/64: Enable FSGSBASE
 instructions in the helper functions
Date: Thu, 25 Oct 2018 23:03:31 +0000
Message-ID: <6CD573FD-3B38-45B1-9DC6-B5F0E9087FB4__1588.10733487389$1540508540$gmane$org@intel.com>
References: <20181023184234.14025-1-chang.seok.bae@intel.com>
 <20181023184234.14025-5-chang.seok.bae@intel.com>
 <CALCETrVcJ08c6yf6y3ruOA_Hx_7srkHw5iYfx1c2p8_ySiL2WA@mail.gmail.com>
 <1EE75BE7-12C6-4BD9-9D31-E9C396D2015B@intel.com>
 <CALCETrVdxKsSgU8zeyn7DO-1toO770yZbEAPTGOtF0FvPfQOXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mxk8=nf=intel.com=chang.seok.bae@srs-us1.protection.inumbo.net>)
 id 1gFofD-0001VK-KC
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 23:03:39 +0000
In-Reply-To: <CALCETrVdxKsSgU8zeyn7DO-1toO770yZbEAPTGOtF0FvPfQOXg@mail.gmail.com>
Content-Language: en-US
Content-ID: <31D47EBD5DD6A34F9903BC9DAD28C9F5@intel.com>
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

DQoNCj4gT24gT2N0IDI1LCAyMDE4LCBhdCAxNjowMCwgQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMTI6MzIgQU0g
QmFlLCBDaGFuZyBTZW9rDQo+IDxjaGFuZy5zZW9rLmJhZUBpbnRlbC5jb20+IHdyb3RlOg0KPj4g
DQo+PiANCj4+PiBPbiBPY3QgMjQsIDIwMTgsIGF0IDEyOjE2LCBBbmR5IEx1dG9taXJza2kgPGx1
dG9Aa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVHVlLCBPY3QgMjMsIDIwMTggYXQg
MTE6NDMgQU0gQ2hhbmcgUy4gQmFlIDxjaGFuZy5zZW9rLmJhZUBpbnRlbC5jb20+IHdyb3RlOg0K
Pj4+PiB2b2lkIHg4Nl9mc2Jhc2Vfd3JpdGVfY3B1KHVuc2lnbmVkIGxvbmcgZnNiYXNlKQ0KPj4+
PiB7DQo+Pj4+IC0gICAgICAgLyoNCj4+Pj4gLSAgICAgICAgKiBTZXQgdGhlIHNlbGVjdG9yIHRv
IDAgYXMgYSBub3Rpb24sIHRoYXQgdGhlIHNlZ21lbnQgYmFzZSBpcw0KPj4+PiAtICAgICAgICAq
IG92ZXJ3cml0dGVuLCB3aGljaCB3aWxsIGJlIGNoZWNrZWQgZm9yIHNraXBwaW5nIHRoZSBzZWdt
ZW50IGxvYWQNCj4+Pj4gLSAgICAgICAgKiBkdXJpbmcgY29udGV4dCBzd2l0Y2guDQo+Pj4+IC0g
ICAgICAgICovDQo+Pj4+IC0gICAgICAgbG9hZHNlZyhGUywgMCk7DQo+Pj4+IC0gICAgICAgd3Jt
c3JsKE1TUl9GU19CQVNFLCBmc2Jhc2UpOw0KPj4+PiArICAgICAgIGlmIChzdGF0aWNfY3B1X2hh
cyhYODZfRkVBVFVSRV9GU0dTQkFTRSkpIHsNCj4+Pj4gKyAgICAgICAgICAgICAgIHdyZnNiYXNl
KGZzYmFzZSk7DQo+Pj4+ICsgICAgICAgfSBlbHNlIHsNCj4+Pj4gKyAgICAgICAgICAgICAgIC8q
DQo+Pj4+ICsgICAgICAgICAgICAgICAgKiBTZXQgdGhlIHNlbGVjdG9yIHRvIDAgYXMgYSBub3Rp
b24sIHRoYXQgdGhlIHNlZ21lbnQgYmFzZSBpcw0KPj4+PiArICAgICAgICAgICAgICAgICogb3Zl
cndyaXR0ZW4sIHdoaWNoIHdpbGwgYmUgY2hlY2tlZCBmb3Igc2tpcHBpbmcgdGhlIHNlZ21lbnQg
bG9hZA0KPj4+PiArICAgICAgICAgICAgICAgICogZHVyaW5nIGNvbnRleHQgc3dpdGNoLg0KPj4+
PiArICAgICAgICAgICAgICAgICovDQo+Pj4+ICsgICAgICAgICAgICAgICBsb2Fkc2VnKEZTLCAw
KTsNCj4+Pj4gKyAgICAgICAgICAgICAgIHdybXNybChNU1JfRlNfQkFTRSwgZnNiYXNlKTsNCj4+
Pj4gKyAgICAgICB9DQo+Pj4+IH0NCj4+Pj4gDQo+Pj4+IHZvaWQgeDg2X2dzYmFzZV93cml0ZV9j
cHVfaW5hY3RpdmUodW5zaWduZWQgbG9uZyBnc2Jhc2UpDQo+Pj4+IHsNCj4+Pj4gLSAgICAgICAv
KiBTZXQgdGhlIHNlbGVjdG9yIHRvIDAgZm9yIHRoZSBzYW1lIHJlYXNvbiBhcyAlZnMgYWJvdmUu
ICovDQo+Pj4+IC0gICAgICAgbG9hZHNlZyhHUywgMCk7DQo+Pj4+IC0gICAgICAgd3Jtc3JsKE1T
Ul9LRVJORUxfR1NfQkFTRSwgZ3NiYXNlKTsNCj4+Pj4gKyAgICAgICBpZiAoc3RhdGljX2NwdV9o
YXMoWDg2X0ZFQVRVUkVfRlNHU0JBU0UpKSB7DQo+Pj4+ICsgICAgICAgICAgICAgICB3cl9pbmFj
dGl2ZV9nc2Jhc2UoZ3NiYXNlKTsNCj4+Pj4gKyAgICAgICB9IGVsc2Ugew0KPj4+PiArICAgICAg
ICAgICAgICAgLyogU2V0IHRoZSBzZWxlY3RvciB0byAwIGZvciB0aGUgc2FtZSByZWFzb24gYXMg
JWZzIGFib3ZlLiAqLw0KPj4+PiArICAgICAgICAgICAgICAgbG9hZHNlZyhHUywgMCk7DQo+Pj4+
ICsgICAgICAgICAgICAgICB3cm1zcmwoTVNSX0tFUk5FTF9HU19CQVNFLCBnc2Jhc2UpOw0KPj4+
IA0KPj4+IEkgc3RpbGwgZG9uJ3QgZ2V0IHdoYXQgdGhpcyBjb2RlIGlzIHRyeWluZyB0byBkby4g
IFNlZSBvdGhlciBlbWFpbC4gIEkNCj4+PiB0aGluayBpdCB3aWxsIHN0cmFpZ2h0IHVwIGNyYXNo
IHRoZSBrZXJuZWwgb24gc29tZSBDUFVzLCBzaW5jZSB3cml0aW5nDQo+Pj4gMCB0byAlJWdzIHdp
bGwgemVybyBvdXQgdGhlICphY3RpdmUqIGJhc2Ugb24gc29tZSBDUFVzLg0KPj4+IA0KPj4gDQo+
PiBPbiB0aG9zZSBDUFVzLCBob3cgdGhlIG9sZCBkb19hcmNoX3ByY3RsXzY0KCkgd29ya2VkPw0K
Pj4gbG9hZHNlZyhHUywgMCkgZXZlbnR1YWxseSBoaXRzIHRoZSBuYXRpdmVfbG9hZF9nc19pbmRl
eCBlbnRyeSwgd2hlcmUgYWN0dWFsDQo+PiBtb3Yg4oCmLCAlZ3MgaXMgd3JhcHBlZCBieSB0d28g
U1dBUEdTZXMuIFNvLCBpdCB3b27igJl0IGNhdXNlIHRoZSBzaWRlIGVmZmVjdA0KPj4gb2Ygb3Zl
cndyaXRpbmcgdGhlICphY3RpdmUqIGJhc2UsIEkgdGhpbmsuDQo+PiANCj4+PiBJIHRoaW5rIHRo
YXQsIGlmIHlvdSByZWFsbHkgd2FudCBzb21lIGZhbmN5IG9wdGltaXphdGlvbiBmb3IgdGhlDQo+
Pj4gbm9uLUZTR1NCQVNFIGNhc2UsIHlvdSBuZWVkIHRvIHB1bGwgdGhhdCBvdXQgaW50byB0aGUg
Y2FsbGVycyBvZiB0aGVzZQ0KPj4+IGhlbHBlcnMuDQo+PiANCj4gDQo+IEkgd2FzIHRoaW5raW5n
IG9mIGxvYWRzZWdtZW50LCBub3QgbG9hZHNlZy4gIFNvcnJ5IQ0KDQpObyBwcm9ibGVtISAgQXBw
cmVjaWF0ZSB5b3VyIHJldmlld3MuDQoNCkNoYW5nDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
