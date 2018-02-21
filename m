From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] sysctl: correct comment in
 xen_sysctl_pcitopoinfo
Date: Wed, 21 Feb 2018 08:24:08 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802210823480.19448@sstabellini-ThinkPad-X260>
References: <20180221134458.21250-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221134458.21250-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMSBGZWIgMjAxOCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gUmVmZXIgdG8gY29ycmVj
dCBtZW1iZXIgb2Ygc3RydWN0IHhlbl9zeXNjdGxfcGNpdG9wb2luZm8gaW4gY29tbWVudC4KPiAK
PiBGaXhlczogY29tbWl0IDYxMzE5ZmJmZDkgKCJzeXNjdGw6IGFkZCBzeXNjdGwgaW50ZXJmYWNl
IGZvciBxdWVyeWluZyBQQ0kgdG9wb2xvZ3kiKQo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sYWYgSGVy
aW5nIDxvbGFmQGFlcGZsZS5kZT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3Rs
LmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggYi94ZW4vaW5j
bHVkZS9wdWJsaWMvc3lzY3RsLmgKPiBpbmRleCBlZjEwMzY4ZDc5Li5mNmFhZmQ0NzU0IDEwMDY0
NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9zeXNjdGwuaAo+IEBAIC02NzgsNyArNjc4LDcgQEAgc3RydWN0IHhlbl9zeXNjdGxf
cHNyX2NtdF9vcCB7Cj4gICNkZWZpbmUgWEVOX0lOVkFMSURfREVWIChYRU5fSU5WQUxJRF9OT0RF
X0lEIC0gMSkKPiAgc3RydWN0IHhlbl9zeXNjdGxfcGNpdG9wb2luZm8gewo+ICAgICAgLyoKPiAt
ICAgICAqIElOOiBOdW1iZXIgb2YgZWxlbWVudHMgaW4gJ3BjaXRvcG8nIGFuZCAnbm9kZXMnIGFy
cmF5cy4KPiArICAgICAqIElOOiBOdW1iZXIgb2YgZWxlbWVudHMgaW4gJ2RldnMnIGFuZCAnbm9k
ZXMnIGFycmF5cy4KPiAgICAgICAqIE9VVDogTnVtYmVyIG9mIHByb2Nlc3NlZCBlbGVtZW50cyBv
ZiB0aG9zZSBhcnJheXMuCj4gICAgICAgKi8KPiAgICAgIHVpbnQzMl90IG51bV9kZXZzOwo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRl
dmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
