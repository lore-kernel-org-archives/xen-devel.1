From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v10 2/6] xen: introduce DEFINE_SYMBOL
Date: Wed, 27 Feb 2019 16:05:58 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902271603280.20689@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-2-git-send-email-sstabellini@kernel.org>
 <23669.27990.559784.995763@mariner.uk.xensource.com>
 <5C7573BA020000780021A6D7@prv1-mh.provo.novell.com>
 <23669.30767.727170.597533@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1902261042180.20689@sstabellini-ThinkPad-X260>
 <5C765C73020000780021A9C0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gz9D6-000143-Uk
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 00:06:00 +0000
In-Reply-To: <5C765C73020000780021A9C0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNyBGZWIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDI2LjAyLjE5
IGF0IDE5OjQzLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIDI2
IEZlYiAyMDE5LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+PiBKYW4gQmV1bGljaCB3cml0ZXMgKCJS
ZTogW1BBVENIIHYxMCAyLzZdIHhlbjogaW50cm9kdWNlIERFRklORV9TWU1CT0wiKToKPiA+PiA+
IE9uIDI2LjAyLjE5IGF0IDE3OjQ2LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4g
Pj4gPiA+IEkgYW0gbm90IGF3YXJlIG9mIGEgc3RhbmRhcmQgQyB0eXBlIHdoaWNoIGNvdWxkIGJl
IHVzZWQgaW5zdGVhZCBvZgo+ID4+ID4gPiB0aGlzIHN0cnVjdC4gIEJ1dCBJIHRoaW5rIHlvdSBj
YW4gdXNlIHRoZSBgcGFja2VkJyBhdHRyaWJ1dGUgdG8gZ2V0Cj4gPj4gPiA+IHRoZSByaWdodCBi
ZWhhdmlvdXIuICBUaGUgR0NDIG1hbnVhbCBzYXlzOgo+ID4+ID4gPiAKPiA+PiA+ID4gIHwgQWxp
Z25tZW50IGNhbiBiZSBkZWNyZWFzZWQgYnkgc3BlY2lmeWluZyB0aGUgJ3BhY2tlZCcgYXR0cmli
dXRlLgo+ID4+ID4gPiAgfCBTZWUgYmVsb3cuCj4gPj4gLi4uCj4gPj4gPiBVbnRpbCBJJ3ZlIGxv
b2tlZCBhdCB0aGlzIChhZ2Fpbikgbm93LCBJIHdhc24ndCBldmVuIGF3YXJlIHRoYXQKPiA+PiA+
IG9uZSBjYW4gY29tYmluZSBwYWNrZWQgYW5kIGFsaWduZWQgYXR0cmlidXRlcyBpbiBhIHNlbnNp
YmxlCj4gPj4gPiB3YXkuIE1heSBJIHN1Z2dlc3QgdGhhdCwgYmVjYXVzZSBvZiB0aGlzIGJlaW5n
IGEgdGhlb3JldGljYWwKPiA+PiA+IGlzc3VlIG9ubHkgYXQgdGhpcyBwb2ludCwgd2UgbGltaXQg
b3Vyc2VsdmVzIHRvIHRoZSBidWlsZCB0aW1lCj4gPj4gPiBhc3NlcnRpb24geW91IHN1Z2dlc3Q/
Cj4gPj4gCj4gPj4gSSBhbSBub3Qgc3VnZ2VzdGluZyBjb21iaW5pbmcgYHBhY2tlZCcgYW5kIGBh
bGlnbmVkJy4gIEkgYW0gc3VnZ2VzdGluZwo+ID4+IG9ubHkgYHBhY2tlZCcgKGJ1dCBiYXNlZCBv
biB0ZXh0IHdoaWNoIGlzIGluIHRoZSBtYW51YWwgc2VjdGlvbiBmb3IKPiA+PiBgYWxpZ25lZCcp
LiAgQnV0IEkgYW0gaGFwcHkgd2l0aCBhIGJ1aWxkLXRpbWUgYXNzZXJ0aW9uIGlmIHlvdSBkb24n
dAo+ID4+IHdhbnQgdG8gYWRkIGBwYWNrZWQnLiAgVGhhdCBpcyBqdXN0IGFzIHNhZmUuCj4gPiAK
PiA+IENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBhIHJvdWdoIGV4YW1wbGUgb2YgdGhlIGJ1aWxk
LXRpbWUgYXNzZXJ0aW9uIHlvdQo+ID4gYXJlIHRoaW5raW5nIGFib3V0PyBJIGFtIGhhcHB5IHRv
IGFkZCBpdC4KPiAKPiBCVUlMRF9CVUdfT04oYWxpZ25vZigqczEpICE9IGFsaWdub2YoKnMyKSk7
CgpUaGFua3MhIEkgbm90aWNlZCB0aGF0IEJVSUxEX0JVR19PTiByZXF1aXJlcyB4ZW4vbGliLmgg
d2hpY2ggY2Fubm90IGJlCmluY2x1ZGVkIGZyb20geGVuL2NvbXBpbGVyLmguIEFjdHVhbGx5LCB3
ZSB3ZXJlIGFscmVhZHkgZXJyb25lb3VzbHkKdXNpbmcgQlVJTERfQlVHX09OX1pFUk8gaW4geGVu
L2NvbXBpbGVyLmggd2l0aG91dCBpbmNsdWRpbmcgeGVuL2xpYi5oLgoKTXkgc3VnZ2VzdGlvbiB3
b3VsZCBiZSB0byBtb3ZlIHRoZSBkZWZpbml0aW9ucyBvZiBCVUdfT04sIFdBUk5fT04sCkJVSUxE
X0JVR19PTiBhbmQgQlVJTERfQlVHX09OX1pFUk8gZnJvbSB4ZW4vbGliLmggdG8gY29tcGlsZXIu
aC4KRXZlcnl0aGluZyB3b3JrcyBmaW5lIGlmIEkgZG8gdGhhdCwgYW5kIGl0IHNlZW1zIGEgYmV0
dGVyIGZpdC4KCkFyZSB5b3UgT0sgd2l0aCB0aGlzPwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
