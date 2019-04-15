From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 2/2] DO NOT APPLY git-checkout.sh: add sleep to
 demonstrate race
Date: Mon, 15 Apr 2019 17:28:09 +0100
Message-ID: <20190415162809.23675-3-ian.jackson@eu.citrix.com>
References: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbw4=SR=citrix.com=prvs=001b8ac9c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hG4Sx-0007UR-4n
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 16:28:19 +0000
In-Reply-To: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
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

VGhpcyBhbGxvd3MgZWFzeSByZXByb2R1Y3Rpb24gb2YgZ2l0LWNoZWNrb3V0IHJhY2VzOiBlYWNo
IGNoZWNrb3V0CndhaXRzIHVudGlsIHlvdSBraWxsIGl0cyBzbGVlcC4gIFlvdSBjYW4gc2VlIHRo
ZSBtdWx0aXBsZSBpZGVudGljYWwKY2hlY2tvdXQgcnVuZXMgaW4gcHMgZXRjLiAgQSBnb29kIHJ1
bmUgaXM6CiAgd2F0Y2ggJ3BzIC1mSHRwdHMvNjAnCihyZXBsYWNpbmcgcHRzLzYwIHdpdGggdGhl
IHB0eSBvZiB5b3VyIGJ1aWxkIGpvYikuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBzY3JpcHRzL2dpdC1jaGVja291dC5zaCB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRz
L2dpdC1jaGVja291dC5zaCBiL3NjcmlwdHMvZ2l0LWNoZWNrb3V0LnNoCmluZGV4IDIwYWUzMWZm
MjMuLjI5MDAyNmFkMzIgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvZ2l0LWNoZWNrb3V0LnNoCisrKyBi
L3NjcmlwdHMvZ2l0LWNoZWNrb3V0LnNoCkBAIC0xMSw2ICsxMSw4IEBAIERJUj0kMwogCiBzZXQg
LWUKIAorc2xlZXAgMTAwMCB8fDoKKwogaWYgdGVzdCBcISAtZCAkRElSLXJlbW90ZTsgdGhlbgog
CXJtIC1yZiAkRElSLXJlbW90ZSAkRElSLXJlbW90ZS50bXAKIAlta2RpciAtcCAkRElSLXJlbW90
ZS50bXA7IHJtZGlyICRESVItcmVtb3RlLnRtcAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
