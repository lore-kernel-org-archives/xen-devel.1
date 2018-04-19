From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Input: xen-kbdfront - allow better run-time
 configuration
Date: Thu, 19 Apr 2018 15:19:02 +0200
Message-ID: <d4075815-2b41-781d-3541-6a17a181512d__31431.9932055243$1524143872$gmane$org@suse.com>
References: <20180418150445.9805-1-andr2000@gmail.com>
 <ccb7a33b-7862-9803-fb24-67861d5ecab9@suse.com>
 <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
 <c833ab0d-746c-c734-3dbe-e02ae7951d1d@suse.com>
 <d935e7d9-090f-a8b1-7f12-5e0a7f0adf1b@gmail.com>
 <CAKf6xpsM03AB-mHaYdpVfipRdtx9uO1rS=bHZdEi3fkfTo6b4g@mail.gmail.com>
 <5ed20b99-263d-d906-9349-d064eead36ad@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gvlu=hi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f99Sr-0004Kq-HI
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 13:19:05 +0000
In-Reply-To: <5ed20b99-263d-d906-9349-d064eead36ad@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, dmitry.torokhov@gmail.com, open list <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDQvMTggMTU6MTIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IE9uIDA0
LzE5LzIwMTggMDQ6MTAgUE0sIEphc29uIEFuZHJ5dWsgd3JvdGU6Cj4+IE9uIFRodSwgQXByIDE5
LCAyMDE4IGF0IDk6MDEgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvCj4+IDxhbmRyMjAwMEBn
bWFpbC5jb20+IHdyb3RlOgo+Pj4gT2ssIHNvIEknbGwgc2VuZCB2MiB3aXRoIHRoZSBmb2xsb3dp
bmcgY2hhbmdlczoKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1r
YmRmcm9udC5jCj4+PiBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYwo+Pj4gaW5k
ZXggYTMzMDZhYWQ0MGIwLi5kOGNjYTIxMmY3MzcgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2lu
cHV0L21pc2MveGVuLWtiZGZyb250LmMKPj4+ICsrKyBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4t
a2JkZnJvbnQuYwo+Pj4gQEAgLTUxLDEzICs1MSwxMyBAQCBtb2R1bGVfcGFyYW1fYXJyYXkocHRy
X3NpemUsIGludCwgTlVMTCwgMDQ0NCk7Cj4+PiDCoCBNT0RVTEVfUEFSTV9ERVNDKHB0cl9zaXpl
LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAiUG9pbnRpbmcgZGV2aWNlIHdpZHRoLCBoZWlnaHQgaW4g
cGl4ZWxzIChkZWZhdWx0IDgwMCw2MDApIik7Cj4+Pgo+Pj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQg
bm9fcHRyX2RldjsKPj4+IC1tb2R1bGVfcGFyYW0obm9fcHRyX2RldiwgdWludCwgMCk7Cj4+PiAr
c3RhdGljIGJvb2wgbm9fcHRyX2RldjsKPj4+ICttb2R1bGVfcGFyYW0obm9fcHRyX2RldiwgYm9v
bCwgMCk7Cj4+PiDCoCBNT0RVTEVfUEFSTV9ERVNDKG5vX3B0cl9kZXYsCj4+PiDCoMKgwqDCoMKg
wqDCoMKgICJJZiBzZXQgdGhlbiBubyB2aXJ0dWFsIHBvaW50aW5nIGRldmljZSBleHBvc2VkIHRv
IHRoZSBndWVzdCIpOwo+Pj4KPj4+IC1zdGF0aWMgdW5zaWduZWQgaW50IG5vX2tiZF9kZXY7Cj4+
PiAtbW9kdWxlX3BhcmFtKG5vX2tiZF9kZXYsIHVpbnQsIDApOwo+Pj4gK3N0YXRpYyBib29sIG5v
X2tiZF9kZXY7Cj4+PiArbW9kdWxlX3BhcmFtKG5vX2tiZF9kZXYsIGJvb2wsIDApOwo+Pj4gwqAg
TU9EVUxFX1BBUk1fREVTQyhub19rYmRfZGV2LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAiSWYgc2V0
IHRoZW4gbm8gdmlydHVhbCBrZXlib2FyZCBkZXZpY2UgZXhwb3NlZCB0byB0aGUgZ3Vlc3QiKTsK
Pj4gSSBwcmVmZXIgZGlyZWN0IGxvZ2ljIG92ZXIgaW52ZXJzZSBsb2dpYy7CoCBNYXliZSBqdXN0
IHVzZSBrYmRfZGV2LAo+PiBkZWZhdWx0IHRvIHRydWUsIGJ1dCBhbGxvdyBpdCB0byBiZSBzZXQg
b2ZmPwo+Pgo+PiBzdGF0aWMgYm9vbCBrYmRfZGV2ID0gdHJ1ZTsKPj4gbW9kdWxlX3BhcmFtKGti
ZF9kZXYsIGJvb2wsIDApOwo+IEkgaGF2ZSBubyBwcmVmZXJlbmNlIGhlcmUsIGVpdGhlciB3YXkg
d29ya3MgZm9yIG1lCj4gSnVlcmdlbiwgd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhlIGFib3Zl
PwoKSSByZWFsbHkgaGF2ZSBubyBwcmVmZXJlbmNlIGhlcmUuIFdoYXQgc2hvdWxkIGJlIHRha2Vu
IGludG8gYWNjb3VudCBpcwp0aGF0IGJvb2xlYW4gcGFyYW1ldGVycyBkb24ndCBuZWVkIGEgdmFs
dWUsIG1lYW5pbmcgInRydWUiIGluIHRoYXQgY2FzZS4KVGhpcyB3b3VsZCBtYWtlIG5vIHNlbnNl
IGZvciAia2JkX2RldiIgYXMgaXQgd291bGRuJ3QgY2hhbmdlIHRoZQpkZWZhdWx0LgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
