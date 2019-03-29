From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] x86emul/fuzz: adjust canonicalization in
 sanitize_input()
Date: Fri, 29 Mar 2019 15:14:16 +0000
Message-ID: <8B8E72C2-696B-4C0D-8733-78C7B93B9FB0@citrix.com>
References: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mto7=SA=citrix.com=prvs=984564d2a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h9tGk-0001ds-QU
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:18:10 +0000
In-Reply-To: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <6F7870372984E647B9590B278481CB53@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTWFyIDI5LCAyMDE5LCBhdCAyOjUxIFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gRHJvcCBpdCBlbnRpcmVseSBmb3IgJXJicCAtIHRoaXMg
cmVnaXN0ZXIgaXMgbm90IHNwZWNpYWwgcHVycG9zZSBlbm91Z2gNCj4gdG8gd2FycmFudCBzdWNo
IHNwZWNpYWwgdHJlYXRtZW50LiBBZGQgYSBjb21tZW50IHRvIGNsYXJpZnkgdGhlIHB1cnBvc2UN
Cj4gb2YgdGhlIGNhbm9uaWNhbGl6YXRpb24gb2YgJXJpcCBhbmQgJXJzcC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KRkFPRDoNCjEuIEkg
ZG9u4oCZdCBvcHBvc2UgdGhpcywgYnV0DQoyLiBJIGRvbuKAmXQgc3VwcG9ydCBpdCBlaXRoZXI7
IGhvd2V2ZXIsDQozLiBJIGRvbuKAmXQgdGhpbmsgbXkgQWNrIGlzIG5lY2Vzc2FyeS4NCg0KIC1H
ZW9yZ2UNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
