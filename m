From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v15 06/14] x86/hvm: Introduce
 hvm_save_mtrr_msr_one func
Date: Tue, 07 Aug 2018 06:00:28 -0600
Message-ID: <5B6989DC02000078001DB863@prv1-mh.provo.novell.com>
References: <1533304431-27897-1-git-send-email-aisaila@bitdefender.com>
 <1533304431-27897-7-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533304431-27897-7-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA4LjE4IGF0IDE1OjUzLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBNQVNLX0VYVFIoaHdfbXRyci5tc3JfbXRycl9jYXAs
IE1UUlJjYXBfVkNOVCk7IGkrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgLyogc2F2ZSBwaHlzYmFz
ZSAqLwo+ICsgICAgICAgIGh3X210cnIubXNyX210cnJfdmFyW2kgKiAyXSA9IG10cnJfc3RhdGUt
PnZhcl9yYW5nZXMtPmJhc2U7Cj4gKyAgICAgICAgLyogc2F2ZSBwaHlzbWFzayAqLwo+ICsgICAg
ICAgIGh3X210cnIubXNyX210cnJfdmFyW2kgKiAyICsgMV0gPSBtdHJyX3N0YXRlLT52YXJfcmFu
Z2VzLT5tYXNrOwo+ICsgICAgfQoKT25lIG9mIHRoZSBpbnRlbmRlZCBzaWRlIGVmZmVjdHMgb2Yg
dXNpbmcgc3RydWN0dXJlIGZpZWxkIG9uIHRoZSByaHMKd2FzIHRvIGJlIGFibGUgdG8gZHJvcCB0
aGUgKG5vdyByZWR1bmRhbnQpIGNvbW1lbnRzLgoKPiAtICAgICAgICBodm1fZ2V0X2d1ZXN0X3Bh
dCh2LCAmaHdfbXRyci5tc3JfcGF0X2NyKTsKPiArICAgIG1lbWNweShod19tdHJyLm1zcl9tdHJy
X2ZpeGVkLCBtdHJyX3N0YXRlLT5maXhlZF9yYW5nZXMsIE5VTV9GSVhFRF9NU1IpOwoKWW91IHdh
bnQgdG8gQlVJTERfQlVHX09OKCkgYXJyYXkgc2l6ZXMgZGlmZmVyaW5nLCBhbmQgdGhlbiB1c2UK
c2l6ZW9mKCkgaW4gdGhlIGNhbGwgdG8gbWVtY3B5KCkuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
