From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 1/8] xen/arm: Only set necessary flags
 when initializing HCR_EL2
Date: Wed, 28 Nov 2018 16:49:32 +0000
Message-ID: <20181128164939.8329-2-julien.grall@arm.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=83fl=oh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gS325-0000qU-SZ
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:49:49 +0000
In-Reply-To: <20181128164939.8329-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T25seSB7QSxGLEl9TU8gYXJlIG5lY2Vzc2FyeSB0byByZWNlaXZlIGludGVycnVwdHMgdW50aWwg
YSBndWVzdCB2Q1BVIGlzCmxvYWRlZC4KClRoZSByZXN0IGhhdmUgbm8gZWZmZWN0IG9uIFhlbiBh
bmQgaXQgaXMgYmV0dGVyIHRvIGF2b2lkIHNldHRpbmcgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3RyYXBz
LmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJt
L3RyYXBzLmMKaW5kZXggODhmZmVlYjQ4MC4uMWVlYzk2NjI5OSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL3RyYXBzLmMKKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKQEAgLTE4MSw4ICsxODEs
MTIgQEAgdm9pZCBpbml0X3RyYXBzKHZvaWQpCiAgICAgV1JJVEVfU1lTUkVHKChIQ1BUUl9DUF9N
QVNLICYgfihIQ1BUUl9DUCgxMCkgfCBIQ1BUUl9DUCgxMSkpKSB8IEhDUFRSX1RUQSwKICAgICAg
ICAgICAgICAgICAgQ1BUUl9FTDIpOwogCi0gICAgLyogU2V0dXAgaHlwZXJ2aXNvciB0cmFwcyAq
LwotICAgIFdSSVRFX1NZU1JFRyhnZXRfZGVmYXVsdF9oY3JfZmxhZ3MoKSwgSENSX0VMMik7Cisg
ICAgLyoKKyAgICAgKiBDb25maWd1cmUgSENSX0VMMiB3aXRoIHRoZSBiYXJlbWluaW11bSB0byBy
dW4gWGVuIHVudGlsIGEgZ3Vlc3QKKyAgICAgKiBpcyBzY2hlZHVsZWQuIHtBLEksRn1NTyBiaXRz
IGFyZSBzZXQgdG8gYWxsb3cgRUwyIHJlY2VpdmluZworICAgICAqIGludGVycnVwdHMuCisgICAg
ICovCisgICAgV1JJVEVfU1lTUkVHKEhDUl9BTU8gfCBIQ1JfRk1PIHwgSENSX0lNTywgSENSX0VM
Mik7CiAgICAgaXNiKCk7CiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
