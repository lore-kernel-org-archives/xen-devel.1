From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] page-alloc: accompany BUG() with printk()
Date: Wed, 15 May 2019 12:09:01 +0200
Message-ID: <20190515100901.4psea2vmmugrkigl@Air-de-Roger>
References: <5CDBD157020000780022F1EA@prv1-mh.provo.novell.com>
 <20190515094435.fgcqzbmj7gbqfgmj@Air-de-Roger>
 <fb2114ce-79d0-fcb1-5b4e-c540aecb360b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ez+k=TP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQqqa-00049R-Th
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:09:16 +0000
Content-Disposition: inline
In-Reply-To: <fb2114ce-79d0-fcb1-5b4e-c540aecb360b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTA6NTk6MjBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wNS8yMDE5IDEwOjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDI6NDQ6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4gTG9nIGluZm9ybWF0aW9uIGxpa2VseSByZWxldmFudCBmb3IgdW5kZXJzdGFuZGlu
ZyB3aHkgdGhlIEJVRygpcyB3ZXJlCj4gPiBXaHkgbm90IHVzZSBwYW5pYyBpbnN0ZWFkIG9mIHBy
aW50ayArIEJVRz8KPiAKPiBCZWNhdXNlIHRoZSBiYWNrdHJhY2UgaXMgdXNlZnVsIGEgbG90IG9m
IHRoZSB0aW1lLgoKT2gsIHBhbmljIGhhcyBubyBiYWNrdHJhY2UsIHRoYXQncyBub3QgdmVyeSB1
c2VmdWwuIE1heWJlIHdlIGNvdWxkIGFkZAphIHBhbmljX3RyYWNlIHZlcnNpb24gdG8gYXZvaWQg
aGF2aW5nIHRvIGRvIGEgcHJpbnRrICsgQlVHLiBJbiBhbnkKY2FzZToKClJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
