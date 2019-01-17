From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] add xl command to get hypervisor .config
Date: Thu, 17 Jan 2019 15:57:20 +0100
Message-ID: <20190117145722.30311-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yQ28=PZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gk96m-00013m-7F
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 14:57:28 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

QWRkICJ4bCBnZXQtY29uZmlnIiBwcmludGluZyB0aGUgLmNvbmZpZyB1c2VkIHRvIGJ1aWxkIHRo
ZSBjdXJyZW50bHkKcnVubmluZyBoeXBlcnZpc29yLgoKSnVlcmdlbiBHcm9zcyAoMik6CiAgeGVu
OiBhZGQgaW50ZXJmYWNlIGZvciBvYnRhaW5pbmcgLmNvbmZpZyBmcm9tIGh5cGVydmlzb3IKICB0
b29sczogYWRkIG5ldyB4bCBjb21tYW5kIGdldC1jb25maWcgZm9yIGdldHRpbmcgaHlwZXJ2aXNv
ciBjb25maWcKCiAuZ2l0aWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBk
b2NzL21hbi94bC4xLnBvZC5pbiAgICAgICAgICAgICAgICB8ICA1ICsrKysrCiB0b29scy9mbGFz
ay9wb2xpY3kvbW9kdWxlcy9kb20wLnRlICB8ICAyICstCiB0b29scy9saWJ4Yy9pbmNsdWRlL3hl
bmN0cmwuaCAgICAgICB8ICA4ICsrKysrKysKIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuZ3Vlc3Qu
aCAgICAgIHwgMTMgKysrKysrKysrKysrCiB0b29scy9saWJ4Yy94Y19taXNjLmMgICAgICAgICAg
ICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRvb2xzL2xp
YnhjL3hnX3ByaXZhdGUuaCAgICAgICAgICAgIHwgIDQgLS0tLQogdG9vbHMvbGlieGwvbGlieGwu
YyAgICAgICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMv
bGlieGwvbGlieGwuaCAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrCiB0b29scy94bC94bC5o
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAg
ICAgICAgICAgIHwgIDUgKysrKysKIHRvb2xzL3hsL3hsX21pc2MuYyAgICAgICAgICAgICAgICAg
IHwgMjAgKysrKysrKysrKysrKysrKysrCiB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICAgICAg
ICAgICB8ICA3ICsrKysrKysKIHhlbi9jb21tb24vc3lzY3RsLmMgICAgICAgICAgICAgICAgIHwg
MTMgKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICAgICAgICB8IDE2
ICsrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4va2VybmVsLmggICAgICAgICAgICB8ICAz
ICsrKwogeGVuL3Rvb2xzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgOSArKysrKystLQog
eGVuL3Rvb2xzL2JpbjJjLmMgICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysr
KysrKysrKysrCiB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgICB8ICAzICsrKwog
eGVuL3hzbS9mbGFzay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgfCAgMiArKwogMjAgZmlsZXMgY2hh
bmdlZCwgMjE0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL3Rvb2xzL2JpbjJjLmMKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
