From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH RESEND 3/3] OvmfPkg/XenSupport: turn off
 address decoding before BAR sizing
Date: Wed, 6 Mar 2019 14:26:22 +0000
Message-ID: <9b193263-06b1-b344-2ef3-5bd42e856c63@citrix.com>
References: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
 <1551876056-28223-4-git-send-email-igor.druzhinin@citrix.com>
 <e8cdf4a2-b02b-daa7-4301-803fb1e0086d@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/oGn=RJ=citrix.com=prvs=961469de7=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1h1XVj-0000wa-Jy
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 14:27:07 +0000
In-Reply-To: <e8cdf4a2-b02b-daa7-4301-803fb1e0086d@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laszlo Ersek <lersek@redhat.com>, edk2-devel@lists.01.org
Cc: anthony.perard@citrix.com, jordan.l.justen@intel.com, julien.grall@arm.com, xen-devel@lists.xenproject.org, ard.biesheuvel@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDMvMjAxOSAxMzoyMiwgTGFzemxvIEVyc2VrIHdyb3RlOgo+IE9uIDAzLzA2LzE5IDEz
OjQwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gT24gWGVuLCBodm1sb2FkZXIgZmlybXdhcmUg
bGVhdmVzIGFkZHJlc3MgZGVjb2RpbmcgZW5hYmxlZCBmb3IKPj4gZW51bWVyYXRlZCBQQ0kgZGV2
aWNlIGJlZm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZNRiBzZWVtcyB0bwo+PiBleHBlY3QgaXQg
dG8gYmUgZGlzYWJsZWQgYW5kIHRyaWVzIHRvIHNpemUgUENJIEJBUnMgaW4gc2V2ZXJhbCBwbGFj
ZXMKPj4gd2l0aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2VzIEJBUjY0LCBmb3IgZXhhbXBs
ZSwgYmVpbmcKPj4gaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCj4+Cj4+IEZpeCBpdCBieSBk
aXNhYmxpbmcgUENJIGFkZHJlc3MgZGVjb2RpbmcgZXhwbGljaXRseSBiZWZvcmUgdGhlCj4+IGZp
cnN0IGF0dGVtcHQgdG8gc2l6ZSBCQVJzIG9uIFhlbi4KPj4KPj4gQ29udHJpYnV0ZWQtdW5kZXI6
IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQo+PiBTaWduZWQtb2ZmLWJ5OiBJ
Z29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPj4gLS0tCj4+ICBPdm1m
UGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMgfCAzNCArKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBw
b3J0LmMgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPj4g
aW5kZXggNDA4ZmIyNC4uOTk0MDMzNSAxMDA2NDQKPj4gLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1Bj
aUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCj4+ICsrKyBiL092bWZQa2cvTGlicmFyeS9QY2lI
b3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYwo+PiBAQCAtNTUsNiArNTUsMzMgQEAgUGNhdFBjaVJv
b3RCcmlkZ2VCYXJFeGlzdGVkICgKPj4gICAgRW5hYmxlSW50ZXJydXB0cyAoKTsKPj4gIH0KPj4g
IAo+PiArI2RlZmluZSBFRklfUENJX0NPTU1BTkRfREVDT0RFICgoVUlOVDE2KShFRklfUENJX0NP
TU1BTkRfSU9fU1BBQ0UgfCBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEVGSV9QQ0lfQ09NTUFORF9NRU1PUllfU1BBQ0UpKQo+IAo+IEkgdGhvdWdodCBJIGFz
a2VkIHlvdSBub3QgdG8gZGVmaW5lIGEgbWFjcm8gaGVyZSB0aGF0IHN0YXJ0ZWQgd2l0aCB0aGUK
PiAiRUZJXyIgcHJlZml4IDovCj4gCj4gaHR0cDovL21pZC5tYWlsLWFyY2hpdmUuY29tL2RkOGUz
YzllLWNiNzYtZDNmZS02YTEwLWMwYTQxYzcxNGI1NkByZWRoYXQuY29tCj4gCgpUaGlzIGlzIGEg
cmVzZW5kIG9mIHYxIHBhdGNoIHNlcmllcyB0byBnZXQgWGVuIGZvbGtzIGludG8gQ0MgYW5kIGdh
dGhlcgpjb21tZW50cy4gSSBleHBlY3QgdjIuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
