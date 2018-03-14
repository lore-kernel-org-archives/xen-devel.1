From: Wei Liu <wei.liu2@citrix.com>
Subject: Implementaiton of cc-option in Config.mk
Date: Wed, 14 Mar 2018 17:11:28 +0000
Message-ID: <20180314171128.52ln4efljqd56mnu@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yxl5=ge=citrix.com=prvs=60440319b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ew9w9-0007OV-QZ
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 17:11:37 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsCgpUaGUgaW1wbGVtZW50YXRpb24gb2YgY2Mtb3B0aW9uIChncmVwcGluZyB0aGUgb3B0
aW9uIGJlaW5nIHRlc3RlZCBpbgpvdXRwdXQpIGluIENvbmZpZy5tayBub3cgbWFrZXMgaXQgbm90
IHBvc3NpYmxlIHRvIGRldGVjdCBpZiAtT2cgaXMKc3VwcG9ydGVkIGJlY2F1c2UgIi1PZyIgZG9l
c24ndCBhcHBlYXIgaW4gdGhlIG91dHB1dCBpZiBpdCBpcyBub3QKc3VwcG9ydGVkLiBJIHN1c3Bl
Y3QgdGhlcmUgd2lsbCBiZSBvdGhlciBvcHRpb25zIHRoYXQgY2Mtb3B0aW9uIGNhbid0IHdvcmsK
d2l0aC4KCkl0IGlzIGltcGxlbWVudGVkIGxpa2UgdGhhdCBiZWNhdXNlIHdlIHRyeSB0byBkZXRl
Y3QgLVduby0qIG9wdGlvbi4gQnV0CndoeSBpcyB0aGF0IGltcG9ydGFudD8gQ2FuJ3Qgd2UganVz
dCBpZ25vcmUgLVduby0qIGlmIHRoZXkgYXJlbid0CnN1cHBvcnRlZD8gRG9lcyBhbnlvbmUgaGFz
IGFuIGlkZWEgaG93IHRvIG1ha2UgY2Mtb3B0aW9uIHdvcmsgZm9yIC1PZwooYW5kIG90aGVyIG9w
dGlvbnMpPwoKVGhhbmtzLApXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
