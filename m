From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 13/28] x86/vvtd: add a helper function to
 decide the interrupt format
Date: Mon, 12 Feb 2018 12:14:44 +0000
Message-ID: <20180212121444.qgryikh5sixpwd4a@MacBook-Pro-de-Roger.local>
References: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
 <1510899755-40237-14-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1510899755-40237-14-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Lan Tianyu <tianyu.lan@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMTcsIDIwMTcgYXQgMDI6MjI6MjBQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gRGlmZmVyZW50IHBsYXRmb3JtIG1heSB1c2UgZGlmZmVyZW50IG1ldGhvZCB0byBkaXN0aW5n
dWlzaAo+IHJlbWFwcGluZyBmb3JtYXQgaW50ZXJydXB0IGFuZCBub3JtYWwgZm9ybWF0IGludGVy
cnVwdC4KPiAKPiBJbnRlbCB1c2VzIG9uZSBiaXQgaW4gSU9BUElDIFJURSBvciBNU0kgYWRkcmVz
cyByZWdpc3RlciB0bwo+IGluZGljYXRlIHRoZSBpbnRlcnJ1cHQgaXMgcmVtYXBwaW5nIGZvcm1h
dC4gdnZ0ZCBzaG91bGQgaGFuZGxlCj4gYWxsIHRoZSBpbnRlcnJ1cHRzIHdoZW4gLmNoZWNrX2ly
cV9yZW1hcHBpbmcoKSByZXR1cm4gdHJ1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8
Y2hhby5nYW9AaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExhbiBUaWFueXUgPHRpYW55dS5s
YW5AaW50ZWwuY29tPgo+IAo+IC0tLQo+IHYzOgo+ICAtIG5ldwo+IC0tLQo+ICB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvdnZ0ZC5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvdnZ0ZC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3Z2dGQuYwo+IGlu
ZGV4IDk4OTBjYzIuLmQzZGVjMDEgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL3Z2dGQuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC92dnRkLmMK
PiBAQCAtNTY1LDYgKzU2NSwxNSBAQCBzdGF0aWMgaW50IHZ2dGRfZ2V0X2lycV9pbmZvKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQsCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiArLyogY2hlY2sg
d2hldGhlciB0aGUgaW50ZXJydXB0IHJlcXVlc3QgaXMgcmVtYXBwYWJsZSAqLwo+ICtzdGF0aWMg
Ym9vbCB2dnRkX2lzX3JlbWFwcGluZyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAoKaXJxX3JlbWFw
cGVkIG9yIGludHJfcmVtYXBwZWQgd291bGQgYmUgY2xlYXJlci4KCkFuZCBsaWtld2lzZSB0aGUg
Y29tbWVudCBpbiB0aGUgcHJldmlvdXMgcGF0Y2gsIGl0IHdvdWxkIGJlIG11Y2gKYmV0dGVyIHRv
IGludHJvZHVjZSB0aGlzIHRvZ2V0aGVyIHdpdGggY2hlY2tfaXJxX3JlbWFwcGluZyBhbmQgYW4K
YWN0dWFsIHVzZXIuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
