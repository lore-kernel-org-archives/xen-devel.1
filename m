From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.7] arm: constify atomic_read parameter
Date: Wed, 15 Aug 2018 09:51:35 +0100
Message-ID: <cf2b9d6d-7bd9-fce7-3961-fe20f5e3ff8a@arm.com>
References: <20180815082836.6046-1-wei.liu2@citrix.com>
 <cce88130-c26d-7b02-a31a-138b6077f3e5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a8op=k6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fprWn-0006i1-Fk
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 08:51:41 +0000
In-Reply-To: <cce88130-c26d-7b02-a31a-138b6077f3e5@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOC8xNS8yMDE4IDA5OjI5IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE1LzA4
LzIwMTggMDk6MjgsIFdlaSBMaXUgd3JvdGU6Cj4+IGRlZDJhMzdkNjMgYWRkZWQgY29uc3QgdG8g
YXRvbWljX3JlYWQuIERvIHRoZSBzYW1lIGZvciBBcm0KPj4gY291bnRlcnBhcnQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gTW9zdCBsaWtl
bHkgbmVlZGVkIGZvciA0LjYgYXMgd2VsbC4KCkZlZWwgZnJlZSB0byBhZGQgbXkgYWNrIG9uIDQu
NiBwYXRjaCBhcyB3ZWxsOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+LgoKPiAKPiB+QW5kcmV3Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
