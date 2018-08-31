From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/2] tools/libxl: correct vcpu affinity
 output with sparse physical cpu map
Date: Fri, 31 Aug 2018 17:22:04 +0200
Message-ID: <20180831152205.21872-2-jgross@suse.com>
References: <20180831152205.21872-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/b/z=lo=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvlFW-0001Fv-E2
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 15:22:14 +0000
In-Reply-To: <20180831152205.21872-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2l0aCBub3QgYWxsIHBoeXNpY2FsIGNwdXMgb25saW5lIChlLmcuIHdpdGggc210PTApIHRoZSBv
dXRwdXQgb2YgaHRlCnZjcHUgYWZmaW5pdGllcyBpcyB3cm9uZywgYXMgdGhlIGFmZmluaXR5IGJp
dG1hcHMgYXJlIGNhcHBlZCBhZnRlcgpucl9jcHVzIGJpdHMsIGluc3RlYWQgb2YgdXNpbmcgbWF4
X2NwdV9pZC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
QWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMveGwveGxf
dmNwdS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3ZjcHUuYyBiL3Rvb2xzL3hsL3hsX3Zj
cHUuYwppbmRleCAzMzg0ZWVlZDA2Li5jODc3ZjI1OTVmIDEwMDY0NAotLS0gYS90b29scy94bC94
bF92Y3B1LmMKKysrIGIvdG9vbHMveGwveGxfdmNwdS5jCkBAIC0xNDQsMTMgKzE0NCwxMyBAQCBz
dGF0aWMgdm9pZCB2Y3B1bGlzdChpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgICAgICAgIH0KIAog
ICAgICAgICBmb3IgKGkgPSAwOyBpPG5iX2RvbWFpbjsgaSsrKQotICAgICAgICAgICAgcHJpbnRf
ZG9tYWluX3ZjcHVpbmZvKGRvbWluZm9baV0uZG9taWQsIHBoeXNpbmZvLm5yX2NwdXMpOworICAg
ICAgICAgICAgcHJpbnRfZG9tYWluX3ZjcHVpbmZvKGRvbWluZm9baV0uZG9taWQsIHBoeXNpbmZv
Lm1heF9jcHVfaWQgKyAxKTsKIAogICAgICAgICBsaWJ4bF9kb21pbmZvX2xpc3RfZnJlZShkb21p
bmZvLCBuYl9kb21haW4pOwogICAgIH0gZWxzZSB7CiAgICAgICAgIGZvciAoOyBhcmdjID4gMDsg
Kythcmd2LCAtLWFyZ2MpIHsKICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkID0gZmluZF9kb21h
aW4oKmFyZ3YpOwotICAgICAgICAgICAgcHJpbnRfZG9tYWluX3ZjcHVpbmZvKGRvbWlkLCBwaHlz
aW5mby5ucl9jcHVzKTsKKyAgICAgICAgICAgIHByaW50X2RvbWFpbl92Y3B1aW5mbyhkb21pZCwg
cGh5c2luZm8ubWF4X2NwdV9pZCArIDEpOwogICAgICAgICB9CiAgICAgfQogICB2Y3B1bGlzdF9v
dXQ6Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
