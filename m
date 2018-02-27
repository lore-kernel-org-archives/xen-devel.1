From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] libxc: really tolerate empty PV records
Date: Tue, 27 Feb 2018 07:51:22 -0700
Message-ID: <5A957E7A02000078001AC4CA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=8ygc=fv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqgbH-0002bQ-Qa
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 14:51:27 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDExOWVlNGQ3NzMgKCJ0b29scy9saWJ4YzogVG9sZXJhdGUgc3BlY2lmaWMgemVyby1j
b250ZW50IHJlY29yZHMKaW4gbWlncmF0aW9uIHYyIHN0cmVhbXMiKSBtZWFudCB0b2xlcmF0ZSB0
aG9zZSwgYnV0IGZhaWxlZCB0byBzZXQgcmMKYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpUaGlzIGlzIHdoYXQgaXMgY3VycmVu
dGx5IGJyZWFraW5nIHNhdmUvcmVzdG9yZSBvbiB0aGUgNC44IGJyYW5jaDsgSQpoYXZlbid0IGNo
ZWNrZWQgeWV0IHdoeSB0aGUgc2VuZGluZyBzaWRlIHByb2R1Y2VzIGFuIGVtcHR5IHJlY29yZCB0
aGVyZS4KSSB3b25kZXIgd2hldGhlciB0aGF0J3MgcmVsYXRlZCB0byBmMWEwYThjM2ZlICgidG9v
bHMvbGlieGM6IEZpeApyZXN0b3JhdGlvbiBvZiBQViBNU1JzIGFmdGVyIG1pZ3JhdGUiKSBub3Qg
aGF2aW5nIGJlZW4gYmFja3BvcnRlZCB5ZXQuCk90b2ggdGhlIGxhdHRlciBpcyBtaXNzaW5nIG9u
IDQuNyB0b28sIHlldCB0aGVyZSBzYXZlL3Jlc3RvcmUgZG9lc24ndApmYWlsLgoKLS0tIGEvdG9v
bHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYworKysgYi90b29scy9saWJ4Yy94Y19zcl9y
ZXN0b3JlX3g4Nl9wdi5jCkBAIC03NzAsNiArNzcwLDcgQEAgc3RhdGljIGludCBoYW5kbGVfeDg2
X3B2X3ZjcHVfYmxvYihzdHJ1YwogICAgIHsKICAgICAgICAgREJHUFJJTlRGKCJTa2lwcGluZyBl
bXB0eSAlcyByZWNvcmQgZm9yIHZjcHUgJXVcbiIsCiAgICAgICAgICAgICAgICAgICByZWNfdHlw
ZV90b19zdHIocmVjLT50eXBlKSwgdmhkci0+dmNwdV9pZCk7CisgICAgICAgIHJjID0gMDsKICAg
ICAgICAgZ290byBvdXQ7CiAgICAgfQogCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
