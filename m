From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 1/4] x86: use PDEP/PEXT for
 maddr/direct-map-offset conversion when available
Date: Wed, 31 Oct 2018 17:03:11 +0000
Message-ID: <20181031170311.rkhagwwcydciwmus@zion.uk.xensource.com>
References: <5AA7E79302000078001B0FAB@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F73C0@prv1-mh.provo.novell.com>
 <5AA7D98302000078001CDC8C@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F8008@prv1-mh.provo.novell.com>
 <5AA7D98302000078001DD5F0@prv1-mh.provo.novell.com>
 <5BA0F0D802000078001E96D4@prv1-mh.provo.novell.com>
 <5BA0F14502000078001E96E2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHtuY-0006YG-G2
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 17:04:06 +0000
Content-Disposition: inline
In-Reply-To: <5BA0F14502000078001E96E2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDY6MzY6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyBhbGxvd3MgdG8gZm9sZCA2IGluc3RydWN0aW9ucyBpbnRvIGEgc2luZ2xlIG9u
ZSwgcmVkdWNpbmcgY29kZSBzaXplCj4gcXVpdGUgYSBiaXQsIGVzcGVjaWFsbHkgd2hlbiBub3Qg
Y29uc2lkZXJpbmcgdGhlIGZhbGxiYWNrIGZ1bmN0aW9ucwo+ICh3aGljaCB3b24ndCBldmVyIG5l
ZWQgdG8gYmUgYnJvdWdodCBpbnRvIGlDYWNoZSBvciB0aGVpciBtYXBwaW5ncyBpbnRvCj4gaVRM
QiBvbiBzeXN0ZW1zIHN1cHBvcnRpbmcgQk1JMikuCj4gCj4gTWFrZSB1c2Ugb2YgZ2NjJ3MgbmV3
IFYgb3BlcmFuZCBtb2RpZmllciwgZXZlbiBpZiB0aGF0IHJlc3VsdHMgaW4gYQo+IHNsaWdodGx5
IG9kZCBkZXBlbmRlbmN5IGluIHRoZSBzb3VyY2VzIChidXQgSSBhbHNvIGRpZG4ndCB3YW50IHRv
Cj4gaW50cm9kdWNlIHlldCBhbm90aGVyIG1hbmlmZXN0IGNvbnN0YW50KS4gVGhpcyBhc3N1bWVz
IHRoYXQgYmFja3BvcnRzIG9mCj4gc3VwcG9ydCBmb3IgdGhpcyByZWxhdGl2ZWx5IG5ldyBtb2Rp
ZmllciBoYXZlIG9ubHkgYmVlbiBkb25lIHRvIHRvb2wKPiBjaGFpbnMgd2l0aCBub3QgdG9vIG9s
ZCBhIGJpbnV0aWxzIChnYXMpIHZlcnNpb24uIElmIHRoaXMgdHVybnMgb3V0IHRvCj4gYmUgYSBm
YWxzZSBhc3N1bXB0aW9uLCB3ZSdsbCBoYXZlIHRvIGFkZCBIQVZFX0FTX0JNSTIgYXMgYSBxdWFs
aWZpZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKSSdtIGFmcmFpZCB0aGlzIHBhdGNoIHNlcmllcyBzbWVsbHMgbGlrZSAgIm1pY3JvIG9wdGlt
aXNhdGlvbiBnb25lIHRvbwpmYXIiIHRvIG1lLiA6LS8KCldlaS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
