From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
Date: Mon, 29 Apr 2019 16:22:38 +0530
Message-ID: <CABHD4K_XCtRbVX17L3v2JbV5NcGwLZd7Medc-qdg=23Z=rtLdw@mail.gmail.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
 <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
 <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FDFM=S7=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hL3u0-0005Gs-5f
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 10:52:52 +0000
Received: by mail-ot1-x343.google.com with SMTP id e5so8145680otk.12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 03:52:50 -0700 (PDT)
In-Reply-To: <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCj4KPiBUaGUgcHJvcGVyIHdheSBpcyB0byBkZXRlY3QgUFBJIGJlZm9yZSBoYW5kIGFu
ZCBjb21wbGV0ZWx5IHNraXAgdGhlIG5vZGUgaWYgYW55LgoKSSB0cmllZCB0aGUgZm9sbG93aW5n
IGNoYW5nZToKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXggZDk4MzY3Ny4uYTllY2ZlZCAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYwpAQCAtMTM1Myw3ICsxMzUzLDcgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25v
ZGUoc3RydWN0IGRvbWFpbiAqZCwKc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAgICAgICAg
eyAvKiBzZW50aW5lbCAqLyB9LAogICAgIH07CiAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpj
aGlsZDsKLSAgICBpbnQgcmVzOworICAgIGludCByZXMsIGlycV9pZDsKICAgICBjb25zdCBjaGFy
ICpuYW1lOwogICAgIGNvbnN0IGNoYXIgKnBhdGg7CgpAQCAtMTM5OSw2ICsxMzk5LDE2IEBAIHN0
YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsCnN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8sCiAgICAgICAgIHJldHVybiAwOwogICAgIH0KCisgICAgLypTa2lwIHRo
ZSBub2RlLCB1c2luZyBQUEkgc291cmNlICovCisgICAgaXJxX2lkID0gcGxhdGZvcm1fZ2V0X2ly
cShub2RlLCAwKTsKKworICAgIGlmICggaXJxX2lkID4gMTYgJiYgaXJxX2lkIDwgMzIgKQorICAg
IHsKKyAgICAgICAgZHRfZHByaW50aygiIFNraXAgbm9kZSB3aXRoIChQUEkgc291cmNlKVxuIik7
CisgICAgICAgIHJldHVybiAwOworICAgIH0KKworCgpBZnRlciBib290aW5nIGRvbTAsIGRvbid0
IHNlZSBQTVUgbm9kZSBpcyBnZXR0aW5nIGdlbmVyYXRlZChpdHMKc2tpcHBlZCBjb21wbGV0ZWx5
IG5vdykuCgpUaGFua3MsCi1BbWl0LgoKCgo+IEp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
