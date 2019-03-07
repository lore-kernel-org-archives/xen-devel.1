From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 9/9] xen: explicit casts when
 DECLARE_BOUNDS cannot be used
Date: Thu, 07 Mar 2019 04:40:04 -0700
Message-ID: <5C810314020000780021C706@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-9-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1rNj-0006qX-RL
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 11:40:11 +0000
In-Reply-To: <1551825512-8975-9-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, ian.jackson@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE5IGF0IDIzOjM4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAu
Ywo+IEBAIC05NzYsNyArOTc2LDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4o
dW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgICAgICAgKiByZXNwZWN0aXZlIHJlc2VydmVfZTgy
MF9yYW0oKSBpbnZvY2F0aW9uIGJlbG93Lgo+ICAgICAgICAgICAqLwo+ICAgICAgICAgIG1vZFtt
YmktPm1vZHNfY291bnRdLm1vZF9zdGFydCA9IHZpcnRfdG9fbWZuKF9zdGV4dCk7Cj4gLSAgICAg
ICAgbW9kW21iaS0+bW9kc19jb3VudF0ubW9kX2VuZCA9IF9fMk1fcndkYXRhX2VuZCAtIF9zdGV4
dDsKPiArICAgICAgICBtb2RbbWJpLT5tb2RzX2NvdW50XS5tb2RfZW5kID0gKHVpbnRwdHJfdClf
XzJNX3J3ZGF0YV9lbmQgLQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAodWludHB0cl90KSBfc3RleHQ7CgpEaWQgeW91IGNvbnNpZGVyIGNoYW5naW5nIF9fMk1fcndk
YXRhX2VuZCdzIGRlY2xhcmF0aW9uIGFuZCB1c2luZwp0ZXh0X2J5dGVkaWZmKCkgaGVyZT8gT3Ro
ZXJ3aXNlLCBpZiB0aGUgY2FzdHMgYXJlIHRvIHN0YXksIHRoZSBzdHJheQpibGFuayBhZnRlciB0
aGUgc2Vjb25kIG9uZSBzaG91bGQgZ28gYXdheS4KCj4gLS0tIGEveGVuL2NvbW1vbi92aXJ0dWFs
X3JlZ2lvbi5jCj4gKysrIGIveGVuL2NvbW1vbi92aXJ0dWFsX3JlZ2lvbi5jCj4gQEAgLTExOSw3
ICsxMTksOSBAQCB2b2lkIF9faW5pdCBzZXR1cF92aXJ0dWFsX3JlZ2lvbnMoY29uc3Qgc3RydWN0
IGV4Y2VwdGlvbl90YWJsZV9lbnRyeSAqc3RhcnQsCj4gICAgICAgICAgY29uc3Qgc3RydWN0IGJ1
Z19mcmFtZSAqczsKPiAgCj4gICAgICAgICAgcyA9IGJ1Z19mcmFtZXNbaSAtIDFdOwo+IC0gICAg
ICAgIHN6ID0gYnVnX2ZyYW1lc1tpXSAtIHM7Cj4gKyAgICAgICAgLyogYnVnX2ZyYW1lW2ldIGFu
ZCBzIGFyZSBwb2ludGVycyB0byBkaWZmZXJlbnQgb2JqZWN0cy4gKi8KPiArICAgICAgICBzeiA9
ICgodWludHB0cl90KWJ1Z19mcmFtZXNbaV0gLSAodWludHB0cl90KXMpIC8KPiArICAgICAgICAg
ICAgIHNpemVvZihzdHJ1Y3QgYnVnX2ZyYW1lKTsKCkkgZGlzYWdyZWUgd2l0aCB0aGUgY29tbWVu
dCwgYW5kIGlmIHlvdSB0aGluayBpdCBpcyBjb3JyZWN0LCB0aGVuIG5vCm1hdHRlciB3aGF0IHlv
dSBkbyB0aGUgYmVoYXZpb3IgaXMgdW5kZWZpbmVkLiBJbnN0ZWFkIEkgdmlldyB0aGUKZW50aXJl
dHkgb2YgdGhlIC5idWdfZnJhbWVzLiogc2VjdGlvbnMgYXMgYSBzaW5nbGUgYXJyYXksIHdpdGgK
bGFiZWxzIHBsYWNlZCBub3Qgb25seSBhdCBzdGFydCBhbmQgZW5kLCBidXQgYWxzbyBpbiB0aGUg
bWlkZGxlLiBJCnRoaW5rIHRoZSBjb2RlIGhlcmUgd291bGQgYmV0dGVyIGFsc28gYmUgdGFrZW4g
Y2FyZSBvZiBieSB0aGUKREVDTEFSRV9CT1VORFMoKSBtYWNoaW5lcnksIGRpdmlkaW5nIHRoZSBz
aW5nbGUgYXJyYXkgaW50bwptdWx0aXBsZSBzbWFsbGVyIG9uZXMuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
