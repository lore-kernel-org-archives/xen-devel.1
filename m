From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 09/45] ARM: GIC: Allow tweaking the
 active and pending state of an IRQ
Date: Tue, 20 Mar 2018 00:57:12 +0000
Message-ID: <62424e55-cd71-9fc0-c888-8cacded398e8@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-10-andre.przywara@linaro.org>
 <5cce550e-e6ce-a237-f83b-d264930c877f@linaro.org>
 <c2704d4e-6ac0-7e82-87d4-825ce9d3677a@arm.com>
 <9390ff2f-7d8c-99b2-edd8-f46e86c445f1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kdcq=gk=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ey5aX-0007S9-Vv
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 00:57:18 +0000
In-Reply-To: <9390ff2f-7d8c-99b2-edd8-f46e86c445f1@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8xOS8yMDE4IDA1OjU0IFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBXaGljaCBoZWxwZXJzPyBUaGUgc2V0X3twZW5kaW5nLGFjdGl2ZX1fc3RhdGUoKSBmdW5jdGlv
bnM/IEkgYWxyZWFkeSBwdXQKPiBzb21lIGtpbmQgb2Ygd2FybmluZyBiZWZvcmUgdGhlICh3cmFw
cGVyKSBwcm90b3R5cGVzOgo+IC8qCj4gICAqIFNldCB0aGUgYWN0aXZlIHN0YXRlIG9mIGFuIElS
US4gVGhpcyBzaG91bGQgYmUgdXNlZCB3aXRoIGNhcmUsIGFzCj4gICAqIHRoaXMgZGlyZWN0bHkg
Zm9yY2VzIHRoZSBhY3RpdmUgYml0LCB3aXRob3V0IGNvbnNpZGVyaW5nIHRoZSBHSUMKPiAgICog
c3RhdGUgbWFjaGluZS4KPiAgICogRm9yIHByaXZhdGUgSVJRcyB0aGlzIG9ubHkgd29ya3MgZm9y
IHRob3NlIG9mIHRoZSBjdXJyZW50IENQVS4KPiAgICovCgpPaCB5ZXMsIEkgbWlzc2VkIHRoYXQu
IFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
