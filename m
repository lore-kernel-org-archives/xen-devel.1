From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v2] mm/page_alloc: make bootscrub happen in
 idle-loop
Date: Mon, 15 Oct 2018 08:53:19 +0100
Message-ID: <f834641d-3f0e-4e08-e860-bfaf224fbe62@citrix.com>
References: <20181009152119.15567-1-sergey.dyasli@citrix.com>
 <5BC0A46802000078001F102F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BC0A46802000078001F102F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggMTQ6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA5LjEwLjE4IGF0
IDE3OjIxLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMKPj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4gQEAg
LTE2MSw4ICsxNjEsNDIgQEAgc3RyaW5nX3BhcmFtKCJiYWRwYWdlIiwgb3B0X2JhZHBhZ2UpOwo+
PiAgLyoKPj4gICAqIG5vLWJvb3RzY3J1YiAtPiBGcmVlIHBhZ2VzIGFyZSBub3QgemVyb2VkIGR1
cmluZyBib290Lgo+PiAgICovCj4+IC1zdGF0aWMgYm9vbF90IG9wdF9ib290c2NydWIgX19pbml0
ZGF0YSA9IDE7Cj4+IC1ib29sZWFuX3BhcmFtKCJib290c2NydWIiLCBvcHRfYm9vdHNjcnViKTsK
Pj4gK2VudW0gYm9vdHNjcnViX21vZGUgewo+PiArICAgIEJPT1RTQ1JVQl9PRkYgPSAwLAo+IAo+
IFRoZSAiPSAwIiBpcyBwb2ludGxlc3MuCgpJIGRvbid0IG1pbmQgdGhpcyBjaGFuZ2UuCgo+PiBA
QCAtMjAzOSw4ICsyMDc3LDI0IEBAIHZvaWQgX19pbml0IGhlYXBfaW5pdF9sYXRlKHZvaWQpCj4+
ICAgICAgICovCj4+ICAgICAgc2V0dXBfbG93X21lbV92aXJxKCk7Cj4+ICAKPj4gLSAgICBpZiAo
IG9wdF9ib290c2NydWIgKQo+PiArICAgIHN3aXRjaCAoIG9wdF9ib290c2NydWIgKQo+PiArICAg
IHsKPj4gKyAgICBkZWZhdWx0Ogo+PiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPj4g
KyAgICAgICAgLyogRmFsbCB0aHJvdWdoICovCj4+ICsKPj4gKyAgICBjYXNlIEJPT1RTQ1JVQl9J
RExFOgo+PiArICAgICAgICBwcmludGsoIlNjcnViYmluZyBGcmVlIFJBTSBvbiAlZCBub2RlcyBp
biBiYWNrZ3JvdW5kXG4iLAo+PiArICAgICAgICAgICAgICAgbnVtX29ubGluZV9ub2RlcygpKTsK
PiAKPiBTdGlsbCB0aGUgcXVlc3Rpb24gd2hldGhlciB0aGlzIHByaW50aygpLCBhbmQgaW4gcGFy
dGljdWxhciB0aGUgaW5jbHVzaW9uCj4gb2YgdGhlIG5vZGUgY291bnQsIGlzIG1lYW5pbmdmdWwg
aW4gYW55IHdheS4gT3RoZXIgdGhhbiB0aGlzCgpJIGRvbid0IGhhdmUgYW55IHN0cm9uZyBvcGlu
aW9uIGFib3V0IGhvdyB0aGlzIHByaW50aygpIHN0YXRlbWVudCBzaG91bGQKbG9vayBsaWtlLiBJ
dCBjYW4gYmUgY2hhbmdlZCB0byB3aGF0ZXZlciBtYWludGFpbmVycyBmaW5kIG1vcmUgYXBwcm9w
cmlhdGUuCgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
YW5kIG9uZSBvciBib3RoIGNoYW5nZXMgd291bGQgYmUgZWFzeSBlbm91Z2ggdG8gbWFrZSB3aGls
ZQo+IGNvbW1pdHRpbmcsIHByb3ZpZGVkIHdlIGNhbiByZWFjaCBhZ3JlZW1lbnQuCgpUaGFua3Ms
ClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
