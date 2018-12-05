From: Jennifer Herbert <Jennifer.Herbert@citrix.com>
Subject: Re: Legacy PIC (x86) support (RTC) in dom0 with Linux
 4.12 and newer is broken for some hardware.
Date: Wed, 5 Dec 2018 16:40:52 +0000
Message-ID: <5C07FF94.70905@citrix.com>
References: <a46c25e311ed4a42a201583709920ab0@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HWlr=OO=citrix.com=prvs=87022a4f2=jennifer.herbert@srs-us1.protection.inumbo.net>)
 id 1gUaEd-0007Rr-3V
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 16:41:15 +0000
In-Reply-To: <a46c25e311ed4a42a201583709920ab0@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

Q0M6IEp1ZXJnZW4gR3Jvc3MKCk9uIDA0LzEyLzE4IDE3OjI0LCBKZW5uaWZlciBIZXJiZXJ0IHdy
b3RlOgo+IFNpbmNlIExpbnV4IDQuMTIsIHRoZXJlIGhhcyBiZWVuIGEgY29tbWl0YTFlMjNhNDJm
MWJkYzAwZTMyZmM0ODY5Y2FlZjEyZTRlNjI3MmYyNgo+Cj4g4oCccnRjOiBjbW9zOiBEbyBub3Qg
YXNzdW1lIGlycSA4IGZvciBydGMgd2hlbiB0aGVyZSBhcmUgbm8gbGVnYWN5IGlycXPigJ0KPgo+
IFRoZSBjb21taXQgZWZmZWN0aXZlbHkgZGlzYWJsZWQgcmVxdWVzdGluZyBJUlEgOCBmb3Igc3lz
dGVtcyB3aXRob3V0IFBJQwo+Cj4gY29udHJvbGxlciBwcmVzZW50IChBcyBpbiB0aGUgY2FzZSB3
aGVuIHVzZWQgYXQgZG9tMCB1bmRlciBYZW4pIGFuZCBhdAo+Cj4gdGhlIHNhbWUgdGltZSB3aGVy
ZSB0aGlzIElSUSBpcyBub3QgZXhwbGljaXRseSBkZXNjcmliZWQgaW4gQUNQSSB0YWJsZXMuCj4K
PiBJIGhhdmUgZm91bmQgaGFyZHdhcmUgd2l0aG91dCB0aGlzIElSUSBpbiB0aGUgQUNQSSB0YWJs
ZXMsIGFuZCBpbmRlZWQsCj4KPiBmb3VuZCB0aGUgUlRDIHRvIGJlIGJyb2tlbiBpbiBkb20gMC4g
IFRlbXBvcmFyaWx5LCBJIHJldmVydGVkIHRoaXMKPgo+IGNvbW1pdCwgd2hpY2ggZml4ZWQgdGhl
IHByb2JsZW0sIGJ1dCBJIHdhcyB3b25kZXJpbmcgaWYgYW55b25lIGhlcmUKPgo+IGtuZXcgb2Yg
YSBiZXR0ZXIgc29sdXRpb24/Cj4KPiBDaGVlcnMsCj4KPiAtamVubnkKPgo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
