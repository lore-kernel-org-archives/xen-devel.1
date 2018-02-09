From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 08/28] x86/vvtd: Add MMIO handler for VVTD
Date: Fri, 9 Feb 2018 17:51:29 +0000
Message-ID: <20180209175129.fil4uetd2nxzhvfr@MacBook-Pro-de-Roger.local>
References: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
 <1510899755-40237-9-git-send-email-chao.gao@intel.com>
 <20180209163915.lglo2f4ag73unasu@MacBook-Pro-de-Roger.local>
 <20180209172109.GH30322@skl-4s-chao.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180209172109.GH30322@skl-4s-chao.sh.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Lan Tianyu <tianyu.lan@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBGZWIgMTAsIDIwMTggYXQgMDE6MjE6MDlBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gRnJpLCBGZWIgMDksIDIwMTggYXQgMDQ6Mzk6MTVQTSArMDAwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+T24gRnJpLCBOb3YgMTcsIDIwMTcgYXQgMDI6MjI6MTVQTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIFZWVEQgTU1JTyBoYW5kbGVyIHRv
IGRlYWwgd2l0aCBNTUlPIGFjY2Vzcy4KPiA+PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdh
byA8Y2hhby5nYW9AaW50ZWwuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IExhbiBUaWFueXUgPHRp
YW55dS5sYW5AaW50ZWwuY29tPgo+ID4+IC0tLQo+ID4+IHY0Ogo+ID4+ICAtIG9ubHkgdHJhcCB0
aGUgcmVnaXN0ZXIgZW11bGF0ZWQgaW4gdnZ0ZF9pbl9yYW5nZSgpLgo+ID4+ICAgIGkuZS4gcmVw
bGFjZSBQQUdFX1NJWkUgd2l0aCB0aGUgVlZURF9NQVhfT0ZGU0VUCj4gPj4gLS0tCj4gPj4gIHhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC92dnRkLmMgfCA1NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygr
KQo+ID4+IAo+ID4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvdnZ0
ZC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3Z2dGQuYwo+ID4+IGluZGV4IDlmNzZj
Y2YuLmQ3OGQ4NzggMTAwNjQ0Cj4gPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L3Z2dGQuYwo+ID4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC92dnRkLmMKPiA+
Cj4gPk5vdyB0aGF0IEkgbG9vayBhdCB0aGlzLCB0aGlzIGlzIHRoZSB3cm9uZyBmb2xkZXIuIFRo
aXMgc2hvdWxkIGJlIGluCj4gPnhlbi9hcmNoL3g4Ni9odm0gd2l0aCB0aGUgcmVzdCBvZiB0aGUg
ZW11bGF0ZWQgZGV2aWNlcy4KPiAKPiBJdCBpcyBhIHByb2JsZW0gd2UgZGlzY3Vzc2VkIGluIHBy
ZXZpb3VzIHZlcnNpb25zLiBBTUQgcHV0cyBpdHMgdklPTU1VCj4gKGlvbW11X2d1ZXN0LmMpIGlu
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC8uIFdlIGFyZSBmb2xsb3dpbmcgd2hhdAo+IHRo
ZXkgZGlkLiBJIGRvbid0IGhhdmUgc3BlY2lhbCB0YXN0ZSBvbiB0aGlzLiBJZiBubyBvbmUgb2Jq
ZWN0cyB0byB5b3VyCj4gc3VnZ2VzdGlvbiwgSSB3aWxsIG1vdmUgaXQgdG8geGVuL2FyY2gveDg2
L2h2bS8uIE1heWJlIGNyZWF0ZSBhIG5ldwo+IGludGVsIGRpcmVjdG9yeSBzaW5jZSBpdCdzIGlu
dGVsLXNwZWNpZmljIGFuZCB3b24ndCBiZSB1c2VkIGJ5IEFNRC4KCk9oLCBpdCdzIGJlZW4gcXVp
dGUgc29tZSB0aW1lIHNpbmNlIEkndmUgcmV2aWV3ZWQgdGhhdCwgc28gVEJIIEkKZGlkbid0IHJl
bWVtYmVyIHRoYXQgZGlzY3Vzc2lvbi4KCklmIHRoZSBBTUQgdmlvbW11IHRoaW5nIGlzIGFscmVh
ZHkgdGhlcmUgSSBndWVzcyBpdCBkb2Vzbid0IGh1cnQuLi4KQWxzbywgaGF2ZSB5b3UgY2hlY2tl
ZCB3aGV0aGVyIGl0IGNhbiBiZSBjb252ZXJ0ZWQgdG8gdXNlIHRoZQppbmZyYXN0cnVjdHVyZSB0
aGF0IHlvdSBhZGQgaGVyZT8KCkJvdGggc2hvdWxkIHJlYWxseSBiZSB1c2luZyB0aGUgc2FtZSBp
bnRlcmZhY2UuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
