From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] hpet: add support for level triggered
 interrupts
Date: Fri, 30 Mar 2018 13:35:58 +0100
Message-ID: <20180330123600.22716-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b5zd=gu=citrix.com=prvs=620b6eee9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f1tGR-00039j-6P
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 12:36:15 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpQYXRjaCAxIGlzIGEgcHJlLXJlcXVpc2l0ZSBmb3IgcGF0Y2ggMiB0aGF0IGFkZHMg
c3VwcG9ydCBmb3IgbGV2ZWwKdHJpZ2dlcmVkIGludGVycnVwdHMgdG8gdGhlIGVtdWxhdGVkIEhQ
RVQgY29kZS4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIHg4Ni92cHQ6
IGV4ZWN1dGUgY2FsbGJhY2tzIGZvciBtYXNrZWQgaW50ZXJydXB0cwogIHZocGV0OiBhZGQgc3Vw
cG9ydCBmb3IgbGV2ZWwgdHJpZ2dlcmVkIGludGVycnVwdHMKCiB4ZW4vYXJjaC94ODYvaHZtL2hw
ZXQuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0K
IHhlbi9hcmNoL3g4Ni9odm0vdnB0LmMgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQoKLS0gCjIuMTYuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
