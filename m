From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 13/20] xen/arm32: mm: Avoid to zero and
 clean cache for CPU0 domheap
Date: Fri, 3 May 2019 18:06:32 +0100
Message-ID: <291f238e-16e8-a5d7-c0a5-5532fde69585@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-14-julien.grall@arm.com>
 <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMbds-000178-7i
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:06:36 +0000
In-Reply-To: <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8wNS8yMDE5IDE2OjU3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiAKPiBPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBU
aGUgcGFnZS10YWJsZSB3YWxrZXIgaXMgY29uZmlndXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVh
YmlsaXR5IGFuZAo+PiBjYWNoZWFiaWxpdHkgYXMgdGhlIGFjY2VzcyBwZXJmb3JtZWQgd2hlbiB1
cGRhdGluZyB0aGUgcGFnZS10YWJsZXMuIFRoaXMKPj4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hl
IGZvciBDUFUwIGRvbWhlYXAgaXMgdW5uZWNlc3NhcnkuCj4+Cj4+IEZ1cnRoZXJtb3JlLCBDUFUw
IHBhZ2UtdGFibGVzIGFyZSBwYXJ0IG9mIFhlbiBiaW5hcnkgYW5kIHdpbGwgYWxyZWFkeSBiZQo+
PiB6ZXJvZWQgYmVmb3JlaGFuZC4KPiAKPiBJTU8gaXQgaXMgYSBiaXQgY29uZnVzaW5nLgo+IEFz
IEkgdW5kZXJzdGFuZCwgYGNwdTBfZG9tbWFwYCByZXNpZGVzIGluIEJTUyB3aGljaCBpcyBub3Qg
YSBwYXJ0IG9mIHRoZSBiaW5hcnkgCj4gdW5saWtlIGluaXRpYWxpemVkIGRhdGEuIFlldCBpdCBp
cyB1bmNvbmRpdGlvbmFsbHkgY2xlYXJlZCBkdXJpbmcgdGhlIGJvb3Qgb24gCj4gQVJNMzIuCgpJ
biBDLCB1bmluaXRpYWxpemVkIGdsb2JhbCB2YXJpYWJsZSB3aWxsIGJlIHplcm8gYnkgZGVmYXVs
dC4gSXQgaXMgYSBiaXQgb2YgCndhc3RlIHRvIGFsbG9jYXRlIHNwYWNlIGluIHRoZSBiaW5hcnkg
Zm9yIHRoZW0uIFNvIHRoZSBjb21waWxlciB3aWxsIGNvbW1vbmx5IApwdXQgdGhlbSBpbiBhIHNl
Y3Rpb24gQlNTIHRoYXQgYXJlIGdvaW5nIHRvIGJlIHplcm9lZCB3aGVuIGF0IGxhdW5jaC4KCk9u
IEFybTMyLCB0aGlzIGlzIGFsd2F5cyBkb25lIGluIENQVTAgYXQgZWFybHkgYm9vdC4gRm9yIEFy
bTY0LCBVRUZJIHdpbGwgZG8gaXQgCmZvciB1cywgc28gd2UgZG9uJ3Qgd2FudCB0byBkbyBpdCB3
aGVuIHVzaW5nIFVFRkkgYXMgd2UgbWF5IG92ZXJyaWRlIGdsb2JhbAoKVGhlIHJlYXNvbiBJIGNo
b3NlIHRvIHNheSAid2lsbCBhbHdheXMgYmUgemVyb2VkIGJlZm9yZWhhbmQiIHRoYW4gc3BlY2lm
aWNhbGx5IAptZW50aW9uICJCU1MiIGlzIEkgd2Fzbid0IGVudGlyZWx5IGNvbnZpbmNlZCB0aGUg
Y29tcGlsZXIgd2lsbCBhbHdheXMgcHV0IGluIEJTUy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
