From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC] x86/xsave: prefer eager clearing of
 state over eager restoring
Date: Tue, 21 Aug 2018 11:10:28 +0100
Message-ID: <20180821101028.4o3srromn4jtn6dz@citrix.com>
References: <5B2CD60902000078001CCEF7@prv1-mh.provo.novell.com>
 <5c43bed1-bc50-2cba-8346-8dca2b784056@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs3cN-00072w-OP
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:10:31 +0000
Content-Disposition: inline
In-Reply-To: <5c43bed1-bc50-2cba-8346-8dca2b784056@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <Wei.Liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMTA6MDc6MDBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJcnJlc3BlY3RpdmUgb2Ygd2hhdCB3ZSBkbyBoZXJlLCBJJ2QgcmVhbGx5IGxpa2Ug
V2VpIHRvIHJlYmFzZSBoaXMgd29yawo+IHRvIHJlbW92ZSB0aGUgbGF6eSBmcHUgbG9naWMgZnJv
bSB0aGUgbmVzdGVkIHZpcnQgcGF0aHMsIGJlY2F1c2UgaXRzIGEKPiBuby1icmFpbmVyIChwZXJm
IHdpc2UpIGFuZCBjb21lcyB3aXRoIGEgbWFzc2l2ZSBhbW91bnQgb2YgY29kZQo+IHNpbXBsaWZp
Y2F0aW9uIGluIFhlbi4KCkkgYW0gdmVyeSBoYXBweSB0byBnZXQgcmlkIG9mIG1vcmUgY29kZSBp
ZiB0aGF0J3MgYWdyZWVkLiA6LSkKCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
