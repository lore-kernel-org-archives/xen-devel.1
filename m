From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] PDX fixes
Date: Mon, 3 Jun 2019 15:01:43 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXv1V-0003Mb-J4
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:01:45 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: julien.grall@arm.com, sstabellini@kernel.org, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaXMgYSBzbWFsbCBjb2xsZWN0aW9uIG9mIFBEWCBmaXhlcy4g
VGhleSBhcmUgdGVjaG5pY2FsbHkKaW5kZXBlbmRlbnQgYnV0IGRpc2NvdmVyZWQgdG9nZXRoZXIg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIG1lbW9yeQp3YXN0ZSBjYXVzZWQgYnkgdGhlIGZyYW1l
dGFibGUgYWxsb2NhdGlvbiBvbiBYaWxpbnggWnlucU1QLgoKQ2hlZXJzLAoKU3RlZmFubwoKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODQ0YWEwYTEzZDM0ZTlhMzQxYTgzNzQx
MTlkMmVkNjdkNGRjZDZiYjoKCiAgc2NoZWRfbnVsbDogc3VwZXJmaWNpYWwgY2xlYW4tdXBzICgy
MDE5LTA2LTAzIDE3OjU2OjIwICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1odHRwL3Blb3Bs
ZS9zc3RhYmVsbGluaS94ZW4tdW5zdGFibGUuZ2l0IAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIGM5MmY1ODllN2NmNjZmYzljM2FkOGE4MTJjZGJjNjkyMTRhODEyZDE6CgogIHhlbi9h
cm06IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sgKDIwMTktMDYtMDMgMTQ6
NDI6MTAgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoMyk6CiAgICAgIHhlbi9h
cm06IGZpeCBucl9wZHhzIGNhbGN1bGF0aW9uCiAgICAgIHhlbjogYWN0dWFsbHkgc2tpcCB0aGUg
Zmlyc3QgTUFYX09SREVSIGJpdHMgaW4gcGZuX3BkeF9ob2xlX3NldHVwCiAgICAgIHhlbi9hcm06
IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sKCiB4ZW4vYXJjaC9hcm0vbW0u
YyAgICB8ICA0ICsrLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgIDkgKysrKysrKystCiB4ZW4v
Y29tbW9uL3BkeC5jICAgICB8IDE0ICsrKysrKysrKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
