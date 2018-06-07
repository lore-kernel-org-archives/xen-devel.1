From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 3/9] xen/balloon: Share common memory
 reservation routines
Date: Thu, 7 Jun 2018 08:32:13 +0300
Message-ID: <9298e775-e5b2-b3b3-dfca-6d1ec66efbfc__21050.1777510673$1528349461$gmane$org@gmail.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-4-andr2000@gmail.com>
 <4fd46fd8-f936-1514-06e4-34c5d3ed8960@oracle.com>
 <05e361c2-c7f3-2f57-908c-e2c9b98b18e7@gmail.com>
 <6cba4317-b517-3e12-ba1b-3ccbe414ada0@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1i32=iz=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fQnX1-0000Vd-VE
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 05:32:20 +0000
Received: by mail-lf0-x243.google.com with SMTP id o9-v6so12643361lfk.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jun 2018 22:32:16 -0700 (PDT)
In-Reply-To: <6cba4317-b517-3e12-ba1b-3ccbe414ada0@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDcvMjAxOCAxMjowOSBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA2LzA2
LzIwMTggMDM6MjQgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwNi8w
NC8yMDE4IDA3OjM3IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwNi8wMS8yMDE4
IDA3OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS94ZW4vbWVtLXJlc2VydmF0aW9uLmgKPj4+PiBiL2luY2x1ZGUveGVuL21lbS1y
ZXNlcnZhdGlvbi5oCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLmE3MjdkNjVhMWU2MQo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9pbmNsdWRl
L3hlbi9tZW0tcmVzZXJ2YXRpb24uaAo+Pj4+IEBAIC0wLDAgKzEsNjUgQEAKPj4+PiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4+PiArCj4+Pj4gKy8qCj4+Pj4gKyAq
IFhlbiBtZW1vcnkgcmVzZXJ2YXRpb24gdXRpbGl0aWVzLgo+Pj4+ICsgKgo+Pj4+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMDMsIEIgRHJhZ292aWMKPj4+PiArICogQ29weXJpZ2h0IChjKSAyMDAzLTIw
MDQsIE0gV2lsbGlhbXNvbiwgSyBGcmFzZXIKPj4+PiArICogQ29weXJpZ2h0IChjKSAyMDA1IERh
biBNLiBTbWl0aCwgSUJNIENvcnBvcmF0aW9uCj4+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAxMCBE
YW5pZWwgS2lwZXIKPj4+PiArICogQ29weXJpZ2h0IChjKSAyMDE4IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvLCBFUEFNIFN5c3RlbXMgSW5jLgo+Pj4+ICsgKi8KPj4+PiArCj4+Pj4gKyNpZm5kZWYg
X1hFTk1FTV9SRVNFUlZBVElPTl9ICj4+Pj4gKyNkZWZpbmUgX1hFTk1FTV9SRVNFUlZBVElPTl9I
Cj4+Pj4gKwo+Pj4+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+Pj4gKyNpbmNsdWRlIDxs
aW51eC9zbGFiLmg+Cj4+Pj4gKwo+Pj4+ICsjaW5jbHVkZSA8YXNtL3hlbi9oeXBlcmNhbGwuaD4K
Pj4+PiArI2luY2x1ZGUgPGFzbS90bGIuaD4KPj4+PiArCj4+Pj4gKyNpbmNsdWRlIDx4ZW4vaW50
ZXJmYWNlL21lbW9yeS5oPgo+Pj4+ICsjaW5jbHVkZSA8eGVuL3BhZ2UuaD4KPj4+PiArCj4+Pj4g
KyNpZmRlZiBDT05GSUdfWEVOX1NDUlVCX1BBR0VTCj4+Pj4gK3ZvaWQgeGVubWVtX3Jlc2VydmF0
aW9uX3NjcnViX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+Pj4+ICsjZWxzZQo+Pj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgeGVubWVtX3Jlc2VydmF0aW9uX3NjcnViX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpCj4+Pj4gK3sKPj4+PiArfQo+Pj4+ICsjZW5kaWYKPj4+IEdpdmVuIHRoYXQgdGhpcyBp
cyBhIHdyYXBwZXIgYXJvdW5kIGEgc2luZ2xlIGNhbGwgSSdkIHByZWZlcgo+Pj4KPj4+IGlubGlu
ZSB2b2lkIHhlbm1lbV9yZXNlcnZhdGlvbl9zY3J1Yl9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+
Pj4gewo+Pj4gI2lmZGVmIENPTkZJR19YRU5fU0NSVUJfUEFHRVMKPj4+ICDCoMKgwqDCoCBjbGVh
cl9oaWdocGFnZShwYWdlKTsKPj4+ICNlbmRpZgo+Pj4gfQo+PiBVbmZvcnR1bmF0ZWx5IHRoaXMg
Y2FuJ3QgYmUgZG9uZSBiZWNhdXNlIG9mCj4+IEVYUE9SVF9TWU1CT0xfR1BMKHhlbm1lbV9yZXNl
cnZhdGlvbl9zY3J1Yl9wYWdlKTsKPj4gd2hpY2ggaXMgb2J2aW91c2x5IGNhbm5vdCBiZSB1c2Vk
IGZvciBzdGF0aWMgaW5saW5lIGZ1bmN0aW9ucy4KPgo+Cj4gV2h5IGRvIHlvdSBuZWVkIHRvIGV4
cG9ydCBpdD8gSXQncyBhbiBpbmxpbmUgZGVmaW5lZCBpbiB0aGUgaGVhZGVyIGZpbGUuCj4gSnVz
dCBsaWtlIGNsZWFyX2hpZ2hwYWdlKCkuCllvdSBhcmUgcGVyZmVjdGx5IHJpZ2h0LCB3aWxsIGNo
YW5nZSBhcyB5b3Ugc3VnZ2VzdAo+Cj4gLWJvcmlzClRoYW5rIHlvdSwKT2xla3NhbmRyCj4+IFNv
LCBJJ2xsIGtlZXAgaXQgYXMgaXMuCj4+Pgo+Pj4gLWJvcmlzCj4+Pgo+Pj4KPj4gVGhhbmsgeW91
LAo+PiBPbGVrc2FuZHIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
