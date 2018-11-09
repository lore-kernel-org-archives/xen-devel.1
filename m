From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen-blkfront: fix kernel panic with
 blkfront_remove()
Date: Fri, 9 Nov 2018 07:16:22 +0100
Message-ID: <9414b993-15f6-941a-fc2b-e96147e4fb26__37330.9974595488$1541744114$gmane$org@suse.com>
References: <1541725843-2019-1-git-send-email-manjunath.b.patil@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mbz9=nu=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gL05i-00084z-QP
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 06:16:26 +0000
In-Reply-To: <1541725843-2019-1-git-send-email-manjunath.b.patil@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manjunath Patil <manjunath.b.patil@oracle.com>, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, roger.pau@citrix.com
Cc: axboe@kernel.dk, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAwMjoxMCwgTWFuanVuYXRoIFBhdGlsIHdyb3RlOgo+IFdoZW4gd2UgdHJ5
IHRvIGRldGFjaCB0aGUgZGV2aWNlLCBibGtmcm9udF9yZW1vdmUoKSB0cmllcyB0byBhY2Nlc3MK
PiBibGtmcm9udF9pbmZvIGxlYWRpbmcgdG8ga2VybmVsIHBhbmljLgo+IAo+IFR5cGljYWwgY2Fs
bCBzdGFjayBpbnZvbHZpbmcgcGFuaWMgLQo+ICAjMTAgcGFnZV9mYXVsdCBhdCBmZmZmZmZmZjgx
NmYyNWRmCj4gICAgICBbZXhjZXB0aW9uIFJJUDogYmxraWZfZnJlZSs0Nl0KPiAgIzExIGJsa2Zy
b250X3JlbW92ZSBhdCBmZmZmZmZmZmEwMDRkZTQ3IFt4ZW5fYmxrZnJvbnRdCj4gICMxMiB4ZW5i
dXNfZGV2X3JlbW92ZSBhdCBmZmZmZmZmZjgxM2ZhYTRjCj4gICMxMyBfX2RldmljZV9yZWxlYXNl
X2RyaXZlciBhdCBmZmZmZmZmZjgxNDc2OWFhCj4gICMxNCBkZXZpY2VfcmVsZWFzZV9kcml2ZXIg
YXQgZmZmZmZmZmY4MTQ3NmE2Mwo+ICAjMTUgYnVzX3JlbW92ZV9kZXZpY2UgYXQgZmZmZmZmZmY4
MTQ3NjJlYgo+ICAjMTYgZGV2aWNlX2RlbCBhdCBmZmZmZmZmZjgxNDcyNjg0Cj4gICMxNyBkZXZp
Y2VfdW5yZWdpc3RlciBhdCBmZmZmZmZmZjgxNDcyN2UyCj4gICMxOCB4ZW5idXNfZGV2X2NoYW5n
ZWQgYXQgZmZmZmZmZmY4MTNmYTg5Zgo+ICAjMTkgZnJvbnRlbmRfY2hhbmdlZCBhdCBmZmZmZmZm
ZjgxM2ZjYTE5Cj4gICMyMCB4ZW53YXRjaF90aHJlYWQgYXQgZmZmZmZmZmY4MTNmODhmOQo+ICAj
MjEga3RocmVhZCBhdCBmZmZmZmZmZjgxMGE0ODZiCj4gICMyMiByZXRfZnJvbV9mb3JrIGF0IGZm
ZmZmZmZmODE2ZWQyYTgKPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1v
ZmYtYnk6IE1hbmp1bmF0aCBQYXRpbCA8bWFuanVuYXRoLmIucGF0aWxAb3JhY2xlLmNvbT4KCkNv
bW1pdCBmOTI4OThlN2YzMmUzIGFscmVhZHkgYWRkZWQgdGhhdC4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
