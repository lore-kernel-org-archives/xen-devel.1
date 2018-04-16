From: Davidwang <Davidwang@zhaoxin.com>
Subject: [PATCH] x86/hpet: add a lock when cpu clear cpumask in
 hpet_broadcast_exit();
Date: Mon, 16 Apr 2018 16:00:45 +0800
Message-ID: <1523865645-4911-1-git-send-email-Davidwang@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dcgl=hf=zhaoxin.com=davidwang@srs-us1.protection.inumbo.net>)
 id 1f7zF4-0002KS-Jw
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 08:12:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: fionali@zhaoxin.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogRGF2aWQgV2FuZyA8ZGF2aWR3YW5nQHpoYW94aW4uY29tPgoKQnkgdGhlIGhwZXRfZ2V0
X2NoYW5uZWwoKSwgY3B1cyBzaGFyZSBhbiBpbi11c2UgY2hhbm5lbCBzb210aW1lLgpTbywgY29y
ZSBzaG91bGRuJ3QgY2xlYXIgY3B1bWFzayB3aGlsZSBvdGhlcnMgYXJlIGdldHRpbmcgZmlyc3QK
Y3B1bWFzay4gSWYgY29yZSB6ZXJvIGFuZCBjb3JlIG9uZSBzaGFyZSBhbiBjaGFubmVsLCB0aGUg
Y3B1bWFzawppcyAweDMuIENvcmUgemVybyBjbGVhciBjcHVtYXNrIGJldHdlZW4gY29yZSBvbmUg
ZXhlY3V0aW5nCmNwdW1hc2tfZW1wdHkoKSBhbmQgY3B1bWFza19maXJzdCgpLiBUaGUgcmV0dXJu
IG9mIGNwdW1hc2tfZmlyc3QoKQppcyBucl9jcHVfaWRzLiBUaGF0IHdvdWxkIGxlYWQgdG8gQVNT
RVJUKGNwdSA8IG5yX2NwdV9pZHMpLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgV2FuZyA8ZGF2aWR3
YW5nQHpoYW94aW4uY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ocGV0LmMgfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2hwZXQu
YyBiL3hlbi9hcmNoL3g4Ni9ocGV0LmMKaW5kZXggYmM3YTg1MS4uNjlhN2IzYSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2hwZXQuYworKysgYi94ZW4vYXJjaC94ODYvaHBldC5jCkBAIC03NDAs
NyArNzQwLDkgQEAgdm9pZCBocGV0X2Jyb2FkY2FzdF9leGl0KHZvaWQpCiAgICAgaWYgKCAhcmVw
cm9ncmFtX3RpbWVyKGRlYWRsaW5lKSApCiAgICAgICAgIHJhaXNlX3NvZnRpcnEoVElNRVJfU09G
VElSUSk7CiAKKyAgICBzcGluX2xvY2tfaXJxKCZjaC0+bG9jayk7CiAgICAgY3B1bWFza19jbGVh
cl9jcHUoY3B1LCBjaC0+Y3B1bWFzayk7CisgICAgc3Bpbl91bmxvY2tfaXJxKCZjaC0+bG9jayk7
CiAKICAgICBpZiAoICEoY2gtPmZsYWdzICYgSFBFVF9FVlRfTEVHQUNZKSApCiAgICAgICAgIGhw
ZXRfZGV0YWNoX2NoYW5uZWwoY3B1LCBjaCk7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
