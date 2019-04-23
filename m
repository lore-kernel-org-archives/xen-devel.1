From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/3] ts-syslog-server: --no-stdin option
Date: Tue, 23 Apr 2019 13:11:37 +0100
Message-ID: <20190423121139.25996-2-ian.jackson@eu.citrix.com>
References: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VyzP=SZ=citrix.com=prvs=009f8e5a5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hIuHE-0006OW-H2
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 12:11:56 +0000
In-Reply-To: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VXNlZnVsIHdoZW4gcnVubmluZyBvbiBhIHR0eSBpbnRlcmFjdGl2ZWx5LgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtc3lzbG9n
LXNlcnZlciB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90cy1zeXNsb2ctc2VydmVyIGIvdHMtc3lzbG9n
LXNlcnZlcgppbmRleCAxMjM0YmI3ZC4uMDZhMDdhZGYgMTAwNzU1Ci0tLSBhL3RzLXN5c2xvZy1z
ZXJ2ZXIKKysrIGIvdHMtc3lzbG9nLXNlcnZlcgpAQCAtMjgsNiArMjgsMTMgQEAgdXNlIFNvY2tl
dCBxdyhQRl9JTkVUIFNPQ0tfREdSQU0gSU5BRERSX0FOWQogCiB0c3JlYWRjb25maWcoKTsKIAor
b3VyICR1c2Vfc3RkaW4gPSAxOworCitpZiAoQEFSR1YgJiYgJEFSR1ZbMF0gZXEgJy0tbm8tc3Rk
aW4nKSB7CisgICAgJHVzZV9zdGRpbiA9IDA7CisgICAgc2hpZnQgQEFSR1Y7Cit9CisKIGRpZSBp
ZiBAQVJHViAmJiAkQVJHVlswXSA9fiBtL14tLzsKIAogbG9nbSgic3RhcnRpbmcgc3lzbG9nIHNl
cnZlciAuLi4iKTsKQEAgLTQyLDcgKzQ5LDggQEAgJG15YWRkciA9IGluZXRfbnRvYSgkbXlhZGRy
KTsKIAogc3RvcmVfcnVudmFyKCdzeXNsb2dfc2VydmVyJywiJG15YWRkcjokcG9ydCIpOwogCi1t
eSBAZmhzID0gcXcoUyBTVERJTik7CitteSBAZmhzID0gcXcoUyk7CitwdXNoIEBmaHMsIHF3KFNU
RElOKSBpZiAkdXNlX3N0ZGluOwogCiBmb3JlYWNoIG15ICRmaCAoQGZocykgewogICAgIG15ICRm
bCA9IGZjbnRsKCRmaCwgRl9HRVRGTCwgMCkgLy8gZGllICQhOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
