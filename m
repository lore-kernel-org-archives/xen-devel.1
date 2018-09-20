From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] x86/AMD: write PAT after ucode update
Date: Thu, 20 Sep 2018 02:40:44 -0600
Message-ID: <5BA35D0C02000078001EA2DC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gjef=mc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2uVy-0001tG-HQ
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 08:40:46 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGluY3JlYXNlZCBudW1iZXIgb2YgbWVzc2FnZXMgKHNwZWNfY3RybC5jOnByaW50X2RldGFp
bHMoKSkgd2l0aGluIGEKY2VydGFpbiB0aW1lIHdpbmRvdyBtYWRlIG1lIG5vdGljZSBzb21lIHNs
b3duZXNzIG9mIGJvb3QgdGltZSBzY3JlZW4Kb3V0cHV0LiBFeHBlcmltZW50YWxseSBJJ3ZlIG5h
cnJvd2VkIHRoZSB0aW1lIHdpbmRvdyB0byBiZSBmcm9tCmltbWVkaWF0ZWx5IGFmdGVyIHRoZSBl
YXJseSB1Y29kZSB1cGRhdGUgb24gdGhlIEJTUCB0byB0aGUgUEFUIHdyaXRlIGluCmNwdV9pbml0
KCkuIEZvciB0aGF0IHJlYXNvbiwgYXMgYSB3b3JrYXJvdW5kLCB3cml0ZSBQQVQgd2l0aCBpdHMK
ZGVzaWduYXRlZCB2YWx1ZSBpbW1lZGlhdGVseSBhZnRlciB0aGUgdWNvZGUgbG9hZC4KClNpbWls
YXIgc2xvd25lc3MgY2Fubm90IGJlIG9ic2VydmVkIG9uIEFQcy4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClJGQyBkcm9wcGVkLCBidXQgc3RpbGw6
IFByZWZlcmFibHkgdG8gYmUgY29uZmlybWVkIGJ5IEFNRC4KLS0tCnYyOiBSZS1iYXNlLgoKLS0t
IGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYworKysgYi94ZW4vYXJjaC94ODYvbWljcm9j
b2RlX2FtZC5jCkBAIC0yMjYsNiArMjI2LDEzIEBAIHN0YXRpYyBpbnQgYXBwbHlfbWljcm9jb2Rl
KHVuc2lnbmVkIGludAogICAgICAgICByZXR1cm4gLUVJTzsKICAgICB9CiAKKyAgICAvKgorICAg
ICAqIEV4cGVyaW1lbnRhbGx5IHRoaXMgaGVscHMgd2l0aCBwZXJmb3JtYW5jZSBpc3N1ZXMgb24g
YXQgbGVhc3QgY2VydGFpbgorICAgICAqIEZhbTE1IG1vZGVscy4gT2RkbHkgZW5vdWdoIG9ubHkg
dGhlIEJTUCBpcyBhZmZlY3RlZCwgYnV0IHRvIGJlIG9uIHRoZQorICAgICAqIHNhZmUgc2lkZSwg
ZG8gdGhlIHdyaXRlIHVuaWZvcm1seS4KKyAgICAgKi8KKyAgICB3cm1zcmwoTVNSX0lBMzJfQ1Jf
UEFULCBYRU5fTVNSX1BBVCk7CisKICAgICBwcmludGsoS0VSTl9XQVJOSU5HICJtaWNyb2NvZGU6
IENQVSVkIHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAlI3ggdG8gJSN4XG4iLAogICAgICAgICAgICBj
cHUsIHVjaS0+Y3B1X3NpZy5yZXYsIGhkci0+cGF0Y2hfaWQpOwogCgoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
