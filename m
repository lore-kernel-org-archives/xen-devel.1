From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 3/9] xen/balloon: Share common memory
 reservation routines
Date: Mon, 4 Jun 2018 12:37:48 -0400
Message-ID: <4fd46fd8-f936-1514-06e4-34c5d3ed8960__44759.3773635619$1528148181$gmane$org@oracle.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-4-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=egk0=iw=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fPxA9-0005kM-U1
 for xen-devel@lists.xenproject.org; Mon, 04 Jun 2018 21:37:14 +0000
In-Reply-To: <20180601114132.22596-4-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDEvMjAxOCAwNzo0MSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL21lbS1yZXNlcnZhdGlvbi5oIGIvaW5jbHVkZS94ZW4v
bWVtLXJlc2VydmF0aW9uLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uYTcyN2Q2NWExZTYxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2luY2x1ZGUveGVuL21l
bS1yZXNlcnZhdGlvbi5oCj4gQEAgLTAsMCArMSw2NSBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCAqLwo+ICsKPiArLyoKPiArICogWGVuIG1lbW9yeSByZXNlcnZhdGlv
biB1dGlsaXRpZXMuCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAwMywgQiBEcmFnb3ZpYwo+
ICsgKiBDb3B5cmlnaHQgKGMpIDIwMDMtMjAwNCwgTSBXaWxsaWFtc29uLCBLIEZyYXNlcgo+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMDUgRGFuIE0uIFNtaXRoLCBJQk0gQ29ycG9yYXRpb24KPiArICog
Q29weXJpZ2h0IChjKSAyMDEwIERhbmllbCBLaXBlcgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTgg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28sIEVQQU0gU3lzdGVtcyBJbmMuCj4gKyAqLwo+ICsKPiAr
I2lmbmRlZiBfWEVOTUVNX1JFU0VSVkFUSU9OX0gKPiArI2RlZmluZSBfWEVOTUVNX1JFU0VSVkFU
SU9OX0gKPiArCj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4KPiArCj4gKyNpbmNsdWRlIDxhc20veGVuL2h5cGVyY2FsbC5oPgo+ICsjaW5jbHVk
ZSA8YXNtL3RsYi5oPgo+ICsKPiArI2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UvbWVtb3J5Lmg+Cj4g
KyNpbmNsdWRlIDx4ZW4vcGFnZS5oPgo+ICsKPiArI2lmZGVmIENPTkZJR19YRU5fU0NSVUJfUEFH
RVMKPiArdm9pZCB4ZW5tZW1fcmVzZXJ2YXRpb25fc2NydWJfcGFnZShzdHJ1Y3QgcGFnZSAqcGFn
ZSk7Cj4gKyNlbHNlCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB4ZW5tZW1fcmVzZXJ2YXRpb25fc2Ny
dWJfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiArewo+ICt9Cj4gKyNlbmRpZgoKCkdpdmVuIHRo
YXQgdGhpcyBpcyBhIHdyYXBwZXIgYXJvdW5kIGEgc2luZ2xlIGNhbGwgSSdkIHByZWZlcgoKaW5s
aW5lIHZvaWQgeGVubWVtX3Jlc2VydmF0aW9uX3NjcnViX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2Up
CnsKI2lmZGVmIENPTkZJR19YRU5fU0NSVUJfUEFHRVMKwqDCoMKgIGNsZWFyX2hpZ2hwYWdlKHBh
Z2UpOwojZW5kaWYKfQoKCgotYm9yaXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
