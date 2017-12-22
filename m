From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fixes for 4.15-rc5
Date: Fri, 22 Dec 2017 07:53:49 +0100
Message-ID: <20171222065349.24812-1-jgross__13151.1631691412$1513925572$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=eyjw=ds=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eSHDR-0001Yn-Q0
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2017 06:53:57 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy00
LjE1LXJjNS10YWcKCnhlbjogZml4ZXMgZm9yIDQuMTUtcmM1CgpJdCBjb250YWlucyB0d28gZml4
ZXMgZm9yIHJ1bm5pbmcgdW5kZXIgWGVuOgoKLSBhIGZpeCBhdm9pZGluZyByZXNvdXJjZSBjb25m
bGljdHMgYmV0d2VlbiBhZGRpbmcgbW1pbyBhcmVhcyBhbmQgbWVtb3J5CiAgaG90cGx1ZwotIGEg
Zml4IHNldHRpbmcgTlggYml0cyBpbiBwYWdlIHRhYmxlIGVudHJpZXMgY29waWVkIGZyb20gWGVu
IHdoZW4gcnVubmluZwogIGFkIFBWIGd1ZXN0CgoKVGhhbmtzLgoKSnVlcmdlbgoKIGFyY2gveDg2
L3hlbi9lbmxpZ2h0ZW4uYyAgICB8IDgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgIDMgKysKIGFyY2gv
eDg2L3hlbi9tbXVfcHYuYyAgICAgICB8IDEyICsrKysrKysKIGFyY2gveDg2L3hlbi9zZXR1cC5j
ICAgICAgICB8ICA2ICsrLS0KIGRyaXZlcnMveGVuL2JhbGxvb24uYyAgICAgICB8IDY1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogaW5jbHVkZS94ZW4vYmFsbG9vbi5oICAg
ICAgIHwgIDUgKysrCiA2IGZpbGVzIGNoYW5nZWQsIDE1OSBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKCkJvcmlzIE9zdHJvdnNreSAoMSk6CiAgICAgIHhlbi9iYWxsb29uOiBNYXJrIHVu
YWxsb2NhdGVkIGhvc3QgbWVtb3J5IGFzIFVOVVNBQkxFCgpKYW4gQmV1bGljaCAoMSk6CiAgICAg
IHg4Ni02NC9YZW46IGVsaW1pbmF0ZSBXK1ggbWFwcGluZ3MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
