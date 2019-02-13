From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/4] backports snapshot: Disable apt
 timestamp checking (sometimes)
Date: Wed, 13 Feb 2019 18:30:17 +0000
Message-ID: <20190213183018.5198-4-ian.jackson@eu.citrix.com>
References: <20190213183018.5198-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HrVK=QU=citrix.com=prvs=9402dae0b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gtzIw-0007hr-IL
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 18:30:42 +0000
In-Reply-To: <20190213183018.5198-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@gmail.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gamVzc2llIGFuZCBlYXJsaWVyLCB0aGlzIGhhcyB0byBiZSBkb25lIHdpdGggYSBnbG9iYWwg
b3B0aW9uLgoKSW4gbGF0ZXIgcmVsZWFzZXMsIGl0IGNhbiBiZSBkb25lIGJ5IHB1dHRpbmcgc29t
ZSBvcHRpb25zIGluIFsgXQppbiB0aGUgcmVsZXZhbnQgc291cmNlcyBsaXN0IGVudHJ5LgoKU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQog
T3NzdGVzdC9EZWJpYW4ucG0gfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBtIGIvT3NzdGVzdC9E
ZWJpYW4ucG0KaW5kZXggNWU3NGU4NmUuLmMxZTc1MDIwIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0Rl
Ymlhbi5wbQorKysgYi9Pc3N0ZXN0L0RlYmlhbi5wbQpAQCAtOTUxLDYgKzk1MSwxOSBAQCBzdWIg
cHJlc2VlZF9iYWNrcG9ydHNfcGFja2FnZXMgKCQkJCRAKSB7CiAKIAlteSAkYXB0X2luc2VydD0n
JzsKIAlteSAkZXh0cmFfcnVuZT0nJzsKKwlpZiAoJHN1aXRlID1+IG0vd2hlZXp5fGplc3NpZS8p
IHsKKwkgICAgIyB0aGlzIGhhcyBnbG9iYWwgZWZmZWN0LCB1bmZvcnR1bmF0ZWx5CisJICAgICRl
eHRyYV9ydW5lID0gPDxFTkQ7CitkPS9ldGMvYXB0L2FwdC5jb25mLmQKK21rZGlyIC1wIFwkZAor
Y2F0ID5cJGQvNTBvc3N0ZXN0c25hcHNob3QgPDxFT0YKK0FjcXVpcmU6OkNoZWNrLVZhbGlkLVVu
dGlsIGZhbHNlOworRU9GCitFTkQKKwl9IGVsc2UgeworCSAgICAkYXB0X2luc2VydCA9ICdbY2hl
Y2stdmFsaWQtdW50aWw9bm9dJzsKKwl9CisKIAlwcmVzZWVkX2hvb2tfY29tbWFuZCgkaG8sICds
YXRlX2NvbW1hbmQnLCAkc2Z4LCA8PEVORCk7CiAjIS9iaW4vc2gKIHNldCAtZXgKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
