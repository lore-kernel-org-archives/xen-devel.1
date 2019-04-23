From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
Date: Tue, 23 Apr 2019 17:00:51 +0100
Message-ID: <c55d9f40-ae67-301b-bc80-8d73bbf053ba@citrix.com>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
 <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
 <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIxrw-0000pM-JY
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 16:02:04 +0000
In-Reply-To: <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMjAxOSAxMjo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA0LzIzLzE5IDEx
OjM3IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyMi8wNC8yMDE5IDEzOjM5LCBEb25n
bGkgWmhhbmcgd3JvdGU6Cj4+PiBQcmludCBsb2cgYXQgbGV2ZWwgWEVOTE9HX0VSUiAoaW5zdGVh
ZCBYRU5MT0dfSU5GTykgYXMgZG9tYWluX2NyYXNoKCkKPj4+IGluZGljYXRlcyB0aGVyZSBpcyBm
YXRhbCBlcnJvci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmdsaS56
aGFuZ0BvcmFjbGUuY29tPgo+Pj4gLS0tCj4+PiAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwg
MiArLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMKPj4+IGluZGV4IDgwNzI4ZWEuLjcyNWM2MTggMTAwNjQ0Cj4+PiAtLS0g
YS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYwo+Pj4gQEAgLTEyODIsNyArMTI4Miw3IEBAIHVubWFwX2NvbW1vbigKPj4+ICAgICAgaWYg
KCB1bmxpa2VseSgocmQgPSByY3VfbG9ja19kb21haW5fYnlfaWQoZG9tKSkgPT0gTlVMTCkgKQo+
Pj4gICAgICB7Cj4+PiAgICAgICAgICAvKiBUaGlzIGNhbiBoYXBwZW4gd2hlbiBhIGdyYW50IGlz
IGltcGxpY2l0bHkgdW5tYXBwZWQuICovCj4+PiAtICAgICAgICBnZHByaW50ayhYRU5MT0dfSU5G
TywgIkNvdWxkIG5vdCBmaW5kIGRvbWFpbiAlZFxuIiwgZG9tKTsKPj4+ICsgICAgICAgIGdkcHJp
bnRrKFhFTkxPR19FUlIsICJDb3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIsIGRvbSk7Cj4+IFdo
aWxlIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlIGluIHByaW5jaXBsZSwgd2hhdCBkb2VzIHRoaXMg
YWN0dWFsbHkgZG8/wqAKPj4gVGhlIGVudGlyZSBwcmludGsoKSBpcyBjb21waWxlZCBvdXQgaW4g
cmVsZWFzZSBidWlsZHMsIGFuZCBkZWJ1ZyBidWlsZHMKPj4gbG9nIGFsbCBtZXNzYWdlcy4KPiAu
Li5ieSBkZWZhdWx0OyBidXQgcHJlc3VtYWJseSB5b3UgY2FuIHR1cm4gdGhhdCBkb3duLCByaWdo
dD8KClllcyB5b3UgY2FuLCBidXQgYSkgbm9vbmUgZG9lcywgYmVjYXVzZSB0aGVzZSBhcmUgZGVi
dWcgYnVpbGRzIGFuZCBiKQp0aGF0IGlzbid0IHRoZSBwb2ludC7CoCBJZiB3ZSBjYXJlIGFib3V0
IHRoaXMgbWVzc2FnZSBiZWluZyBwcmludGVkLCBpdAptdXN0buKAmXQgYmUgYSBnZHByaW50aygp
LgoKSXQgZWl0aGVyIHdhbnRzIHRvIHR1cm4gaW50byBhIGdwcmludGsoKSBhdCBYRU5MT0dfSU5G
Tywgb3Igd2FudHMKZGVsZXRpbmcgZW50aXJlbHksIGJ1dCBzaW1wbHkgc2h1ZmZsaW5nIHRoZSBl
eGFjdCBsZXZlbCBmb3IgYSBnZHByaW50aygpCmlzIHRhbnRhbW91bnQgdG8gdXNlbGVzcy4KCj4K
PiBUaGlzIGFsc28gY2hhbmdlcyB0aGUgcHJlZml4IGluIHRoZSBsb2cgb3V0cHV0LCByaWdodD8g
IFRoYXQgd291bGQgbWFrZQo+IGl0IGVhc2llciB0byBpZGVudGlmeSB3aGljaCBtZXNzYWdlIGlz
IGltcG9ydGFudCBmb3IgdW5kZXJ0YW5kaW5nIHdoeQo+IHlvdXIgZG9tYWluIGp1c3QgY3Jhc2hl
ZC4KClRoZSBwcmVmaXggaXMgY29tcGxldGVseSBpbnRlcm5hbCB0byBYZW4uwqAgQnkgdGhlIHRp
bWUgaXQgZW5kcyB1cCBpbiB0aGUKY29uc29sZSByaW5nLCB0aGUgZGF0YSBpcyBsb3N0LgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
