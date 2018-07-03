From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH RFC] x86/AMD: write PAT after ucode update
Date: Tue, 03 Jul 2018 08:55:29 -0600
Message-ID: <5B3B8E6102000078001D05F0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uib8=jt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1faMiM-0001f9-6P
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 14:55:34 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGluY3JlYXNlZCBudW1iZXIgb2YgbWVzc2FnZXMgKHNwZWNfY3RybC5jOnByaW50X2RldGFp
bHMoKSkgd2l0aGluIGEKY2VydGFpbiB0aW1lIHdpbmRvdyBtYWRlIG1lIG5vdGljZSBzb21lIHNs
b3duZXNzIG9mIGJvb3QgdGltZSBzY3JlZW4Kb3V0cHV0LiBFeHBlcmltZW50YWxseSBJJ3ZlIG5h
cnJvd2VkIHRoZSB0aW1lIHdpbmRvdyB0byBiZSBmcm9tCmltbWVkaWF0ZWx5IGFmdGVyIHRoZSBl
YXJseSB1Y29kZSB1cGRhdGUgb24gdGhlIEJTUCB0byB0aGUgUEFUIHdyaXRlIGluCmNwdV9pbml0
KCkuIEZvciB0aGF0IHJlYXNvbiwgYXMgYSB3b3JrYXJvdW5kLCB3cml0ZSBQQVQgd2l0aCBpdHMK
ZGVzaWduYXRlZCB2YWx1ZSBpbW1lZGlhdGVseSBhZnRlciB0aGUgdWNvZGUgbG9hZC4KClNpbWls
YXIgc2xvd25lc3MgY2Fubm90IGJlIG9ic2VydmVkIG9uIEFQcy4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClJGQzogUHJlZmVyYWJseSB0byBiZSBj
b25maXJtZWQgYnkgQU1ELgotLS0KV2lsbCBuZWVkIHJlLWJhc2luZyBvbiB0b3Agb2YgQW5kcmV3
J3MgcGF0Y2ggZWxpbWluYXRpbmcgaG9zdF9wYXQsIGlmCnRoYXQgZ29lcyBpbiBlYXJsaWVyLgoK
LS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYworKysgYi94ZW4vYXJjaC94ODYvbWlj
cm9jb2RlX2FtZC5jCkBAIC0yMjYsNiArMjI2LDEzIEBAIHN0YXRpYyBpbnQgYXBwbHlfbWljcm9j
b2RlKHVuc2lnbmVkIGludAogICAgICAgICByZXR1cm4gLUVJTzsKICAgICB9CiAKKyAgICAvKgor
ICAgICAqIEV4cGVyaW1lbnRhbGx5IHRoaXMgaGVscHMgd2l0aCBwZXJmb3JtYW5jZSBpc3N1ZXMg
b24gYXQgbGVhc3QgY2VydGFpbgorICAgICAqIEZhbTE1IG1vZGVscy4gT2RkbHkgZW5vdWdoIG9u
bHkgdGhlIEJTUCBpcyBhZmZlY3RlZCwgYnV0IHRvIGJlIG9uIHRoZQorICAgICAqIHNhZmUgc2lk
ZSwgZG8gdGhlIHdyaXRlIHVuaWZvcm1seS4KKyAgICAgKi8KKyAgICB3cm1zcmwoTVNSX0lBMzJf
Q1JfUEFULCBob3N0X3BhdCk7CisKICAgICBwcmludGsoS0VSTl9XQVJOSU5HICJtaWNyb2NvZGU6
IENQVSVkIHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAlI3ggdG8gJSN4XG4iLAogICAgICAgICAgICBj
cHUsIHVjaS0+Y3B1X3NpZy5yZXYsIGhkci0+cGF0Y2hfaWQpOwogCgoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
