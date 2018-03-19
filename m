From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v2 09/45] ARM: GIC: Allow tweaking the
 active and pending state of an IRQ
Date: Mon, 19 Mar 2018 17:54:13 +0000
Message-ID: <9390ff2f-7d8c-99b2-edd8-f46e86c445f1@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-10-andre.przywara@linaro.org>
 <5cce550e-e6ce-a237-f83b-d264930c877f@linaro.org>
 <c2704d4e-6ac0-7e82-87d4-825ce9d3677a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zik3=gj=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1exyzL-0000j3-Uf
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 17:54:28 +0000
Received: by mail-wm0-x243.google.com with SMTP id 139so17509381wmn.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 10:54:25 -0700 (PDT)
In-Reply-To: <c2704d4e-6ac0-7e82-87d4-825ce9d3677a@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxOS8wMy8xOCAwOTozMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDAz
LzE2LzIwMTggMDQ6MDUgUE0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBIaSwKPiAKPiBIaSBB
bmRyZSwKPiAKPj4gT24gMTUvMDMvMTggMjA6MzAsIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+Pj4g
K8KgwqDCoCB9Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyB2b2lkIGdpY3YyX3NldF9wZW5kaW5n
X3N0YXRlKHN0cnVjdCBpcnFfZGVzYyAqaXJxZCwgYm9vbAo+Pj4gcGVuZGluZykKPj4+ICt7Cj4+
PiArwqDCoMKgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmaXJxZC0+bG9jaykpOwo+Pj4gKwo+Pj4g
K8KgwqDCoCBpZiAoIHBlbmRpbmcgKQo+Pj4gK8KgwqDCoCB7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
LyogVGhlIElOUFJPR1JFU1MgYml0IHdpbGwgYmUgc2V0IHdoZW4gdGhlIGludGVycnVwdCBmaXJl
cy4gKi8KPj4+ICvCoMKgwqDCoMKgwqDCoCBnaWN2Ml9wb2tlX2lycShpcnFkLCBHSUNEX0lTUEVO
RFIpOwo+Pj4gK8KgwqDCoCB9Cj4+PiArwqDCoMKgIGVsc2UKPj4+ICvCoMKgwqAgewo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGdpY3YyX3Bva2VfaXJxKGlycWQsIEdJQ0RfSUNQRU5EUik7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCAhZ2ljdjJfcGVla19pcnEoaXJxZCwgR0lDRF9JU0FDVElWRVIpICYm
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlc3RfYml0KF9JUlFfR1VFU1QsICZpcnFk
LT5zdGF0dXMpICkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsZWFyX2JpdChfSVJRX0lO
UFJPR1JFU1MsICZpcnFkLT5zdGF0dXMpOwo+Pgo+PiBXZSBzaG91bGQgbm90IG5lZWQgdG8gdG91
Y2ggdGhlIF9JUlFfSU5QUk9HUkVTUyBiaXQgaGVyZS4gVGhhdCBiaXQKPj4gcmVhbGx5IHNoYWRv
d3MgdGhlICphY3RpdmUqIGJpdCwgc28gY2hhbmdpbmcgdGhlIHBlbmRpbmcgc3RhdGUgc2hvdWxk
Cj4+IG5vdCBtYXR0ZXIgaGVyZToKPj4gLSBJZiB0aGUgaC93IElSUSBpcyBhY3RpdmUsIHRoZSBi
aXQgaXMgc2V0IGFscmVhZHkgYW5kIHNob3VsZCByZW1haW4gc28sCj4+IGFzIFhlbiBhbmQgdGhl
IGd1ZXN0IGFyZSBzdGlsbCBkZWFsaW5nIHdpdGggaXQuIENsZWFyaW5nIHRoZSBoL3cgcGVuZGlu
Zwo+PiBzdGF0ZSBkb2VzIG5vdCBjaGFuZ2UgdGhhdC4KPj4gLSBJZiB0aGUgaC93IElSUSBpcyBu
b3QgYWN0aXZlLCB0aGUgX0lSUV9JTlBST0dSRVNTIGJpdCBpcyBub3Qgc2V0LCBzbwo+PiBjbGVh
cmluZyBpdCB3b3VsZCBiZSBhIE5PUC4KPj4gU28gd2UgY2FuIHJlbW92ZcKgIHRoZSBfSVJRX0lO
UFJPR1JFU1MgaGFuZGxpbmcgaGVyZSBjb21wbGV0ZWx5Lgo+Pgo+PiBJIHdpbGwgYW1lbmQgdGhl
IGNvZGUgYWNjb3JkaW5nbHksIGluY2x1ZGluZyB0aGUgcmVzcGVjdGl2ZSBHSUN2MyBwYXJ0cy4K
PiAKPiBUaGFuayB5b3UgZm9yIHN1bW1hcml6aW5nIG91ciBkaXNjdXNzaW9uLiBJcyBpdCBzdGls
bCBtYWtpbmcgc2Vuc2UgdG8KPiBkb2N1bWVudCBob3cgdGhvc2UgaGVscGVycyBzaG91bGQgYmUg
Y2FsbGVkPwoKV2hpY2ggaGVscGVycz8gVGhlIHNldF97cGVuZGluZyxhY3RpdmV9X3N0YXRlKCkg
ZnVuY3Rpb25zPyBJIGFscmVhZHkgcHV0CnNvbWUga2luZCBvZiB3YXJuaW5nIGJlZm9yZSB0aGUg
KHdyYXBwZXIpIHByb3RvdHlwZXM6Ci8qCiAqIFNldCB0aGUgYWN0aXZlIHN0YXRlIG9mIGFuIElS
US4gVGhpcyBzaG91bGQgYmUgdXNlZCB3aXRoIGNhcmUsIGFzCiAqIHRoaXMgZGlyZWN0bHkgZm9y
Y2VzIHRoZSBhY3RpdmUgYml0LCB3aXRob3V0IGNvbnNpZGVyaW5nIHRoZSBHSUMKICogc3RhdGUg
bWFjaGluZS4KICogRm9yIHByaXZhdGUgSVJRcyB0aGlzIG9ubHkgd29ya3MgZm9yIHRob3NlIG9m
IHRoZSBjdXJyZW50IENQVS4KICovCgpDaGVlcnMsCkFuZHJlLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
