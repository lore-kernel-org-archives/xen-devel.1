From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 11/44] x86emul: support AVX512F "normal"
 FP compare insns
Date: Wed, 14 Nov 2018 07:41:30 -0700
Message-ID: <5BEC341A02000078001FC0A0@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA38EE02000078001EBA42@prv1-mh.provo.novell.com>
 <b2122d5c-802b-fb36-7578-97aff666d2c4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etbn=nz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMwMJ-0007L2-QE
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 14:41:35 +0000
In-Reply-To: <b2122d5c-802b-fb36-7578-97aff666d2c4@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDIwOjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gV2hhdCBkbyB5b3UgY29uc2lkZXIgIm5vcm1hbCIgaGVyZT8KCldvdWxkICJvcmRpbmFy
eSIgYmUgYmV0dGVyIChJJ3ZlIHVzZWQgcXVvdGVzIGV4YWN0bHkgYmVjYXVzZSBJCmNvdWxkbid0
IHRoaW5rIG9mIGFueXRoaW5nIGJldHRlcik/IFZ7LFV9Q09NSVN7UyxEfSBhcmUgdGhlIG9uZXMK
bm90IGRlYWx0IHdpdGggaGVyZS4KCj4gT24gMjUvMDkvMjAxOCAxNDozMiwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+IEFsc28gY29ycmVjdCB0aGUgQVZYIGNvdW50ZXJwYXJ0J3MgY29tbWVudC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFRo
ZSBjb250ZW50IGl0c2VsZiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4sCj4gYnV0IHByZWZlcmFibHkgd2l0aCBhIGJldHRlciBkZXNjcmlwdGlvbi4K
ClRoYW5rcyAtIGxldCBtZSBrbm93IHdoZXRoZXIgIm5vcm1hbCIgb3IgIm9yZGluYXJ5IiBvciBv
a2F5IHdpdGgKeW91LCBvciB3aGF0IGJldHRlciBzdWdnZXN0aW9ucyB5b3UgaGF2ZS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
