From: Andrea Righi <righi.andrea@gmail.com>
Subject: [PATCH] kprobes/x86/xen: blacklist non-attachable xen
 interrupt functions
Date: Mon, 10 Dec 2018 16:12:57 +0100
Message-ID: <20181210151256.GA1977__963.740659835999$1544455763$gmane$org@Dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jAYW=OT=gmail.com=righi.andrea@srs-us1.protection.inumbo.net>)
 id 1gWNEy-0005gX-SR
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 15:13:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id u3so10881728wrs.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Dec 2018 07:12:59 -0800 (PST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Masami Hiramatsu <mhiramat@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

QmxhY2tsaXN0IHN5bWJvbHMgaW4gWGVuIHByb2JlLXByb2hpYml0ZWQgYXJlYXMsIHNvIHRoYXQg
dXNlciBjYW4gc2VlCnRoZXNlIHByb2hpYml0ZWQgc3ltYm9scyBpbiBkZWJ1Z2ZzLgoKU2VlIGFs
c286IGE1MDQ4MGNiNmQ2MS4KClNpZ25lZC1vZmYtYnk6IEFuZHJlYSBSaWdoaSA8cmlnaGkuYW5k
cmVhQGdtYWlsLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94
ZW4tYXNtXzY0LlMgYi9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCmluZGV4IGJiMWMyZGEwMzgx
ZC4uMWU5ZWYwYmEzMGE1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCisr
KyBiL2FyY2gveDg2L3hlbi94ZW4tYXNtXzY0LlMKQEAgLTEyLDYgKzEyLDcgQEAKICNpbmNsdWRl
IDxhc20vc2VnbWVudC5oPgogI2luY2x1ZGUgPGFzbS9hc20tb2Zmc2V0cy5oPgogI2luY2x1ZGUg
PGFzbS90aHJlYWRfaW5mby5oPgorI2luY2x1ZGUgPGFzbS9hc20uaD4KIAogI2luY2x1ZGUgPHhl
bi9pbnRlcmZhY2UveGVuLmg+CiAKQEAgLTI0LDYgKzI1LDcgQEAgRU5UUlkoeGVuX1xuYW1lKQog
CXBvcCAlcjExCiAJam1wICBcbmFtZQogRU5EKHhlbl9cbmFtZSkKK19BU01fTk9LUFJPQkUoeGVu
X1xuYW1lKQogLmVuZG0KIAogeGVuX3B2X3RyYXAgZGl2aWRlX2Vycm9yCi0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
