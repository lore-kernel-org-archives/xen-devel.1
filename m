From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/pvh: copy data from low 1MB to Dom0
 physmap instead of mapping it
Date: Mon, 17 Sep 2018 11:41:29 +0100
Message-ID: <a1fe9135-ffcb-b9a0-ff9b-eb31752784e7@citrix.com>
References: <20180914111611.23008-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4ssd=l7=citrix.com=prvs=791546d89=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g1qyF-00012D-Ik
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 10:41:35 +0000
In-Reply-To: <20180914111611.23008-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <rogewr.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTQvMjAxOCAxMjoxNiBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElkZW50aXR5
IG1hcHBpbmcgUkFNIHJlZ2lvbnMgb24gdGhlIGxvdyAxTUIgZm9yIERvbTAgaXMgbm90IGlkZWFs
LAo+IHNpbmNlIHRoZXJlJ3MgZGF0YSB0aGVyZSB0aGF0IGNvdWxkIGJlIHVzZWQgYnkgWGVuIGR1
cmluZyBydW50aW1lCj4gKGxpa2UgdGhlIEFQIHRyYW1wb2xpbmUpLCBzbyBpbnN0ZWFkIG9mIGlk
ZW50aXR5IG1hcHBpbmcgdGhlIGxvdyAxTUIKPiBpbnRvIHRoZSBEb20wIHBoeXNtYXAgcG9wdWxh
dGUgdGhvc2UgUkFNIHJlZ2lvbnMgYW5kIGNvcHkgdGhlIGRhdGEuCj4gCj4gTm90ZSB0aGF0IHRo
aXMgYWxsb3dzIHRvIHJlbW92ZSB1bnNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qgc2luY2UgdGhl
Cj4gb25seSBjYWxsZXIgd2FzIHRoZSBQVkggRG9tMCBidWlsZGVyLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2V3ci5wYXVAY2l0cml4LmNvbT4KClJlbW92aW5nIHVu
c2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCgpIG9uY2UgaXQncyBub3QgdXNlZDoKCkFja2VkLWJ5
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
