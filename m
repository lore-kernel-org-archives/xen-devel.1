From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 10 Jul 2018 11:32:45 +0100
Message-ID: <23364.35661.260888.861745@mariner.uk.xensource.com>
References: <20180710093322.10854-1-george.dunlap@citrix.com>
 <5B4483F202000078001D28E2@prv1-mh.provo.novell.com>
 <73a5cb1a-a228-11c4-0f1d-da21a16726ad@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=shaj=j2=citrix.com=prvs=7225138ac=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fcpwv-0001Ci-Dg
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 10:32:49 +0000
In-Reply-To: <73a5cb1a-a228-11c4-0f1d-da21a16726ad@citrix.com>
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
LzIwMTggMTE6MDEgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9yIDJhOiBJbmNsdWRlIGEgY29t
bWVudCBzYXlpbmcgdGhlICdpbnRlcm5hbCcgaW50ZXJmYWNlIGhhc24ndCBiZWVuCj4gZXZhbHVh
dGVkIGZvciBzYWZldHksIGFuZCBkb24ndCBib3RoZXIgYmxhY2tsaXN0aW5nIG5ldyBvcHMgdW50
aWwgc3VjaAo+IGFuIGV2YWx1YXRpb24gaGFzIGJlZW4gbWFkZS4KCldlIHNob3VsZCBoYXZlIGEg
d2F5IG9mIHJlbWVtYmVyaW5nIHRoZSBkZXNpZ24gaW50ZW50LCBldmVuIGlmIGl0Cmhhc24ndCBi
ZWVuIGF1ZGl0ZWQuCgpTVVBQT1JULm1kIGNhbiBkZWFsIHdpdGggdGhlIHBvc3NpYmxlIHByb2Js
ZW0gb2YgcGVvcGxlIHRoaW5raW5nIHRoZQpub24tYmxhY2tsaXN0ZWQgaXRlbXMgYXJlIGZ1bGx5
IHJlYWR5IGZvciB1c2UuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
