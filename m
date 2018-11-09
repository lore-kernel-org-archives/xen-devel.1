From: Manjunath Patil <manjunath.b.patil@oracle.com>
Subject: Re: [PATCH v2] xen-blkfront: fix kernel panic with
 blkfront_remove()
Date: Fri, 9 Nov 2018 11:08:56 -0800
Message-ID: <28e89b14-add7-348d-f054-975af74bdf52__35430.3621840247$1541790487$gmane$org@oracle.com>
References: <1541725843-2019-1-git-send-email-manjunath.b.patil@oracle.com>
 <9414b993-15f6-941a-fc2b-e96147e4fb26@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lv5h=nu=oracle.com=manjunath.b.patil@srs-us1.protection.inumbo.net>)
 id 1gLC9X-0006D7-P7
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 19:09:11 +0000
In-Reply-To: <9414b993-15f6-941a-fc2b-e96147e4fb26@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, roger.pau@citrix.com
Cc: axboe@kernel.dk, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

b29wcyEgc29ycnkgZm9yIG5vdCBub3RpY2luZyB0aGlzLgoKLU1hbmp1bmF0aAoKT24gMTEvOC8y
MDE4IDEwOjE2IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LzExLzIwMTggMDI6MTAs
IE1hbmp1bmF0aCBQYXRpbCB3cm90ZToKPj4gV2hlbiB3ZSB0cnkgdG8gZGV0YWNoIHRoZSBkZXZp
Y2UsIGJsa2Zyb250X3JlbW92ZSgpIHRyaWVzIHRvIGFjY2Vzcwo+PiBibGtmcm9udF9pbmZvIGxl
YWRpbmcgdG8ga2VybmVsIHBhbmljLgo+Pgo+PiBUeXBpY2FsIGNhbGwgc3RhY2sgaW52b2x2aW5n
IHBhbmljIC0KPj4gICAjMTAgcGFnZV9mYXVsdCBhdCBmZmZmZmZmZjgxNmYyNWRmCj4+ICAgICAg
IFtleGNlcHRpb24gUklQOiBibGtpZl9mcmVlKzQ2XQo+PiAgICMxMSBibGtmcm9udF9yZW1vdmUg
YXQgZmZmZmZmZmZhMDA0ZGU0NyBbeGVuX2Jsa2Zyb250XQo+PiAgICMxMiB4ZW5idXNfZGV2X3Jl
bW92ZSBhdCBmZmZmZmZmZjgxM2ZhYTRjCj4+ICAgIzEzIF9fZGV2aWNlX3JlbGVhc2VfZHJpdmVy
IGF0IGZmZmZmZmZmODE0NzY5YWEKPj4gICAjMTQgZGV2aWNlX3JlbGVhc2VfZHJpdmVyIGF0IGZm
ZmZmZmZmODE0NzZhNjMKPj4gICAjMTUgYnVzX3JlbW92ZV9kZXZpY2UgYXQgZmZmZmZmZmY4MTQ3
NjJlYgo+PiAgICMxNiBkZXZpY2VfZGVsIGF0IGZmZmZmZmZmODE0NzI2ODQKPj4gICAjMTcgZGV2
aWNlX3VucmVnaXN0ZXIgYXQgZmZmZmZmZmY4MTQ3MjdlMgo+PiAgICMxOCB4ZW5idXNfZGV2X2No
YW5nZWQgYXQgZmZmZmZmZmY4MTNmYTg5Zgo+PiAgICMxOSBmcm9udGVuZF9jaGFuZ2VkIGF0IGZm
ZmZmZmZmODEzZmNhMTkKPj4gICAjMjAgeGVud2F0Y2hfdGhyZWFkIGF0IGZmZmZmZmZmODEzZjg4
ZjkKPj4gICAjMjEga3RocmVhZCBhdCBmZmZmZmZmZjgxMGE0ODZiCj4+ICAgIzIyIHJldF9mcm9t
X2ZvcmsgYXQgZmZmZmZmZmY4MTZlZDJhOAo+Pgo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5qdW5hdGggUGF0aWwgPG1hbmp1bmF0aC5iLnBhdGlsQG9y
YWNsZS5jb20+Cj4gQ29tbWl0IGY5Mjg5OGU3ZjMyZTMgYWxyZWFkeSBhZGRlZCB0aGF0Lgo+Cj4K
PiBKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
