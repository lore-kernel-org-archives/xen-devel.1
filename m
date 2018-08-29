From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] xen: fill topology info for online cpus only
Date: Wed, 29 Aug 2018 20:23:02 +0200
Message-ID: <20180829182302.9977-3-jgross@suse.com>
References: <20180829182302.9977-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cgjg=lm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fv57X-0006Qo-Bv
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 18:23:11 +0000
In-Reply-To: <20180829182302.9977-1-jgross@suse.com>
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

VGhlIHRvcG9sb2d5IGluZm9ybWF0aW9uIG9idGFpbmFibGUgdmlhIFhFTl9TWVNDVExfY3B1dG9w
b2luZm8gaXMKZmlsbGVkIHJhdGhlciB3ZWlyZDogdGhlIHNpemUgb2YgdGhlIGFycmF5IGlzIGRl
cml2ZWQgZnJvbSB0aGUgaGlnaGVzdApvbmxpbmUgY3B1IG51bWJlciwgd2hpbGUgdGhlIGRhdGEg
aXMgc2V0IHRvICJpbnZhbGlkIiBmb3Igbm90IHByZXNlbnQKY3B1cyBvbmx5LgoKV2l0aCBzbXQ9
MCB0aGUgaW5mb3JtYXRpb24gZm9yIHBhcmtlZCB0aHJlYWRzIGlzIGFsbCB6ZXJvLCBzbyBpdCBz
aG91bGQKYmUgYmVzdCB0byByZXR1cm4gImludmFsaWQiIGluZm9ybWF0aW9uIGZvciBvZmZsaW5l
IGNwdXMuCgpPbiBhIGR1YWwgY29yZSBzeXN0ZW0gd2l0aG91dCB0aGlzIHBhdGNoIHhsIGluZm8g
LW4gd2lsbCBwcmludDoKCmNwdV90b3BvbG9neSAgICAgICAgICAgOgpjcHU6ICAgIGNvcmUgICAg
c29ja2V0ICAgICBub2RlCiAgMDogICAgICAgMCAgICAgICAgMCAgICAgICAgMAogIDE6ICAgICAg
IDAgICAgICAgIDAgICAgICAgIDAKICAyOiAgICAgICAxICAgICAgICAwICAgICAgICAwCgp3aGls
ZSB3aXRoIHRoaXMgcGF0Y2ggdGhlIG91dHB1dCBpczoKCmNwdV90b3BvbG9neSAgICAgICAgICAg
OgpjcHU6ICAgIGNvcmUgICAgc29ja2V0ICAgICBub2RlCiAgMDogICAgICAgMCAgICAgICAgMCAg
ICAgICAgMAogIDI6ICAgICAgIDEgICAgICAgIDAgICAgICAgIDAKClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3N5c2N0bC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9zeXNjdGwuYyBiL3hlbi9jb21tb24vc3lzY3RsLmMKaW5kZXgg
OGU4M2MzM2ExNi4uNmNlZjZkMzEwYiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYwor
KysgYi94ZW4vY29tbW9uL3N5c2N0bC5jCkBAIC0zNTgsNyArMzU4LDcgQEAgbG9uZyBkb19zeXNj
dGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQogICAgICAg
ICAgICAgICAgIG51bV9jcHVzID0gdGktPm51bV9jcHVzOwogICAgICAgICAgICAgZm9yICggaSA9
IDA7IGkgPCBudW1fY3B1czsgKytpICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBp
ZiAoIGNwdV9wcmVzZW50KGkpICkKKyAgICAgICAgICAgICAgICBpZiAoIGNwdV9vbmxpbmUoaSkg
KQogICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgY3B1dG9wby5jb3JlID0g
Y3B1X3RvX2NvcmUoaSk7CiAgICAgICAgICAgICAgICAgICAgIGNwdXRvcG8uc29ja2V0ID0gY3B1
X3RvX3NvY2tldChpKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
