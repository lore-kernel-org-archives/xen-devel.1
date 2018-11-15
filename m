From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 08/18] xen/arm: Disable/enable non-boot
 physical CPUs on suspend/resume
Date: Thu, 15 Nov 2018 21:09:08 +0000
Message-ID: <23b0a385-ac28-3ec8-b549-50b0738501d9@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-9-git-send-email-mirela.simonovic@aggios.com>
 <283a8957-99d6-6b17-c52d-f8b0d9a7ca83@arm.com>
 <25f52d11-9ebe-ca0d-8447-ece8f34e93c9@aggios.com>
 <e0b9d487-879e-4e5c-7db3-57a8020ccd77@arm.com>
 <alpine.DEB.2.10.1811141448310.302@sstabellini-ThinkPad-X260>
 <a7e5a838-d900-29b3-783d-94279b2f5087@arm.com>
 <alpine.DEB.2.10.1811151051480.22115@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbOG=N2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gNOt0-0005kB-0b
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 21:09:14 +0000
In-Reply-To: <alpine.DEB.2.10.1811151051480.22115@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "dm@aggios.com" <dm@aggios.com>, "saeed.nowshadi@xilinx.com" <saeed.nowshadi@xilinx.com>, "stefano.stabellini@xilinx.com" <stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xNS8xOCA2OjU3IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2Vk
LCAxNCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxNC8xMS8yMDE4IDIzOjA0
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBXZWQsIDE0IE5vdiAyMDE4LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pj4gICDCoCAtwqDCoMKgIHJldHVybiAtRU5PU1lTOwo+Pj4+
Pj4KPj4+Pj4+IFdoeSBkbyB5b3UgcmV0dXJuIC1FTk9TWVMgdW50aWwgdGhpcyBwYXRjaD8gU2hv
dWxkIG5vdCBoYXZlIGl0IGJlIDA/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUbyBkaXN0aW5ndWlzaCB0
aGF0IFhlbiBzdXNwZW5kIHdhc24ndCBzdXBwb3J0ZWQgdW50aWwgd2UgYXQgbGVhc3QgZG8KPj4+
Pj4gc29tZXRoaW5nIHVzZWZ1bCBpbiBzdXNwZW5kIHByb2NlZHVyZS4gVGhpcyBpcyBub3Qgc28g
aW1wb3J0YW50LCB3ZSBjYW4KPj4+Pj4gcmV0dXJuIDAgYnV0IG5lZWRzIHRvIGJlIGZpeGVkIGlu
IHByZXZpb3VzIHBhdGNoZXMuCj4+Pj4KPj4+PiBJZiB5b3UgcmV0dXJuIDAgYmVmb3JlIGhhbmQg
eW91IGNhbiBtb3JlIGVhc2lseSBiaXNlY3QgdGhpcyBzZXJpZXMgYW5kIGtub3cKPj4+PiB3aGVy
ZSBpdCBzdXNwZW5kL3Jlc3VtZSBicmVha3MuCj4+Pgo+Pj4gV2h5IDAgaW1wcm92ZXMgYmlzZWN0
YWJpbGl0eT8gMCBwcmV2ZW50cyBvdGhlciBjaGVja3MgZnJvbSBmaWd1cmluZyBvdXQKPj4+IHRo
YXQgdGhlcmUgd2FzIGFuIGVycm9yLgo+Pgo+PiBCdXQgdGhpcyBjb2RlIGlzIGV4YWN0bHkgcmVw
bGFjaW5nIC1FTk9TWVMgYnkgc3RhdGUgKHRoYXQgd291bGQgYmUgMCBpbgo+PiBzdWNjZXNzLiBT
byB3aGF0J3Mgd3JvbmcgdG8gcmV0dXJuIDAgcmF0aGVyIHRoYW4gLUVOT1NZUyBpbiB0aGF0IHBh
dGNoCj4+IGltcGxlbWVudCB0aGUgZHVtbXkgc3lzdGVtX3N0YXRlPwo+Pgo+Pj4gQWxzbywgdGhl
IGZlYXR1cmUgaXMgbm90IGJpc2VjdGFibGUgdW50aWwgdGhlCj4+PiBmdWxsIHNlcmllcyBpcyBh
cHBsaWVkLgo+Pgo+PiBSZWFsbHk/IEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHlvdSBjYW4g
c3RpbGwgZG8gc29tZSBzb3J0IG9mCj4+IHN1c3BlbmQvcmVzdW1lIHBhdGNoIGJ5IHBhdGNoLiBB
bHRob3VnaCwgeW91IHdvdWxkIG5vdCBkbyBhIGZ1bGwKPj4gc3VzcGVuZC9yZXN1bWUuCj4gCj4g
WW91IGFyZSBzYXlpbmcgdGhhdCB3ZSBjb3VsZCBjYWxsIHRoZSBmdW5jdGlvbiBhbmQgcmV0dXJu
IHN1Y2Nlc3NmdWxseQo+IGV2ZW4gaWYgdGhlIGZ1bmN0aW9uIGRvZXMgbm90aGluZywgc2ltcGx5
IGJ5IHJldHVybmluZyAwLiBUaGF0IHdvdWxkCj4gbWFrZSBzdXNwZW5kIGJpc2VjdGFibGUgd2l0
aGluIHRoaXMgc2VyaWVzLCBwYXRjaCBieSBwYXRjaC4KPiAKPiBJIHRoaW5rIGl0J3MgaW1wcmVz
c2l2ZSB0aGF0IE1pcmVsYSBtYW5hZ2VkIHRvIHdyaXRlIHRoZSBzZXJpZXMgdGhpcwo+IHdheSwg
YW5kIGlmIHN1c3BlbmQgaXMgYWN0dWFsbHkgYmlzZWN0YWJsZSBwYXRjaCBieSBwYXRjaCBzaW1w
bHkgYnkKPiByZXR1cm5pbmcgMCBoZXJlLCBpdCB3b3VsZCBiZSBhbWF6aW5nLCBhbmQgY2VydGFp
bmx5IHdvcnRoIGRvaW5nLgo+IEhvd2V2ZXIsIGlmIGl0IGlzIG5vdCB0aGUgY2FzZSwgSSB3b3Vs
ZG4ndCBhc2sgTWlyZWxhIHRvIG1ha2UgdGhlIGVmZm9ydAo+IHRvIG1ha2Ugc3VzcGVuZCBiaXNl
Y3RhYmxlIHBhdGNoIGJ5IHBhdGNoIGJleW9uZCByZXR1cm5pbmcgMCBoZXJlLCBpdAo+IHdvdWxk
IGJlIGdvb2QgdG8gaGF2ZSBidXQgbm90IHJlcXVpcmVkLgoKVGhpcyB3YXNuJ3QgbXkgaW50ZW50
aW9uIDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
