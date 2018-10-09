From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/3] x86: make rsdp address accessible via
 boot params
Date: Tue,  9 Oct 2018 12:54:34 +0200
Message-ID: <20181009105437.5471-1-jgross__37216.657101135$1539082410$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nckf=mv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g9pf1-0004di-Vz
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 10:54:44 +0000
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
aCAgICAgICAgICAgfCAgMiArKwogYXJjaC94ODYvaW5jbHVkZS9hc20veDg2X2luaXQuaCAgICAg
ICB8ICAyICsrCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oIHwgIDQgKysr
KwogYXJjaC94ODYva2VybmVsL2FjcGkvYm9vdC5jICAgICAgICAgICB8ICA2ICsrKysrKwogYXJj
aC94ODYva2VybmVsL2hlYWQzMi5jICAgICAgICAgICAgICB8ICAxICsKIGFyY2gveDg2L2tlcm5l
bC9oZWFkNjQuYyAgICAgICAgICAgICAgfCAgMiArKwogYXJjaC94ODYva2VybmVsL3NldHVwLmMg
ICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCiBhcmNoL3g4Ni9rZXJuZWwveDg2
X2luaXQuYyAgICAgICAgICAgIHwgIDMgKy0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5j
ICAgICAgICAgIHwgIDIgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
