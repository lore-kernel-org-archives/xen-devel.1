From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/vsprintf: Introduce %pd formatter
 for domains
Date: Mon, 01 Oct 2018 04:25:04 -0600
Message-ID: <5BB1F60002000078001ED252@prv1-mh.provo.novell.com>
References: <1538155327-3194-1-git-send-email-andrew.cooper3@citrix.com>
 <5BB1E42B02000078001ED185@prv1-mh.provo.novell.com>
 <d46618c6-b8e6-aa0a-2f78-5e25947964b0@citrix.com>
 <5BB1F37002000078001ED214@prv1-mh.provo.novell.com>
 <02092f7c-8ac9-2658-fe05-dfc041ac68ce@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <02092f7c-8ac9-2658-fe05-dfc041ac68ce@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDEyOjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMTAvMTggMTE6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMS4x
MC4xOCBhdCAxMjowMiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MDEvMTAvMTggMTA6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDI4LjA5LjE4IGF0
IDE5OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+ICtzdGF0aWMg
Y2hhciAqcHJpbnRfZG9tYWluKGNoYXIgKnN0ciwgY2hhciAqZW5kLCBjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKQo+Pj4+PiArewo+Pj4+PiArICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBOVUxMOwo+Pj4+
PiArCj4+Pj4+ICsgICAgLyogU29tZSBkZWJ1Z2dpbmcgbWF5IGhhdmUgYW4gb3B0aW9uYWxseS1O
VUxMIHBvaW50ZXIuICovCj4+Pj4+ICsgICAgaWYgKCB1bmxpa2VseSghZCkgKQo+Pj4+PiArICAg
ICAgICByZXR1cm4gc3RyaW5nKHN0ciwgZW5kLCAiTlVMTCIsIC0xLCAtMSwgMCk7Cj4+Pj4+ICsK
Pj4+Pj4gKyAgICBpZiAoIHN0ciA8IGVuZCApCj4+Pj4+ICsgICAgICAgICpzdHIgPSAnZCc7Cj4+
Pj4+ICsKPj4+Pj4gKyAgICBzd2l0Y2ggKCBkLT5kb21haW5faWQgKQo+Pj4+PiArICAgIHsKPj4+
Pj4gKyAgICBjYXNlIERPTUlEX0lPOiAgIG5hbWUgPSAiW0lPXSI7ICAgYnJlYWs7Cj4+Pj4+ICsg
ICAgY2FzZSBET01JRF9YRU46ICBuYW1lID0gIltYRU5dIjsgIGJyZWFrOwo+Pj4+PiArICAgIGNh
c2UgRE9NSURfQ09XOiAgbmFtZSA9ICJbQ09XXSI7ICBicmVhazsKPj4+Pj4gKyAgICBjYXNlIERP
TUlEX0lETEU6IG5hbWUgPSAiW0lETEVdIjsgYnJlYWs7Cj4+Pj4gICAgIGRlZmF1bHQ6IEFTU0VS
VF9VTlJFQUNIQUJMRSgpOwo+Pj4+Cj4+Pj4gPwo+Pj4gTm8gLSBzcGVjaWZpY2FsbHkgbm90IGlu
IHRoaXMgY2FzZS4KPj4+Cj4+PiBUaGlzIHBhdGggaXMgdXNlZCB3aGVuIHByaW50aW5nIGNyYXNo
IGluZm9ybWF0aW9uLCBhbmQgZmFsbGluZyBiYWNrIHRvIGEKPj4+IG51bWJlciBpcyBiZXR0ZXIg
YmVoYXZpb3VyIHRoYW4gZmFsbGluZyBpbnRvIGFuIGluZmluaXRlIGxvb3AsCj4+PiBvdmVyZmxv
d2luZyB0aGUgcHJpbWFyeSBzdGFjaywgdGhlbiB0YWtpbmcgYSAjREYgKHdoaWNoIGVzY2FsYXRl
cyB0bwo+Pj4gdHJpcGxlIGZhdWx0IG9uIEFNRCksIHdpdGhvdXQgcHJpbnRpbmcgYW55dGhpbmcg
dXNlZnVsLgo+PiBBaCwgZ29vZCBwb2ludC4gUGVyaGFwcyB3b3J0aCBhIGJyaWVmIGNvbW1lbnQg
aW5zdGVhZCBvZiBhICJkZWZhdWx0OiIKPj4gdGhlbj8KPiAKPiBUaGlzIGluY3JlbWVudGFsIGRp
ZmY/CgpMR1RNLCB0aGFua3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
