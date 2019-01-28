From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 09/17] tools/libvchan: notify server when
 client is connected
Date: Mon, 28 Jan 2019 22:30:26 +0100
Message-ID: <02ae82eafc7e64ba7fad883cb5f66cbe888e799d.1548710973.git-series.marmarek@invisiblethingslab.com>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sAWr=QE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1goEUZ-0001qK-58
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 21:30:55 +0000
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

TGV0IHRoZSBzZXJ2ZXIga25vdyB3aGVuIHRoZSBjbGllbnQgaXMgY29ubmVjdGVkLiBPdGhlcndp
c2Ugc2VydmVyIHdpbGwKbm90aWNlIG9ubHkgd2hlbiBjbGllbnQgc2VuZCBzb21lIGRhdGEuClRo
aXMgY2hhbmdlIGRvZXMgbm90IGJyZWFrIGV4aXN0aW5nIGNsaWVudHMsIGFzIGxpYnZjaGFuIHVz
ZXIgc2hvdWxkCmhhbmRsZSBzcHVyaW91cyBub3RpZmljYXRpb25zIGFueXdheSAoZm9yIGV4YW1w
bGUgYWNrbm93bGVkZ2Ugb2YgcmVtb3RlCnNpZGUgcmVhZGluZyB0aGUgZGF0YSkuCgpTaWduZWQt
b2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+Ci0tLQpJIGhhZCB0aGlzIHBhdGNoIGluIFF1YmVzIGZvciBhIGxvbmcgdGlt
ZSBhbmQgdG90YWxseSBmb3Jnb3QgaXQgd2Fzbid0CnVwc3RyZWFtIHRoaW5nLi4uCi0tLQogdG9v
bHMvbGlidmNoYW4vaW5pdC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90b29scy9saWJ2Y2hhbi9pbml0LmMgYi90b29scy9saWJ2Y2hhbi9p
bml0LmMKaW5kZXggMTgwODMzZC4uNTBhNjRjMSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlidmNoYW4v
aW5pdC5jCisrKyBiL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwpAQCAtNDQ3LDYgKzQ0Nyw5IEBAIHN0
cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fY2xpZW50X2luaXQoc3RydWN0IHhlbnRvb2xs
b2dfbG9nZ2VyICpsb2dnZXIsCiAJY3RybC0+cmluZy0+Y2xpX2xpdmUgPSAxOwogCWN0cmwtPnJp
bmctPnNydl9ub3RpZnkgPSBWQ0hBTl9OT1RJRllfV1JJVEU7CiAKKyAgICAvKiB3YWtlIHVwIHRo
ZSBzZXJ2ZXIgKi8KKyAgICB4ZW5ldnRjaG5fbm90aWZ5KGN0cmwtPmV2ZW50LCBjdHJsLT5ldmVu
dF9wb3J0KTsKKwogIG91dDoKIAlpZiAoeHMpCiAJCXhzX2RhZW1vbl9jbG9zZSh4cyk7Ci0tIApn
aXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
