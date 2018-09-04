From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 0/3] xen/arm: vgic-v3: Bug fixes
Date: Tue,  4 Sep 2018 20:21:50 +0100
Message-ID: <20180904192153.17210-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0yqp=ls=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fxGtm-0005QM-SC
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 19:22:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, shameerali.kolothum.thodi@huawei.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhlIGZpcnN0IDIgcGF0Y2hlcyBvZiB0aGUgc2VyaWVzIGFyZSBtZWFudCB0byBh
ZGRyZXNzIERvbTAgYm9vdCBmYWlsdXJlCndoZW4gb24gR0lDdjQgcGxhdGZvcm1zIGFzIHdlbGwg
YXMgd2hlbiB0aGUgbnVtYmVyIG9mIHZDUFVzIGlzIG5vdCBlcXVhbCB0bwp0aGUgbnVtYmVycyBv
ZiBwQ1BVcy4gVGhleSBzaG91bGQgYmUgYmFja3BvcnRlZCB1cCBYZW4gNC44LgoKUGF0Y2ggIzMg
c2hvdWxkIGFkZHJlc3MgZmFpbHVyZSB3aGVuIGZhaWxpbmcgdG8gY3JlYXRlIGd1ZXN0LiBJVFMg
aXMgc3RpbGwKdW5kZXIgRVhQRVJULCBzbyBJIHdvdWxkIG5vdCBjb25zaWRlciBpdCBhcyBiYWNr
cG9ydC4KCkNoZWVycywKCkp1bGllbiBHcmFsbCAoMyk6CiAgW25vdC1mb3ItdW5zdGFibGVdIHhl
bi9hcm06IHZnaWMtdjM6IERlbGF5IHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUKICAgIGRvbWFp
biBpbmZvcm1hdGlvbgogIHhlbi9hcm06IHZnaWMtdjM6IERvbid0IGNyZWF0ZSBlbXB0eSByZS1k
aXN0cmlidXRvciByZWdpb25zCiAgeGVuL2FybTogdmdpYy12My1pdHM6IE1ha2UgdmdpY192M19p
dHNfZnJlZV9kb21haW4gaWRlbXBvdGVudAoKIHhlbi9hcmNoL2FybS9naWMtdjMuYyAgICAgIHwg
MTAgKysrKysrKystLQogeGVuL2FyY2gvYXJtL3ZnaWMtdjMtaXRzLmMgfCAgNCArKysrCiB4ZW4v
YXJjaC9hcm0vdmdpYy12My5jICAgICB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
