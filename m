From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH v2 2/2] xen/arm32: Remove __init prefixes from
 funcs that are used within CPU up flow
Date: Fri,  7 Dec 2018 11:45:31 +0200
Message-ID: <1544175931-17047-3-git-send-email-olekstysh@gmail.com>
References: <1544175931-17047-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PsOz=OQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gVChg-0001xz-LB
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 09:45:48 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 83-v6so2974629ljf.10
 for <xen-devel@lists.xenproject.org>; Fri, 07 Dec 2018 01:45:47 -0800 (PST)
In-Reply-To: <1544175931-17047-1-git-send-email-olekstysh@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBpcyBhIGZvbGxvdy11cCBwYXRjaCB0bwpjb21taXQgMDFhN2U4Y2NlZjZlN2Q1NzE4
YTI1MWFkNTg3NTY3YWZiZTcyMzMzMAp4ZW4vYXJtOiBSZW1vdmUgX19pbml0ZGF0YSBhbmQgX19p
bml0IHRvIGVuYWJsZSBDUFUgaG90cGx1ZwoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hj
aGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvc21wYm9v
dC5jIHwgMiArLQogeGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMgICAgICB8IDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9hcm0zMi9zbXBib290LmMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvc21wYm9vdC5j
CmluZGV4IDJhNzdmMjkuLmU3MzY4NjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9z
bXBib290LmMKKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL3NtcGJvb3QuYwpAQCAtMTYsNyArMTYs
NyBAQCBpbnQgX19pbml0IGFyY2hfY3B1X2luaXQoaW50IGNwdSwgc3RydWN0IGR0X2RldmljZV9u
b2RlICpkbikKICAgICByZXR1cm4gMDsKIH0KIAotaW50IF9faW5pdCBhcmNoX2NwdV91cChpbnQg
Y3B1KQoraW50IGFyY2hfY3B1X3VwKGludCBjcHUpCiB7CiAgICAgcmV0dXJuIHBsYXRmb3JtX2Nw
dV91cChjcHUpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMgYi94ZW4v
YXJjaC9hcm0vcGxhdGZvcm0uYwppbmRleCA2OTg5ZTU4Li4wYmEyMDAxIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vcGxhdGZvcm0uYworKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm0uYwpAQCAt
OTUsNyArOTUsNyBAQCBpbnQgX19pbml0IHBsYXRmb3JtX3NwZWNpZmljX21hcHBpbmcoc3RydWN0
IGRvbWFpbiAqZCkKIH0KIAogI2lmZGVmIENPTkZJR19BUk1fMzIKLWludCBfX2luaXQgcGxhdGZv
cm1fY3B1X3VwKGludCBjcHUpCitpbnQgcGxhdGZvcm1fY3B1X3VwKGludCBjcHUpCiB7CiAgICAg
aWYgKCBwc2NpX3ZlciApCiAgICAgICAgIHJldHVybiBjYWxsX3BzY2lfY3B1X29uKGNwdSk7Ci0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
