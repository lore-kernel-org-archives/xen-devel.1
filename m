From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.4 01/74] x86/asm/32: Make sync_core() handle
	missing CPUID on all 32-bit kernels
Date: Mon, 29 Jan 2018 13:56:06 +0100
Message-ID: <20180129123847.578496255__32919.1918870949$1517256253$gmane$org@linuxfoundation.org>
References: <20180129123847.507563674@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180129123847.507563674@linuxfoundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Peter Zijlstra <peterz@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Matthew Whitehead <tedheadster@gmail.com>, "Zhang,
 Ning A" <ning.a.zhang@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Brian Gerst <brgerst@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel <Xen-devel@lists.xen.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

NC40LXN0YWJsZSByZXZpZXcgcGF0Y2guICBJZiBhbnlvbmUgaGFzIGFueSBvYmplY3Rpb25zLCBw
bGVhc2UgbGV0IG1lIGtub3cuCgotLS0tLS0tLS0tLS0tLS0tLS0KCkZyb206IEFuZHkgTHV0b21p
cnNraSA8bHV0b0BrZXJuZWwub3JnPgoKY29tbWl0IDFjNTJkODU5Y2IyZDQxN2U3MjE2ZDNlNTZi
YjdmZWE4ODQ0NGNlYzkgdXBzdHJlYW0uCgpXZSBzdXBwb3J0IHZhcmlvdXMgbm9uLUludGVsIENQ
VXMgdGhhdCBkb24ndCBoYXZlIHRoZSBDUFVJRAppbnN0cnVjdGlvbiwgc28gdGhlIE00ODYgdGVz
dCB3YXMgd3JvbmcuICBGb3Igbm93LCBmaXggaXQgd2l0aCBhIGJpZwpoYW1tZXI6IGhhbmRsZSBt
aXNzaW5nIENQVUlEIG9uIGFsbCAzMi1iaXQgQ1BVcy4KClJlcG9ydGVkLWJ5OiBPbmUgVGhvdXNh
bmQgR25vbWVzIDxnbm9tZXNAbHhvcmd1ay51a3V1Lm9yZy51az4KU2lnbmVkLW9mZi1ieTogQW5k
eSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBC
cmlhbiBHZXJzdCA8YnJnZXJzdEBnbWFpbC5jb20+CkNjOiBNYXR0aGV3IFdoaXRlaGVhZCA8dGVk
aGVhZHN0ZXJAZ21haWwuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+CkNj
OiBIZW5yaXF1ZSBkZSBNb3JhZXMgSG9sc2NodWggPGhtaEBobWguZW5nLmJyPgpDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiB4ZW4tZGV2ZWwgPFhlbi1kZXZlbEBsaXN0
cy54ZW4ub3JnPgpMaW5rOiBodHRwOi8vbGttbC5rZXJuZWwub3JnL3IvNjg1YmQwODNhN2MwMzZm
Nzc2OTUxMGI2ODQ2MzE1YjE3ZDZiYTcxZi4xNDgxMzA3NzY5LmdpdC5sdXRvQGtlcm5lbC5vcmcK
U2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiAi
WmhhbmcsIE5pbmcgQSIgPG5pbmcuYS56aGFuZ0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgotLS0KIGFyY2gv
eDg2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
cm9jZXNzb3IuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaApAQCAtNTc0
LDcgKzU3NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzeW5jX2NvcmUodm9pZCkKIHsKIAlpbnQg
dG1wOwogCi0jaWZkZWYgQ09ORklHX000ODYKKyNpZmRlZiBDT05GSUdfWDg2XzMyCiAJLyoKIAkg
KiBEbyBhIENQVUlEIGlmIGF2YWlsYWJsZSwgb3RoZXJ3aXNlIGRvIGEganVtcC4gIFRoZSBqdW1w
CiAJICogY2FuIGNvbnZlbmllbnRseSBlbm91Z2ggYmUgdGhlIGp1bXAgYXJvdW5kIENQVUlELgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
