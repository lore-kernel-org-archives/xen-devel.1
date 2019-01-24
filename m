From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Thu, 24 Jan 2019 20:33:34 +0200
Message-ID: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XLNC=QA=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmjoq-0002Yh-Hl
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:33:40 +0000
Received: by mail-lf1-x144.google.com with SMTP id e26so5077113lfc.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jan 2019 10:33:38 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQogeGVuL2FyY2gv
YXJtL2dpYy12Z2ljLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hlbi9h
cmNoL2FybS9naWMtdmdpYy5jCmluZGV4IDQ4OTIyZjUuLjY4NGYyZDEgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9naWMtdmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCkBAIC00
NDMsNyArNDQzLDcgQEAgaW50IHZnaWNfY29ubmVjdF9od19pcnEoc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCB2aXJxLAogICAgIGludCByZXQgPSAwOwogCiAg
ICAgLyogImRlc2MiIGlzIG9wdGlvbmFsIHdoZW4gd2UgZGlzY29ubmVjdCBhbiBJUlEuICovCi0g
ICAgQVNTRVJUKGNvbm5lY3QgJiYgZGVzYyk7CisgICAgQVNTRVJUKGNvbm5lY3QgfHwgZGVzYyk7
CiAKICAgICAvKiBXZSBhcmUgdGFraW5nIHRvIHJhbmsgbG9jayB0byBwcmV2ZW50IHBhcmFsbGVs
IGNvbm5lY3Rpb25zLiAqLwogICAgIHZnaWNfbG9ja19yYW5rKHZfdGFyZ2V0LCByYW5rLCBmbGFn
cyk7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
