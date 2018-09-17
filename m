From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 3/6] xenbus: dispatch per-domU watch event
 to per-domU xenwatch thread
Date: Mon, 17 Sep 2018 16:09:43 -0400
Message-ID: <f8e317e5-820f-1666-1bf6-1ed8f89b0856__13985.2728615098$1537214835$gmane$org@oracle.com>
References: <1536910456-13337-1-git-send-email-dongli.zhang@oracle.com>
 <1536910456-13337-4-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sv8h=l7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g1zog-00012C-Am
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 20:08:18 +0000
In-Reply-To: <1536910456-13337-4-git-send-email-dongli.zhang@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, srinivas.eeda@oracle.com, paul.durrant@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8xNC8xOCAzOjM0IEFNLCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4gIAo+ICtzdGF0aWMgaW50
IHhzX3dhdGNoX2luc2VydF9ldmVudChzdHJ1Y3QgeHNfd2F0Y2hfZXZlbnQgKmV2ZW50LCBkb21p
ZF90IGRvbWlkKQo+ICt7Cj4gKwlzdHJ1Y3QgbXR3YXRjaF9kb21haW4gKmRvbWFpbjsKPiArCWlu
dCByZXQgPSAtMTsKCi1FTk9ERVYgbWF5YmU/CgotYm9yaXMKCj4gKwo+ICsJcmN1X3JlYWRfbG9j
aygpOwo+ICsKPiArCWRvbWFpbiA9IG10d2F0Y2hfZmluZF9kb21haW4oZG9taWQpOwo+ICsJaWYg
KCFkb21haW4pIHsKPiArCQlyY3VfcmVhZF91bmxvY2soKTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJ
fQo+ICsKPiArCXNwaW5fbG9jaygmZG9tYWluLT5ldmVudHNfbG9jayk7Cj4gKwlpZiAoZG9tYWlu
LT5zdGF0ZSA9PSBNVFdBVENIX0RPTUFJTl9VUCkgewo+ICsJCWxpc3RfYWRkX3RhaWwoJmV2ZW50
LT5saXN0LCAmZG9tYWluLT5ldmVudHMpOwo+ICsJCXdha2VfdXAoJmRvbWFpbi0+ZXZlbnRzX3dx
KTsKPiArCQlyZXQgPSAwOwo+ICsJfQo+ICsJc3Bpbl91bmxvY2soJmRvbWFpbi0+ZXZlbnRzX2xv
Y2spOwo+ICsKPiArCXJjdV9yZWFkX3VubG9jaygpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30K
PiArCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
