From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 2/2] vmx/hap: optimize CR4 trapping
Date: Fri, 16 Feb 2018 14:30:55 +0200
Message-ID: <338ca9c5-d5f5-c0e9-4e35-154c9919ae75@bitdefender.com>
References: <20180216121029.6872-1-roger.pau@citrix.com>
 <20180216121029.6872-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wjjn=fk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1emfAK-0005d9-0g
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 12:31:00 +0000
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 6BA4D7FC09
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2018 14:30:56 +0200 (EET)
In-Reply-To: <20180216121029.6872-3-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTYvMjAxOCAwMjoxMCBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW9uaXRvci5jIGIveGVuL2FyY2gveDg2L21vbml0b3IuYwo+IGlu
ZGV4IGYyMjllNjk5NDguLjQzMTc2NThjNTYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L21v
bml0b3IuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tb25pdG9yLmMKPiBAQCAtMTg5LDEwICsxODks
MTEgQEAgaW50IGFyY2hfbW9uaXRvcl9kb21jdGxfZXZlbnQoc3RydWN0IGRvbWFpbiAqZCwKPiAg
ICAgICAgICAgICAgYWQtPm1vbml0b3Iud3JpdGVfY3RybHJlZ19lbmFibGVkICY9IH5jdHJscmVn
X2JpdG1hc2s7Cj4gICAgICAgICAgfQo+ICAKPiAtICAgICAgICBpZiAoIFZNX0VWRU5UX1g4Nl9D
UjMgPT0gbW9wLT51Lm1vdl90b19jci5pbmRleCApCj4gKyAgICAgICAgaWYgKCBWTV9FVkVOVF9Y
ODZfQ1IzID09IG1vcC0+dS5tb3ZfdG9fY3IuaW5kZXggfHwKPiArICAgICAgICAgICAgIFZNX0VW
RU5UX1g4Nl9DUjQgPT0gbW9wLT51Lm1vdl90b19jci5pbmRleCApCj4gICAgICAgICAgewo+ICAg
ICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsKPiAtICAgICAgICAgICAgLyogTGF0Y2hlcyBuZXcg
Q1IzIG1hc2sgdGhyb3VnaCBDUjAgY29kZS4gKi8KPiArICAgICAgICAgICAgLyogTGF0Y2hlcyBu
ZXcgQ1IzIG9yIENSNCBtYXNrIHRocm91Z2ggQ1IwIGNvZGUuICovCj4gICAgICAgICAgICAgIGZv
cl9lYWNoX3ZjcHUgKCBkLCB2ICkKPiAgICAgICAgICAgICAgICAgIGh2bV91cGRhdGVfZ3Vlc3Rf
Y3IodiwgMCk7Cj4gICAgICAgICAgfQoKRGlkIHlvdSwgYnkgYW55IGNoYW5jZSwgdGVzdCB0aGlz
IGNvZGUgd2l0aCB4ZW4tYWNjZXNzLmMgKGl0IGFscmVhZHkgaGFzCmEgdGVzdCBmb3IgQ1I0IGZv
ciB0aGUgUEdFIHN0dWZmKT8gSSdtIG5vdCBjb252aW5jZWQgdGhlCmh2bV91cGRhdGVfZ3Vlc3Rf
Y3IodiwgMCk7IGNhbGwgc3VmZmljZXMgdG8gZW5hYmxlIENSNCBsb2FkIGV4aXRzLgoKClRoYW5r
cywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
