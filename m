From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/vm_event: block interrupt injection for
 sync vm_events
Date: Mon, 10 Dec 2018 17:00:17 +0200
Message-ID: <211ef4cd-9313-72e3-7a5d-8b5bffe17b51@bitdefender.com>
References: <1544302120-13737-1-git-send-email-rcojocaru@bitdefender.com>
 <5C0E79130200007800204B67@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pczp=OT=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gWN2n-0004Vp-Dg
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 15:00:25 +0000
In-Reply-To: <5C0E79130200007800204B67@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggNDozMiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMTIuMTgg
YXQgMjE6NDgsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gQmxvY2sgaW50
ZXJydXB0cyAoaW4gdm14X2ludHJfYXNzaXN0KCkpIGZvciB0aGUgZHVyYXRpb24gb2YKPj4gcHJv
Y2Vzc2luZyBhIHN5bmMgdm1fZXZlbnQgKHNpbWlsYXJseSB0byB0aGUgc3RyYXRlZ3kKPj4gY3Vy
cmVudGx5IHVzZWQgZm9yIHNpbmdsZS1zdGVwcGluZykuIE90aGVyd2lzZSwgYXR0ZW1wdGluZwo+
PiB0byBlbXVsYXRlIGFuIGluc3RydWN0aW9uIHdoZW4gcmVxdWVzdGVkIGJ5IGEgdm1fZXZlbnQK
Pj4gcmVwbHkgbWF5IGxlZ2l0aW1hdGVseSBuZWVkIHRvIGNhbGwgaHZtX2luamVjdF9wYWdlX2Zh
dWx0KCksCj4+IHdoaWNoIHRoZW4gb3ZlcndyaXRlcyB0aGUgYWN0aXZlIGludGVycnVwdCBpbiB0
aGUgVk1DUy4KPiAKPiBJIHRha2UgaXQgdGhhdCBodm1faW5qZWN0X3BhZ2VfZmF1bHQoKSBpcyBq
dXN0IHRoZSBtb3N0IHByb21pbmVudAo+IGV4YW1wbGUuIElmIHNvLCB3b2xkIHlvdSBtaW5kIGFk
ZGluZyAiZS5nLiI/CgpJbmRlZWQuIEknbGwgYWRkICJlLmcuIi4KCj4+IEBAIC0yMzksNiArMjQx
LDEyIEBAIHZvaWQgdm14X2ludHJfYXNzaXN0KHZvaWQpCj4+ICAgICAgICAgIHJldHVybjsKPj4g
ICAgICB9Cj4+ICAKPj4gKyAgICAvKiBCbG9jayBldmVudCBpbmplY3Rpb24gd2hpbGUgaGFuZGxp
bmcgYSBzeW5jIHZtX2V2ZW50LiAqLwo+PiArICAgIGlmICggdW5saWtlbHkodi0+YXJjaC52bV9l
dmVudCkgJiYKPj4gKyAgICAgICAgIHZtX2V2ZW50X2NoZWNrX3Jpbmcodi0+ZG9tYWluLT52bV9l
dmVudF9tb25pdG9yKSAmJgo+IAo+IElzIHRoaXMgY2hlY2sgcmVhbGx5IG5lZWRlZD8KPiAKPj4g
KyAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPmludHJfYmxvY2sgKQo+IAo+IFRoaXMgcGFydCBj
ZXJ0YWlubHkgZG9lc24ndCBsb29rIHRvIGRlcGVuZCBvbiBpdC4gUGVyaGFwcwo+IC0+aW50cl9i
bG9jayB3b3VsZCBiZXR0ZXIgYmUgY2xlYXJlZCB3aGVuIHRlYXJpbmcgZG93biBhIHJpbmc/CgpU
cnVlLCB0aGF0IHdvdWxkIGxvb2sgY2xlYW5lci4KCj4gQWxzbyBpcyB0aGVyZSByZWFsbHkgbm8g
c2ltaWxhciBjaGFuZ2UgbmVlZGVkIG9uIHRoZSBBTUQgKFNWTSkKPiBzaWRlPwoKV2VsbCwgZm9y
IGFsbCBwcmFjdGljYWwgcHVycG9zZXMgbm8sIHNpbmNlIHdlIGRvbid0IGN1cnJlbnRseSBoYXZl
Ck5QVC1mYXVsdCB2bV9ldmVudHMgb24gQU1EIChJJ2xsIGhhdmUgdG8gZGlnIHVwIHRoZSBvbGQg
dGhyZWFkIHRvCnJlbWVtYmVyIHdoZXJlIHRoYXQgZ290IGxlZnQgb2ZmKSwgYW5kIHRob3NlIGFy
ZSB0aGUgb25seSBldmVudHMgZm9yCndoaWNoIGl0IGlzIHNhbmUgdG8gcmVwbHkgd2l0aCAicGxl
YXNlIGVtdWxhdGUiLgoKQnV0IEkgc2VlIHlvdXIgcG9pbnQsIGl0IHdvdWxkIGJlIGJldHRlciB0
byBhZGQgdGhhdCBjb2RlIGZvciBTVk0gYXMKd2VsbCB3aGlsZSB3ZSdyZSBhdCBpdCByYXRoZXIg
dGhhbiBoYXZlIGEgc3VycHJpc2Ugb25jZSBldmVyeXRoaW5nIGVsc2UKaXMgaW4gcGxhY2UuIFNv
IEknbGwgYWRkIHRoYXQgZWFybHkgcmV0dXJuIHRvIHN2bV9pbnRyX2Fzc2lzdCgpIGFzIHdlbGwu
CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
