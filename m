From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/3] resource allocation: PropEq,
 PropMinVer: support defaults
Date: Wed, 4 Jul 2018 11:56:31 +0100
Message-ID: <1530701791-32462-3-git-send-email-ian.jackson@eu.citrix.com>
References: <23356.42924.671628.339753@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qzb=ju=citrix.com=prvs=716786cb2=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fafSk-00018w-Py
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 10:56:42 +0000
In-Reply-To: <23356.42924.671628.339753@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHlvdSBjYW4gcGFzcyBhbm90aGVyIDotc2VwYXJhdGVkIGFyZ3VtZW50LCB0aGUgZGVmYXVs
dCB2YWx1ZSB0bwp1c2UgaWYgbm9uZSBpcyBzcGVjaWZpZWQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJveWdlckBGcmVlQlNELm9yZz4KLS0tCiBPc3N0ZXN0L1Jlc291cmNlQ29uZGl0aW9uL1Byb3BD
b21wYXJlQmFzZS5wbSB8IDExICsrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvUmVzb3VyY2VDb25k
aXRpb24vUHJvcENvbXBhcmVCYXNlLnBtIGIvT3NzdGVzdC9SZXNvdXJjZUNvbmRpdGlvbi9Qcm9w
Q29tcGFyZUJhc2UucG0KaW5kZXggZTFlZmU1Zi4uNWFmZjhmMyAxMDA2NDQKLS0tIGEvT3NzdGVz
dC9SZXNvdXJjZUNvbmRpdGlvbi9Qcm9wQ29tcGFyZUJhc2UucG0KKysrIGIvT3NzdGVzdC9SZXNv
dXJjZUNvbmRpdGlvbi9Qcm9wQ29tcGFyZUJhc2UucG0KQEAgLTM0LDEzICszNCwxNCBAQCBCRUdJ
TiB7CiB9CiAKIHN1YiBuZXcgewotICAgIG15ICgkY2xhc3MsICRuYW1lLCAkcHJvcCwgJHZhbCkg
PSBAXzsKKyAgICBteSAoJGNsYXNzLCAkbmFtZSwgJHByb3AsICR2YWwsICRkZWZ2YWwpID0gQF87
CiAKICAgICBkaWUgInByb3BuYW1lOiAkcHJvcD8iIHVubGVzcyBwcm9wbmFtZV9jaGVjaygkcHJv
cCk7CiAKICAgICByZXR1cm4gYmxlc3MgewogCVByb3AgPT4gJHByb3AsCi0JVmFsID0+ICR2YWwK
KwlWYWwgPT4gJHZhbCwKKyAgICAgICAgRGVmYXVsdFZhbCA9PiAkdmFsLAogICAgIH0sICRjbGFz
czsKIH0KIApAQCAtNjQsNyArNjUsMTEgQEAgRU5ECiAgICAgJGhwcm9wcS0+ZmluaXNoKCk7CiAg
ICAgCiAgICAgbXkgJHYgPSAkcm93LT5bMF07Ci0gICAgcmV0dXJuICR2OworICAgIHJldHVybiAk
diBpZiBkZWZpbmVkICR2OworCisgICAgcmV0dXJuICRwYy0+e0RlZmF1bHRWYWx9OworICAgICMg
aWYgbm8gZGVmYXVsdCBzcGVjaWZpZWQsIHJldHVybnMgdW5kZWYKKyAgICAjIHRoZW4gX2NoZWNr
IGdldHMgdG8gZGVjaWRlIHdoYXQgdG8gZG8KIH0KIAogc3ViIGNoZWNrIHsKLS0gCjIuMS40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
