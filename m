From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 55/62] make-flight: shadow test:
 Disable kpti in guests
Date: Wed, 10 Apr 2019 16:59:49 +0100
Message-ID: <23726.4853.466227.501439@mariner.uk.xensource.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-56-ian.jackson@eu.citrix.com>
 <76415ebc-6540-4ea0-d1f4-023a6763cba2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEFeU-0006Sb-PW
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 16:00:42 +0000
In-Reply-To: <76415ebc-6540-4ea0-d1f4-023a6763cba2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW09TU1RFU1QgUEFUQ0ggNTUvNjJdIG1ha2UtZmxp
Z2h0OiBzaGFkb3cgdGVzdDogRGlzYWJsZSBrcHRpIGluIGd1ZXN0cyIpOgo+IE9uIDEwLzA0LzIw
MTkgMTU6MjQsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gU2luY2UgU3BlY3RyZS9NZWx0ZG93biwg
c2hhZG93IGhhcyBiZWVuIGEgbG90IHNsb3dlciwgZXNwZWNpYWxseSB3aXRoCj4gPiBLUFRJIGlu
IHRoZSBndWVzdC4gIEVtcGlyaWNhbGx5LCB0b28gc2xvdyAod2l0aCB0aGUga2VybmVsIGZyb20g
RGViaWFuCj4gPiBzdHJldGNoKS4KPiAKPiBUaGUgc3BlZWQgb2Ygc2hhZG93IHBhZ2V0YWJsZXMg
aGFzbid0IGNoYW5nZWQgLSBJIGRvbid0IHRoaW5rIHdlIGV2ZW4KPiB0b3VjaGVkIHRoZSBzaGFk
b3cgY29kZSBhdCBhbGwgZm9yIFhTQS0yNTQuCj4gCj4gVGhlIHByb2JsZW0gaXMgdGhlIGNoYW5n
ZSBpbiBndWVzdCBiZWhhdmlvdXIgYXMgYSBjb25zZXF1ZW5jZSBvZiBuZWVkaW5nCj4gS1BUSSBm
b3IgYSBNZWx0ZG93biBtaXRpZ2F0aW9uLgo+IAo+IFRoZSBndWVzdCBub3cgZmx1c2hlcyBpdHMg
cGFnZXRhYmxlcyBvbiBldmVyeQo+IHN5c2NhbGwvaW50ZXJydXB0L2V4Y2VwdGlvbiByYXRoZXIg
dGhhbiBvbmNlIG9uIGEgcHJvY2Vzcz0+cHJvY2Vzcwo+IGNvbnRleHQgc3dpdGNoLCB3aGljaCBp
cyB3aHkgcnVubmluZyBhIGd1ZXN0IHVzaW5nIEtQVEkgaW4gc2hhZG93IG1vZGUKPiBpcyBib2Fy
ZGVybGluZSB1bnVzYWJsZS4KPiAKPiBUaGUgYWN0dWFsIGNoYW5nZSB0byB1c2Ugbm9wdGkgbG9v
a3MgZmluZS4KClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiAgVW5mb3J0dW5hdGVseSBmb3Ig
dGhlIHJlYXNvbnMgSSd2ZQpleHBsYWluZWQgSSB3b24ndCBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNz
YWdlIGJlY2F1c2UgdGhhdCB3b3VsZCBpbnZvbHZlCnJld3JpdGluZyB0aGUgY29tbWl0LCBidXQg
aXQgaXMgdXNlZnVsIHRvIGhhdmUgdGhpcyBjb3JyZWN0aW9uIGluIHRoZQphcmNoaXZlcy4KClJl
Z2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
