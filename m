From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v1 0/2] Fix Broadwell microcode update after
 idle-scrub was added
Date: Tue, 27 Nov 2018 10:00:32 +0000
Message-ID: <20181127100034.4257-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpc3N1ZSB3YXMgZGlzY292ZXJlZCBkdXJpbmcgaW50ZXJuYWwgdGVzdGluZy4KClNlcmdl
eSBEeWFzbGkgKDIpOgogIHN5c3RlbV9zdGF0ZTogaW50cm9kdWNlIFNZU19TVEFURV9zbXBfYm9v
dGVkCiAgY29tbW9uL3BhZ2VfYWxsb2M6IGRvbid0IGlkbGUtc2NydWIgYmVmb3JlIG1pY3JvY29k
ZSB1cGRhdGUKCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgfCA2ICsrKysrKwogeGVuL2FyY2gv
eDg2L3NldHVwLmMgICAgIHwgNCArKysrCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgfCA3ICsr
KysrKysKIHhlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaCB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
