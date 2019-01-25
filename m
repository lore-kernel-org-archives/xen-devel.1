From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/5] flight_otherjob: Use confess rather
 than die
Date: Fri, 25 Jan 2019 14:50:42 +0000
Message-ID: <20190125145046.27138-2-ian.jackson@eu.citrix.com>
References: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1alE=QB=citrix.com=prvs=9210a8ee7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gn2or-00081O-SB
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:50:57 +0000
In-Reply-To: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiB0aGlzIGVycm9yIHRyaXBzIGl0IGlzIHVzdWFsbHkgYmVjYXVzZSB0aGUgY2FsbCBzaXRl
IGxvb2tlZCB1cCBhbgp1bnNldCBydW52YXIgYW5kIGl0IGNhbiBiZSBoYXJkIHRvIHRlbGwgd2hh
dCB0aGF0IHJ1bnZhciB3YXMuCgpJZiB3ZSB1c2UgY29uZmVzcyB3ZSB3aWxsIGF0IGxlYXN0IGZp
bmQgb3V0IHRoZSBjYWxsaW5nIGxpbmUgbnVtYmVyLi4uCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0LnBtIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvT3NzdGVzdC5wbSBiL09zc3Rlc3QucG0KaW5kZXggODVhNmU3OGIuLjkyYjFhMGVhIDEw
MDY0NAotLS0gYS9Pc3N0ZXN0LnBtCisrKyBiL09zc3Rlc3QucG0KQEAgLTIyLDYgKzIyLDcgQEAg
dXNlIHdhcm5pbmdzOwogdXNlIFBPU0lYOwogdXNlIEZpbGU6OkJhc2VuYW1lOwogdXNlIElPOjpG
aWxlOwordXNlIENhcnA7CiAKIEJFR0lOIHsKICAgICB1c2UgRXhwb3J0ZXIgKCk7CkBAIC0zNzAs
NyArMzcxLDcgQEAgc3ViIGZsaWdodF9vdGhlcmpvYiAoJCQpIHsKICAgICBteSAoJHRoaXNmbGln
aHQsICRvdGhlcmZsaWdodGpvYikgPSBAXzsgICAgCiAgICAgcmV0dXJuICRvdGhlcmZsaWdodGpv
YiA9fiBtL14oW14uXSspXC4oW14uXSspJC8gPyAoJDEsJDIpIDoKICAgICAgICAgICAgJG90aGVy
ZmxpZ2h0am9iID1+IG0vXlwuPyhbXi5dKykkLyA/ICgkdGhpc2ZsaWdodCwkMSkgOgotICAgICAg
ICAgICBkaWUgIiRvdGhlcmZsaWdodGpvYiA/IjsKKyAgICAgICAgICAgY29uZmVzcyAiJG90aGVy
ZmxpZ2h0am9iID8iOwogfQogCiBzdWIgb3RoZXJfcmV2aXNpb25fam9iX3N1ZmZpeCAoJCQpIHsK
QEAgLTQ0NCwzICs0NDUsNCBAQCBzdWIgc2hvd19hYnNfdGltZSAoJCkgewogfQogCiAxOworCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
