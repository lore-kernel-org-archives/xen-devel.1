From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v7 08/15] x86/cpu: Remove loop form
 vmce_save_vcpu_ctxt() func
Date: Thu, 21 Jun 2018 07:47:33 +0000
Message-ID: <1529567253.4608.19.camel@bitdefender.com>
References: <1528383573-21522-1-git-send-email-aisaila@bitdefender.com>
 <1528383573-21522-9-git-send-email-aisaila@bitdefender.com>
 <d459cb16ab834f15907b75b4266a22b8@AMSPEX02CL03.citrite.net>
 <1528447880.25123.36.camel@bitdefender.com>
 <d273805464a3476d9bebbf254cbc4124@AMSPEX02CL03.citrite.net>
 <5B1A95D702000078001C9878@prv1-mh.provo.novell.com>
 <1529484960.4608.16.camel@bitdefender.com>
 <5B2B561902000078001CC95C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B2B561902000078001CC95C@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <666AFC6855C3B5438FEE437E08E3739F@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "JBeulich@suse.com" <JBeulich@suse.com>
Cc: "Ian.Jackson@citrix.com" <Ian.Jackson@citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gSm8sIDIwMTgtMDYtMjEgYXQgMDE6MzkgLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPbiAyMC4wNi4xOCBhdCAxMDo1NiwgPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4gPiBTbyB0aGUgZmluYWwgcGxhbiBmb3IgdGhlIHNl
cmllcyBpcyBsaWtlIHRoaXM6DQo+ID4gLSBCYXNlIGV2ZXJ5dGhpbmcgb24gUm9nZXIncyBzZXJp
ZXMNCj4gPiAtIEtlZXAgcGF0Y2hlcyAxLTcNCj4gPiAtIEhhdmUgcGF0Y2ggOCBhZGQgYW4gZXh0
cmEgYXJnIHRvIEhWTV9SRUdJU1RFUl9TQVZFX1JFU1RPUkUNCj4gPiBhbmQgaHZtX3NyX2hhbmRs
ZXJzDQo+ID4gLSBIYXZlIHBhdGNoIDkgbGlrZSB0aGUgcGF0Y2ggMTUgZm9ybSBub3cgYW5kIGhh
dmUgaXQgY2FsbCB0aGUNCj4gPiBzYXZlX29uZSBoYW5kbGVycw0KPiA+IC0gSGF2ZSB0aGUgbmV4
dCBwYXRjaGVzIHJlbW92ZSB0aGUgcmVkdW5kYW50IHNhdmUgaGFuZGxlcnMgYW5kDQo+ID4gcmVu
YW1lIHRoZSBzYXZlIG9uZQ0KPiA+IC0gVGhlIGZpbmFsIHBhdGNoIHNob3VsZCByZW1vdmUgdGhl
IGV4dHJhIGFyZy4gVGhpcyBvbmUgY2FuIGJlDQo+ID4ga2VwdCBvciBub3QuDQo+IFNvdW5kcyBy
ZWFzb25hYmxlLCBhbGJlaXQgSSBoYXZlIHRvIGFkbWl0IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBs
YXN0DQo+IHNlbnRlbmNlIGlzIHN1cHBvc2VkIHRvIG1lYW4uIEVpdGhlciBpdCBpcyBwb3NzaWJs
ZSB0byBlbGltaW5hdGUgdGhlDQo+IGV4dHJhIGFyZywgdGhlbiB5b3Ugc2hvdWxkIGRvIHNvLCBv
ciBpdCBpcyBub3QgcG9zc2libGUgKGluIHdoaWNoDQo+IGNhc2UNCj4geW91IGNhbid0IHBvc3Np
Ymx5IGFkZCBhIHJlc3BlY3RpdmUgcGF0Y2ggdG8gdGhlIHNlcmllcykuDQoNCkkgd2FudGVkIHRv
IHNheSB0aGF0IHRoZSBsYXN0IHBhdGNoIHdpbGwgYmUgaW5kZXBlbmRlbnQgYW5kIGl0IGNhbiBn
bw0KdXBzdHJlYW0gb3Igbm90IGJlY2F1c2UgeW91IHNhaWQgdGhhdCB5b3UgYXJlIG5vdCBzdXJl
IGlmIHRoZSBleHRyYQ0KYXJncyBzaG91bGQgYmUgcmVtb3ZlZCBvciBub3QuDQoNCkFsZXgNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fDQpUaGlzIGVtYWlsIHdhcyBzY2FubmVkIGJ5IEJpdGRl
ZmVuZGVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
