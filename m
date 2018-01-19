From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 6/7] Revert "x86/boot: Map more than the
	first 16MB"
Date: Fri, 19 Jan 2018 15:34:57 +0000
Message-ID: <20180119153458.22535-7-wei.liu2@citrix.com>
References: <20180119153458.22535-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecYjg-0002W5-M2
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 15:37:44 +0000
In-Reply-To: <20180119153458.22535-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXZlcnRzIGNvbW1pdCA3ZDZmOTU4ZDlkMThjNTQwMTdmNWVmNmUyOTlhMDgwMzdmMDM1
NzQ3LgoKTm93IHdlIGhhdmUgUFZIIGluZm8gcmVsb2NhdGlvbiBzdXBwb3J0LCB0aGlzIGNoYW5n
ZSBpcyBubyBsb25nZXIKbmVlZGVkLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jv
b3QveDg2XzY0LlMgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwppbmRleCA0MjYzNmNmMzM0
Li5jZjQ3ZTAxOWY1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUworKysg
Yi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpAQCAtMTE0LDEwICsxMTQsMTEgQEAgR0xPQkFM
KF9fcGFnZV90YWJsZXNfc3RhcnQpCiBHTE9CQUwobDJfaWRlbnRtYXApCiAgICAgICAgIC5xdWFk
IHN5bV9vZmZzKGwxX2lkZW50bWFwKSArIF9fUEFHRV9IWVBFUlZJU09SCiAgICAgICAgIGlkeCA9
IDEKLSAgICAgICAgLnJlcHQgNCAqIEwyX1BBR0VUQUJMRV9FTlRSSUVTIC0gMQorICAgICAgICAu
cmVwdCA3CiAgICAgICAgIC5xdWFkIChpZHggPDwgTDJfUEFHRVRBQkxFX1NISUZUKSB8IFBBR0Vf
SFlQRVJWSVNPUiB8IF9QQUdFX1BTRQogICAgICAgICBpZHggPSBpZHggKyAxCiAgICAgICAgIC5l
bmRyCisgICAgICAgIC5maWxsIDQgKiBMMl9QQUdFVEFCTEVfRU5UUklFUyAtIDgsIDgsIDAKICAg
ICAgICAgLnNpemUgbDJfaWRlbnRtYXAsIC4gLSBsMl9pZGVudG1hcAogCiAvKgotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
