From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 6/7] vtd: change lookup_page failure
 semantics
Date: Fri, 21 Sep 2018 00:58:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1913236F6@SHSMSX101.ccr.corp.intel.com>
References: <20180920141149.1643-1-paul.durrant@citrix.com>
 <20180920141149.1643-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=d/op=md=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g39oH-0007Dw-Im
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 01:00:41 +0000
In-Reply-To: <20180920141149.1643-7-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDIwLCAyMDE4IDEwOjEyIFBNCj4gCj4gQ29tbWl0IDQz
ZDE2MjJiICJ2dGQ6IGFkZCBsb29rdXBfcGFnZSBtZXRob2QgdG8gaW9tbXVfb3BzIiBhZGRlZCBh
Cj4gbG9va3VwIG1ldGhvZCBpbiB0byB0aGUgVlQtZCBJT01NVSBpbXBsZW1lbnRhdGlvbi4gSW4g
c29tZSBjYXNlcyAoc3VjaAo+IGFzCj4gd2hlbiBzaGFyZWQgRVBUIGlzIGluIG9wZXJhdGlvbikg
dGhhdCBmdW5jdGlvbiBzaW1wbHkgcGFzc2VzIGJhY2sgYW4KPiBpZGVudGl0eSBNRk4gKGkuZS4g
YW4gTUZOIHdpdGggdGhlIHNhbWUgdmFsdWUgYXMgdGhlIERGTiB0aGF0IHdhcyBwYXNzZWQKPiBp
biksIGJ1dCB0aGlzIGRvZXNuJ3QgYWN0dWFsbHkgbWFrZSBhIGxvdCBvZiBzZW5zZS4gSWYsIGZv
ciBpbnN0YW5jZSwKPiBzaGFyZWQgRVBUIGlzIHVzZWQgdGhlbiByZWFsbHkgdGhlIGZ1bmN0aW9u
IHNob3VsZCBiZSBkb2luZyBhIFAyTSBsb29rdXAKPiBzaW5jZSBERk4gc3BhY2Ugd2lsbCBiZSBp
ZGVudGljYWwgdG8gR0ZOIHNwYWNlLgo+IAo+IEluIHByYWN0aWNlIHRoZXJlIGFyZSBubyBjdXJy
ZW50IGNhbGxlcnMgb2YgdGhlIGxvb2t1cF9wYWdlIG1ldGhvZCBhbmQsCj4gd2hlbiBQVi1JT01N
VSBzdXBwb3J0IGlzIGFkZGVkLCB0aGUgbWV0aG9kIHdpbGwgbm90IGJlIGNhbGxlZCBpZiBlaXRo
ZXIKPiBzaGFyZWQgRVBUIGlzIGluIG9wZXJhdGlvbiBvciBpb21tdV9wYXNzdGhyb3VnaCBpcyBz
ZXQsIHNvIHRoaXMgcGF0Y2gKPiBzaW1wbHkgZmFpbHMgdGhlIG1ldGhvZCB3aXRoIC1FT1BOT1RT
VVBQIGluIHRob3NlIGNhc2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
