From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 0/4] Use INVPCID to flush global mappings
Date: Thu, 15 Feb 2018 12:10:36 +0000
Message-ID: <20180215121040.20585-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zbre=fj=citrix.com=prvs=57767c78e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1emINF-0002Vg-8J
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2018 12:10:49 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SSB3cm90ZSB0aGVzZSBwYXRjaGVzIHNvbWV0aW1lIGFnbyB0byBleHBsb3JlIFBDSUQgYW5kIElO
VlBDSUQuIEkgaGF2ZW4ndAp0aG91Z2h0IHRocm91Z2ggd2hldGhlciBob3cgdG8gdXNlIGJvdGgg
aW4gWGVuIHlldC4gQnV0IHNlZWluZyBKdWVyZ2VuIGxhaWQgb3V0CmhpcyB0aG91Z2h0IG9uIFBD
SUQgYW5kIElOVlBDSUQgSSB0aGluayBzb21lIG9mIHRoZSBwYXRjaGVzIGNhbiBiZSB1c2VmdWwu
CgpJIGhhZCBkb25lIHNvbWUgYmVuY2htYXJrIG9uIHRoZSBzcGVlZCBpbiBvbmUgb2YgbXkgb2xk
ZXIgYnJhbmNoIGJ5IGluc2VydGluZwpzb21lIHRyYWNlIHBvaW50cyBiZWZvcmUgYW5kIGFmdGVy
IHRoZSBmbHVzaC4gSXQgc2hvd2VkIHRoYXQgdHdpZGRsaW5nIENSNC5QR0UKaXMgMyB0byA1IHRp
bWVzIHNsb3dlciB0aGFuIGludnBjaWQuCgpUaGlzIHNlcmllcyBpcyBpbiBpbmNvbXBsZXRlIC0t
IG9idmlvdXNseSB3ZSBoYXZlIENSNC5QR0UgdHdpZGRsaW5nIGluIGEgZmV3Cm90aGVyIHBsYWNl
cy4gQnV0IGlmIHlvdSB0aGluayBpdCBpcyBiZW5lZmljaWFsIEkgY2FuIHRyeSB0byBjb252ZXJ0
IHRob3NlCnBsYWNlcyBhcyB3ZWxsLgoKV2VpLgoKV2VpIExpdSAoNCk6CiAgeDg2OiBpbnRyb2R1
Y2UgY3B1X2hhc19pbnZwY2lkCiAgeDg2OiByZXBvcnQgaWYgUENJRCBhbmQgSU5WUENJRCBhcmUg
c3VwcG9ydGVkCiAgeDg2OiBhZGQgaW52cGNpZC5oCiAgeDg2OiB1c2UgaW52cGNpZCB0byBkbyBn
bG9iYWwgZmx1c2gKCiB4ZW4vYXJjaC94ODYvZmx1c2h0bGIuYyAgICAgICAgICB8IDIyICsrKysr
KysrKysrKy0tLQogeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgfCAgNyArKysrKwog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlLmggfCAgMSArCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2ludnBjaWQuaCAgICB8IDYxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDQgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2ludnBjaWQuaAoKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
