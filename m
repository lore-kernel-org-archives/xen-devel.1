From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 01/21] ts-hosts-allocate-Executive: with
 -U, just append to the same logfile
Date: Thu, 18 Apr 2019 17:31:38 +0100
Message-ID: <20190418163158.11408-2-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xM-00023B-8j
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:12 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBtdWNoIG1vcmUgY29udmVuaWVudCBmb3IgYWQtaG9jIHVzZS4KClNpZ25lZC1vZmYt
Ynk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWhvc3Rz
LWFsbG9jYXRlLUV4ZWN1dGl2ZSB8IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMtaG9zdHMtYWxsb2NhdGUt
RXhlY3V0aXZlIGIvdHMtaG9zdHMtYWxsb2NhdGUtRXhlY3V0aXZlCmluZGV4IGRjZmM3MGYyLi4z
ZGExMzhiMSAxMDA3NTUKLS0tIGEvdHMtaG9zdHMtYWxsb2NhdGUtRXhlY3V0aXZlCisrKyBiL3Rz
LWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQpAQCAtNzUsMTYgKzc1LDE4IEBAIHN1YiBzZXR1cCAo
KSB7CiAKICAgICAkdGFza2lkPSBmaW5kdGFzaygpOwogCi0gICAgbXkgJGxvZ2Jhc2UgPSAiaG9z
dHMtYWxsb2NhdGUuZGVidWciLigkY29tcHJlc3NkZWJ1Zz8iLmd6IjoiIik7Ci0gICAgbXkgJGxv
Z2ZoID0gb3Blbl91bmlxdWVfc3Rhc2hmaWxlIFwkbG9nYmFzZTsKKyAgICBteSAkbG9nYmFzZSA9
ICJob3N0cy1hbGxvY2F0ZS5kZWJ1ZyI7CiAgICAgaWYgKCRjb21wcmVzc2RlYnVnKSB7CisJJGxv
Z2Jhc2UgLj0gIi5neiI7CisJbXkgJGxvZ2ZoID0gb3Blbl91bmlxdWVfc3Rhc2hmaWxlIFwkbG9n
YmFzZTsKIAlteSAkbG9nY2hpbGQgPSBvcGVuIERFQlVHLCAifC0iOyAgZGVmaW5lZCAkbG9nY2hp
bGQgb3IgZGllICQhOwogCWlmICghJGxvZ2NoaWxkKSB7CiAJICAgIG9wZW4gU1RET1VULCAiPiYi
LCAkbG9nZmggb3IgZGllICQhOwogCSAgICBleGVjICJnemlwIiBvciBkaWUgJCE7CiAJfQogICAg
IH0gZWxzZSB7Ci0Jb3BlbiBERUJVRywgIj4mIiwgJGxvZ2ZoIG9yIGRpZSAkITsKKwlteSAkbG9n
ZmggPSAiJHN0YXNoLyRsb2diYXNlIjsKKwlvcGVuIERFQlVHLCAiPj4iLCAkbG9nZmggb3IgZGll
ICQhOwogICAgIH0KICAgICBERUJVRy0+YXV0b2ZsdXNoKDEpOwogICAgIGxvZ20oImhvc3QgYWxs
b2NhdGlvbiBkZWJ1ZyBsb2cgaW4gJGxvZ2Jhc2UiKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
