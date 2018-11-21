From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 01/14] x86/soft-reset: Drop gfn reference after
 calling get_gfn_query()
Date: Wed, 21 Nov 2018 13:21:09 +0000
Message-ID: <1542806482-24030-2-git-send-email-andrew.cooper3@citrix.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Z2V0X2dmbl9xdWVyeSgpIGludGVybmFsbHkgdGFrZXMgdGhlIHAybSBsb2NrLCBhbmQgdGhpcyBl
cnJvciBwYXRoIGxlYXZlcyBpdApsb2NrZWQuCgpUaGlzIHdhc24ndCBpbmNsdWRlZCBpbiBYU0Et
Mjc3IGJlY2F1c2UgdGhlIGVycm9yIHBhdGggY2FuIG9ubHkgYmUgdHJpZ2dlcmVkCmJ5IGEgY2Fy
ZWZ1bGx5IHRpbWVkIHBoeW1hcCBvcGVyYXRpb24gY29uY3VycmVudCB3aXRoIHRoZSBkb21haW4g
YmVpbmcgcGF1c2VkCmFuZCB0aGUgdG9vbHN0YWNrIGlzc3VpbmcgRE9NQ1RMX3NvZnRfcmVzZXQu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
ZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKaW5kZXggMjk1YjEwYy4uYjRkNTk0OCAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21h
aW4uYwpAQCAtNzI1LDcgKzcyNSw3IEBAIGludCBhcmNoX2RvbWFpbl9zb2Z0X3Jlc2V0KHN0cnVj
dCBkb21haW4gKmQpCiAgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIkZhaWxlZCB0byBnZXQg
RG9tJWQncyBzaGFyZWRfaW5mbyBHRk4gKCVseClcbiIsCiAgICAgICAgICAgICAgICBkLT5kb21h
aW5faWQsIGdmbik7CiAgICAgICAgIHJldCA9IC1FSU5WQUw7Ci0gICAgICAgIGdvdG8gZXhpdF9w
dXRfcGFnZTsKKyAgICAgICAgZ290byBleGl0X3B1dF9nZm47CiAgICAgfQogCiAgICAgbmV3X3Bh
Z2UgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgMCk7Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
