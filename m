From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
Date: Thu, 25 Apr 2019 07:10:46 -0600
Message-ID: <5CC1B1D60200007800229124@prv1-mh.provo.novell.com>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
 <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
 <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
 <c55d9f40-ae67-301b-bc80-8d73bbf053ba@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJe9O-0005Tf-M8
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:10:54 +0000
In-Reply-To: <c55d9f40-ae67-301b-bc80-8d73bbf053ba@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Dongli Zhang <dongli.zhang@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA0LjE5IGF0IDE4OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDQvMjAxOSAxMjo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gNC8y
My8xOSAxMTozNyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDIyLzA0LzIwMTkgMTM6
MzksIERvbmdsaSBaaGFuZyB3cm90ZToKPj4+PiBQcmludCBsb2cgYXQgbGV2ZWwgWEVOTE9HX0VS
UiAoaW5zdGVhZCBYRU5MT0dfSU5GTykgYXMgZG9tYWluX2NyYXNoKCkKPj4+PiBpbmRpY2F0ZXMg
dGhlcmUgaXMgZmF0YWwgZXJyb3IuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhh
bmcgPGRvbmdsaS56aGFuZ0BvcmFjbGUuY29tPgo+Pj4+IC0tLQo+Pj4+ICB4ZW4vY29tbW9uL2dy
YW50X3RhYmxlLmMgfCAyICstCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4+IGluZGV4IDgwNzI4ZWEuLjcyNWM2
MTggMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4gKysrIGIv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4gQEAgLTEyODIsNyArMTI4Miw3IEBAIHVubWFw
X2NvbW1vbigKPj4+PiAgICAgIGlmICggdW5saWtlbHkoKHJkID0gcmN1X2xvY2tfZG9tYWluX2J5
X2lkKGRvbSkpID09IE5VTEwpICkKPj4+PiAgICAgIHsKPj4+PiAgICAgICAgICAvKiBUaGlzIGNh
biBoYXBwZW4gd2hlbiBhIGdyYW50IGlzIGltcGxpY2l0bHkgdW5tYXBwZWQuICovCj4+Pj4gLSAg
ICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJDb3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIs
IGRvbSk7Cj4+Pj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkNvdWxkIG5vdCBmaW5k
IGRvbWFpbiAlZFxuIiwgZG9tKTsKPj4+IFdoaWxlIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlIGlu
IHByaW5jaXBsZSwgd2hhdCBkb2VzIHRoaXMgYWN0dWFsbHkgZG8/IAo+Pj4gVGhlIGVudGlyZSBw
cmludGsoKSBpcyBjb21waWxlZCBvdXQgaW4gcmVsZWFzZSBidWlsZHMsIGFuZCBkZWJ1ZyBidWls
ZHMKPj4+IGxvZyBhbGwgbWVzc2FnZXMuCj4+IC4uLmJ5IGRlZmF1bHQ7IGJ1dCBwcmVzdW1hYmx5
IHlvdSBjYW4gdHVybiB0aGF0IGRvd24sIHJpZ2h0Pwo+IAo+IFllcyB5b3UgY2FuLCBidXQgYSkg
bm9vbmUgZG9lcywgYmVjYXVzZSB0aGVzZSBhcmUgZGVidWcgYnVpbGRzIGFuZCBiKQo+IHRoYXQg
aXNuJ3QgdGhlIHBvaW50LiAgSWYgd2UgY2FyZSBhYm91dCB0aGlzIG1lc3NhZ2UgYmVpbmcgcHJp
bnRlZCwgaXQKPiBtdXN0buKAmXQgYmUgYSBnZHByaW50aygpLgo+IAo+IEl0IGVpdGhlciB3YW50
cyB0byB0dXJuIGludG8gYSBncHJpbnRrKCkgYXQgWEVOTE9HX0lORk8sIG9yIHdhbnRzCj4gZGVs
ZXRpbmcgZW50aXJlbHksIGJ1dCBzaW1wbHkgc2h1ZmZsaW5nIHRoZSBleGFjdCBsZXZlbCBmb3Ig
YSBnZHByaW50aygpCj4gaXMgdGFudGFtb3VudCB0byB1c2VsZXNzLgoKRldJVyBJIGFncmVlLCBh
bmQgSSB0aGluayB0aGVyZSBhcmUgcXVpdGUgYSBmZXcgbW9yZSBjYW5kaWRhdGVzIG9mCmRlYnVn
IG1lc3NhZ2VzIHRoYXQgd291bGQgYmV0dGVyIGdvIGF3YXksIGFuZCBzaG91bGQgcHJvYmFibHkK
aGF2ZSBiZWVuIHN0cmlwcGVkIG9mZiBiZWZvcmUgdGhlIG9yaWdpbmFsIGNvbW1pdCBpbnRyb2R1
Y2luZyB0aGVtLgoKVGhlIG9uZSByZWFzb24gbm90IHRvIGRyb3AgdGhlIG1lc3NhZ2UgaGVyZSwg
YnV0IHRvIHN3aXRjaCB0bwpncHJpbnRrKCksIGlzIHRoZSBhZGphY2VudCBkb21haW5fY3Jhc2go
KS4gVGhpcywgaG93ZXZlciwgdGhlbiBpcwphIHJlYXNvbiB0byBnaXZlIGl0IGEgbG9nIGxldmVs
IGFib3ZlIElORk8uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
