From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 08/10] mg-anoint: Support mg-anoint
 retrieve --tolerate-unprepared
Date: Thu, 17 May 2018 15:22:49 +0100
Message-ID: <20180517142249.jkyvosy3ohyvxq3t@MacBook-Pro-de-Roger.local>
References: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
 <1526555819-29883-9-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xtgg=ie=citrix.com=prvs=668872ca3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fJJp3-0002P4-GP
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 14:24:01 +0000
Content-Disposition: inline
In-Reply-To: <1526555819-29883-9-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTcsIDIwMTggYXQgMTI6MTY6NTdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gbWFrZS0qLWZsaWdodCBpcyBnb2luZyB0byB3YW50IHRoaXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpKdXN0IGEgc3R5bGUg
Y29tbWVudCBiZWxvdy4KCj4gLS0tCj4gIG1nLWFub2ludCB8IDEyICsrKysrKysrKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvbWctYW5vaW50IGIvbWctYW5vaW50Cj4gaW5kZXggNTIyY2JkZC4uZDA5MTI0YiAx
MDA3NTUKPiAtLS0gYS9tZy1hbm9pbnQKPiArKysgYi9tZy1hbm9pbnQKPiBAQCAtMTUsMTAgKzE1
LDEyIEBACj4gICMgICAgICAgIC0tYWxsb3ctYmxlc3NlZD1CTEVTU0lORywuLi4gICAgICAgZGVm
YXVsdCBpcyBmcm9tIGBwcmVwYXJlJwo+ICAjICAgICAgICAtLWFsbG93LWpvYi1zdGF0dXM9U1RB
VFVTLC4uLiAgICAgIGRlZmF1bHQgaXMgb25seSBgcGFzcycKPiAgIwo+IC0jICAuL21nLWFub2lu
dCByZXRyaWV2ZSBSRUZLRVkKPiArIyAgLi9tZy1hbm9pbnQgcmV0cmlldmUgWy0tdG9sZXJhdGUt
dW5wcmVwYXJlZF0gUkVGS0VZCj4gICMgICAgICA9PiBGTElHSFQgSk9CCj4gICMgICAgICAgICBp
ZiBub3RoaW5nIGFub2ludGVkIHlldCwgcHJpbnRzIG5vdGhpbmcgYW5kIGV4aXRzIDAKPiAgIyAg
ICAgICAgIGlmIGFub2ludG1lbnQgbm90IHByZXBhcmVkLCBmYWlscwo+ICsjICAgICAgV2l0aCAt
LXRvbGVyYXRlLXVucHJlcGFyZWQsIGl0IGlzIG5vdCBhbiBlcnJvciBpZiBub3RoaW5nIGlzCj4g
KyMgICAgICByZXBvcnRlZCBiZWNhdXNlIHRoZSBhbm9pbnRtZW50IGhhcyBub3QgYmVlbiBwcmVw
YXJlZC4KPiAgIwo+ICAjICAuL21nLWFub2ludCBsaXN0LXByZXBhcmVkIFJFRktFWS1HTE9CCj4g
ICMgICAgICA9PiBwb3NzaWJseSBlbXB0eSBsaXN0IG9mIFJFRktFWXMKPiBAQCAtMjk0LDYgKzI5
NiwxMSBAQCBFTkQKPiAgfSAgICAKPiAgCj4gIHN1YiBjbWRfcmV0cmlldmUgewo+ICsgICAgbXkg
JHRvbGVyYXRlX3VucHJlcGFyZWQ7Cj4gKyAgICBpZiAoQEFSR1YgJiYgJEFSR1ZbMF0gZXEgJy0t
dG9sZXJhdGUtdW5wcmVwYXJlZCcpIHsKPiArCXNoaWZ0IEBBUkdWOwo+ICsJJHRvbGVyYXRlX3Vu
cHJlcGFyZWQgPSAxOwo+ICsgICAgfQoKVGhlcmUgc2VlbXMgdG8gYmUgYSBtaXggYmV0d2VlbiBo
YXJkIGFuZCBzb2Z0IHRhYnMgaW4gdGhlIGNodW5rIGFib3ZlCihhbmQgYmVsb3cpLgoKVGhhbmtz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
