From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Fri, 22 Feb 2019 06:22:50 -0700
Message-ID: <5C6FF7AA020000780021933C@prv1-mh.provo.novell.com>
References: <1550786936-5925-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAou-000808-QH
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:24:52 +0000
In-Reply-To: <1550786936-5925-1-git-send-email-igor.druzhinin@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDIzOjA4LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSXQncyB1bnNhZmUgdG8gZGlzYWJsZSBJT01NVSBvbiBhIGxpdmUgc3lzdGVtIHdoaWNo
IGlzIHRoZSBjYXNlCj4gaWYgd2UncmUgY3Jhc2hpbmcgc2luY2UgcmVtYXBwaW5nIGhhcmR3YXJl
IGRvZXNuJ3QgdXN1YWxseSBrbm93IHdoYXQKPiB0byBkbyB3aXRoIG9uZ29pbmcgYnVzIHRyYW5z
YWN0aW9ucyBhbmQgZnJlcXVlbnRseSByYWlzZXMgTk1JL01DRS9TTUksCj4gZXRjLiAoZGVwZW5k
cyBvbiB0aGUgZmlybXdhcmUgY29uZmlndXJhdGlvbikgdG8gc2lnbmFsIHRoZXNlIGFibm9ybWFs
aXRpZXMuCj4gVGhpcywgaW4gdHVybiwgZG9lc24ndCBwbGF5IHdlbGwgd2l0aCBrZXhlYyB0cmFu
c2l0aW9uIHByb2Nlc3MgYXMgdGhlcmUgaXMKPiBubyBoYW5kbGluZyBhdmFpbGFibGUgYXQgdGhl
IG1vbWVudCBmb3IgdGhpcyBraW5kIG9mIGV2ZW50cyByZXN1bHRpbmcKPiBpbiBmYWlsdXJlcyB0
byBlbnRlciB0aGUga2VybmVsLgo+IAo+IE1vZGVybiBMaW51eCBrZXJuZWxzIHRhdWdodCB0byBj
b3B5IGFsbCB0aGUgbmVjZXNzYXJ5IERNQVIvSVIgdGFibGVzCj4gZm9sbG93aW5nIGtleGVjIGZy
b20gdGhlIHByZXZpb3VzIGtlcm5lbCAoWGVuIGluIG91ciBjYXNlKSAtIHNvIGl0J3MKPiBjdXJy
ZW50bHkgbm9ybWFsIHRvIGtlZXAgSU9NTVUgZW5hYmxlZC4gSXQgbWlnaHQgcmVxdWlyZSBtaW5v
ciBjaGFuZ2VzIHRvCj4ga2R1bXAgY29tbWFuZCBsaW5lIHRoYXQgZW5hYmxlcyBJT01NVSBkcml2
ZXJzIChlLmcuIGludGVsX2lvbW11PW9uIC8KPiBpbnRyZW1hcD1vbikgYnV0IHJlY2VudCBrZXJu
ZWxzIGRvbid0IHJlcXVpcmUgYW55IGFkZGl0aW9uYWwgY2hhbmdlcyBmb3IKPiB0aGUgdHJhbnNp
dGlvbiB0byBiZSB0cmFuc3BhcmVudC4KPiAKPiBBIGZhbGxiYWNrIG9wdGlvbiBpcyBzdGlsbCBs
ZWZ0IGZvciBjb21wYXRpYmlsaXR5IHdpdGggYW5jaWVudCBjcmFzaAo+IGtlcm5lbHMgd2hpY2gg
ZGlkbid0IGxpa2UgdG8gaGF2ZSBJT01NVSBhY3RpdmUgdW5kZXIgdGhlaXIgZmVldCBvbiBib290
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRy
aXguY29tPgoKQmFzZWQgb24gdGhlIHN1YnNlcXVlbnQgZGlzY3Vzc2lvbgpBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
