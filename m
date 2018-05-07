From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/5] fix several issues in documentation
Date: Mon,  7 May 2018 12:16:03 +0200
Message-ID: <20180507101608.797-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=25p9=h2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFdBq-0004DR-1U
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 10:16:18 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24gaGFzIHNldmVyYWwgaXNzdWVzIHJl
Z2FyZGluZwptaXNzaW5nIGFyY2hpdGVjdHVyZSBxdWFsaWZpZXJzIGFuZCBtaXNzaW5nIGRvY3Vt
ZW50YXRpb24gb2Ygb25lCnBhcmFtZXRlci4gRml4IHRob3NlLgoKU29tZSBvdGhlciBkb2N1bWVu
dHMgaGF2ZSBzeW50YXggaXNzdWVzLCB0b28sIHdoaWNoIHNob3cgdXAgd2hlbgp0cnlpbmcgdG8g
ZG8gIm1ha2UgYWxsIiBpbiB0aGUgZG9jcyBkaXJlY3RvcnkuIEZpeCB0aG9zZSBhcyB3ZWxsLgoK
Q2hhbmdlcyBpbiBWMjoKLSBkcm9wcGVkIHBhdGNoZXMgMSBhbmQgNCBhcyBhbHJlYWR5IGFwcGxp
ZWQKLSByZWJhc2VkIHRvIGN1cnJlbnQgc3RhZ2luZwotIHJlLWFkZGVkIGRyb3BwZWQgbGluZSBp
biBsaXZlcGF0Y2gubWFya2Rvd24gKEtvbnJhZCkKCkluIGNhc2UgdGhlIG1haW50YWluZXJzIGFy
ZSBmaW5lIHdpdGggbXkgY2hhbmdlcyBJIGJlbGlldmUgdGhlIHNlcmllcwpzaG91bGQgYmUgaW5j
bHVkZWQgaW4gNC4xMS4gU28gZm9yIHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpKdWVyZ2VuIEdyb3NzICg1KToKICBkb2M6IGFk
ZCBhcmNoaXRlY3R1cmUgcXVhbGlmaWVyIHRvIGJvb3QgcGFyYW1ldGVyIGVudHJpZXMKICBkb2M6
IGFkZCBjcmVkaXQyX2NhcF9wZXJpb2RfbXMgYm9vdCBwYXJhbWV0ZXIgZGVzY3JpcHRpb24KICBk
b2M6IGNvcnJlY3QgbGl2ZXBhdGNoLm1hcmtkb3duIHN5bnRheAogIGRvYzogY29ycmVjdCBmZWF0
dXJlLWxldmVsbGluZy5wYW5kb2Mgc3ludGF4CiAgZG9jOiBjb3JyZWN0IGludGVsX3Bzcl9jYXRf
Y2RwLnBhbmRvYyBzeW50YXgKCiBkb2NzL2ZlYXR1cmVzL2ZlYXR1cmUtbGV2ZWxsaW5nLnBhbmRv
YyB8ICAgMiArLQogZG9jcy9mZWF0dXJlcy9pbnRlbF9wc3JfY2F0X2NkcC5wYW5kb2MgfCAzNjYg
KysrKysrKysrKy0tLS0tLS0tLS0KIGRvY3MvbWlzYy9saXZlcGF0Y2gubWFya2Rvd24gICAgICAg
ICAgIHwgNTkwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUubWFya2Rvd24gICAgfCAxOTQgKysrKysrLS0tLS0KIDQgZmlsZXMgY2hh
bmdlZCwgNTUxIGluc2VydGlvbnMoKyksIDYwMSBkZWxldGlvbnMoLSkKCi0tIAoyLjEzLjYKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
