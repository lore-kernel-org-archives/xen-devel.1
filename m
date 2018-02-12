From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH] libxc: check for null size file mapping
Date: Mon, 12 Feb 2018 13:09:15 +0100
Message-ID: <20180212120915.25515-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=agx5=fg=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1elCZk-0002Bh-Sn
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 11:47:13 +0000
Received: by mail-wr0-x241.google.com with SMTP id o76so11747776wrb.7
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2018 03:47:11 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Semel <semelpaul@gmail.com>, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdlZCB0aGUgZXJyb3IgbWVzc2FnZSB3aGVuIHRyeWluZyB0byBtYXAgYSBudWxsIHNpemUg
ZmlsZS4KV2hlbiBkb2luZyBgeGwgY3JlYXRlYCBjb21tYW5kLCB3ZSBnZXQgYW4gSW52YWxpZCBL
ZXJuZWwgZXJyb3IKd2hlbiB0aGUgZmlsZSBzaXplIGlzIGdyZWF0ZXIgdGhhbiB6ZXJvLiBGb3Ig
emVybyBsZW5ndGggZmlsZXMsIHdlIGFyZQpmYWxsaW5nIGluIHRoZSBtbWFwIGVycm9yLCBhbmQg
d2UgZ2V0IGFuIGBJbnZhbGlkIHBhcmFtZXRlcmAgZXJyb3IsCndoaWNoIGlzIG5vdCBleHBsaWNp
dC4gV2l0aCB0aGlzIGNoYW5nZSwgd2UgZ2V0IGEgYHplcm8gbGVuZ3RoIGZpbGVgCmVycm9yLgoK
U2lnbmVkLW9mZi1ieTogUGF1bCBTZW1lbCA8c2VtZWxwYXVsQGdtYWlsLmNvbT4KLS0tCiB0b29s
cy9saWJ4Yy94Y19kb21fY29yZS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19kb21fY29yZS5jIGIvdG9vbHMv
bGlieGMveGNfZG9tX2NvcmUuYwppbmRleCA5NmU3MWRkMmQ5Li45YmQwNGNiMmQ1IDEwMDY0NAot
LS0gYS90b29scy9saWJ4Yy94Y19kb21fY29yZS5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9j
b3JlLmMKQEAgLTIyNSw2ICsyMjUsMTIgQEAgdm9pZCAqeGNfZG9tX21hbGxvY19maWxlbWFwKHN0
cnVjdCB4Y19kb21faW1hZ2UgKmRvbSwKICAgICAgICAgICAgICAgICAgICAgICJ0cmllZCB0byBt
YXAgZmlsZSB3aGljaCBpcyB0b28gbGFyZ2UiKTsKICAgICAgICAgZ290byBlcnI7CiAgICAgfQor
ICAgIGVsc2UgaWYgKCAhKnNpemUgKQorICAgIHsKKyAgICAgICAgeGNfZG9tX3BhbmljKGRvbS0+
eGNoLCBYQ19JTlRFUk5BTF9FUlJPUiwKKyAgICAgICAgICAgICAgICAgICAgICInJXMnOiB6ZXJv
IGxlbmd0aCBmaWxlIiwgZmlsZW5hbWUpOworICAgICAgICBnb3RvIGVycjsKKyAgICB9CiAKICAg
ICBibG9jayA9IG1hbGxvYyhzaXplb2YoKmJsb2NrKSk7CiAgICAgaWYgKCBibG9jayA9PSBOVUxM
ICkgewotLSAKMi4xNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
