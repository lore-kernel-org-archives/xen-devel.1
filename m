From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V4 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 9 Nov 2018 13:03:54 +0200
Message-ID: <a33c06bd-20a9-18be-b766-58dac1c0fe8c@bitdefender.com>
References: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
 <1541083542-22464-4-git-send-email-rcojocaru@bitdefender.com>
 <65ef6cc6-a198-f875-ec11-e3727360f257@citrix.com>
 <d3387f54-04fb-3fdc-6b5f-9cbfc725fef2@bitdefender.com>
 <5BE562CB02000078001FA18D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y7e3=nu=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gL4a0-0000Qb-S4
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 11:04:00 +0000
In-Reply-To: <5BE562CB02000078001FA18D@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvOS8xOCAxMjozNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMTEuMTgg
YXQgMTk6MzcsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gT24gdGhlIGZp
cnN0IHBhdGNoIG9mIHRoZSBzZXJpZXM6IGNhbiBpdCBnbyBpbiBpbmRlcGVuZGVudGx5LCBzaW5j
ZSBKYW4KPj4gaXMgT0sgd2l0aCBpdCBhbmQgaXQganVzdCBnb3QgeW91ciBhY2s/IE9yIHNob3Vs
ZCBJIGp1c3QgYWRkIHRoZSBhY2sgYW5kCj4+IGNhcnJ5IGl0IG92ZXIgdG8gdGhlIG5leHQgdmVy
c2lvbiBvZiB0aGUgc2VyaWVzPwo+IAo+IFdlbGwsIEkgd291bGQgaGF2ZSBjb21taXR0ZWQgaXQs
IGlmIG9ubHkgaXQgaGFkIGEgVk1YL0VQVCBtYWludGFpbmVyCj4gYWNrLgoKRmFpciBlbm91Z2gg
LSBKdW4sIEtldmluLCB3b3VsZCB5b3UgbWluZCB0YWtpbmcgYSBxdWljayBsb29rIGF0IHRoaXMK
cGF0Y2ggcGxlYXNlPwoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
