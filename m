From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH RFC] libxl: set 1GB MMIO hole for PVH
Date: Thu, 10 May 2018 10:43:26 +0100
Message-ID: <CAFLBxZZ3A0tZGterC-6OUg6oN=KdTL6EjqvSeCLRB5rON96UZA@mail.gmail.com>
References: <20180509160712.26231-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0erk=h5=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1fGi6k-0001jL-2I
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 09:43:30 +0000
Received: by mail-qt0-x235.google.com with SMTP id f1-v6so1708977qtj.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 May 2018 02:43:27 -0700 (PDT)
In-Reply-To: <20180509160712.26231-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgOSwgMjAxOCBhdCA1OjA3IFBNLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPiBUaGlzIHByZXZlbnRzIHBhZ2Utc2hhdHRlcmluZywgYnkg
YmVpbmcgYWJsZSB0byBwb3B1bGF0ZSB0aGUgUkFNCj4gcmVnaW9ucyBiZWxvdyA0R0IgdXNpbmcg
MUdCIHBhZ2VzLCBwcm92aWRlZCB0aGUgZ3Vlc3QgbWVtb3J5IHNpemUgaXMKPiBzZXQgdG8gYSBt
dWx0aXBsZSBvZiBhIEdCLgo+Cj4gTm90ZSB0aGF0IHRoZXJlIGFyZSBzb21lIHNwZWNpYWwgYW5k
IEFDUEkgcGFnZXMgaW4gdGhlIE1NSU8gaG9sZSB0aGF0Cj4gd2lsbCBiZSBwb3B1bGF0ZWQgdXNp
bmcgc21hbGxlciBvcmRlciBwYWdlcywgYnV0IHRob3NlIHNob3VsZG4ndCBiZQo+IGFjY2Vzc2Vk
IGFzIG9mdGVuIGFzIFJBTSByZWdpb25zLgoKSXMgaXQgcG9zc2libGUgdG8gcnVuIFBWSCBpbiBw
dXJlIDMyLWJpdCBtb2RlIChhcyBvcHBvc2VkIHRvIDMyLWJpdApQQUUpPyAgSWYgc28sIHN1Y2gg
Z3Vlc3RzIHdvdWxkIGJlIGxpbWl0ZWQgdG8gM0dpQiBvZiB0b3RhbCBtZW1vcnkKKGluc3RlYWQg
b2YgNEdpQikuCgpCdXQgSSBzdXBwb3NlIHRoZXJlJ3Mgbm8gcGFydGljdWxhciByZWFzb24gdG8g
cnVuIFBWSCBpbiBwdXJlIDMyLWJpdAptb2RlIGluc3RlYWQgb2YgMzItYml0IFBBRS4gIChJIGRv
bid0ICp0aGluayogVExCIG1pc3NlcyBhcmUgc2xvd2VyIG9uCjMtbGV2ZWwgcGFnaW5nIHRoYW4g
Mi1sZXZlbCBwYWdpbmcsIGJlY2F1c2UgdGhlIEwzIGVudHJpZXMgYXJlCmVzc2VudGlhbGx5IGxv
YWRlZCBvbiBDUjMgc3dpdGNoLikKClNvIGF0IHRoZSBtb21lbnQgdGhpcyBzZWVtcyBPSyB0byBt
ZS4gIElmIHNvbWVvbmUgZGVjaWRlcyB0aGV5IHdhbnQgdG8KcnVuIFBWSCAyLWxldmVsIHBhZ2lu
ZyB3aXRoIG1vcmUgdGhhbiAzR2lCIG9mIFJBTSwgd2UgY2FuIGVhc2lseSBhZGQKYW4gb3B0aW9u
IHRvIHR1cm4gaXQgb24uCgooSGF2ZW4ndCByZXZpZXdlZCB0aGUgY29kZS4pCgogLUdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
