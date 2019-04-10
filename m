From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] xmalloc: statically initialize pool list head
 and lock
Date: Wed, 10 Apr 2019 04:58:30 -0600
Message-ID: <5CADCC560200007800226221@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEAy2-0004OG-5R
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:00:34 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBuZWVkIHRvIGV4ZWN1dGUgYW55IGluc3RydWN0aW9ucyBmb3IgZG9pbmcgc28u
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94
ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCisrKyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMK
QEAgLTY1LDggKzY1LDggQEAKICNkZWZpbmUgUFJFVl9GUkVFICAgICAgICgweDIpCiAjZGVmaW5l
IFBSRVZfVVNFRCAgICAgICAoMHgwKQogCi1zdGF0aWMgc3BpbmxvY2tfdCBwb29sX2xpc3RfbG9j
azsKLXN0YXRpYyBzdHJ1Y3QgbGlzdF9oZWFkIHBvb2xfbGlzdF9oZWFkOworc3RhdGljIERFRklO
RV9TUElOTE9DSyhwb29sX2xpc3RfbG9jayk7CitzdGF0aWMgTElTVF9IRUFEKHBvb2xfbGlzdF9o
ZWFkKTsKIAogc3RydWN0IGZyZWVfcHRyIHsKICAgICBzdHJ1Y3QgYmhkciAqcHJldjsKQEAgLTU1
MSw4ICs1NTEsNiBAQCBzdGF0aWMgdm9pZCAqeG1hbGxvY193aG9sZV9wYWdlcyh1bnNpZ25lCiAK
IHN0YXRpYyB2b2lkIHRsc2ZfaW5pdCh2b2lkKQogewotICAgIElOSVRfTElTVF9IRUFEKCZwb29s
X2xpc3RfaGVhZCk7Ci0gICAgc3Bpbl9sb2NrX2luaXQoJnBvb2xfbGlzdF9sb2NrKTsKICAgICB4
ZW5wb29sID0geG1lbV9wb29sX2NyZWF0ZSgKICAgICAgICAgInhtYWxsb2MiLCB4bWFsbG9jX3Bv
b2xfZ2V0LCB4bWFsbG9jX3Bvb2xfcHV0LAogICAgICAgICBQQUdFX1NJWkUsIDAsIFBBR0VfU0la
RSk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
