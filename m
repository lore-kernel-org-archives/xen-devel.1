From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 10 Jul 2018 11:26:45 +0100
Message-ID: <23364.35301.770106.69489@mariner.uk.xensource.com>
References: <20180710093322.10854-1-george.dunlap@citrix.com>
 <20180710095415.niyjxfmotv3jxeqo@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=shaj=j2=citrix.com=prvs=7225138ac=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fcprJ-00005i-T9
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 10:27:01 +0000
In-Reply-To: <20180710095415.niyjxfmotv3jxeqo@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIXSBodm0vYWx0cDJtOiBDbGFyaWZ5IHRoZSBwcm9w
ZXIgd2F5IHRvIGV4dGVuZCB0aGUgYWx0cDJtIGludGVyZmFjZSIpOgo+IE9uIFR1ZSwgSnVsIDEw
LCAyMDE4IGF0IDEwOjMzOjIyQU0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiArICog
Tm9ybWFsbHkgaHlwZXJjYWxscyBtYWRlIGJ5IGEgcHJvZ3JhbSBpbiBkb21haW4gMCBpbiBvcmRl
ciB0bwo+ID4gKyAqIGNvbnRyb2wgYSBndWVzdCB3b3VsZCBiZSBET01DVExzIHJhdGhlciB0aGFu
IEhWTU9Qcy4gIEJ1dCBpbiBvcmRlcgo+ID4gKyAqIHRvIHByb3Blcmx5IGVuYWJsZSB0aGUgJ2lu
dGVybmFsJyB1c2UgY2FzZSwgYXMgd2VsbCBhcyB0byBhdm9pZAo+ID4gKyAqIGZyYWdtZW50YXRp
b24sIGFsbCBhbHRwMm0gc3Vib3BzIHNob3VsZCBjb21lIHVuZGVyIHRoaXMgc2luZ2xlCj4gPiAr
ICogSFZNT1AuCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgYXJndW1lbnQuIFRoZXJlIGlz
IG5vIHJpc2sgb2YgY29kZSBkdXBsaWNhdGlvbiAvCj4gZnJhZ21lbnRhdGlvbiBpZiB0aGUgaW1w
bGVtZW50YXRpb24gaXMgY29udGFpbmVkIHdpdGhpbiBhIGZ1bmN0aW9uLgo+IFNob3VsZCB3ZSBj
aG9vc2UgdG8gc3BsaXQgb25lIEhWTU9QIGludG8gYSBET01DVEwgYW5kIGEgSFZNT1AsIHRoZXJl
IGlzCj4gbm93IHR3byBlbnRyaWVzIHRvIHRoZSBpbnRlcm5hbCBmdW5jdGlvbiwgZWFjaCBvZiB3
aGljaCB3aXRoIHByb3Blcgo+IGNoZWNrcywgYnV0IHRoZXkgd2lsbCBjYWxsIHRoZSBzYW1lIGlu
dGVybmFsIGZ1bmN0aW9uIGV2ZW50dWFsbHkuCj4gCj4gSSBhZG1pdCBJIGhhdmVuJ3QgZm9sbG93
ZWQgdGhlIGRpc2N1c3Npb24gY2xvc2VseS4KCiJlYWNoIG9mIHdoaWNoIHdpdGggcHJvcGVyIGNo
ZWNrcyIuICBZb3UgZW5kIHVwIGRvaW5nIHNvbWUgb2YgdGhlCnBhcmFtZXRlciB2YWxpZGF0aW9u
IHR3aWNlLiAgVGhhdCBpcyB2ZXJ5IHVuZGVzaXJhYmxlIGluZGVlZC4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
