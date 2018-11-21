From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mem_access: move
 p2m_mem_access_sanity_check() from header
Date: Wed, 21 Nov 2018 03:00:14 -0700
Message-ID: <5BF52CAE02000078001FE57D@prv1-mh.provo.novell.com>
References: <1542737127-17695-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPPJ3-0008Ff-UP
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:00:25 +0000
In-Reply-To: <1542737127-17695-1-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE5OjA1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiBAQCAtNTQxLDYgKzU0MSwxMSBAQCB2b2lkIGFyY2hfcDJt
X3NldF9hY2Nlc3NfcmVxdWlyZWQoc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBhY2Nlc3NfcmVxdWly
ZWQpCj4gICNlbmRpZgo+ICB9Cj4gIAo+ICtib29sIHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVj
ayhzdHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICByZXR1cm4gaXNfaHZtX2RvbWFpbihkKSAm
JiBjcHVfaGFzX3ZteCAmJiBoYXBfZW5hYmxlZChkKTsKPiArfQoKV2l0aCBUYW1hcydzIGFjayBJ
J3ZlIGNvbW1pdHRlZCB0aGlzIGFzIGlzLCBidXQgZm9yIHRoZSBmdXR1cmUgbWF5CkkgYXNrIHRo
YXQgeW91IHRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBkbyB0cml2aWFsIGltcHJvdmVtZW50cyBp
bgpzdWNoIGNhc2VzIChoZXJlOiBhZGQgY29uc3QpPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
