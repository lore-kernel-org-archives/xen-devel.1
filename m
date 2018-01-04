From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 04/74] tools/libxc: initialise hvm loader
	elf log fd to get more logging
Date: Thu, 4 Jan 2018 13:05:15 +0000
Message-ID: <20180104130625.28605-5-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5Ea-0000YC-TH
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:07:00 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGli
eGMveGNfZG9tX2h2bWxvYWRlci5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMgYi90b29scy9s
aWJ4Yy94Y19kb21faHZtbG9hZGVyLmMKaW5kZXggNTlmOTRlNTFlNS4uMDJjM2VhZWYzOCAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfZG9tX2h2bWxvYWRlci5jCisrKyBiL3Rvb2xzL2xpYnhj
L3hjX2RvbV9odm1sb2FkZXIuYwpAQCAtNjYsNiArNjYsNyBAQCBzdGF0aWMgZWxmX25lZ2Vycm5v
dmFsIHhjX2RvbV9wcm9iZV9odm1fa2VybmVsKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAg
ICAgICAgcmV0dXJuIHJjOwogCiAgICAgcmMgPSBlbGZfaW5pdCgmZWxmLCBkb20tPmtlcm5lbF9i
bG9iLCBkb20tPmtlcm5lbF9zaXplKTsKKyAgICB4Y19lbGZfc2V0X2xvZ2ZpbGUoZG9tLT54Y2gs
ICZlbGYsIDEpOwogICAgIGlmICggcmMgIT0gMCApCiAgICAgICAgIHJldHVybiByYzsKIAotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
