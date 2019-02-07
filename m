From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 2/3] tools: init scripts: xencommons: Fixes to
 Description
Date: Thu,  7 Feb 2019 15:02:26 +0000
Message-ID: <20190207150227.6341-3-ian.jackson@eu.citrix.com>
References: <20190207150227.6341-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gno6=QO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1grlCK-0004SW-0G
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 15:02:40 +0000
In-Reply-To: <20190207150227.6341-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

YG5lZWVkZWQnIGlzIGEgdHlwby4gIEFuZCB4ZW5kIGlzIGxvbmcgZ29uZS4KCk5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+Ci0tLQogdG9vbHMvaG90cGx1Zy9MaW51eC9pbml0LmQveGVuY29tbW9ucy5pbiB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2hvdHBsdWcvTGludXgvaW5pdC5kL3hlbmNvbW1vbnMuaW4gYi90b29s
cy9ob3RwbHVnL0xpbnV4L2luaXQuZC94ZW5jb21tb25zLmluCmluZGV4IDU4MWIwMmMyN2EuLmFh
NjJlNGM5MmYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgvaW5pdC5kL3hlbmNvbW1v
bnMuaW4KKysrIGIvdG9vbHMvaG90cGx1Zy9MaW51eC9pbml0LmQveGVuY29tbW9ucy5pbgpAQCAt
MTUsNyArMTUsNyBAQAogIyBEZWZhdWx0LVN0YXJ0OiAgICAgMiAzIDUKICMgRGVmYXVsdC1TdG9w
OiAgICAgIDAgMSA2CiAjIFNob3J0LURlc2NyaXB0aW9uOiBTdGFydC9zdG9wIHhlbnN0b3JlZCBh
bmQgeGVuY29uc29sZWQKLSMgRGVzY3JpcHRpb246ICAgICAgIFN0YXJ0cyBhbmQgc3RvcHMgdGhl
IGRhZW1vbnMgbmVlZWRlZCBmb3IgeGwveGVuZAorIyBEZXNjcmlwdGlvbjogICAgICAgU3RhcnRz
IGFuZCBzdG9wcyB0aGUgZGFlbW9ucyBuZWVkZWQgZm9yIHhsCiAjIyMgRU5EIElOSVQgSU5GTwog
CiBCQUNLRU5EX01PRFVMRVM9IkBMSU5VWF9CQUNLRU5EX01PRFVMRVNAIgotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
