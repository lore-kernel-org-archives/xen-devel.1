From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 06/15] x86/hvm: Introduce
 hvm_save_mtrr_msr_one func
Date: Fri, 08 Jun 2018 08:57:05 -0600
Message-ID: <5B1A994102000078001C98CC@prv1-mh.provo.novell.com>
References: <1528383573-21522-1-git-send-email-aisaila@bitdefender.com>
 <1528383573-21522-7-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528383573-21522-7-git-send-email-aisaila@bitdefender.com>
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

Pj4+IE9uIDA3LjA2LjE4IGF0IDE2OjU5LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IFRoaXMgaXMgdXNlZCB0byBzYXZlIGRhdGEgZnJvbSBhIHNpbmdsZSBpbnN0YW5jZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNv
bT4KCkkgdGhpbmsgaXQgd291bGQgaGVscCBpZiB5b3UgYmFzZWQgdGhpcyBvbiB0b3Agb2YgUm9n
ZXIncyBzZXJpZXNbMV0gcmlnaHQgYXdheSwKYXMgdGhhdCBvbmUgaXMgcHJldHR5IGxpa2VseSB0
byBnbyBpbiByZWxhdGl2ZWx5IHNvb24gYWZ0ZXIgYnJhbmNoaW5nLiBJZiB5b3UKY2hvb3NlIHRv
IGRvIHNvLCBwbGVhc2UgZG9uJ3QgZm9yZ2V0IHRvIG1lbnRpb24gdGhlIGRlcGVuZGVuY3kgYXMg
bG9uZwphcyB0aGUgb3RoZXIgc2VyaWVzIGhhc24ndCBnb25lIGluLgoKPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL210cnIuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vbXRyci5jCj4gQEAgLTY2
NiwzNiArNjY2LDQyIEBAIGludCBodm1fc2V0X21lbV9waW5uZWRfY2FjaGVhdHRyKHN0cnVjdCBk
b21haW4gKmQsIAo+IHVpbnQ2NF90IGdmbl9zdGFydCwKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4g
IAo+IC1zdGF0aWMgaW50IGh2bV9zYXZlX210cnJfbXNyKHN0cnVjdCBkb21haW4gKmQsIGh2bV9k
b21haW5fY29udGV4dF90ICpoKQo+ICtzdGF0aWMgdm9pZCBodm1fc2F2ZV9tdHJyX21zcl9vbmUo
c3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfbXRyciAqaHdfbXRycikKPiAgewo+ICsgICAg
c3RydWN0IG10cnJfc3RhdGUgKm10cnJfc3RhdGUgPSAmdi0+YXJjaC5odm1fdmNwdS5tdHJyOwoK
Y29uc3QgKGFuZCBpbiBjYXNlIEkndmUgb3Zlcmxvb2tlZCBhbnkgc3VjaCBoZWxwZXIgcG9pbnRl
ciBpbiBvdGhlcgpwYXRjaGVzLCBwbGVhc2UgYXBwbHkgdGhpcyBjb21tZW50IHRoZXJlIGFzIHdl
bGwpCgpKYW4KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTgtMDYvbXNnMDA0ODcuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
