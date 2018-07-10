From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 10 Jul 2018 11:59:59 +0100
Message-ID: <23364.37295.298968.438866@mariner.uk.xensource.com>
References: <20180710093322.10854-1-george.dunlap@citrix.com>
 <5B4483F202000078001D28E2@prv1-mh.provo.novell.com>
 <73a5cb1a-a228-11c4-0f1d-da21a16726ad@citrix.com>
 <23364.35661.260888.861745@mariner.uk.xensource.com>
 <6b083fa6-2d6e-846d-a800-02832f158368@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=shaj=j2=citrix.com=prvs=7225138ac=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fcqNH-0004aK-UW
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 11:00:03 +0000
In-Reply-To: <6b083fa6-2d6e-846d-a800-02832f158368@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIXSBodm0vYWx0cDJtOiBDbGFyaWZ5IHRo
ZSBwcm9wZXIgd2F5IHRvIGV4dGVuZCB0aGUgYWx0cDJtIGludGVyZmFjZSIpOgo+IE9uIDA3LzEw
LzIwMTggMTE6MzIgQU0sIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gV2Ugc2hvdWxkIGhhdmUgYSB3
YXkgb2YgcmVtZW1iZXJpbmcgdGhlIGRlc2lnbiBpbnRlbnQsIGV2ZW4gaWYgaXQKPiA+IGhhc24n
dCBiZWVuIGF1ZGl0ZWQuCj4gPiAKPiA+IFNVUFBPUlQubWQgY2FuIGRlYWwgd2l0aCB0aGUgcG9z
c2libGUgcHJvYmxlbSBvZiBwZW9wbGUgdGhpbmtpbmcgdGhlCj4gPiBub24tYmxhY2tsaXN0ZWQg
aXRlbXMgYXJlIGZ1bGx5IHJlYWR5IGZvciB1c2UuCj4gCj4gSSB0aGluayBTVVBQT1JULm1kIHNo
b3VsZCBwcmltYXJpbHkgYmUgZm9yIGVuZCB1c2VycyB0byBkZXRlcm1pbmUKPiB3aGV0aGVyIHRo
ZXkgc2hvdWxkIHVzZSBhbiBpbnRlcmZhY2Ugb3Igbm90LiAgQSB0ZWNobmljYWwgZGlzY3Vzc2lv
bgo+IGFib3V0IGV4YWN0bHkgdG8gd2hhdCBkZWdyZWUgYW4gaW50ZXJmYWNlIGhhcyAob3IgaGFz
bid0KSBiZWVuIHZldHRlZCBpcwo+IG1vcmUgdG93YXJkcyBhIGRldmVsb3BlciB3aG8gbWF5IGJl
IGxvb2tpbmcgdG8gZ2V0IHRoaW5ncyBpbnRvIGEKPiBzdXBwb3J0ZWQgc3RhdGUsIGFuZCBzbyBz
aG91bGQgcHJvYmFibHkgYmUgaW4gdGhlIGNvZGUgc29tZXdoZXJlLgoKSSBhZ3JlZSB3aXRoIHRo
YXQuICBCdXQgY3VycmVudGx5IEkgdGhpbmsgbm9uZSBvZiBpdCBoYXMgYmVlbgphdWRpdGVkLiAg
SWYgdGhlcmUgaXMgYW55IHF1ZXN0aW9uIG9mIGRvdWJ0IHdlIGNhbiBsZWF2ZSBhIGNvbW1lbnQg
aW4Kb25lIHBsYWNlIHJlZmVyZW5jZWluZyB0aGUgU1VQUE9SVC5tZCBzdGF0dXMgYW5kIHNheWlu
ZyBgb25lIHJlYXNvbiBpcwp0aGF0IG5vbmUgb2YgdGhpcyBzdHVmZiBoYXMgYmVlbiBhdWRpdGVk
Jy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
