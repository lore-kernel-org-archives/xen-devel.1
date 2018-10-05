From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 18/18] tools/debugger/kdd: Install as `xen-kdd',
 not just `kdd'
Date: Fri,  5 Oct 2018 18:29:17 +0100
Message-ID: <20181005172917.11963-19-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8U38-0005rz-DQ
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:38:02 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

YGtkZCcgaXMgYW4gdW5mb3J0dW5hdGUgbmFtZXNwYWNlIGxhbmRncmFiLgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvZGVidWdn
ZXIva2RkL01ha2VmaWxlIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2RlYnVnZ2VyL2tkZC9NYWtlZmls
ZSBiL3Rvb2xzL2RlYnVnZ2VyL2tkZC9NYWtlZmlsZQppbmRleCA1NTA5ZWVlNjhjLi4yNjExNjk0
OWQ0IDEwMDY0NAotLS0gYS90b29scy9kZWJ1Z2dlci9rZGQvTWFrZWZpbGUKKysrIGIvdG9vbHMv
ZGVidWdnZXIva2RkL01ha2VmaWxlCkBAIC0yNCw4ICsyNCw4IEBAIGRpc3RjbGVhbjogY2xlYW4K
IC5QSE9OWTogaW5zdGFsbAogaW5zdGFsbDogYWxsCiAJWyAtZCAkKERFU1RESVIpJChzYmluZGly
KSBdIHx8ICQoSU5TVEFMTF9ESVIpICQoREVTVERJUikkKHNiaW5kaXIpCi0JJChJTlNUQUxMX1BS
T0cpIGtkZCAkKERFU1RESVIpJChzYmluZGlyKS9rZGQKKwkkKElOU1RBTExfUFJPRykga2RkICQo
REVTVERJUikkKHNiaW5kaXIpL3hlbi1rZGQKIAogLlBIT05ZOiB1bmluc3RhbGwKIHVuaW5zdGFs
bDoKLQlybSAtZiAkKERFU1RESVIpJChzYmluZGlyKS9rZGQKKwlybSAtZiAkKERFU1RESVIpJChz
YmluZGlyKS94ZW4ta2RkCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
