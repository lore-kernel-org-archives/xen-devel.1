From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/cacheattr: fix
 mtrr_pat_not_equal
Date: Thu, 17 May 2018 05:54:47 -0600
Message-ID: <5AFD6D8702000078001C395D@prv1-mh.provo.novell.com>
References: <20180517094809.80469-1-roger.pau@citrix.com>
 <5AFD5CF402000078001C38BD@prv1-mh.provo.novell.com>
 <20180517111017.cs4epmlbi5iffz3i@MacBook-Pro-de-Roger.local>
 <5AFD688002000078001C393B@prv1-mh.provo.novell.com>
 <e866444e-3fcf-ca9e-8363-774b7cc04895@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rtgu=ie=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fJHUf-0006EZ-QN
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:54:49 +0000
In-Reply-To: <e866444e-3fcf-ca9e-8363-774b7cc04895@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA1LjE4IGF0IDEzOjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTm90aGluZyBnb29kIHdpbGwgY29tZSBvZiB0cnlpbmcgdG8gZm9ybWFsbHkgc3VwcG9y
dCBkaWZmZXJlbnQgTVNSCj4gY2FwYWJpbGl0aWVzIG9uIGRpZmZlcmVudCB2Y3B1cywgYmVjYXVz
ZSB5b3Ugd29uJ3QgZmluZCBhbnkgaGFyZHdhcmUKPiB3aGVyZSB5b3UgY2FuIGRvIHRoaXMgaW4g
cHJhY3RpY2UuCgpUaGlua2luZyBvZiBpdCAtIGFsbG93aW5nIHRoaXMgd291bGQgYmUgYSBuaWNl
IHdheSB0byBhbGxvdyB0ZXN0aW5nIE9TCmNvZGUgd2hlbiBtZWFuaW5nIGl0IHRvIGNvcGUgd2l0
aCBhc3ltbWV0cmllcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
