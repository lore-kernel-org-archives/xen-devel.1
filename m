From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 4/6] mm: introduce a helper to get the
 memory type of a page
Date: Tue, 21 Aug 2018 06:53:05 -0600
Message-ID: <5B7C0B3102000078001E0801@prv1-mh.provo.novell.com>
References: <20180821074944.38773-1-roger.pau@citrix.com>
 <20180821074944.38773-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs69o-0007KJ-G6
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 12:53:12 +0000
In-Reply-To: <20180821074944.38773-5-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDA5OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFJldHVybnMgYWxsIHRoZSBtZW1vcnkgdHlwZXMgYXBwbGljYWJsZSB0byBhIHBhZ2UuCj4gCj4g
VGhpcyBmdW5jdGlvbiBpcyB1bmltcGxlbWVudGVkIGZvciBBUk0uCj4gCj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQnV0IHRoaXMgc2hvdWxkIG9ubHkgZ28g
aW4gdG9nZXRoZXIgd2l0aCB0aGUgY29uc3VtZXIgb2YgdGhlIG5ldyBmdW5jdGlvbgpzZWVpbmcg
dGhhdCB5b3UgZGlkbid0IGZvbGQgdGhlIHBhdGNoZXMuCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
