From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/2] xen: fill topology info for all present
 cpus
Date: Fri, 31 Aug 2018 17:22:05 +0200
Message-ID: <20180831152205.21872-3-jgross@suse.com>
References: <20180831152205.21872-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/b/z=lo=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvlFW-0001Fq-2T
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

VGhlIHRvcG9sb2d5IGluZm9ybWF0aW9uIG9idGFpbmFibGUgdmlhIFhFTl9TWVNDVExfY3B1dG9w
b2luZm8gaXMKZmlsbGVkIHJhdGhlciB3ZWlyZDogdGhlIHNpemUgb2YgdGhlIGFycmF5IGlzIGRl
cml2ZWQgZnJvbSB0aGUgaGlnaGVzdApvbmxpbmUgY3B1IG51bWJlciwgc28gaW4gY2FzZSB0aGVy
ZSBhcmUgdHJhaWxpbmcgb2ZmbGluZSBjcHVzIHRoZXkKd2lsbCBub3QgYmUgaW5jbHVkZWQuCgpP
biBhIGR1YWwgY29yZSBzeXN0ZW0gd2l0aCA0IHRocmVhZHMgYm9vdGVkIHdpdGggc210PTAgd2l0
aG91dCB0aGlzCnBhdGNoIHhsIGluZm8gLW4gd2lsbCBwcmludDoKCmNwdV90b3BvbG9neSAgICAg
ICAgICAgOgpjcHU6ICAgIGNvcmUgICAgc29ja2V0ICAgICBub2RlCiAgMDogICAgICAgMCAgICAg
ICAgMCAgICAgICAgMAogIDE6ICAgICAgIDAgICAgICAgIDAgICAgICAgIDAKICAyOiAgICAgICAx
ICAgICAgICAwICAgICAgICAwCgp3aGlsZSB3aXRoIHRoaXMgcGF0Y2ggdGhlIG91dHB1dCBpczoK
CmNwdV90b3BvbG9neSAgICAgICAgICAgOgpjcHU6ICAgIGNvcmUgICAgc29ja2V0ICAgICBub2Rl
CiAgMDogICAgICAgMCAgICAgICAgMCAgICAgICAgMAogIDE6ICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAKICAyOiAgICAgICAxICAgICAgICAwICAgICAgICAwCiAgMzogICAgICAgMSAgICAgICAg
MCAgICAgICAgMAoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KIHhlbi9jb21tb24vc3lzY3RsLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3N5c2N0bC5j
IGIveGVuL2NvbW1vbi9zeXNjdGwuYwppbmRleCA4ZTgzYzMzYTE2Li5jMGFhNmJkZTRlIDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jCisrKyBiL3hlbi9jb21tb24vc3lzY3RsLmMKQEAg
LTM0OSw3ICszNDksNyBAQCBsb25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhl
bl9zeXNjdGxfdCkgdV9zeXNjdGwpCiAgICAgICAgIHVuc2lnbmVkIGludCBpLCBudW1fY3B1czsK
ICAgICAgICAgc3RydWN0IHhlbl9zeXNjdGxfY3B1dG9wb2luZm8gKnRpID0gJm9wLT51LmNwdXRv
cG9pbmZvOwogCi0gICAgICAgIG51bV9jcHVzID0gY3B1bWFza19sYXN0KCZjcHVfb25saW5lX21h
cCkgKyAxOworICAgICAgICBudW1fY3B1cyA9IGNwdW1hc2tfbGFzdCgmY3B1X3ByZXNlbnRfbWFw
KSArIDE7CiAgICAgICAgIGlmICggIWd1ZXN0X2hhbmRsZV9pc19udWxsKHRpLT5jcHV0b3BvKSAp
CiAgICAgICAgIHsKICAgICAgICAgICAgIHN0cnVjdCB4ZW5fc3lzY3RsX2NwdXRvcG8gY3B1dG9w
byA9IHsgfTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
