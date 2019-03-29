From: Juergen Gross <jgross@suse.com>
Subject: [PATCH RFC 19/49] xen/sched: add domain pointer to
 struct sched_item
Date: Fri, 29 Mar 2019 16:09:04 +0100
Message-ID: <20190329150934.17694-20-jgross@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9t8e-0003ar-Er
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:09:48 +0000
In-Reply-To: <20190329150934.17694-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgcG9pbnRlciB0byB0aGUgZG9tYWluIHRvIHN0cnVjdCBzY2hlZF9pdGVtIGluIG9yZGVy
IHRvIGF2b2lkCmhhdmluZyB0byBkZXJlZmVyZW5jZSB0aGUgdmNwdSBwb2ludGVyIG9mIHN0cnVj
dCBzY2hlZF9pdGVtIHRvIGZpbmQKdGhlIHJlbGF0ZWQgZG9tYWluLgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUu
YyAgICAgIHwgMyArKy0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCA5OTY2MGNl
ZTY3Li42MjVkNjI4N2MyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC0yNTcsNyArMjU3LDcgQEAgc3RhdGljIHZvaWQgc2No
ZWRfc3Bpbl91bmxvY2tfZG91YmxlKHNwaW5sb2NrX3QgKmxvY2sxLCBzcGlubG9ja190ICpsb2Nr
MiwKIHN0YXRpYyB2b2lkIHNjaGVkX2ZyZWVfaXRlbShzdHJ1Y3Qgc2NoZWRfaXRlbSAqaXRlbSkK
IHsKICAgICBzdHJ1Y3Qgc2NoZWRfaXRlbSAqcHJldl9pdGVtOwotICAgIHN0cnVjdCBkb21haW4g
KmQgPSBpdGVtLT52Y3B1LT5kb21haW47CisgICAgc3RydWN0IGRvbWFpbiAqZCA9IGl0ZW0tPmRv
bWFpbjsKIAogICAgIGlmICggZC0+c2NoZWRfaXRlbV9saXN0ID09IGl0ZW0gKQogICAgICAgICBk
LT5zY2hlZF9pdGVtX2xpc3QgPSBpdGVtLT5uZXh0X2luX2xpc3Q7CkBAIC0yOTMsNiArMjkzLDcg
QEAgc3RhdGljIHN0cnVjdCBzY2hlZF9pdGVtICpzY2hlZF9hbGxvY19pdGVtKHN0cnVjdCB2Y3B1
ICp2KQogCiAgICAgdi0+c2NoZWRfaXRlbSA9IGl0ZW07CiAgICAgaXRlbS0+dmNwdSA9IHY7Cisg
ICAgaXRlbS0+ZG9tYWluID0gZDsKIAogICAgIGZvciAoIHByZXZfaXRlbSA9ICZkLT5zY2hlZF9p
dGVtX2xpc3Q7ICpwcmV2X2l0ZW07CiAgICAgICAgICAgcHJldl9pdGVtID0gJigqcHJldl9pdGVt
KS0+bmV4dF9pbl9saXN0ICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5o
IGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggYjVjYmJiYmNiMS4uOWE1MjQwMTRk
MCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1
ZGUveGVuL3NjaGVkLWlmLmgKQEAgLTUwLDYgKzUwLDcgQEAgREVDTEFSRV9QRVJfQ1BVKHN0cnVj
dCBjcHVwb29sICosIGNwdXBvb2wpOwogREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCBzY2hlZF9yZXNv
dXJjZSAqLCBzY2hlZF9yZXMpOwogCiBzdHJ1Y3Qgc2NoZWRfaXRlbSB7CisgICAgc3RydWN0IGRv
bWFpbiAgICAgICAgICpkb21haW47CiAgICAgc3RydWN0IHZjcHUgICAgICAgICAgICp2Y3B1Owog
ICAgIHZvaWQgICAgICAgICAgICAgICAgICAqcHJpdjsgICAgICAvKiBzY2hlZHVsZXIgcHJpdmF0
ZSBkYXRhICovCiAgICAgc3RydWN0IHNjaGVkX2l0ZW0gICAgICpuZXh0X2luX2xpc3Q7Ci0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
