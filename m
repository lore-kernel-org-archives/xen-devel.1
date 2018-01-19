From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 03/11] x86/msr: Emulation of
 MSR_{SPEC_CTRL, PRED_CMD} for guests
Date: Fri, 19 Jan 2018 03:45:39 -0700
Message-ID: <5A61DA6302000078001A0497@prv-mh.provo.novell.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516290370-14958-4-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE4IGF0IDE2OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTE1MywxNCArMTY4LDQ0IEBAIGludCBndWVzdF93cm1zcihzdHJ1Y3QgdmNwdSAq
diwgdWludDMyX3QgbXNyLCB1aW50NjRfdCB2YWwpCj4gIHsKPiAgICAgIGNvbnN0IHN0cnVjdCB2
Y3B1ICpjdXJyID0gY3VycmVudDsKPiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47
Cj4gKyAgICBjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpjcCA9IGQtPmFyY2guY3B1aWQ7Cj4g
ICAgICBzdHJ1Y3QgbXNyX2RvbWFpbl9wb2xpY3kgKmRwID0gZC0+YXJjaC5tc3I7Cj4gICAgICBz
dHJ1Y3QgbXNyX3ZjcHVfcG9saWN5ICp2cCA9IHYtPmFyY2gubXNyOwo+ICAKPiAgICAgIHN3aXRj
aCAoIG1zciApCj4gICAgICB7Cj4gICAgICBjYXNlIE1TUl9JTlRFTF9QTEFURk9STV9JTkZPOgo+
ICsgICAgY2FzZSBNU1JfQVJDSF9DQVBBQklMSVRJRVM6Cj4gKyAgICAgICAgLyogUmVhZC1vbmx5
ICovCj4gICAgICAgICAgZ290byBncF9mYXVsdDsKPiAgCj4gKyAgICBjYXNlIE1TUl9TUEVDX0NU
Ukw6Cj4gKyAgICAgICAgaWYgKCAhY3AtPmZlYXQuaWJyc2IgKQo+ICsgICAgICAgICAgICBnb3Rv
IGdwX2ZhdWx0OyAvKiBNU1IgYXZhaWxhYmxlPyAqLwo+ICsKPiArICAgICAgICAvKgo+ICsgICAg
ICAgICAqIE5vdGU6IFNQRUNfQ1RSTF9TVElCUCBpcyBzcGVjaWZpZWQgYXMgc2FmZSB0byB1c2Ug
KGkuZS4gaWdub3JlZCkKPiArICAgICAgICAgKiB3aGVuIFNUSUJQIGlzbid0IGVudW1lcmF0ZWQg
aW4gaGFyZHdhcmUuCj4gKyAgICAgICAgICovCj4gKwo+ICsgICAgICAgIGlmICggdmFsICYgfihT
UEVDX0NUUkxfSUJSUyB8IFNQRUNfQ1RSTF9TVElCUCkgKQo+ICsgICAgICAgICAgICBnb3RvIGdw
X2ZhdWx0OyAvKiBSc3ZkIGJpdCBzZXQ/ICovCj4gKwo+ICsgICAgICAgIHZwLT5zcGVjX2N0cmwu
cmF3ID0gdmFsOwo+ICsgICAgICAgIGJyZWFrOwoKRGlkIHlvdSBjaGVjayAob3IgaW5xdWlyZSkg
d2hldGhlciByZWFkaW5nIGJhY2sgdGhlIHZhbHVlIG9uIGEKc3lzdGVtIHdoaWNoIGlnbm9yZXMg
dGhlIHdyaXRlIHRvIDEgYWN0dWFsbHkgcHJvZHVjZXMgdGhlCndyaXR0ZW4gdmFsdWU/IEknZCBz
b3J0IG9mIGV4cGVjdCB6ZXJvIHRvIGNvbWUgYmFjayBpbnN0ZWFkLgoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
