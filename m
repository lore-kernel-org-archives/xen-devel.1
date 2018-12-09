From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.16 233/328] x86/EISA: Don't probe EISA bus for
 Xen PV guests
Date: Sun, 09 Dec 2018 21:50:33 +0000
Message-ID: <lsq.1544392233.175880549@decadent.org.uk>
References: <lsq.1544392232.713909046@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZ7Y=OS=decadent.org.uk=ben@srs-us1.protection.inumbo.net>)
 id 1gW737-0000Jy-Md
 for xen-devel@lists.xenproject.org; Sun, 09 Dec 2018 21:55:41 +0000
Content-Disposition: inline
In-Reply-To: <lsq.1544392232.713909046@decadent.org.uk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, hpa@zytor.com, Andy Smith <andy@strugglers.net>, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

My4xNi42Mi1yYzEgcmV2aWV3IHBhdGNoLiAgSWYgYW55b25lIGhhcyBhbnkgb2JqZWN0aW9ucywg
cGxlYXNlIGxldCBtZSBrbm93LgoKLS0tLS0tLS0tLS0tLS0tLS0tCgpGcm9tOiBCb3JpcyBPc3Ry
b3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKY29tbWl0IDZhOTJiMTExNjlhNjVi
M2Y4Y2M1MTJjNzVhMjUyY2JkMGQwOTZiYTAgdXBzdHJlYW0uCgpGb3IgdW5wcml2aWxlZ2VkIFhl
biBQViBndWVzdHMgdGhpcyBpcyBub3JtYWwgbWVtb3J5IGFuZCBpb3JlbWFwIHdpbGwKbm90IGJl
IGFibGUgdG8gcHJvcGVybHkgbWFwIGl0LgoKV2hpbGUgYXQgaXQsIHNpbmNlIGlvcmVtYXAgbWF5
IHJldHVybiBOVUxMLCBhZGQgYSB0ZXN0IGZvciBwb2ludGVyJ3MKdmFsaWRpdHkuCgpSZXBvcnRl
ZC1ieTogQW5keSBTbWl0aCA8YW5keUBzdHJ1Z2dsZXJzLm5ldD4KU2lnbmVkLW9mZi1ieTogQm9y
aXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBocGFAenl0b3IuY29tCkNj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IGpncm9zc0BzdXNlLmNvbQpMaW5r
OiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMTgwOTExMTk1NTM4LjIzMjg5LTEtYm9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20KU2lnbmVkLW9mZi1ieTogQmVuIEh1dGNoaW5ncyA8YmVuQGRl
Y2FkZW50Lm9yZy51az4KLS0tCiBhcmNoL3g4Ni9rZXJuZWwvZWlzYS5jIHwgMTAgKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tLSBh
L2FyY2gveDg2L2tlcm5lbC9laXNhLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2Vpc2EuYwpAQCAt
NiwxMSArNiwxNyBAQAogI2luY2x1ZGUgPGxpbnV4L2lvcG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4
L2Vpc2EuaD4KIAorI2luY2x1ZGUgPHhlbi94ZW4uaD4KKwogc3RhdGljIF9faW5pdCBpbnQgZWlz
YV9idXNfcHJvYmUodm9pZCkKIHsKLQl2b2lkIF9faW9tZW0gKnAgPSBpb3JlbWFwKDB4MEZGRkQ5
LCA0KTsKKwl2b2lkIF9faW9tZW0gKnA7CisKKwlpZiAoeGVuX3B2X2RvbWFpbigpICYmICF4ZW5f
aW5pdGlhbF9kb21haW4oKSkKKwkJcmV0dXJuIDA7CiAKLQlpZiAocmVhZGwocCkgPT0gJ0UnICsg
KCdJJzw8OCkgKyAoJ1MnPDwxNikgKyAoJ0EnPDwyNCkpCisJcCA9IGlvcmVtYXAoMHgwRkZGRDks
IDQpOworCWlmIChwICYmIHJlYWRsKHApID09ICdFJyArICgnSScgPDwgOCkgKyAoJ1MnIDw8IDE2
KSArICgnQScgPDwgMjQpKQogCQlFSVNBX2J1cyA9IDE7CiAJaW91bm1hcChwKTsKIAlyZXR1cm4g
MDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
