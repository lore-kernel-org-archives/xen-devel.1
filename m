From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Fri, 21 Sep 2018 16:16:22 +0300
Message-ID: <9019edcd-89c5-4bd7-6ba1-10fa27524fe4@bitdefender.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-4-apop@bitdefender.com>
 <24239a31-9d31-57dd-06f3-68aba641e263@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qbiu=md=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g3LIa-0000oN-8j
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 13:16:44 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 51CDD305FFB5
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 16:16:41 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 23EF17FE6B
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 16:16:41 +0300 (EEST)
In-Reply-To: <24239a31-9d31-57dd-06f3-68aba641e263@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Adrian Pop <apop@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMC8xOCAzOjUwIFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDA5LzAzLzIwMTgg
MDQ6NDggUE0sIEFkcmlhbiBQb3Agd3JvdGU6Cj4+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQb3Ag
PGFwb3BAYml0ZGVmZW5kZXIuY29tPgo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vz
cy5jCj4+IEBAIC01NTAsNiArNTUwLDUxIEBAIG91dDoKPj4gICAgICByZXR1cm4gcmM7Cj4+ICB9
Cj4+ICAKPj4gK2ludCBwMm1fZ2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90
IGdmbiwgYm9vbCAqc3VwcHJlc3NfdmUsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgYWx0cDJtX2lkeCkKPj4gK3sKPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9z
dF9wMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7Cj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmFw
Mm0gPSBOVUxMOwo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4+ICsgICAgbWZuX3Qg
bWZuOwo+PiArICAgIHAybV9hY2Nlc3NfdCBhOwo+PiArICAgIHAybV90eXBlX3QgdDsKPj4gKwo+
PiArICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnRfZXhjZXB0aW9ucyApCj4+ICsgICAgICAgIHJl
dHVybiAtRU9QTk9UU1VQUDsKPj4gKwo+PiArICAgIC8qICNWRSBzaG91bGQgYmUgZW5hYmxlZCBm
b3IgdGhpcyB2Y3B1LiAqLwo+PiArICAgIGlmICggZ2ZuX2VxKHZjcHVfYWx0cDJtKGN1cnJlbnQp
LnZlaW5mb19nZm4sIElOVkFMSURfR0ZOKSApCj4+ICsgICAgICAgIHJldHVybiAtRU5YSU87Cj4g
Cj4gQmFzaWNhbGx5IHRoZSBzYW1lIGNvbW1lbnRzIGFzIGZvciAyLzM6ICBNb3ZlIHRvIHAybS5j
LCBhbmQgZ2V0IHJpZCBvZgo+IHRoZSB2bXgtaXNtLgo+IAo+IEFub3RocmUgaWRlYSBpcyB0byBn
ZXQgcmlkIG9mIHRoZXNlIGNoZWNrcyBhbHRvZ2V0aGVyIC0tIHJldHVybmluZwo+ICdmYWxzZScg
d2hlbiB0aGUgZmVhdHVyZSBpc24ndCBzdXBwb3J0ZWQgb3IgZW5hYmxlZCBzaG91bGRuJ3QgYmUg
YSBiaWcKPiBkZWFsLiAgQnV0IEkgZG9uJ3QgZmVlbCBzdHJvbmdseSBlbm91Z2ggYWJvdXQgaXQg
dG8gYXJndWUgZWl0aGVyIHdheS4KCkkndmUgbW92ZWQgdGhlIGZ1bmN0aW9ucyB0byBwMm0uYyBh
bmQgc3RhcnRlZCBtb3ZpbmcgdGhlIGNoZWNrcyB3aGVuIGl0Cm9jY3VyZWQgdG8gbWUgdGhhdCBp
dCBtaWdodCBiZSBjaGEgdG8gbW92ZSB0aGVtIHRvIGVwdF9nZXRfZW50cnkoKSAvCmVwdF9zZXRf
ZW50cnkoKSBpbiBwMm0tZXB0LmMuCgplcHRfZ2V0X2VudHJ5KCkgdXNlcyBhIGJvb2xfdCAqc3Zl
IHBvaW50ZXIsIHNvIEkgY291bGQgY2hlY2sgaWYgdGhlCnBvaW50ZXIgaXMgbm90IE5VTEwsIGFu
ZCBpZiBpdCdzIG5vdCBwZXJmb3JtIHRoZSBjaGVja3MgdGhlbiwgYW5kIHNvCnJlcXVpcmUgdGhl
IGNhbGxlciB0byBhbHdheXMgcGFzcyBhIE5VTEwgcG9pbnRlciBpbiBub24tI1ZFIGNhc2VzLgpT
dGlsbCwgZXB0X2dldF9lbnRyeSgpIHJldHVybnMgYSBtZm5fdCwgc28gYWxsIGNhbiBkbyB0aGVy
ZSBpcyByZXR1cm4KSU5WQUxJRF9NRk4sIHdoaWNoIGlzIG5vdCB2ZXJ5IGhlbHBmdWwuCgplcHRf
c2V0X2VudHJ5KCkgaXMgbW9yZSBjb21wbGljYXRlZDogaXQgdGFrZXMgImludCBzdmUiIGFzIGEg
cGFyYW1ldGVyCih3aGljaCBtYWtlcyBzZW5zZSBiZWNhdXNlIGl0IGNhbiBhbHNvIGJlIC0xKSAt
IGJ1dCB0aGVuIHJlYWxseSB0aGVyZSdzCm5vIHNwZWNpYWwgdmFsdWUgd2hpY2ggc2hvdWxkIHRy
aWdnZXIgYSBjaGVjay4gQW55IHZhbHVlIGNvdWxkIGJlIGEKbGVnaXRpbWF0ZSBhdHRlbXB0IHRv
IHNldCB0aGF0IGJpdCAtIGFsdGhvdWdoIDAgKGNsZWFyaW5nIGl0KSBtaWdodCBiZQp2aWV3ZWQg
YXMgYSBzcGVjaWFsIGNhc2UsIGxpa2UgaXQgaXMgaW4gdGhlIE5QVCBjb2RlLgoKSSBjb3VsZCBp
bmRlZWQgcmVtb3ZlIGFsbCB0aGUgY2hlY2tzIGFuZCBhbGxvdyBzZXR0aW5nIGFuZCBnZXR0aW5n
IHRoYXQKYml0IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciAjVkUgaXMgZW5hYmxlZCBhbmQgLyBvciBh
dmFpbGFibGUgLSBpZiB0aGF0J3MKYWNjZXB0YWJsZSAodGhvdWdoIEkgYmVsaWV2ZSBzb21lb25l
IGhhcyByZXF1aXJlZCB0aGUgY2hlY2tzIGF0IHNvbWUKcG9pbnQgaW4gQWRyaWFuJ3Mgd29yayB3
aXRoIHRoZSBwYXRjaGVzKS4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
