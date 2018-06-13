From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/17] ts-xen-install: Create
 xen-qemuuser-range-base
Date: Wed, 13 Jun 2018 14:03:53 +0100
Message-ID: <1528895042-14113-9-git-send-email-ian.jackson@eu.citrix.com>
References: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ytt=i7=citrix.com=prvs=695a74e14=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fT5Rg-0005Kx-JD
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 13:04:16 +0000
In-Reply-To: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
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

SXQgaXMgZmluZSB0byBkbyBpbiBhbGwgam9icy4gIGxpYnhsIHdpbGwgb25seSB1c2UgdGhpcyBp
ZiB3ZSBhc2sgaXQKdG8uCgpXZSBkbyBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgdGhlIHVzZXIgZXhp
c3RzIGFscmVhZHksIHNpbmNlIGFkZHVzZXIKZG9lcyBub3Qgc2VlbSB0byBoYXZlIGEgbW9kZSB3
aGljaCBleGl0cyB6ZXJvIGluIHRoYXQgY2FzZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLXhlbi1pbnN0YWxsIHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy14ZW4taW5z
dGFsbCBiL3RzLXhlbi1pbnN0YWxsCmluZGV4IDk5MTNlODUuLjFlYzIzNmYgMTAwNzU1Ci0tLSBh
L3RzLXhlbi1pbnN0YWxsCisrKyBiL3RzLXhlbi1pbnN0YWxsCkBAIC0xMjksNiArMTI5LDkgQEAg
RU5ECiB9CiAKIHN1YiBhZGp1c3Rjb25maWcgKCkgeworICAgIG15ICRxdXNlciA9ICd4ZW4tcWVt
dXVzZXItcmFuZ2UtYmFzZSc7CisgICAgdGFyZ2V0X2NtZF9yb290KCRobywgImlkICRxdXNlciB8
fCBhZGR1c2VyIC0tc3lzdGVtIC0tdWlkPTIwMDAwMCAkcXVzZXIiKTsKKwogICAgIHRhcmdldF9l
ZGl0ZmlsZV9yb290KCRobywgIi9ldGMveGVuL3hlbmQtY29uZmlnLnN4cCIsCiAJCQkgInhlbmQt
Y29uZmlnLnN4cCIsIHN1YiB7CiAJbXkgKEBkb21haW5zKSA9IChxdyhsb2NhbGhvc3QgbG9jYWxo
b3N0LmxvY2FsZG9tYWluKSwKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
