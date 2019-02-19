From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: don't pass wrong L4 MFN to
 guest_walk_tables()
Date: Tue, 19 Feb 2019 12:07:09 +0000
Message-ID: <6eaa25e1-fead-44c2-0fbf-720faa7b5a56@citrix.com>
References: <5C6BF02B0200007800217F32@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=riu8=Q2=citrix.com=prvs=9462ceaa8=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gw4BW-0002LN-El
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 12:07:38 +0000
In-Reply-To: <5C6BF02B0200007800217F32@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMjAxOSAxMjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gNjQtYml0IFBWIGd1ZXN0
IHVzZXIgbW9kZSBydW5zIG9uIGEgZGlmZmVyZW50IEw0IHRhYmxlLiBNYWtlIHN1cmUKPiAtIHRo
ZSBhY2Nlc3NlZCBiaXQgZ2V0cyBzZXQgaW4gdGhlIGNvcnJlY3QgdGFibGUgKGFuZCBpbiBsb2ct
ZGlydHkKPiAgIG1vZGUgdGhlIGNvcnJlY3QgcGFnZSBnZXRzIG1hcmtlZCBkaXJ0eSkgZHVyaW5n
IGd1ZXN0IHdhbGtzLAo+IC0gdGhlIGNvcnJlY3QgdGFibGUgZ2V0cyBhdWRpdGVkIGJ5IHNoX2F1
ZGl0X2d3KCksCj4gLSBjb3JyZWN0IGluZm8gZ2V0cyBsb2dnZWQgYnkgcHJpbnRfZ3coKS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCk91Y2guwqAg
WWVzIC0gdGhhdCBpcyBhIHByb2JsZW0uCgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
