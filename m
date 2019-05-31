From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] xen: make tracebuffer configurable
Date: Fri, 31 May 2019 12:58:36 +0000
Message-ID: <D13DE1D6-CE96-4A41-941E-FC4161CFA1EA@citrix.com>
References: <1559211432-30973-1-git-send-email-chenbaodong@mxnavi.com>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nX14=T7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hWh7g-0006CA-Kc
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 12:59:04 +0000
In-Reply-To: <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <5F55328682AA864E94B69B4D3E5D1059@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Baodong Chen <chenbaodong@mxnavi.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTWF5IDMxLCAyMDE5LCBhdCAxMjoxMCBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+Pj4+IE9uIDMwLjA1LjE5IGF0IDEyOjE3LCA8Y2hlbmJh
b2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6DQo+PiBEZWZhdWx0OiBlbmFibGVkLg0KPj4gQ2FuIGJl
IGRpc2FibGVkIGZvciBzbWFsbGVyIGNvZGUgZm9vdHByaW50Lg0KPiANCj4gQnV0IHlvdSdyZSBh
d2FyZSB0aGF0IHdlJ3JlLCBmb3Igbm93IGF0IGxlYXN0LCB0cnlpbmcgdG8gbGltaXQgdGhlDQo+
IG51bWJlciBvZiBpbmRlcGVuZGVudGx5IHNlbGVjdGFibGUgY29uZmlnIG9wdGlvbnM/IE9uZXMg
ZGVwZW5kaW5nDQo+IG9uIEVYUEVSVCBhcmUgc29ydCBvZiBhbiBleGNlcHRpb24gaW4gY2VydGFp
biBjYXNlcy4NCg0KSeKAmW0gdHJ5aW5nIHRvIHJlbWVtYmVyIGV4YWN0bHkgd2hhdCB3ZSBoYXZl
IG9yIGhhdmVu4oCZdCBkZWNpZGVkLiAgSSB0YWtlIGl0IHlvdSB0aGluayB3ZSBzaG91bGQgYXZv
aWQgaGF2aW5nIGEgbG9hZCBvZiBpbmRlcGVuZGVudGx5LXNlbGVjdGFibGUgY29uZmlndXJhdGlv
bnMgdG8gc3VwcG9ydD8NCg0KQmFvZG9uZywgd2hhdCB3YXMgeW91ciBtYWluIHB1cnBvc2UgaW4g
YWRkaW5nIGEgcGF0Y2ggbGlrZSB0aGlzPyAgSnVzdCB0byBtYWtlIHRoaW5ncyBhIGJpdCB0aWRp
ZXIsIG9yIHdhcyBpdCB0byB0cnkgdG8gZ28gdGhyb3VnaCBhbmQgZ2VuZXJhdGUgYSBmYXIgc21h
bGxlciBoeXBlcnZpc29yIGNvZGViYXNlIChmb3IgaW5zdGFuY2UsIHBlcmhhcHMgdG8gbWFrZSBz
YWZldHkgY2VydGlmaWNhdGlvbiBtb3JlIHRyYWN0YWJsZSk/DQoNCkkgdGhpbmsgd2XigJl2ZSB0
YWxrZWQgYWJvdXQgdGhpcyBiZWZvcmUsIGJ1dCBvdXIgYmFzaWMgb3B0aW9ucywgYXMgZmFyIGFz
IHN1cHBvcnQsIHdvdWxkIGJlOg0KDQoxLiBIYXZlIGEgc2luZ2xlIGxhcmdlIGNvbmZpZyBvcHRp
b24gd2hpY2ggZGlzYWJsZWQgbGFyZ2Ugc3dhdGhlcyBvZiB1bnVzZWQgZnVuY3Rpb25hbGl0eQ0K
Mi4gSGF2ZSBpbmRpdmlkdWFsIGJpdHMgY29uZmlndXJhYmxlLCBidXQgaGF2ZSBvbmx5IGEgaGFu
ZGZ1bCBvZiDigJxzZWN1cml0eSBzdXBwb3J0ZWTigJ0gY29uZmlndXJhdGlvbnMuDQoNClRoZSBp
ZGVhIHdpdGggIzIgaXMgdGhhdCB3ZeKAmWQgaGF2ZSBhIOKAnGNlcnRpZmljYXRpb27igJ0gY29u
ZmlnIHRoYXQgd2UgdGVzdGVkIGFuZCBzZWN1cml0eSBzdXBwb3J0ZWQsIHdpdGggYWxsIG9mIHRo
ZXNlIGluZGl2aWR1YWwgYml0cyBvZmYsIGFzIHdlbGwgYXMg4oCcY2xvdWTigJ0gYW5kIOKAnGNs
aWVudOKAnSBjb25maWdzIHdpdGggYWxsIG9mIHRoZXNlIOKAnG9wdGlvbmFs4oCdIGJpdHMgb24g
KG9yIHNvbWUgc3Vic2V0IG9uLCBkZXBlbmRpbmcgb24gd2hhdCBlYWNoIGNvbW11bml0eSB0aG91
Z2h0IG1hZGUgdGhlIG1vc3Qgc2Vuc2UgZm9yIHRoZWlyIHVzZSBjYWZlKS4gIElmIHBlb3BsZSB3
YW50ZWQgdG8gZW5hYmxlIG9yIGRpc2FibGUgaW5kaXZpZHVhbCBjb25maWcgb3B0aW9ucyBvdXRz
aWRlIGZvIHRob3NlLCB0aGV54oCZZCBiZSB0YWtpbmcgYSByaXNrIHdydCBicmVha2FnZSAobm90
IHRlc3RlZCkgb3Igc2VjdXJpdHkgaXNzdWVzIChubyBYU0EgaXNzdWVkIHVubGVzcyBpdCBhZmZl
Y3RlZCBvbmUgb2YgdGhlIHN1cHBvcnRlZCBjb25maWdzKS4NCg0KUmljaCAvIERhbmllbCwgYW0g
SSBvbiB0aGUgcmlnaHQgdHJhY2sgaGVyZT8gIEFueSB0aG91Z2h0cz8NCg0KIC1HZW9yZ2UNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
