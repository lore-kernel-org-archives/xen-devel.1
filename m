From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 17/17] libxl: require qemu in dom0 even if
 stubdomain is in use
Date: Mon, 28 Jan 2019 22:30:34 +0100
Message-ID: <4aaa28f3d5d50abc3d7f253afdb0d24946dd0d69.1548710973.git-series.marmarek@invisiblethingslab.com>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sAWr=QE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1goEUg-000207-Cu
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 21:31:02 +0000
In-Reply-To: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

VW50aWwgeGVuY29uc29sZWQgbGVhcm5zIGhvdyB0byBoYW5kbGUgbXVsdGlwbGUgY29uc29sZXMs
IHRoaXMgaXMgbmVlZGVkCmZvciBzYXZlL3Jlc3RvcmUgc3VwcG9ydCAocWVtdSBzdGF0ZSBpcyB0
cmFuc2ZlcnJlZCBvdmVyIHNlY29uZGFyeQpjb25zb2xlcykuCkFkZGl0aW9uYWxseSwgTGludXgt
YmFzZWQgc3R1YmRvbWFpbiB3YWl0cyBmb3IgYWxsIHRoZSBiYWNrZW5kcyB0bwppbml0aWFsaXpl
IGR1cmluZyBib290LiBMYWNrIG9mIHNvbWUgY29uc29sZSBiYWNrZW5kcyByZXN1bHRzIGluCnN0
dWJkb21haW4gc3RhcnR1cCB0aW1lb3V0LgoKVGhpcyBpcyBhIHRlbXBvcmFyeSBwYXRjaCB1bnRp
bCB4ZW5jb25zb2xlZCB3aWxsIGJlIGltcHJvdmVkLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0K
IHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IGNlNjUzMjEuLjBmZGMyZjggMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxf
ZG0uYwpAQCAtMjQzOCw3ICsyNDM4LDExIEBAIHN0YXRpYyB2b2lkIHNwYXduX3N0dWJfbGF1bmNo
X2RtKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgfQogICAgIH0KIAotICAgIG5lZWRfcWVtdSA9
IGxpYnhsX19uZWVkX3hlbnB2X3FlbXUoZ2MsIGRtX2NvbmZpZyk7CisgICAgLyoKKyAgICAgKiBV
bnRpbCB4ZW5jb25zb2xlZCBsZWFybnMgaG93IHRvIGhhbmRsZSBtdWx0aXBsZSBjb25zb2xlcywg
cmVxdWlyZSBxZW11CisgICAgICogaW4gZG9tMCwgc2luY2UgdGhlIGFib3ZlIGNvZGUgYWx3YXlz
IGFkZHMgYXQgbGVhc3QgMiBjb25zb2xlcy4KKyAgICAgKi8KKyAgICBuZWVkX3FlbXUgPSAxOwog
CiAgICAgZm9yIChpID0gMDsgaSA8IG51bV9jb25zb2xlOyBpKyspIHsKICAgICAgICAgbGlieGxf
X2RldmljZSBkZXZpY2U7Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
