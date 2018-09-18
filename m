From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] x86: use VMLOAD for PV context switch
Date: Tue, 18 Sep 2018 12:11:41 -0400
Message-ID: <c33dc191-7697-00f5-8f81-430c699f3f59@oracle.com>
References: <5B9679C702000078001E6CF7@prv1-mh.provo.novell.com>
 <5BA0EF5602000078001E96C2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k7lq=ma=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g2IZt-0008Bb-EC
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 16:10:17 +0000
In-Reply-To: <5BA0EF5602000078001E96C2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS8xOC8xOCA4OjI4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBIYXZpbmcgbm90aWNlZCB0
aGF0IFZNTE9BRCBhbG9uZSBpcyBhYm91dCBhcyBmYXN0IGFzIGEgc2luZ2xlIG9mIHRoZQo+IGlu
dm9sdmVkIFdSTVNScywgSSB0aG91Z2h0IGl0IG1pZ2h0IGJlIGEgcmVhc29uYWJsZSBpZGVhIHRv
IGFsc28gdXNlIGl0Cj4gZm9yIFBWLiBNZWFzdXJlbWVudHMsIGhvd2V2ZXIsIGhhdmUgc2hvd24g
dGhhdCBhbiBhY3R1YWwgaW1wcm92ZW1lbnQgY2FuCj4gYmUgYWNoaWV2ZWQgb25seSB3aXRoIGFu
IGVhcmx5IHByZWZldGNoIG9mIHRoZSBWTUNCICh0aGFua3MgdG8gQW5kcmV3Cj4gZm9yIHN1Z2dl
c3RpbmcgdG8gdHJ5IHRoaXMpLCB3aGljaCBJIGhhdmUgdG8gYWRtaXQgSSBjYW4ndCByZWFsbHkK
PiBleHBsYWluLiBUaGlzIHdheSBvbiBteSBGYW0xNSBib3ggY29udGV4dCBzd2l0Y2ggdGFrZXMg
b3ZlciAxMDAgY2xvY2tzCj4gbGVzcyBvbiBhdmVyYWdlICh0aGUgbWVhc3VyZWQgdmFsdWVzIGFy
ZSBoZWF2aWx5IHZhcnlpbmcgaW4gYWxsIGNhc2VzLAo+IHRob3VnaCkuCj4KPiBUaGlzIGlzIGlu
dGVudGlvbmFsbHkgbm90IHVzaW5nIGEgbmV3IGh2bV9mdW5jcyBob29rOiBGb3Igb25lLCB0aGlz
IGlzCj4gYWxsIGFib3V0IFBWLCBhbmQgc29tZXRoaW5nIHNpbWlsYXIgY2FuIGhhcmRseSBiZSBk
b25lIGZvciBWTVguCj4gRnVydGhlcm1vcmUgdGhlIGluZGlyZWN0IHRvIGRpcmVjdCBjYWxsIHBh
dGNoaW5nIHRoYXQgaXMgbWVhbnQgdG8gYmUKPiBhcHBsaWVkIHRvIG1vc3QgaHZtX2Z1bmNzIGhv
b2tzIHdvdWxkIGJlIHVnbHkgdG8gbWFrZSB3b3JrIHdpdGgKPiBmdW5jdGlvbnMgaGF2aW5nIG1v
cmUgdGhhbiA2IHBhcmFtZXRlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQu
Y29tPgo+IC0tLQo+IHYzOiBBZGQvZXh0ZW5kIGNvbW1lbnRzLgo+IHYyOiBSZS1iYXNlLgo+IC0t
LQo+IEJlc2lkZXMgdGhlIG1lbnRpb25lZCBvZGRpdHkgd2l0aCBtZWFzdXJlZCBwZXJmb3JtYW5j
ZSwgSSd2ZSBhbHNvCj4gbm90aWNlZCBhIHNpZ25pZmljYW50IGRpZmZlcmVuY2UgKG9mIGF0IGxl
YXN0IDE1MCBjbG9ja3MpIGJldHdlZW4KPiBtZWFzdXJpbmcgaW1tZWRpYXRlbHkgYXJvdW5kIHRo
ZSBjYWxscyB0byBzdm1fbG9hZF9zZWdzKCkgYW5kIG1lYXN1cmluZwo+IGltbWVkaWF0ZWx5IGlu
c2lkZSB0aGUgZnVuY3Rpb24uCgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
