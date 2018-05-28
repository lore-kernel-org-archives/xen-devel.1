From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: [PATCH v3 16/17] arm64: if trapping a
 write-to-read-only GICv3 access inject Undef exception in guest
Date: Mon, 28 May 2018 08:51:20 +0530
Message-ID: <dca651dd6eafcbeb40a5ab60c848f146edd69748.1527247385.git.mjaggi@caviumnetworks.com>
References: <cover.1527247385.git.mjaggi@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=grxy=ip=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1fN8kb-0005HI-Qe
 for xen-devel@lists.xenproject.org; Mon, 28 May 2018 03:23:13 +0000
In-Reply-To: <cover.1527247385.git.mjaggi@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com
Cc: Manish Jaggi <mjaggi@caviumnetworks.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBpcyBhIHBvcnQgdG8geGVuIGZyb20gbGludXggY29tbWl0Ogo3YjFkYmExZjcz
MjU2Mjk0MjdjMGU1YmRmMDE0MTU5YjIyOWQxNmM4CktWTTogYXJtNjQ6IExvZyBhbiBlcnJvciBp
ZiB0cmFwcGluZyBhIHdyaXRlLXRvLXJlYWQtb25seSBHSUN2MyBhY2Nlc3MKCkEgd3JpdGUtdG8t
cmVhZC1vbmx5IEdJQ3YzIGFjY2VzcyBzaG91bGQgVU5ERUYgYXQgRUwxLiBCdXQgc2luY2UKd2Un
cmUgaW4gY29tcGxldGUgcGFyYW5vaWEtbGFuZCB3aXRoIGJyb2tlbiBDUFVzLCBsZXQncyBhc3N1
bWUgdGhlCndvcnNlIGFuZCBncmFjZWZ1bGx5IGhhbmRsZSB0aGUgY2FzZS4KClNpZ25lZC1vZmYt
Ynk6IE1hbmlzaCBKYWdnaSA8bWFuaXNoLmphZ2dpQGNhdml1bS5jb20+CgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2FybTY0L3ZnaWMtdjMtc3IuYyBiL3hlbi9hcmNoL2FybS9hcm02NC92Z2lj
LXYzLXNyLmMKaW5kZXggMjdmNTEzOWRjYi4uYWMzOWViNWUxZCAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL2FybTY0L3ZnaWMtdjMtc3IuYworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvdmdpYy12
My1zci5jCkBAIC03ODIsNiArNzgyLDExIEBAIGJvb2wgdmdpY192M19oYW5kbGVfY3B1aWZfYWNj
ZXNzKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQogCiAgICAgY2FzZSBIU1JfU1lTUkVHX0lD
Q19JQVIwX0VMMToKICAgICBjYXNlIEhTUl9TWVNSRUdfSUNDX0lBUjFfRUwxOgorICAgICAgICBp
ZiAoIHVubGlrZWx5KCFpc19yZWFkKSApCisgICAgICAgIHsKKyAgICAgICAgICAgIHJldCA9IGZh
bHNlOworICAgICAgICAgICAgZ290byBlbmQ7CisgICAgICAgIH0KICAgICAgICAgZm4gPSB2Z2lj
X3YzX3JlYWRfaWFyOwogICAgICAgICBicmVhazsKIApAQCAtNzkyLDYgKzc5NywxMSBAQCBib29s
IHZnaWNfdjNfaGFuZGxlX2NwdWlmX2FjY2VzcyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykK
IAogICAgIGNhc2UgSFNSX1NZU1JFR19JQ0NfSFBQSVIwX0VMMToKICAgICBjYXNlIEhTUl9TWVNS
RUdfSUNDX0hQUElSMV9FTDE6CisgICAgICAgIGlmICggdW5saWtlbHkoIWlzX3JlYWQpICkKKyAg
ICAgICAgeworICAgICAgICAgICAgcmV0ID0gZmFsc2U7CisgICAgICAgICAgICBnb3RvIGVuZDsK
KyAgICAgICAgfQogICAgICAgICBmbiA9IHZnaWNfdjNfcmVhZF9ocHBpcjsKICAgICAgICAgYnJl
YWs7CiAKLS0gCjIuMTQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
