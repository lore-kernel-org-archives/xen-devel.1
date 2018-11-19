From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/xen: cleanup includes in
 arch/x86/xen/spinlock.c
Date: Mon, 19 Nov 2018 14:59:45 +0100
Message-ID: <20181119135945.9985-1-jgross__45766.1797445782$1542635921$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RTps=N6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gOk5e-0007om-CN
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 13:59:50 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

YXJjaC94ODYveGVuL3NwaW5sb2NrLmMgaW5jbHVkZXMgc2V2ZXJhbCBoZWFkZXJzIHdoaWNoIGFy
ZSBub3QgbmVlZGVkLgpSZW1vdmUgdGhlICNpbmNsdWRlcy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4vc3BpbmxvY2suYyB8
IDcgKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9zcGlubG9jay5jIGIvYXJjaC94ODYveGVuL3Nw
aW5sb2NrLmMKaW5kZXggMWM4YTg4MTZhNDAyLi4zNzc2MTIyYzg3Y2MgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L3hlbi9zcGlubG9jay5jCisrKyBiL2FyY2gveDg2L3hlbi9zcGlubG9jay5jCkBAIC0z
LDIyICszLDE3IEBACiAgKiBTcGxpdCBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiBvdXQgaW50byBp
dHMgb3duIGZpbGUsIHNvIGl0IGNhbiBiZQogICogY29tcGlsZWQgaW4gYSBGVFJBQ0UtY29tcGF0
aWJsZSB3YXkuCiAgKi8KLSNpbmNsdWRlIDxsaW51eC9rZXJuZWxfc3RhdC5oPgorI2luY2x1ZGUg
PGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+Ci0jaW5jbHVkZSA8
bGludXgvZGVidWdmcy5oPgotI2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4KLSNpbmNsdWRlIDxsaW51
eC9nZnAuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvYXRvbWlj
Lmg+CiAKICNpbmNsdWRlIDxhc20vcGFyYXZpcnQuaD4KICNpbmNsdWRlIDxhc20vcXNwaW5sb2Nr
Lmg+CiAKLSNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL3hlbi5oPgogI2luY2x1ZGUgPHhlbi9ldmVu
dHMuaD4KIAogI2luY2x1ZGUgInhlbi1vcHMuaCIKLSNpbmNsdWRlICJkZWJ1Z2ZzLmgiCiAKIHN0
YXRpYyBERUZJTkVfUEVSX0NQVShpbnQsIGxvY2tfa2lja2VyX2lycSkgPSAtMTsKIHN0YXRpYyBE
RUZJTkVfUEVSX0NQVShjaGFyICosIGlycV9uYW1lKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
