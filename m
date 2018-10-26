From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V2 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Fri, 26 Oct 2018 08:54:15 -0600
Message-ID: <5BD32A9702000078001F5439@prv1-mh.provo.novell.com>
References: <1540300744-7406-1-git-send-email-rcojocaru@bitdefender.com>
 <1540300744-7406-3-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gG3VE-0005MH-MZ
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 14:54:20 +0000
In-Reply-To: <1540300744-7406-3-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjEwLjE4IGF0IDE1OjE5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0tZXB0LmMKPiBAQCAtMTM0OCw2ICsxMzQ4LDggQEAgaW50IGVwdF9wMm1faW5pdChz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+ICB2b2lkIGVwdF9wMm1fdW5pbml0KHN0cnVjdCBwMm1f
ZG9tYWluICpwMm0pCj4gIHsKPiAgICAgIHN0cnVjdCBlcHRfZGF0YSAqZXB0ID0gJnAybS0+ZXB0
Owo+ICsKPiArICAgIHAybV9mcmVlX2xvZ2RpcnR5KHAybSk7CgpUaGlzIGFuZCAuLi4KCj4gICAg
ICBmcmVlX2NwdW1hc2tfdmFyKGVwdC0+aW52YWxpZGF0ZSk7Cj4gIH0KPiAgCj4gQEAgLTE0MzQs
MTEgKzE0MzYsMjAgQEAgdm9pZCBzZXR1cF9lcHRfZHVtcCh2b2lkKQo+ICAgICAgcmVnaXN0ZXJf
a2V5aGFuZGxlcignRCcsIGVwdF9kdW1wX3AybV90YWJsZSwgImR1bXAgVlQteCBFUFQgdGFibGVz
IiwgMCk7Cj4gIH0KPiAgCj4gLXZvaWQgcDJtX2luaXRfYWx0cDJtX2VwdChzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBpbnQgaSkKPiAraW50IHAybV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IGkpCj4gIHsKPiAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpw
Mm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baV07Cj4gICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9z
dHAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPiAgICAgIHN0cnVjdCBlcHRfZGF0YSAqZXB0Owo+
ICsgICAgaW50IHJjID0gcDJtX2luaXRfbG9nZGlydHkocDJtKTsKPiArCj4gKyAgICBpZiAoIHJj
ICkKPiArICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgcmMgPSByYW5nZXNldF9tZXJnZShw
Mm0tPmxvZ2RpcnR5X3JhbmdlcywgaG9zdHAybS0+bG9nZGlydHlfcmFuZ2VzKTsKPiArCj4gKyAg
ICBpZiAoIHJjICkKPiArICAgICAgICByZXR1cm4gcmM7CgouLi4gYWxsIG9mIHRoaXMgbG9naWNh
bGx5IGJlbG9uZyBpbnRvIHAybS5jLCBhcyBpdCdzIG5vdCBjb2RlIHdoaWNoIGlzCkVQVC1zcGVj
aWZpYy4gVGhpcyB3b3VsZCBhbHNvIGVsaW1pbmF0ZSB0aGUgbmVlZCB0byBtYWtlIHRoZSB0d28K
ZnVuY3Rpb25zIG5vbi1zdGF0aWMuCgpBbHNvIEkgdGhpbmsgdGhlIHJhbmdlc2V0X21lcmdlKCkg
aW52b2NhdGlvbiB3b3VsZCBkZXNlcnZlIGEKYnJpZWYgY29tbWVudCBub3RpbmcgdGhhdCB0aGlz
ICJtZXJnZSIgaXMgcmVhbGx5IGp1c3QgYSAiY29weSIuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
