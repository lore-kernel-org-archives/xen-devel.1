From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 4/7] docs/parse-support-md: pandoc2html_inline:
 print failing json
Date: Mon, 3 Dec 2018 12:16:29 +0000
Message-ID: <20181203121632.4654-5-ian.jackson@eu.citrix.com>
References: <20181203121632.4654-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pdlu=om=citrix.com=prvs=8685b8843=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gTn9Y-0006vF-PG
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 12:16:44 +0000
In-Reply-To: <20181203121632.4654-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWYgb3VyIHJ1biBvZiBwYW5kb2MgdG8gY29udmVydCBwaWVjZXMgb2YgbWFya3VwIGluIG91ciBo
YW5kLCBpbnRvCmh0bWwsIGZhaWxzLCBwcmludCB0aGUganNvbiB0aGF0IHdhcyByZWplY3RlZC4K
Ck5vIGNoYW5nZSBpbiBub24tZXJyb3IgY2FzZXMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBkb2NzL3BhcnNlLXN1cHBvcnQtbWQg
fCAxMSArKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL3BhcnNlLXN1cHBvcnQtbWQgYi9kb2NzL3BhcnNl
LXN1cHBvcnQtbWQKaW5kZXggZTJkMDE4N2RkMS4uYThmMjE2ZjEzMSAxMDA3NTUKLS0tIGEvZG9j
cy9wYXJzZS1zdXBwb3J0LW1kCisrKyBiL2RvY3MvcGFyc2Utc3VwcG9ydC1tZApAQCAtMjQ3LDEw
ICsyNDcsMTEgQEAgc3ViIHBhbmRvYzJodG1sX2lubGluZSAoJCkgewogICAgIG15ICgkY29udGVu
dCkgPSBAXzsKIAogICAgIG15ICRqc29uX2ZoID0gSU86OkZpbGU6Om5ld190bXBmaWxlIG9yIGRp
ZSAkITsKLSAgICBwcmludCAkanNvbl9maCB0b19qc29uKFsKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB7IHVuTWV0YSA9PiB7IH0gfSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBb
eyB0ID0+ICdQYXJhJywgYyA9PiAkY29udGVudCB9XSwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF0pIG9yIGRpZSAkITsKKyAgICBteSAkaiA9IHRvX2pzb24oWworICAgICAgICAgICAgICAg
ICAgICAgeyB1bk1ldGEgPT4geyB9IH0sCisgICAgICAgICAgICAgICAgICAgICBbeyB0ID0+ICdQ
YXJhJywgYyA9PiAkY29udGVudCB9XSwKKyAgICAgICAgICAgICAgICAgICAgXSkgb3IgZGllICQh
OworICAgIHByaW50ICRqc29uX2ZoICRqOwogICAgIGZsdXNoICRqc29uX2ZoIG9yIGRpZSAkITsK
ICAgICBzZWVrICRqc29uX2ZoLDAsMCBvciBkaWUgJCE7CiAKQEAgLTI3MCw3ICsyNzEsNyBAQCBz
dWIgcGFuZG9jMmh0bWxfaW5saW5lICgkKSB7CiAgICAgICAgICAgICBvcGVuIFNURElOLCAnPCYn
LCAkanNvbl9maCBvciBkaWUgJCE7CiAgICAgICAgICAgICBzeXN0ZW0gJ2pzb25fcHAnOwogICAg
ICAgICB9OwotICAgICAgICBkaWUgIlxuICQ/ICQhIjsKKyAgICAgICAgZGllICIkaiBcbiAkPyAk
ISI7CiAgICAgfQogCiAgICAgJGh0bWwgPX4gc3teXDxwXD59e30gb3IgZGllICIkaHRtbCA/IjsK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
