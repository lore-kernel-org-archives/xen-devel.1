From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] coverage: GCC coverage libfdt Makefile fix
Date: Thu, 16 May 2019 12:26:38 +0100
Message-ID: <20190516112638.GX2798@zion.uk.xensource.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREXC-0001bC-KR
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:26:50 +0000
Content-Disposition: inline
In-Reply-To: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6MTM6NTRQTSArMDMwMCwgVmlrdG9yIE1pdGluIHdy
b3RlOgo+IFRoZSBwYXRjaCByZXNvbHZlcyAneGVuY292JyBjcmFzaGVzIGluIGNhc2Ugb2YgQWFy
Y2g2NC4KPiAKPiBBbGwgdGhlIC5pbml0Liogc2VjdGlvbnMgYXJlIHN0cmlwcGVkIGFmdGVyIGJv
b3QsCj4gaXQgbWVhbnMgdGhhdCBhbnl0aGluZyBpbiAuaW5pdC5kYXRhIGNhbm5vdCBiZSBhY2Nl
c3NlZCBhbnltb3JlLgo+IFRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlcyBhbnkg
LmluaXQgYmluYXJ5IHdpdGhvdXQgZ2NvdiBvcHRpb24uCj4gVGhlIHByb2JsZW0gaXMgY29taW5n
IGZyb20gbGliZmR0Lgo+IFRoZSBlbnRpcmUgbGlicmFyeSBpcyBtb3ZlZCB0byAuaW5pdCB1c2lu
ZzoKPiAkKE9CSkNPUFkpICQoZm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24g
LiQocyk9LmluaXQuJChzKSkgJDwgJEAKPiBTbyB3ZSBuZWVkIHRvIHRlbGwgdGhlIHRvcCBNYWtl
ZmlsZSB0byBmaWx0ZXIgb3V0IGxpYmZkdC4KPiAKPiBSZXBvcnRlZC1ieTogVmlrdG9yIE1pdGlu
IDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gVGVzdGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rv
ci5taXRpbi4xOUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KCkFsdGhvdWdoIEkgd291bGQgbGlrZSB0byBhc2sgeW91IHRvIGFkanVzdCB0aGUg
c3ViamVjdCB0byBiZSBtb3JlCnNwZWNpZmljOgoKICBjb3ZlcmFnZTogZmlsdGVyIG91dCBsaWJm
ZHQubwoKaWYgeW91IGFncmVlLCB0aGlzIGNhbiBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuCgpX
ZWkuCgoKPiAtLS0KPiAgeGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGli
ZmR0L01ha2VmaWxlIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUKPiBpbmRleCBkODFmNTRi
NmI4Li5jMDc1YmJmNTQ2IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxl
Cj4gKysrIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUKPiBAQCAtMyw2ICszLDcgQEAgaW5j
bHVkZSBNYWtlZmlsZS5saWJmZHQKPiAgU0VDVElPTlMgOj0gdGV4dCBkYXRhICQoU1BFQ0lBTF9E
QVRBX1NFQ1RJT05TKQo+ICAKPiAgb2JqLXkgKz0gbGliZmR0Lm8KPiArbm9jb3YteSArPSBsaWJm
ZHQubwo+ICAKPiAgQ0ZMQUdTICs9IC1JJChCQVNFRElSKS9pbmNsdWRlL3hlbi9saWJmZHQvCj4g
IAo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
