From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v4 6/6] RFC: test/depriv: Add a tool to
 check process-level depriv
Date: Tue, 6 Nov 2018 10:43:01 +0000
Message-ID: <449cd003-34cc-f26a-7908-d91eed0dcd15@citrix.com>
References: <20181105180711.20322-1-george.dunlap@citrix.com>
 <20181105180711.20322-6-george.dunlap@citrix.com>
 <9444658da164470d906e55a348e0d3cd@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pbld=nr=citrix.com=prvs=8415d0394=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gJyp9-0006hk-D8
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 10:43:07 +0000
In-Reply-To: <9444658da164470d906e55a348e0d3cd@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDYvMjAxOCAwOTozNCBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiArIyBFeGFtcGxl
IGlucHV0Ogo+PiArIyBVaWQ6CTExOTMJMTE5MwkxMTkzCTExOTMKPj4gK2lucHV0PSQoZ3JlcCBe
VWlkOiAvcHJvYy8kZG1waWQvc3RhdHVzKQo+PiAraWYgW1sgIiRpbnB1dCIgPX4gXlVpZDpbWzpz
cGFjZTpdXSsoWzAtOV0rKVtbOnNwYWNlOl1dKyhbMC0KPj4gOV0rKVtbOnNwYWNlOl1dKyhbMC05
XSspW1s6c3BhY2U6XV0rKFswLTldKykkIF1dIDsgdGhlbgo+PiArICAgIHJlc3VsdD0iUEFTU0VE
Igo+PiArICAgIGZvciBpIGluIHsxLi40fTsgZG8KPj4gKwlpZiBbWyAiJHtCQVNIX1JFTUFUQ0hb
JGldfSIgIT0gIiR0Z3RfdWlkIiBdXSA7IHRoZW4KPj4gKwkgICAgcmVzdWx0PSJGQUlMRUQiCj4+
ICsJICAgIGZhaWxlZD0idHJ1ZSIKPiAKPiBUaGlzIHBhdHRlciBvY2N1cnMgbWFueSB0aW1lcy4g
Q291bGQgeW91IG5vdCBqdXN0IGhhdmUgYSBib29sZWFuICdmYWlsZWQnIHZhbHVlIGFuZCBhIHN1
cHBvcnRpbmcgJ3JlYXNvbicgKHdoaWNoIG1pZ2h0IGJlIGVtcHR5KSB0aGVuIHlvdSBjYW4ganVz
dCB0ZXN0ICdyZWFzb24nIGF0IHRoZSBlbmQgdG8gZGVjaWRlIHdoYXQgdG8gZWNobz8KClllcywg
SWFuIGFsc28gc3VnZ2VzdGVkIHRoYXQsIGFuZCBpZiBJIGVuZCB1cCBsZWF2aW5nIGl0IGFzIGEg
YmFzaApzY3JpcHQgSSdsbCBjZXJ0YWlubHkgZG8gc29tZXRoaW5nIGxpa2UgdGhhdC4gIEhvd2V2
ZXI6Cgo+PiBOQiB0aGlzIHBhdGNoIGlzIGluY2x1ZGVkIGZvciByZWZlcmVuY2Ugb25seSwgd2hp
bGUgSSBjb25zaWRlciB3aGV0aGVyCj4+IHRvIGxlYXZlIHRoaXMgYXMgYSBzdGFuZC1hbG9uZSBz
Y3JpcHQsIG9yIHdoZXRoZXIgdG8gbWVyZ2Ugb3NzdGVzdCdzCj4+IGZkIGNoZWNrZXIgZnVuY3Rp
b25hbGl0eSBpbnRvIGl0IChwZXJoYXBzIGNoYW5naW5nIHRoZSBsYW5ndWFnZSB0bwo+PiBwZXJs
IGF0IHRoZSBzYW1lIHRpbWUpLiAgUmV2aWV3cyBvZiB0aGUgZ2VuZXJhbCBkZXRlY3Rpb24gYWxn
b3JpdGhtCj4+IGFyZSB3ZWxjb21lLCBidXQgdGhlcmUncyBubyBuZWVkIGZvciBhIGRldGFpbGVk
IHJldmlldyBvZiB0aGUgY29kZQo+PiB1bnRpbCB0aGUgc2NyaXB0IGlzIGluIGl0cyBmaW5hbCBm
b3JtLgoKU29ycnkgeW91IG1pc3NlZCB0aGF0ISAgSWYgSSBlbmQgdXAgbGVhdmluZyB0aGlzIGFz
IGEgYmFzaCBzY3JpcHQgSSdsbAp0YWtlIHlvdXIgY29tbWVudHMgYWJvdXQgdGFicy9zcGFjZXMg
YW5kIHRoZSB2YWx1ZSBvZiAiZmFpbGVkIiBpbnRvIGFjY291bnQuCgogLUdlb3JnZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
