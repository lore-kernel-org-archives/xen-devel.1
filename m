From: Baodong Chen <chenbaodong@mxnavi.com>
Subject: [PATCH] xen: schedule: initialize 'now' when really
 needed
Date: Fri, 31 May 2019 14:31:08 +0800
Message-ID: <1559284268-8280-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=USVC=T7=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWb4T-0004Hy-6o
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 06:31:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Baodong Chen <chenbaodong@mxnavi.com>, George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

d2hlbiAncGVyaW9kaWNfcGVyaW9kJyBpcyB6ZXJvLCB0aGVyZSBpcyBubyBuZWVkIHRvIGluaXRp
YWxpemUgJ25vdycuCgpTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14
bmF2aS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jIHwgMyArKy0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggNjZmMWUyNi4uODYz
NDFiYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24v
c2NoZWR1bGUuYwpAQCAtMTM4NSwxMiArMTM4NSwxMyBAQCBsb25nIHNjaGVkX2FkanVzdF9nbG9i
YWwoc3RydWN0IHhlbl9zeXNjdGxfc2NoZWR1bGVyX29wICpvcCkKIAogc3RhdGljIHZvaWQgdmNw
dV9wZXJpb2RpY190aW1lcl93b3JrKHN0cnVjdCB2Y3B1ICp2KQogewotICAgIHNfdGltZV90IG5v
dyA9IE5PVygpOworICAgIHNfdGltZV90IG5vdzsKICAgICBzX3RpbWVfdCBwZXJpb2RpY19uZXh0
X2V2ZW50OwogCiAgICAgaWYgKCB2LT5wZXJpb2RpY19wZXJpb2QgPT0gMCApCiAgICAgICAgIHJl
dHVybjsKIAorICAgIG5vdyA9IE5PVygpOwogICAgIHBlcmlvZGljX25leHRfZXZlbnQgPSB2LT5w
ZXJpb2RpY19sYXN0X2V2ZW50ICsgdi0+cGVyaW9kaWNfcGVyaW9kOwogCiAgICAgaWYgKCBub3cg
Pj0gcGVyaW9kaWNfbmV4dF9ldmVudCApCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
