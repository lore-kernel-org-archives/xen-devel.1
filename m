From: Matthew Daley <mattd@bugfuzz.com>
Subject: Re: [PATCH for-4.12 0/2] xen/arm: mm: Boot fixes
Date: Sat, 1 Dec 2018 14:27:35 +1300
Message-ID: <CAD3CancfX2FdKHk0BBq+H3ra-To+nLC4iCx5ACqXjDprLr4OOw@mail.gmail.com>
References: <20181129113744.2797-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6ryh=ok=bugfuzz.com=mattd@srs-us1.protection.inumbo.net>)
 id 1gSu4T-0005kJ-RG
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:27:49 +0000
Received: by mail-lf1-x142.google.com with SMTP id f23so5388141lfc.13
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:27:48 -0800 (PST)
In-Reply-To: <20181129113744.2797-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: xen-devel@lists.xenproject.org, Jan-Peter.Larsson@arm.com, Stefano Stabellini <sstabellini@kernel.org>, shameerali.kolothum.thodi@huawei.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKVGhlc2UgcGF0Y2hlcyBmaXggbXkgSGlrZXk5NjAgcHJvYmxlbXMgLSBJJ20g
YWJsZSB0byBib290IGFsbCBleHBlY3RlZApDUFVzIHdpdGhvdXQgdHJvdWJsZSBub3cuCgpGZWVs
IGZyZWUgdG8gYWRkClRlc3RlZC1ieTogTWF0dGhldyBEYWxleSA8bWF0dGRAYnVnZnV6ei5jb20+
CmlmIHlvdSB3YW50LgoKVGhhbmtzIGZvciB0aGUgZ29vZCB3b3JrIQoKLSBNYXR0aGV3CgpPbiBG
cmksIDMwIE5vdiAyMDE4IGF0IDAwOjM3LCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPiB3cm90ZToKPgo+IEhpIGFsbCwKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIDIgYnVn
IGluIHRoZSBib290IGNvZGUgZm9yIHRoZSBtZW1vcnkgbWFuYWdlbWVudC4KPgo+IFRoZSBmaXJz
dCBwYXRjaCBzaG91bGQgcmVzb2x2ZSBYZW4gc3RhbGwgd2hlbiBzZXR0aW5nIFNDVExSLlhOIG9u
IHNvbWUKPiBwbGF0Zm9ybXMuCj4KPiBUaGUgc2Vjb25kIHBhdGNoIHNob3VsZCBhbGxvdyB0byBi
b290IFhlbiBhZ2FpbiB0aGUgSGlrZXkgYm9hcmQuCj4KPiBDaGVlcnMsCj4KPiBDYzogU2hhbWVl
cmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29t
Pgo+IENjOiBKYW4tUGV0ZXIgTGFyc3NvbiA8SmFuLVBldGVyLkxhcnNzb25AYXJtLmNvbT4KPiBD
YzogTWF0dGhldyBEYWxleSA8bWF0dGRAYnVnZnV6ei5jb20+Cj4KPiBKdWxpZW4gR3JhbGwgKDIp
Ogo+ICAgeGVuL2FybTogbW06IFNldC11cCBwYWdlIHBlcm1pc3Npb24gZm9yIFhlbiBtYXBwaW5n
cyBlYXJsaWVyIG9uCj4gICB4ZW4vYXJtOiBTdG9wIHJlbG9jYXRpbmcgWGVuCj4KPiAgeGVuL2Fy
Y2gvYXJtL2FybTMyL2hlYWQuUyB8IDU0ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCA1MCArKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgIHwgNjcgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2FyY2gv
YXJtL3NldHVwLmMgICAgICB8IDY1ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggIHwgIDIgKy0KPiAgNSBmaWxl
cyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxOTkgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIu
MTEuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
