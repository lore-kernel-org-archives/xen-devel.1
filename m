From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libacpi: report PCI slots as enabled only
 for hotpluggable devices
Date: Thu, 23 May 2019 09:30:47 -0600
Message-ID: <5CE6BCA70200007800231C92@prv1-mh.provo.novell.com>
References: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
 <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
 <20190523152007.GH2373@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTpsp-0006O4-FG
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 15:43:55 +0000
In-Reply-To: <20190523152007.GH2373@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA1LjE5IGF0IDE3OjIwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDI6NTc6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyMi4wNS4xOSBhdCAyMDoxMCwgPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiA+IERTRFQgZm9yIHFlbXUteGVuIGxhY2tzIF9TVEEgbWV0aG9kIG9mIFBD
SSBzbG90IG9iamVjdC4gSWYgX1NUQSBtZXRob2QKPj4gPiBkb2Vzbid0IGV4aXN0IHRoZW4gdGhl
IHNsb3QgaXMgYXNzdW1lZCB0byBiZSBhbHdheXMgcHJlc2VudCBhbmQgYWN0aXZlCj4+ID4gd2hp
Y2ggaW4gY29uanVuY3Rpb24gd2l0aCBfRUowIG1ldGhvZCBtYWtlcyBldmVyeSBkZXZpY2UgZWpl
Y3RhYmxlIGZvcgo+PiA+IGFuIE9TIGV2ZW4gaWYgaXQncyBub3QgdGhlIGNhc2UuCj4+ID4gCj4+
ID4gcWVtdS1rdm0gaXMgYWJsZSB0byBkeW5hbWljYWxseSBhZGQgX0VKMCBtZXRob2Qgb25seSB0
byB0aG9zZSBzbG90cwo+PiA+IHRoYXQgZWl0aGVyIGhhdmUgaG90cGx1Z2dhYmxlIGRldmljZXMg
b3IgZnJlZSBmb3IgUENJIHBhc3N0aHJvdWdoLgo+PiA+IEFzIFhlbiBsYWNrcyB0aGlzIGNhcGFi
aWxpdHkgd2UgY2Fubm90IHVzZSB0aGVpciB3YXkuCj4+ID4gCj4+ID4gcWVtdS14ZW4tdHJhZGl0
aW9uYWwgRFNEVCBoYXMgX1NUQSBtZXRob2Qgd2hpY2ggb25seSByZXBvcnRzIHRoYXQKPj4gPiB0
aGUgc2xvdCBpcyBwcmVzZW50IGlmIHRoZXJlIGlzIGEgUENJIGRldmljZXMgaG90cGx1Z2dlZCB0
aGVyZS4KPj4gPiBUaGlzIGlzIGRvbmUgdGhyb3VnaCBxdWVyeWluZyBvZiBpdHMgUENJIGhvdHBs
dWcgY29udHJvbGxlci4KPj4gPiBxZW11LXhlbiBoYXMgc2ltaWxhciBjYXBhYmlsaXR5IHRoYXQg
cmVwb3J0cyBpZiBkZXZpY2UgaXMgImhvdHBsdWdnYWJsZQo+PiA+IG9yIGFic2VudCIgd2hpY2gg
d2UgY2FuIHVzZSB0byBhY2hpZXZlIHRoZSBzYW1lIHJlc3VsdC4KPj4gPiAKPj4gPiBTaWduZWQt
b2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPj4gCj4+
IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IAo+IAo+IEph
biwgRkFPRCBzaW5jZSB5b3UncmUgdGhlIG1haW50YWluZXIgSSdtIGV4cGVjdGluZyB5b3UgdG8g
cHVzaCB0aGlzCj4gcGF0Y2ggeW91cnNlbGYuCgpTdXJlLCBJIGhhdmUgaXQgb24gbXkgbGlzdCBv
ZiB0aGluZ3MgdG8gcHVzaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
