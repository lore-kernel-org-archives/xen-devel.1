From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v2 3/8] viridian: extend init/deinit hooks
 into synic and time modules
Date: Tue, 29 Jan 2019 04:56:51 -0700
Message-ID: <5C503F83020000780014B89F@prv1-mh.provo.novell.com>
References: <20190108151811.19510-1-paul.durrant@citrix.com>
 <20190108151811.19510-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1goS0f-0000kz-4h
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 11:56:57 +0000
In-Reply-To: <20190108151811.19510-4-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: paul.durrant@citrix.com
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IDAxLzA4LzE5IDQ6MTgg
UE0gPj4+Cj5UaGlzIHBhdGNoIHNpbXBseSBhZGRzIGRvbWFpbiBhbmQgdmNwdSBpbml0L2RlaW5p
dCBob29rcyBpbnRvIHRoZSBzeW5pYwo+YW5kIHRpbWUgbW9kdWxlcyBhbmQgd2lyZXMgdGhlbSBp
bnRvIHZpcmlkaWFuX1tkb21haW58dmNwdV1fW2luaXR8ZGVpbml0XSgpLgo+T25seSBvbmUgb2Yg
dGhlIGhvb2tzIGlzIGN1cnJlbnRseSBuZWVkZWQgKHRvIHVubWFwIHRoZSAnVlAgQXNzaXN0JyBw
YWdlKQo+YnV0IHN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIG1ha2UgdXNlIG9mIHRoZSBvdGhlcnMu
Cj4KPk5PVEU6IFRvIHBlcmZvcm0gdGhlIHVubWFwIG9mIHRoZSBWUCBBc3Npc3QgcGFnZSwKPnZp
cmlkaWFuX3VubWFwX2d1ZXN0X3BhZ2UoKSBpcyBub3cgZGlyZWN0bHkgY2FsbGVkIGluIHRoZSBu
ZXcKPnZpcmlkaWFuX3N5bmljX3ZjcHVfZGVpbml0KCkgZnVuY3Rpb24gKHdoaWNoIGlzIHNhZmUg
ZXZlbiBpZgo+aXNfdmlyaWRpYW5fdmNwdSgpIGV2YWx1YXRlcyB0byBmYWxzZSkuIFRoaXMgcmVw
bGFjZXMgdGhlIHNsaWdodGx5Cj5oYWNreSBtZWNoYW5pc20gb2YgZmFraW5nIGEgemVybyB3cml0
ZSB0byB0aGUKPkhWX1g2NF9NU1JfVlBfQVNTSVNUX1BBR0UgTVNSIGluIHZpcmlkaWFuX2NwdV9k
ZWluaXQoKS4KPgo+U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
