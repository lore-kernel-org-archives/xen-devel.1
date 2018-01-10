From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH v3 01/24] ---- x86/Kconfig: Options for Xen and
	PVH support
Date: Tue, 9 Jan 2018 16:02:35 -0800
Message-ID: <1515542578-15412-2-git-send-email-aliguori@amzn.com>
References: <1515542578-15412-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9dv8=ef=amzn.com=prvs=541bb313f=aliguori@srs-us1.protection.inumbo.net>)
 id 1eZ3rP-0005m5-Dv
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 00:03:15 +0000
In-Reply-To: <1515542578-15412-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L0tjb25maWcgfCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hl
bi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDdjNDU4MjkuLjA3NTMwYmYgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0xMTcsNiAr
MTE3LDIzIEBAIGNvbmZpZyBUQk9PVAogCSAgVGVjaG5vbG9neSAoVFhUKQogCiAJICBJZiB1bnN1
cmUsIHNheSBZLgorCitjb25maWcgWEVOX0dVRVNUCisJZGVmX2Jvb2wgeQorCXByb21wdCAiWGVu
IEd1ZXN0IgorCS0tLWhlbHAtLS0KKwkgIFN1cHBvcnQgZm9yIFhlbiBkZXRlY3Rpbmcgd2hlbiBp
dCBpcyBydW5uaW5nIHVuZGVyIFhlbi4KKworCSAgSWYgdW5zdXJlLCBzYXkgWS4KKworY29uZmln
IFBWSF9HVUVTVAorCWRlZl9ib29sIG4KKwlwcm9tcHQgIlBWSCBHdWVzdCIKKwlkZXBlbmRzIG9u
IFhFTl9HVUVTVAorCS0tLWhlbHAtLS0KKwkgIFN1cHBvcnQgYm9vdGluZyB1c2luZyB0aGUgUFZI
IEFCSS4KKworCSAgSWYgdW5zdXJlLCBzYXkgTi4KIGVuZG1lbnUKIAogc291cmNlICJjb21tb24v
S2NvbmZpZyIKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
