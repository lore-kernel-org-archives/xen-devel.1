From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] domctl: revert double increment of domctl
	version
Date: Wed, 21 Feb 2018 17:38:03 +0000
Message-ID: <20180221173802.4asubsivkejs2ihy@citrix.com>
References: <20180221173422.10550-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180221173422.10550-1-olaf@aepfle.de>
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

T24gV2VkLCBGZWIgMjEsIDIwMTggYXQgMDY6MzQ6MjJQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gWGVuIDQuMTAgaGFzIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHhlLCBzdGFn
aW5nIHNob3VsZCBiZSBmaW5lCj4gd2l0aCAweGYgdW50aWwgdGhlIG5leHQgcmVsZWFzZSBpcyBw
cmVwYXJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+
Cj4gLS0tCj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+
IGluZGV4IGVjN2E4NjBhZmMuLjUwMWM0NDIzMGIgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2RvbWN0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gQEAg
LTM4LDcgKzM4LDcgQEAKPiAgI2luY2x1ZGUgImh2bS9zYXZlLmgiCj4gICNpbmNsdWRlICJtZW1v
cnkuaCIKPiAgCj4gLSNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAw
MDEwCj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDBmCj4g
IAoKVGhlIHJlYXNvbiB3ZSBidW1wZWQgdGhlIG51bWJlciB0d2ljZSBpcyBiZWNhdXNlIHdlIHdh
bnQgYSBkZWRpY2F0ZWQKbnVtYmVyIHRvIGRlbm90ZSB0aGUgcmVjZW50IHNlY3VyaXR5IGZpeC4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
