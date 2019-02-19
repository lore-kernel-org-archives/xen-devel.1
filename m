From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH tentitively for-4.12 0/4] x86/altp2m: Fix
 multiple security issues
Date: Tue, 19 Feb 2019 22:18:31 +0000
Message-ID: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
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
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgYXJlIG5vIFhTQXMgYmVjYXVzZSBhbHRwMm0gaXNuJ3Qgc2VjdXJpdHkgc3VwcG9ydGVk
LiAgSG93ZXZlciwgaXQgd291bGQKYmUgdmVyeSBuaWNlIHRvIGhhdmUgaXQgaW4gYSBsZXNzIGJy
b2tlbiBzdGF0ZSBmb3IgNC4xMi4KCk92ZXJhbGwgdGhlIHJpc2sgb2YgcmVncmVzc2lvbiB0byBv
dGhlciBwYXJ0cyBvZiBYZW4gaXMgbWluaW1hbCwgYXMgbW9zdCBvZgp0aGVzZSBjaGFuZ2VzIGFy
ZSBvbmx5IGluIGFsdHAybS1lbmFibGVkIHBhdGhzLgoKQW5kcmV3IENvb3BlciAoNCk6CiAgeGVu
L2NvbW1vbjogQnJlYWsgZG9tYWluX3VubWFwX3Jlc291cmNlcygpIG91dCBvZiBkb21haW5fa2ls
bCgpCiAgeDg2L2FsdHAybTogUmV3b3JrICNWRSBlbmFibGUvZGlzYWJsZSBwYXRocwogIHg4Ni92
bXg6IEZpeCBzZWN1cml0eSBpc3N1ZSB3aGVuIGEgZ3Vlc3QgYmFsbG9vbnMgb3V0IHRoZSAjVkUg
aW5mbyBwYWdlCiAgeDg2L3ZteDogUHJvcGVybHkgZmx1c2ggdGhlIFRMQiB3aGVuIGFuIGFsdHAy
bSBpcyBtb2RpZmllZAoKIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICB8ICA3ICsrKysK
IHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICB8IDE5ICsrLS0tLS0tLS0KIHhlbi9hcmNo
L3g4Ni9odm0vdm14L3ZteC5jICAgICB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLQogeGVuL2FyY2gveDg2L21tL2FsdHAybS5jICAgICAgIHwgODAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAg
ICAgICAgfCAxNiArKysrKysrLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvYWx0cDJtLmggICB8ICA0
ICsrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCAgIHwgIDMgKysKIHhlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3ZjcHUuaCB8ICA3ICsrKy0KIHhlbi9pbmNsdWRlL3hlbi9kb21haW4uaCAg
ICAgICB8ICA0ICsrKwogOSBmaWxlcyBjaGFuZ2VkLCAxNTMgaW5zZXJ0aW9ucygrKSwgNTYgZGVs
ZXRpb25zKC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
