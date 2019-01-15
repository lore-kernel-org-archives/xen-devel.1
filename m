From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v4 14/14] xsm,
 argo: notify: don't describe rings that cannot be sent to
Date: Tue, 15 Jan 2019 01:27:46 -0800
Message-ID: <1547544466-21135-15-git-send-email-christopher.w.clark@gmail.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjL1M-0003p4-No
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 09:28:32 +0000
Received: by mail-io1-xd43.google.com with SMTP id m19so1540821ioh.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 01:28:32 -0800 (PST)
In-Reply-To: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KQWNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2Eu
Z292PgotLS0KdjMgIzEwIFJvZ2VyOiBkcm9wIG91dCBsYWJlbCwgdXNlIHJldHVybiAtRUZBVUxU
IGluIGZpbGxfcmluZ19kYXRhCnYzOiBBZGQgRGFuaWVsJ3MgQWNrZWQtYnkKCiB4ZW4vY29tbW9u
L2FyZ28uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2FyZ28uYyBiL3hlbi9jb21tb24vYXJnby5jCmlu
ZGV4IDIzYjYxYmYuLmNlZDhkNDcgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vYXJnby5jCisrKyBi
L3hlbi9jb21tb24vYXJnby5jCkBAIC0xMjYxLDYgKzEyNjEsNyBAQCBmaWxsX3JpbmdfZGF0YShj
b25zdCBzdHJ1Y3QgZG9tYWluICpjdXJyZCwKICAgICB4ZW5fYXJnb19yaW5nX2RhdGFfZW50X3Qg
ZW50OwogICAgIHN0cnVjdCBkb21haW4gKmRzdF9kOwogICAgIHN0cnVjdCBhcmdvX3JpbmdfaW5m
byAqcmluZ19pbmZvOworICAgIGludCByZXQ7CiAKICAgICBBU1NFUlQoY3VycmQgPT0gY3VycmVu
dC0+ZG9tYWluKTsKICAgICBBU1NFUlQoTE9DS0lOR19SZWFkX0wxKTsKQEAgLTEyNzgsNiArMTI3
OSwxNyBAQCBmaWxsX3JpbmdfZGF0YShjb25zdCBzdHJ1Y3QgZG9tYWluICpjdXJyZCwKICAgICB7
CiAgICAgICAgIGlmICggZHN0X2QtPmFyZ28gKQogICAgICAgICB7CisgICAgICAgICAgICAvKgor
ICAgICAgICAgICAgICogRG9uJ3Qgc3VwcGx5IGluZm9ybWF0aW9uIGFib3V0IHJpbmdzIHRoYXQg
YSBndWVzdCBpcyBub3QKKyAgICAgICAgICAgICAqIGFsbG93ZWQgdG8gc2VuZCB0by4KKyAgICAg
ICAgICAgICAqLworICAgICAgICAgICAgcmV0ID0geHNtX2FyZ29fc2VuZChjdXJyZCwgZHN0X2Qp
OworICAgICAgICAgICAgaWYgKCByZXQgKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAg
IHB1dF9kb21haW4oZHN0X2QpOworICAgICAgICAgICAgICAgIHJldHVybiByZXQ7CisgICAgICAg
ICAgICB9CisKICAgICAgICAgICAgIHJlYWRfbG9jaygmZHN0X2QtPmFyZ28tPnJpbmdzX0wyX3J3
bG9jayk7CiAKICAgICAgICAgICAgIHJpbmdfaW5mbyA9IGZpbmRfcmluZ19pbmZvX2J5X21hdGNo
KGRzdF9kLCBlbnQucmluZy5hcG9ydCwKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
