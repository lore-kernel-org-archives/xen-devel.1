From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] vpci/msi: fix updating already bound MSI
 interrupts
Date: Tue, 8 May 2018 10:23:57 +0100
Message-ID: <20180508092359.6829-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=klyg=h3=citrix.com=prvs=65938511e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fFyqw-0003Wv-Bx
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 09:24:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGVyZSdzIGEgYnVnIGluIGN1cnJlbnQgdnBjaSBjb2RlIGZvciBNU0kgZW11bGF0
aW9uIHdoZW4gdXBkYXRpbmcgYW4KYWxyZWFkeSBib3VuZCBpbnRlcnJ1cHQuIFRoZSBjb2RlIHdp
bGwgZGlzYWJsZSBhbmQgZW5hYmxlIHRoZSBpbnRlcnJ1cHQKaW4gb3JkZXIgdG8gdXBkYXRlIHRo
ZSBiaW5kaW5nLCB3aGljaCBjYWxscyB1bm1hcF9kb21haW5fcGlycSB0aGF0CmRpc2FibGVzIHRo
ZSBnbG9iYWwgTVNJIGVuYWJsZSBmbGFnIGluIHRoZSBjb250cm9sIHJlZ2lzdGVyLgoKSW4gb3Jk
ZXIgdG8gZml4IHRoaXMgaW5jb3JyZWN0IGJlaGF2aW9yIGludHJvZHVjZSBhIG5ldyB1cGRhdGUg
aGVscGVyCnRoYXQgc2hvdWxkIGJlIHVzZWQgdG8gdXBkYXRlIHRoZSBiaW5kaW5ncyBvZiBhbiBh
bHJlYWR5IGVuYWJsZWQgZ3JvdXAKb2YgTVNJIGludGVycnVwdHMuCgpUaGFua3MsIFJvZ2VyLgoK
Um9nZXIgUGF1IE1vbm5lICgyKToKICB2cGNpL21zaTogc3BsaXQgY29kZSB0byBiaW5kIHBpcnEK
ICB2cGNpL21zaTogZml4IHVwZGF0ZSBvZiBib3VuZCBNU0kgaW50ZXJydXB0cwoKIHhlbi9hcmNo
L3g4Ni9odm0vdm1zaS5jIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0KIHhlbi9kcml2ZXJzL3ZwY2kvbXNpLmMgIHwgIDMgKy0KIHhlbi9pbmNsdWRlL3hlbi92
cGNpLmggIHwgIDIgKwogMyBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAzMCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
