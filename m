From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 5/4] backports snapshot: Disable apt
 timestamp checking in right place
Date: Thu, 14 Feb 2019 11:41:57 +0000
Message-ID: <20190214114157.12749-1-ian.jackson@eu.citrix.com>
References: <20190213183018.5198-4-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tiIw=QV=citrix.com=prvs=941a144f0=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1guFP6-0003Te-St
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 11:42:08 +0000
In-Reply-To: <20190213183018.5198-4-ian.jackson@eu.citrix.com>
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

V2UgbmVlZCB0byBwdXQgdGhpcyBpbiAvdGFyZ2V0IG9yIGl0IGRvZXMgbm90IHRha2UgZWZmZWN0
LgoKWWVzdGVyZGF5J3MgNCBwYXRjaGVzIHdvcmtlZCB5ZXN0ZXJkYXkgYnV0IG5vdCB0b2RheSwg
YmVjYXVzZSB0aGUKc25hcHNob3QgaW4gcXVlc3Rpb24gaW4gZmFjdCBleHBpcmVkIGluIGJldHdl
ZW4uICBXaXRoIHRoaXMgYWRkaXRpb25hbApwYXRjaCB0aGV5IHdvcmsgdG9kYXkgdG9vLgoKU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQog
T3NzdGVzdC9EZWJpYW4ucG0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3Qv
RGViaWFuLnBtCmluZGV4IGMxZTc1MDIwLi4xN2RmZWY1NCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9E
ZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTk1NCw3ICs5NTQsNyBAQCBzdWIg
cHJlc2VlZF9iYWNrcG9ydHNfcGFja2FnZXMgKCQkJCRAKSB7CiAJaWYgKCRzdWl0ZSA9fiBtL3do
ZWV6eXxqZXNzaWUvKSB7CiAJICAgICMgdGhpcyBoYXMgZ2xvYmFsIGVmZmVjdCwgdW5mb3J0dW5h
dGVseQogCSAgICAkZXh0cmFfcnVuZSA9IDw8RU5EOwotZD0vZXRjL2FwdC9hcHQuY29uZi5kCitk
PS90YXJnZXQvZXRjL2FwdC9hcHQuY29uZi5kCiBta2RpciAtcCBcJGQKIGNhdCA+XCRkLzUwb3Nz
dGVzdHNuYXBzaG90IDw8RU9GCiBBY3F1aXJlOjpDaGVjay1WYWxpZC1VbnRpbCBmYWxzZTsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
