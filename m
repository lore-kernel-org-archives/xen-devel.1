From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] Osstest/Debian: bootloader: Fix grub
 parsing for XSM and multiboot1
Date: Tue, 29 May 2018 12:15:04 +0100
Message-ID: <1527592504-23197-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g64s=iq=citrix.com=prvs=6804eb919=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fNcar-0000qK-0R
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 11:15:09 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

YmNhM2VkYjRhYzBkNjcwMDk4Yjc2MThjYmFjY2Y3NTc3YWNhMjY3YQogICJPc3N0ZXN0L0RlYmlh
bjogYm9vdGxvYWRlcjogVW5kZXJzdGFuZCBtdWx0aWJvb3QyIHN5bnRheCIKd2FzIHN1cHBvc2Vk
IHRvIGNoYW5nZSBgbXVsdGlib290JyBhbmQgYG1vZHVsZScgaW4gdGhlIGdydWIyIG1lbnUKcGFy
c2VyIHRvIGBtdWx0aWJvb3QyPycgYW5kIGBtb2R1bGUyPycuICBCdXQgdGhlIGVudHJ5IGZvciBt
YXRjaGluZwpYU00gcG9saWN5IGZpbGUgbGluZXMgd2FzIG1pc3NpbmcgdGhlID8sIHdoaWNoIGJy
b2tlIGFsbCBtdWx0aWJvb3QxClhTTSB0ZXN0cy4gIEZpeCB0aGlzLgoKUmVwb3J0ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDE2YjQ3YzUu
Ljk3ODljYTYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvRGViaWFuLnBtCisrKyBiL09zc3Rlc3QvRGVi
aWFuLnBtCkBAIC01MzIsNyArNTMyLDcgQEAgc3ViIHNldHVwYm9vdF9ncnViMiAoJCQkJCkgewog
ICAgICAgICAgICAgaWYgKG0vXlxzKm1vZHVsZTI/XHMqKD86XC9ib290KT9cLyhpbml0cmRcUysp
LykgewogICAgICAgICAgICAgICAgICRlbnRyeS0+e0luaXRyZH09ICQxOwogICAgICAgICAgICAg
fQotCSAgICBpZiAobS9eXHMqbW9kdWxlMlxzKlwvKHhlbnBvbGljeVxTKykvKSB7CisJICAgIGlm
IChtL15ccyptb2R1bGUyP1xzKlwvKHhlbnBvbGljeVxTKykvKSB7CiAgICAgICAgICAgICAgICAg
JGVudHJ5LT57WGVucG9saWN5fT0gJDE7CiAgICAgICAgICAgICB9CiAgICAgICAgIH0KLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
