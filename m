From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 24 Jan 2018 10:42:39 +0000
Message-ID: <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=kyrb=et=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1eeIVu-0003ZX-QF
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 10:42:42 +0000
Received: by mail-qt0-x243.google.com with SMTP id f4so9064023qtj.6
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 02:42:40 -0800 (PST)
In-Reply-To: <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMjo0MSBBTSwgQm9yaXMgT3N0cm92c2t5Cjxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gT24gMDEvMTgvMjAxOCAwNTozMyBBTSwgV2Vp
IExpdSB3cm90ZToKPj4gT24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMTE6MzE6MzJBTSArMDEwMCwg
SnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IFdlaSwKPj4+Cj4+PiBPbiAwMS8xMi8xNyAxNToxNCwg
SnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+PiBJbnN0ZWFkIG9mIGxvY2F0aW5nIHRoZSBSU0RQIHRh
YmxlIGJlbG93IDFNQiBwdXQgaXQganVzdCBiZWxvdyA0R0IKPj4+PiBsaWtlIHRoZSByZXN0IG9m
IHRoZSBBQ1BJIHRhYmxlcyBpbiBjYXNlIG9mIFBWSCBndWVzdHMuIFRoaXMgd2lsbAo+Pj4+IGF2
b2lkIHB1bmNoaW5nIG1vcmUgaG9sZXMgdGhhbiBuZWNlc3NhcnkgaW50byB0aGUgbWVtb3J5IG1h
cC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4+PiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4+IE1pbmQg
YXBwbHlpbmcgdGhpcyBvbmU/Cj4+IERvbid0IHdvcnJ5LCBpdCBpcyBpbiBteSBxdWV1ZS4KPj4K
Pj4gV2lsbCBjb21lIHRvIHRoaXMgYW5kIG90aGVyIHBhdGNoZXMgSSBhY2N1bXVsYXRlZCBzb29u
Lgo+Pgo+PiBXZWkuCj4KPiBUaGlzIHJlcXVpcmVzIGtlcm5lbCBjaGFuZ2VzLCBkb2Vzbid0IGl0
Pwo+Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE3LTEyL21zZzAwNzE0Lmh0bWwKPgo+IEFuZCB0aGlzIHNlcmllcyBhcHBhcmVudGx5IG5l
dmVyIG1hZGUgaXQgdG8gdGhlIHRyZWUuCj4KPiBQVkggZ3Vlc3RzIGFyZSBicm9rZW4gbm93IG9u
IHN0YWdpbmcuCgpBbmQgdGhlIExpbnV4IHNpZGUgb2YgUFZIIGlzIG9mZmljaWFsbHkgc3VwcG9y
dGVkIG5vdywgcmlnaHQ/ICBXaGljaAptZWFucyB3ZSBuZWVkIHRvIGhhdmUgc29tZSB3YXkgb2Yg
YmVpbmcgYmFja3dhcmRzIGNvbXBhdGlibGUgd2l0aAprZXJuZWxzIHdpdGhvdXQgdGhhdCBwYXRj
aCwgZXZlbiBpZiBpdCBkb2VzIGdldCAgYmFja3BvcnRlZC4KCiAtR2VvcmdlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
