From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Wed, 13 Mar 2019 17:24:38 +0000
Message-ID: <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
 <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h47cR-0008Hy-Hv
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 17:24:43 +0000
In-Reply-To: <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMy8wMy8yMDE5IDE1OjA0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOC4w
Mi4xOSBhdCAxMjozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L21tLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPj4gQEAgLTQzMDAsNyAr
NDMwMCw4IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKAo+PiAgIHsKPj4gICAgICAg
c3RydWN0IHBhZ2VfaW5mbyAqcGFnZSA9IE5VTEw7Cj4+ICAgICAgIHVuc2lnbmVkIGxvbmcgZ2Zu
ID0gMDsgLyogZ2NjIC4uLiAqLwo+PiAtICAgIHVuc2lnbmVkIGxvbmcgcHJldl9tZm4sIG9sZF9n
cGZuOwo+PiArICAgIG1mbl90IHByZXZfbWZuOwo+PiArICAgIHVuc2lnbmVkIGxvbmcgb2xkX2dw
Zm47Cj4gCj4gUGxlYXNlIGNhbiB5b3UgcHV0IHRoaXMgdG9nZXRoZXIgd2l0aCAiZ2ZuIj8KClN1
cmUuCgo+IAo+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiArKysgYi94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYwo+PiBAQCAtMjEyMSw5ICsyMTIxLDkgQEAgdm9pZCBpbml0X3hlbmhl
YXBfcGFnZXMocGFkZHJfdCBwcywgcGFkZHJfdCBwZSkKPj4gICAgICAgICogWXVrISBFbnN1cmUg
dGhlcmUgaXMgYSBvbmUtcGFnZSBidWZmZXIgYmV0d2VlbiBYZW4gYW5kIERvbSB6b25lcywgdG8K
Pj4gICAgICAgICogcHJldmVudCBtZXJnaW5nIG9mIHBvd2VyLW9mLXR3byBibG9ja3MgYWNyb3Nz
IHRoZSB6b25lIGJvdW5kYXJ5Lgo+PiAgICAgICAgKi8KPj4gLSAgICBpZiAoIHBzICYmICFpc194
ZW5faGVhcF9tZm4ocGFkZHJfdG9fcGZuKHBzKS0xKSApCj4+ICsgICAgaWYgKCBwcyAmJiAhaXNf
eGVuX2hlYXBfbWZuKF9tZm4ocGFkZHJfdG9fcGZuKHBzKS0xKSkgKQo+IAo+IFBsZWFzZSBhZGQg
dGhlIG1pc3NpbmcgYmxhbmtzIGFyb3VuZCAtIGF0IHRoZSBzYW1lIHRpbWUuCgpPay4KCj4gCj4+
ICAgICAgICAgICBwcyArPSBQQUdFX1NJWkU7Cj4+IC0gICAgaWYgKCAhaXNfeGVuX2hlYXBfbWZu
KHBhZGRyX3RvX3BmbihwZSkpICkKPj4gKyAgICBpZiAoICFpc194ZW5faGVhcF9tZm4obWFkZHJf
dG9fbWZuKHBlKSkgKQo+IAo+IFdoeSBtYWRkcl90b19tZm4oKSBoZXJlIGJ1dCBzdGlsbCBwYWRk
cl90b19wZm4oKSBhYm92ZT8gT2gsCj4gd2UgZG9uJ3QgaGF2ZSBhbnkgbWZuX3N1YigpLCBJIHNl
ZS4KClllcyB3ZSBkb24ndCBoYXZlIG1mbl9zdWIoKSAob3IgZXZlbiBnZm5fc3ViKCkpLiBJIG9u
bHkgZm91bmQgYSBjb3VwbGUgb2YgcGxhY2VzIAp3aGVyZSBzdWNoIGhlbHBlcnMgbWlnaHQgYmUg
dXNlZnVsLiBJIGNhbiBpbnRyb2R1Y2UgdGhlIDIgaGVscGVycyBpZiB5b3UgdGhpbmsgCml0IGlz
IHdvcnRoIGl0LgoKPiAKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+PiBAQCAtMjc4LDcgKzI3OCw3IEBAIHN0cnVjdCBw
YWdlX2luZm8KPj4gICAKPj4gICAjZGVmaW5lIGlzX3hlbl9oZWFwX3BhZ2UocGFnZSkgKChwYWdl
KS0+Y291bnRfaW5mbyAmIFBHQ194ZW5faGVhcCkKPj4gICAjZGVmaW5lIGlzX3hlbl9oZWFwX21m
bihtZm4pIFwKPj4gLSAgICAoX19tZm5fdmFsaWQobWZuKSAmJiBpc194ZW5faGVhcF9wYWdlKG1m
bl90b19wYWdlKF9tZm4obWZuKSkpKQo+PiArICAgIChfX21mbl92YWxpZChtZm5feChtZm4pKSAm
JiBpc194ZW5faGVhcF9wYWdlKG1mbl90b19wYWdlKG1mbikpKQo+IAo+IFBsZWFzZSBkb24ndCBv
cGVuIGNvZGUgbWZuX3ZhbGlkKCkuCgpUaGF0J3MgYSBtaXN0YWtlLiBTb21lb25lIEkgdGhvdWdo
dCB0aGVyZSB3ZXJlIHBsYWNlIGluIHRoZSBjb2RlIHRoYXQgd2FzIApvdmVycmlkaW5nIG1mbl92
YWxpZCgpLgoKSSB3aWxsIHVwZGF0ZSBpdC4KCj4gCj4gV2l0aCB0aGVzZSBtaW5vciBpc3N1ZXMg
dGFrZW4gY2FyZSBvZgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpUaGFuayB5b3UhCgo+IAo+IEphbgo+IAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
