From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 0/3] x86: make rsdp address accessible via
 boot params
Date: Wed, 10 Oct 2018 08:14:53 +0200
Message-ID: <20181010061456.22238-1-jgross__16965.3740399101$1539152038$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mkav=mw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gA7lu-0002ke-Uh
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 06:15:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, corbet@lwn.net, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

SW4gdGhlIG5vbi1FRkkgYm9vdCBwYXRoIHRoZSBBQ1BJIFJTRFAgdGFibGUgaXMgY3VycmVudGx5
IGZvdW5kIHZpYQplaXRoZXIgRUJEQSBvciBieSBzZWFyY2hpbmcgdGhyb3VnaCBsb3cgbWVtb3J5
IGZvciB0aGUgUlNEUCBtYWdpYy4KVGhpcyByZXF1aXJlcyB0aGUgUlNEUCB0byBiZSBsb2NhdGVk
IGluIHRoZSBmaXJzdCAxTUIgb2YgcGh5c2ljYWwKbWVtb3J5LiBYZW4gUFZIIGd1ZXN0cywgaG93
ZXZlciwgZ2V0IHRoZSBSU0RQIGFkZHJlc3MgdmlhIHRoZSBzdGFydCBvZgpkYXkgaW5mb3JtYXRp
b24gYmxvY2suCgpJbiBvcmRlciB0byBzdXBwb3J0IGFuIGFyYml0cmFyeSBSU0RQIGFkZHJlc3Mg
dGhpcyBwYXRjaCBzZXJpZXMgYWRkcwp0aGUgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgUlNEUCB0
byB0aGUgYm9vdCBwYXJhbXMgc3RydWN0dXJlIGZpbGxlZApieSB0aGUgYm9vdCBsb2FkZXIuCgpK
dWVyZ2VuIEdyb3NzICgzKToKICB4ODYveGVuOiBmaXggYm9vdCBsb2FkZXIgdmVyc2lvbiByZXBv
cnRlZCBmb3IgcHZoIGd1ZXN0cwogIHg4Ni9ib290OiBhZGQgYWNwaSByc2RwIGFkZHJlc3MgdG8g
c2V0dXBfaGVhZGVyCiAgeDg2L2FjcGk6IHRha2UgcnNkcCBhZGRyZXNzIGZvciBib290IHBhcmFt
cyBpZiBhdmFpbGFibGUKCiBEb2N1bWVudGF0aW9uL3g4Ni9ib290LnR4dCAgICAgICAgICAgIHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGFyY2gveDg2L2Jvb3QvaGVhZGVy
LlMgICAgICAgICAgICAgICAgfCAgNiArKysrKy0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2FjcGku
aCAgICAgICAgICAgfCAgNyArKysrKysrCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ODZfaW5pdC5o
ICAgICAgIHwgIDIgKysKIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmggfCAg
NCArKysrCiBhcmNoL3g4Ni9rZXJuZWwvYWNwaS9ib290LmMgICAgICAgICAgIHwgIDYgKysrKysr
CiBhcmNoL3g4Ni9rZXJuZWwvaGVhZDMyLmMgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC94ODYv
a2VybmVsL2hlYWQ2NC5jICAgICAgICAgICAgICB8ICAyICsrCiBhcmNoL3g4Ni9rZXJuZWwvc2V0
dXAuYyAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKIGFyY2gveDg2L2tlcm5l
bC94ODZfaW5pdC5jICAgICAgICAgICAgfCAgMyArLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHZoLmMgICAgICAgICAgfCAgMiArLQogMTEgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
