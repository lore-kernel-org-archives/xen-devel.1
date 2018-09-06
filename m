From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 03/11] vpci: add tear down functions
Date: Thu, 6 Sep 2018 10:57:10 +0100
Message-ID: <20180906095710.tmx5zjl7udnkz3hn@zion.uk.xensource.com>
References: <20180717094830.54806-1-roger.pau@citrix.com>
 <20180717094830.54806-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xusr=lu=citrix.com=prvs=7806f00aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxr2I-0000ER-3s
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 09:57:14 +0000
Content-Disposition: inline
In-Reply-To: <20180717094830.54806-4-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMTE6NDg6MjJBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRlYXIgZG93biBmdW5jdGlvbnMgYXJlIG5vdCBtYW5kYXRvcnkuIE5vdGUgdGhh
dCB0aGlzIHBhdGNoIGp1c3QKPiBpbXBsZW1lbnRzIHRoZSBmcmFtZXdvcmssIGJ1dCBkb2Vzbid0
IGltcGxlbWVudCBhbnkgdGVhciBkb3duIGZ1bmN0aW9uCj4geWV0Lgo+IAo+IFRoZSBsaXN0IG9m
IHZwY2kgaW5pdCBhbmQgdGVhcmRvd24gZnVuY3Rpb25zIGlzIGFsc28gbW92ZWQgb3V0c2lkZSBv
Zgo+IHRoZSBpbml0IHNlY3Rpb24uIFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9yIFNSLUlPViBz
dXBwb3J0LCB3aGljaAo+IHJlcXVpcmVzIHRoZSBhYmlsaXR5IHRvIGFkZCBhbmQgcmVtb3ZlIHBj
aSBkZXZpY2VzIChhbmQgdnBjaSBoYW5kbGVycykKPiBhZnRlciBib290Lgo+IAo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
