From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Fri, 26 Oct 2018 18:02:29 +0300
Message-ID: <3d9ac849-7e32-cff8-d022-0f87b9899e1f@bitdefender.com>
References: <1540300744-7406-1-git-send-email-rcojocaru@bitdefender.com>
 <1540300744-7406-3-git-send-email-rcojocaru@bitdefender.com>
 <5BD32A9702000078001F5439@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h5dl=ng=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gG3dF-0006Rc-9Y
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:02:37 +0000
In-Reply-To: <5BD32A9702000078001F5439@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjYvMTggNTo1NCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMTAuMTgg
YXQgMTU6MTksIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L21tL3AybS1lcHQuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5j
Cj4+IEBAIC0xMzQ4LDYgKzEzNDgsOCBAQCBpbnQgZXB0X3AybV9pbml0KHN0cnVjdCBwMm1fZG9t
YWluICpwMm0pCj4+ICB2b2lkIGVwdF9wMm1fdW5pbml0KHN0cnVjdCBwMm1fZG9tYWluICpwMm0p
Cj4+ICB7Cj4+ICAgICAgc3RydWN0IGVwdF9kYXRhICplcHQgPSAmcDJtLT5lcHQ7Cj4+ICsKPj4g
KyAgICBwMm1fZnJlZV9sb2dkaXJ0eShwMm0pOwo+IAo+IFRoaXMgYW5kIC4uLgo+IAo+PiAgICAg
IGZyZWVfY3B1bWFza192YXIoZXB0LT5pbnZhbGlkYXRlKTsKPj4gIH0KPj4gIAo+PiBAQCAtMTQz
NCwxMSArMTQzNiwyMCBAQCB2b2lkIHNldHVwX2VwdF9kdW1wKHZvaWQpCj4+ICAgICAgcmVnaXN0
ZXJfa2V5aGFuZGxlcignRCcsIGVwdF9kdW1wX3AybV90YWJsZSwgImR1bXAgVlQteCBFUFQgdGFi
bGVzIiwgMCk7Cj4+ICB9Cj4+ICAKPj4gLXZvaWQgcDJtX2luaXRfYWx0cDJtX2VwdChzdHJ1Y3Qg
ZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaSkKPj4gK2ludCBwMm1faW5pdF9hbHRwMm1fZXB0KHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpKQo+PiAgewo+PiAgICAgIHN0cnVjdCBwMm1f
ZG9tYWluICpwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baV07Cj4+ICAgICAgc3RydWN0IHAybV9k
b21haW4gKmhvc3RwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7Cj4+ICAgICAgc3RydWN0IGVwdF9k
YXRhICplcHQ7Cj4+ICsgICAgaW50IHJjID0gcDJtX2luaXRfbG9nZGlydHkocDJtKTsKPj4gKwo+
PiArICAgIGlmICggcmMgKQo+PiArICAgICAgICByZXR1cm4gcmM7Cj4+ICsKPj4gKyAgICByYyA9
IHJhbmdlc2V0X21lcmdlKHAybS0+bG9nZGlydHlfcmFuZ2VzLCBob3N0cDJtLT5sb2dkaXJ0eV9y
YW5nZXMpOwo+PiArCj4+ICsgICAgaWYgKCByYyApCj4+ICsgICAgICAgIHJldHVybiByYzsKPiAK
PiAuLi4gYWxsIG9mIHRoaXMgbG9naWNhbGx5IGJlbG9uZyBpbnRvIHAybS5jLCBhcyBpdCdzIG5v
dCBjb2RlIHdoaWNoIGlzCj4gRVBULXNwZWNpZmljLiBUaGlzIHdvdWxkIGFsc28gZWxpbWluYXRl
IHRoZSBuZWVkIHRvIG1ha2UgdGhlIHR3bwo+IGZ1bmN0aW9ucyBub24tc3RhdGljLgo+IAo+IEFs
c28gSSB0aGluayB0aGUgcmFuZ2VzZXRfbWVyZ2UoKSBpbnZvY2F0aW9uIHdvdWxkIGRlc2VydmUg
YQo+IGJyaWVmIGNvbW1lbnQgbm90aW5nIHRoYXQgdGhpcyAibWVyZ2UiIGlzIHJlYWxseSBqdXN0
IGEgImNvcHkiLgoKSSdsbCBtb3ZlIHRoZW0gdG8gcDJtLmMuCgoKVGhhbmtzLApSYXp2YW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
