From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH SpectreV1+L1TF v4 07/11] nospec: enable lfence
 on Intel
Date: Wed, 23 Jan 2019 12:57:31 +0100
Message-ID: <1548244655-32180-7-git-send-email-nmanthey@amazon.de>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eBhM=P7=amazon.de=prvs=91940689d=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gmHD2-0003vO-4W
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:00:44 +0000
In-Reply-To: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgdGhlIGxmZW5jZSBpbnN0cnVjdGlvbiB3YXMgYWRkZWQgZm9yIGFsbCB4ODYgcGxhdGZv
cm0gaW4gdGhlCmJlZ2lubmluZywgaXQncyB1c2VmdWwgdG8gbm90IGJsb2NrIHBsYXRmb3JtcyB0
aGF0IGFyZSBub3QgYWZmZWN0ZWQKYnkgdGhlIEwxVEYgdnVsbmVyYWJpbGl0eS4gVGhlcmVmb3Jl
LCB0aGUgbGZlbmNlIGluc3RydWN0aW9uIHNob3VsZApvbmx5IGJlIGludHJvZHVjZWQsIGluIGNh
c2UgdGhlIGN1cnJlbnQgQ1BVIGlzIGFuIEludGVsIENQVSB0aGF0IGlzCmNhcGFibGUgb2YgaHlw
ZXIgdGhyZWFkaW5nLiBUaGlzIGNvbWJpbmF0aW9uIG9mIGZlYXR1cmVzIGlzIGFkZGVkCnRvIHRo
ZSBmZWF0dXJlcyB0aGF0IGFjdGl2YXRlIHRoZSBhbHRlcm5hdGl2ZS4KClRoaXMgY29tbWl0IGlz
IHBhcnQgb2YgdGhlIFNwZWN0cmVWMStMMVRGIG1pdGlnYXRpb24gcGF0Y2ggc2VyaWVzLgoKU2ln
bmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CgotLS0KIHhl
bi9pbmNsdWRlL3hlbi9ub3NwZWMuaCB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L25vc3BlYy5oIGIveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCi0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9ub3NwZWMuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgKQEAgLTcsNiArNyw3IEBA
CiAjaWZuZGVmIFhFTl9OT1NQRUNfSAogI2RlZmluZSBYRU5fTk9TUEVDX0gKIAorI2luY2x1ZGUg
PGFzbS9hbHRlcm5hdGl2ZS5oPgogI2luY2x1ZGUgPGFzbS9zeXN0ZW0uaD4KIAogLyoqCkBAIC02
OCw3ICs2OSwxMCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlfaW5kZXhfbWFz
a19ub3NwZWModW5zaWduZWQgbG9uZyBpbmRleCwKICAqIGFsbG93IHRvIGluc2VydCBhIHJlYWQg
bWVtb3J5IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMKICAqLwogI2lmZGVmIENPTkZJR19YODYK
LXN0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7IHJtYigpOyByZXR1cm4gdHJ1
ZTsgfQorc3RhdGljIGlubGluZSBib29sIGxmZW5jZV90cnVlKHZvaWQpIHsKKyAgICBhbHRlcm5h
dGl2ZSgiIiwgImxmZW5jZSIsIFg4Nl9WRU5ET1JfSU5URUwpOworICAgIHJldHVybiB0cnVlOwor
fQogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7IHJldHVybiB0
cnVlOyB9CiAjZW5kaWYKQEAgLTkxLDcgKzk1LDcgQEAgc3RhdGljIGlubGluZSBib29sIGxmZW5j
ZV90cnVlKHZvaWQpIHsgcmV0dXJuIHRydWU7IH0KICAqIGFsbG93IHRvIGJsb2NrIHNwZWN1bGF0
aXZlIGV4ZWN1dGlvbiBpbiBnZW5lcmljIGNvZGUKICAqLwogI2lmZGVmIENPTkZJR19YODYKLSNk
ZWZpbmUgYmxvY2tfc3BlY3VsYXRpb24oKSBybWIoKQorI2RlZmluZSBibG9ja19zcGVjdWxhdGlv
bigpIGFsdGVybmF0aXZlKCIiLCAibGZlbmNlIiwgWDg2X1ZFTkRPUl9JTlRFTCkKICNlbHNlCiAj
ZGVmaW5lIGJsb2NrX3NwZWN1bGF0aW9uKCkKICNlbmRpZgotLSAKMi43LjQKCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIEhSQiAxNDkxNzMgQgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
