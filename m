From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] Move RSDP address out of setup_header
Date: Tue, 20 Nov 2018 08:22:43 +0100
Message-ID: <20181120072245.5378-1-jgross__6127.49561337313$1542698500$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gP0N2-0007Lo-43
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 07:22:52 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, dkiper@oracle.com, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

SW5zdGVhZCBvZiBwYXNzaW5nIHRoZSBSU0RQIGFkZHJlc3MgZm9yIFhlbiBQVkggZ3Vlc3RzIGZy
b20gZ3J1YjIgdG8KdGhlIGtlcm5lbCBpbiBzZXR1cF9oZWFkZXIgbW92ZSBpdCBpbnRvIHRoZSBu
b24tbGVnYWN5IHBhcnQgb2YgdGhlCmJvb3RfcGFyYW1zIHN0cnVjdHVyZS4KClRoaXMgcGF0Y2gg
c2VyaWVzIHNob3VsZCBiZSBhcHBsaWVkIHJhdGhlciBzb29uZXIgdGhhbiBsYXRlciBpbiBvcmRl
cgp0byBhdm9pZCBzaGlwcGluZyBsaW51eCA0LjIwIHdpdGggYSBjb3JreSBib290IHByb3RvY29s
LgoKSnVlcmdlbiBHcm9zcyAoMik6CiAgeDg2L2Jvb3Q6IHJldmVydCBjb21taXQgYWU3ZTEyMzhl
NjhmMmEgKEFkZCBBQ1BJIFJTRFAgYWRkcmVzcyB0bwogICAgc2V0dXBfaGVhZGVyKQogIHg4Ni9h
Y3BpLCB4ODYvYm9vdDogVGFrZSBSU0RQIGFkZHJlc3MgZnJvbSBib290IHBhcmFtcyBpZiBhdmFp
bGFibGUKCiBEb2N1bWVudGF0aW9uL3g4Ni9ib290LnR4dCAgICAgICAgICAgIHwgMzIgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gveDg2L2Jvb3QvaGVhZGVyLlMgICAgICAg
ICAgICAgICAgfCAgNiArLS0tLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3g4Nl9pbml0LmggICAg
ICAgfCAgMiAtLQogYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFyYW0uaCB8ICA3ICsr
LS0tLS0KIGFyY2gveDg2L2tlcm5lbC9hY3BpL2Jvb3QuYyAgICAgICAgICAgfCAgMiArLQogYXJj
aC94ODYva2VybmVsL2hlYWQzMi5jICAgICAgICAgICAgICB8ICAxIC0KIGFyY2gveDg2L2tlcm5l
bC9oZWFkNjQuYyAgICAgICAgICAgICAgfCAgMiAtLQogYXJjaC94ODYva2VybmVsL3NldHVwLmMg
ICAgICAgICAgICAgICB8IDE3IC0tLS0tLS0tLS0tLS0tLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
