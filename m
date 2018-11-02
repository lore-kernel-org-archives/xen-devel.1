From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 2/8] tools/xenstore: Document that xs_close(0)
 is OK.
Date: Fri, 2 Nov 2018 17:01:07 +0000
Message-ID: <20181102170113.11646-3-ian.jackson@eu.citrix.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vtjf=nn=citrix.com=prvs=837fd0aa5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIcpX-0004ZG-CR
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 17:01:55 +0000
In-Reply-To: <20181102170113.11646-1-ian.jackson@eu.citrix.com>
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdG9vbHMveGVuc3RvcmUvaW5jbHVkZS94ZW5zdG9yZS5oIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGVu
c3RvcmUvaW5jbHVkZS94ZW5zdG9yZS5oIGIvdG9vbHMveGVuc3RvcmUvaW5jbHVkZS94ZW5zdG9y
ZS5oCmluZGV4IDA2NGI2MmM0NTUuLjg4OWRjMjM4NjMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hlbnN0
b3JlL2luY2x1ZGUveGVuc3RvcmUuaAorKysgYi90b29scy94ZW5zdG9yZS9pbmNsdWRlL3hlbnN0
b3JlLmgKQEAgLTc3LDcgKzc3LDcgQEAgdHlwZWRlZiB1aW50MzJfdCB4c190cmFuc2FjdGlvbl90
Owogc3RydWN0IHhzX2hhbmRsZSAqeHNfb3Blbih1bnNpZ25lZCBsb25nIGZsYWdzKTsKIAogLyog
Q2xvc2UgdGhlIGNvbm5lY3Rpb24gdG8gdGhlIHhzIGRhZW1vbi4gKi8KLXZvaWQgeHNfY2xvc2Uo
c3RydWN0IHhzX2hhbmRsZSAqeHNoKTsKK3ZvaWQgeHNfY2xvc2Uoc3RydWN0IHhzX2hhbmRsZSAq
eHNoIC8qIE5VTEwgb2sgKi8pOwogCiAvKiBDb25uZWN0IHRvIHRoZSB4cyBkYWVtb24uCiAgKiBS
ZXR1cm5zIGEgaGFuZGxlIG9yIE5VTEwuCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
