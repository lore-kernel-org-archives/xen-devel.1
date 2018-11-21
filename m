From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] xen: sched: Credit2: during scheduling,
 update the idle mask before using it
Date: Wed, 21 Nov 2018 15:57:45 +0000
Message-ID: <dd747aed-8144-2de3-f6d3-62943bf60173@citrix.com>
References: <153926549830.22680.203200918007449375.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=azpx=oa=citrix.com=prvs=856900a8f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gPUsv-0004LC-VM
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 15:57:49 +0000
In-Reply-To: <153926549830.22680.203200918007449375.stgit@wayrath>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTEvMTggMjo0NCBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gTG9hZCBiYWxhbmNp
bmcsIHdoZW4gaGFwcGVuaW5nLCBhdCB0aGUgZW5kIG9mIGEgInNjaGVkdWxlciBlcG9jaCIsIGNh
bgo+IHRyaWdnZXIgdmNwdSBtaWdyYXRpb24sIHdoaWNoIGluIGl0cyB0dXJuIG1heSBjYWxsIHJ1
bnFfdGlja2xlKCkuIElmIHRoZQo+IGNwdSB3aGVyZSB0aGlzIGhhcHBlbnMgd2FzIGlkbGUsIGJ1
dCB3ZSdyZSBub3cgZ29pbmcgdG8gc2NoZWR1bGUgYSB2Y3B1Cj4gb24gaXQsIGxldCdzIHVwZGF0
ZSB0aGUgcnVucSdzIGlkbGUgY3B1cyBtYXNrIGFjY29yZGluZ2x5IF9iZWZvcmVfIGRvaW5nCj4g
bG9hZCBiYWxhbmNpbmcuCj4gCj4gTm90IGRvaW5nIHRoYXQsIGluIGZhY3QsIG1heSBjYXVzZSBy
dW5xX3RpY2tsZSgpIHRvIHRoaW5rIHRoYXQgdGhlIGNwdQo+IGlzIHN0aWxsIGlkbGUsIGFuZCB0
aWNrbGUgaXQgdG8gZ28gcGljayB1cCBhIHZjcHUgZnJvbSB0aGUgcnVucXVldWUsCj4gd2hpY2gg
bWlnaHQgYmUgd3JvbmcvdW5pZGVhbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9s
aSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKUGF0Y2ggbG9va3MgZ29vZDoKClJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpPbmUgY29tbWVudDogVGhl
IHRpdGxlIHNlZW1zIHRvIGhhdmUgZXhjZXNzaXZlIHRhZ3MuICBZb3Ugb25seSBuZWVkCmVub3Vn
aCBmb3IgcGVvcGxlIHNjcm9sbGluZyB0aHJvdWdoIHRvIGZpZ3VyZSBvdXQgdGhlIGRvbWFpbjsK
Inhlbi9jcmVkaXQyOiIsIG9yIGV2ZW4ganVzdCAiY3JlZGl0MjoiIGlzIGVub3VnaC4gIE1vcmUg
dGhhbiB0aGF0IG1ha2VzCnRoZSBsaW5lIHRvbyBsb25nIGFuZCBjYW4gb2JzY3VyZSBpbXBvcnRh
bnQgaW5mb3JtYXRpb24gaWYgdGhlIGxpbmVzIGVuZAp1cCBiZWluZyBjbGlwcGVkLgoKRG8geW91
IG1pbmQgaWYgSSBjaGFuZ2UgdGhhdCBvbiBjaGVjay1pbj8KCiAtR2VvcmdlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
