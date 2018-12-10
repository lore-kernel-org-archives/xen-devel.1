From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 1/3] xen: modify parse_size_and_unit() to
 support percentage
Date: Mon, 10 Dec 2018 12:44:20 +0100
Message-ID: <20181210114422.27275-2-jgross@suse.com>
References: <20181210114422.27275-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gWJzB-0007i2-Ac
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 11:44:29 +0000
In-Reply-To: <20181210114422.27275-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

TW9kaWZ5IHBhcnNlX3NpemVfYW5kX3VuaXQoKSB0byBzdXBwb3J0IGEgdmFsdWUgZm9sbG93ZWQg
YnkgYSAnJScKY2hhcmFjdGVyLiBJbiB0aGlzIGNhc2UgcHMgaXMgcmVxdWlyZWQgdG8gYmUgbm9u
LU5VTEwgdG8gZW5zdXJlIHRoZQpjYWxsZXIgY2FuIGRldGVjdCB0aGF0IGNhc2UuIFRoZSByZXR1
cm5lZCB2YWx1ZSB3aWxsIGJlIHRoZSBpbnRlZ2VyCnZhbHVlIHMgd2FzIHBvaW50aW5nIHRvIGFu
ZCAqcHMgd2lsbCBwb2ludCB0byB0aGUgJyUnIGNoYXJhY3Rlci4KClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2xpYi5jIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9saWIuYyBiL3hlbi9jb21tb24vbGliLmMKaW5kZXggNjIzMzAyMDVmZS4uOGViZWM4MTFi
MyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9saWIuYworKysgYi94ZW4vY29tbW9uL2xpYi5jCkBA
IC00NzYsNiArNDc2LDEwIEBAIHVuc2lnbmVkIGxvbmcgbG9uZyBwYXJzZV9zaXplX2FuZF91bml0
KGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIgKipwcykKICAgICBjYXNlICdCJzogY2FzZSAnYic6
CiAgICAgICAgIHMxKys7CiAgICAgICAgIGJyZWFrOworICAgIGNhc2UgJyUnOgorICAgICAgICBp
ZiAoIHBzICkKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICAvKiBmYWxsdGhyb3VnaCAqLwog
ICAgIGRlZmF1bHQ6CiAgICAgICAgIHJldCA8PD0gMTA7IC8qIGRlZmF1bHQgdG8ga0IgKi8KICAg
ICAgICAgYnJlYWs7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
