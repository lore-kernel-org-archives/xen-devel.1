From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v4] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Tue, 25 Sep 2018 18:03:38 +0300
Message-ID: <e96fa011-6355-4b23-0190-556a9c2ce48f@bitdefender.com>
References: <20180903154734.25361-1-apop@bitdefender.com>
 <CABfawh=MDOR=gDD7L5fb98p3iPEWdp63NgJEQaZMVFPczB-PBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tuow=mh=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g4osZ-0000KL-0r
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 15:03:59 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 00CDB301AB26
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 18:03:57 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id DEBDE7FBF6
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 18:03:56 +0300 (EEST)
In-Reply-To: <CABfawh=MDOR=gDD7L5fb98p3iPEWdp63NgJEQaZMVFPczB-PBg@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8xOS8xOCA2OjI5IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gTW9uLCBTZXAg
MywgMjAxOCBhdCA5OjQ3IEFNIEFkcmlhbiBQb3AgPGFwb3BAYml0ZGVmZW5kZXIuY29tPiB3cm90
ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4+IGluZGV4IGJiYmE5OWU1ZjUuLmJiYjBhYTk4
NGEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgKPj4gKysr
IGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+PiBAQCAtMjM0LDYgKzIzNCw3IEBA
IHN0cnVjdCB4ZW5faHZtX2FsdHAybV92aWV3IHsKPj4gIHR5cGVkZWYgc3RydWN0IHhlbl9odm1f
YWx0cDJtX3ZpZXcgeGVuX2h2bV9hbHRwMm1fdmlld190Owo+PiAgREVGSU5FX1hFTl9HVUVTVF9I
QU5ETEUoeGVuX2h2bV9hbHRwMm1fdmlld190KTsKPj4KPj4gKyNpZiBfX1hFTl9JTlRFUkZBQ0Vf
VkVSU0lPTl9fIDwgMHgwMDA0MGEwMAo+PiAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF9tZW1f
YWNjZXNzIHsKPj4gICAgICAvKiB2aWV3ICovCj4+ICAgICAgdWludDE2X3QgdmlldzsKPj4gQEAg
LTI0NSw2ICsyNDYsMTkgQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzIHsK
Pj4gIH07Cj4+ICB0eXBlZGVmIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2VzcyB4
ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vzc190Owo+PiAgREVGSU5FX1hFTl9HVUVTVF9IQU5E
TEUoeGVuX2h2bV9hbHRwMm1fc2V0X21lbV9hY2Nlc3NfdCk7Cj4+ICsjZW5kaWYgLyogX19YRU5f
SU5URVJGQUNFX1ZFUlNJT05fXyA8IDB4MDAwNDBhMDAgKi8KPj4gKwo+PiArc3RydWN0IHhlbl9o
dm1fYWx0cDJtX21lbV9hY2Nlc3Mgewo+PiArICAgIC8qIHZpZXcgKi8KPj4gKyAgICB1aW50MTZf
dCB2aWV3Owo+PiArICAgIC8qIE1lbW9yeSB0eXBlICovCj4+ICsgICAgdWludDE2X3QgaHZtbWVt
X2FjY2VzczsgLyogeGVubWVtX2FjY2Vzc190ICovCj4gCj4gQSBzdHJ1Y3R1cmUgbmFtZSB3aXRo
ICJtZW1fYWNjZXNzIiBoYXZpbmcgYSB2YXJpYWJsZSBuYW1lCj4gImh2bW1lbV9hY2Nlc3MiIGFu
ZCBhIGNvbW1lbnQgc2F5aW5nICJ4ZW5tZW1fYWNjZXNzIi4gVGhpcyBpcwo+IGNvbmZ1c2luZy4g
SSB1bmRlcnN0YW5kIHRoYXQgeW91IGNvcHkvcGFzdGVkIHRoaXMgZnJvbSB0aGUgZXhpc3Rpbmcg
b3AKPiBidXQgaXQgZG9lc24ndCBsb29rIGdvb2QuIFBlcmhhcHMgZml4IGJvdGggaWYgd2UgYXJl
IHRvdWNoaW5nIGl0Pwo+IEFsc28sIGluIHB1YmxpYy9tZW1vcnkuaCB0aGUgd2lkdGggb2YgYWNj
ZXNzIGlzIHVpbnQ4X3Qgc28gSSdtIG5vdAo+IHN1cmUgd2h5IHRoZSBkaXNjcmVwYW5jeS4KClRo
ZSB1aW50MTZfdCBoYXMgYmVlbiBwcm9iYWJseSBjaG9zZW4gdG8gYmUgdGhhdCBiZWNhdXNlIGl0
IHNpbXBsaWZpZXMKcGFkZGluZy4gSSBjYW4gcmVuYW1lICJodm1tZW1fYWNjZXNzIiB0byBzaW1w
bHkgImFjY2VzcyIuIFNob3VsZCBJIGp1c3QKcmVtb3ZlIHRoZSBjb21tZW50LCBvciBkbyB5b3Ug
dGhpbmsgc29tZXRoaW5nIGVsc2UgaXMgbW9yZSBhcHByb3ByaWF0ZT8KCgpUaGFua3MsClJhenZh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
