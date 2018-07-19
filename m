From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86/HVM: prefill cache with PDPTEs when
 possible
Date: Thu, 19 Jul 2018 05:47:45 -0600
Message-ID: <5B507A6102000078001D5DDD@prv1-mh.provo.novell.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506CE302000078001D5D8A@prv1-mh.provo.novell.com>
 <2fa046b9-9d6f-caa0-d400-804f92332d2e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fg7PP-0005H4-Rl
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 11:47:47 +0000
In-Reply-To: <2fa046b9-9d6f-caa0-d400-804f92332d2e@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA3LjE4IGF0IDEzOjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDcvMTggMTE6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBTaW5jZSBzdHJp
Y3RseSBzcGVha2luZyBpdCBpcyBpbmNvcnJlY3QgZm9yIGd1ZXN0X3dhbGtfdGFibGVzKCkgdG8g
cmVhZAo+PiBMMyBlbnRyaWVzIGR1cmluZyBQQUUgcGFnZSB3YWxrcywgdHJ5IHRvIG92ZXJjb21l
IHRoaXMgd2hlcmUgcG9zc2libGUgYnkKPj4gcHJlLWxvYWRpbmcgdGhlIHZhbHVlcyBmcm9tIGhh
cmR3YXJlIGludG8gdGhlIGNhY2hlLiBTYWRseSB0aGUKPj4gaW5mb3JtYXRpb24gaXMgYXZhaWxh
YmxlIGluIHRoZSBFUFQgY2FzZSBvbmx5LiBPbiB0aGUgcG9zaXRpdmUgc2lkZSBmb3IKPj4gTlBU
IHRoZSBzcGVjIHNwZWxscyBvdXQgdGhhdCBMMyBlbnRyaWVzIGFyZSBhY3R1YWxseSByZWFkIG9u
IHdhbGtzLCBzbwo+PiB1cyByZWFkaW5nIHRoZW0gaXMgY29uc2lzdGVudCB3aXRoIGhhcmR3YXJl
IGJlaGF2aW9yIGluIHRoYXQgY2FzZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEknbSBhZnJhaWQgdGhhdCB0aGlzIGlzbid0IGFyY2hp
dGVjdHVyYWxseSBjb3JyZWN0LiAgSXQgbWVhbnMgdGhhdCBhbgo+IGVtdWxhdGVkIG1lbW9yeSBh
Y2Nlc3Mgd2lsbCByZWFkIHRoZSBQRFBURSByZWdpc3RlciB2YWx1ZXMsIHJhdGhlciB0aGFuCj4g
d2hhdCBpcyBhY3R1YWxseSBpbiBSQU0uCgpJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZDog
QSBDUjMgbG9hZCBsb2FkcyB0aGUgUERQVEVzIGludG8KcmVnaXN0ZXJzLCBhbmQgd2Fsa3MgdXNl
IHRob3NlIHJlZ2lzdGVycywgbm90IG1lbW9yeS4gVGhhdCdzIHRoZSB2ZXJ5CmRpZmZlcmVuY2Ug
YmV0d2VlbiBQQUUgYW5kIGFsbCBvdGhlciB3YWxrcy4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
