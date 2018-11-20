From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] Move RSDP address out of setup_header
Date: Tue, 20 Nov 2018 08:25:27 +0100
Message-ID: <20181120072529.5489-1-jgross__9697.1835745082$1542698652$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vczp=n7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gP0Pd-0007h2-WA
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 07:25:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, daniel.kiper@oracle.com, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

UmVzZW5kIHdpdGggRGFuaWVsJ3MgbWFpbG8gYWRkcmVzcyBjb3JyZWN0ZWQKCkluc3RlYWQgb2Yg
cGFzc2luZyB0aGUgUlNEUCBhZGRyZXNzIGZvciBYZW4gUFZIIGd1ZXN0cyBmcm9tIGdydWIyIHRv
CnRoZSBrZXJuZWwgaW4gc2V0dXBfaGVhZGVyIG1vdmUgaXQgaW50byB0aGUgbm9uLWxlZ2FjeSBw
YXJ0IG9mIHRoZQpib290X3BhcmFtcyBzdHJ1Y3R1cmUuCgpUaGlzIHBhdGNoIHNlcmllcyBzaG91
bGQgYmUgYXBwbGllZCByYXRoZXIgc29vbmVyIHRoYW4gbGF0ZXIgaW4gb3JkZXIKdG8gYXZvaWQg
c2hpcHBpbmcgbGludXggNC4yMCB3aXRoIGEgY29ya3kgYm9vdCBwcm90b2NvbC4KCkp1ZXJnZW4g
R3Jvc3MgKDIpOgogIHg4Ni9ib290OiByZXZlcnQgY29tbWl0IGFlN2UxMjM4ZTY4ZjJhIChBZGQg
QUNQSSBSU0RQIGFkZHJlc3MgdG8KICAgIHNldHVwX2hlYWRlcikKICB4ODYvYWNwaSwgeDg2L2Jv
b3Q6IFRha2UgUlNEUCBhZGRyZXNzIGZyb20gYm9vdCBwYXJhbXMgaWYgYXZhaWxhYmxlCgogRG9j
dW1lbnRhdGlvbi94ODYvYm9vdC50eHQgICAgICAgICAgICB8IDMyICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiBhcmNoL3g4Ni9ib290L2hlYWRlci5TICAgICAgICAgICAgICAgIHwg
IDYgKy0tLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ODZfaW5pdC5oICAgICAgIHwgIDIgLS0K
IGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmggfCAgNyArKy0tLS0tCiBhcmNo
L3g4Ni9rZXJuZWwvYWNwaS9ib290LmMgICAgICAgICAgIHwgIDIgKy0KIGFyY2gveDg2L2tlcm5l
bC9oZWFkMzIuYyAgICAgICAgICAgICAgfCAgMSAtCiBhcmNoL3g4Ni9rZXJuZWwvaGVhZDY0LmMg
ICAgICAgICAgICAgIHwgIDIgLS0KIGFyY2gveDg2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAg
ICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDY0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
