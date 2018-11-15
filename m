From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/4] x86/vvmx: Don't call vmsucceed() at the end
 of virtual_vmexit()
Date: Thu, 15 Nov 2018 13:52:50 +0000
Message-ID: <1542289970-32709-5-git-send-email-andrew.cooper3@citrix.com>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBlbmRzIHVwIGNvcnJ1cHRpbmcgTDEncyB2aWV3IG9mIFJGTEFHUyBieSBzZXR0aW5nIFpG
LiAgVGhlIGNvcnJlY3QgdmFsdWUKaXMgZXN0YWJsaXNoZWQgZWFybGllciBpbiB0aGUgZnVuY3Rp
b24uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KQ0M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KQ0M6
IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ0M6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyB8IDEg
LQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKaW5kZXggNDFj
NGUyZi4uYTcyYjUxOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwpAQCAtMTM3MSw3ICsxMzcxLDYgQEAgc3Rh
dGljIHZvaWQgdmlydHVhbF92bWV4aXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAg
ICAgIG52bXhfdXBkYXRlX2FwaWN2KHYpOwogCiAgICAgbnZjcHUtPm52X3Ztc3dpdGNoX2luX3By
b2dyZXNzID0gMDsKLSAgICB2bXN1Y2NlZWQocmVncyk7CiB9CiAKIHN0YXRpYyB2b2lkIG52bXhf
ZXB0cF91cGRhdGUodm9pZCkKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
