From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Tue, 27 Nov 2018 14:12:20 +0200
Message-ID: <e98d9d93-b2f5-5a54-e43c-05ad392b267e@bitdefender.com>
References: <20181123085402.663pdh75rhqtxsf4@mac>
 <67fa7dc6-3aff-a5fd-4105-dce19a89448c@bitdefender.com>
 <20181127113205.ohli6saatlwid7ua@mac>
 <8ad5c4f8-b4b5-2a91-73d2-6b7c3ddece5c@bitdefender.com>
 <285d7c45-9607-9c92-7a79-56074c4e0e92@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FTPm=OG=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gRcED-00080Z-Pr
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 12:12:33 +0000
In-Reply-To: <285d7c45-9607-9c92-7a79-56074c4e0e92@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjcvMTggMTo1OSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8xMS8yMDE4
IDExOjQ1LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IE9uIDExLzI3LzE4IDE6MzIgUE0sIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBhZGQgc29t
ZSBraW5kIG9mIGZsYWcgdG8gdGhlIGVtdWxhdG9yIHRvCj4+PiBzaWduYWwgd2hldGhlciBwMm0g
cmVzdHJpY3Rpb25zIHNob3VsZCBiZSBlbmZvcmNlZC9pZ25vcmVkPwo+Pj4gaHZtZW11bF9hY3F1
aXJlX3BhZ2Ugc2VlbXMgbGlrZSBhIHN1aXRhYmxlIHBsYWNlLCBidXQgSSdtIG5vdCB0aGF0Cj4+
PiBmYW1pbGlhciB3aXRoIHRoZSBlbXVsYXRvci4KPj4+Cj4+PiBUaGVuIHlvdSBjb3VsZCBnZW5l
cmF0ZSB2bSBldmVudHMgZnJvbSB0aGUgZW11bGF0b3IgaXRzZWxmLCB3aGljaAo+Pj4gQUZBSUNU
IGlzIHRoZSBvbmx5IHdheSB0byBoYW5kbGUgdGhpcyBpbnN0cnVjdGlvbiBleGVjdXRpb24gaXNz
dWUuCj4+IEkgaG9wZSBzbywgd2UnbGwgZGVmaW5pdGVseSBsb29rIGludG8gdGhhdC4KPiAKPiBG
V0lXLCBUaGVyZSBpcyBhbHJlYWR5IGEgcGxhbih0bSkuwqAgSXQgd2FzIGRpc2N1c3NlZCBhdCBs
ZWFzdCBpbiBwYXJ0IGluCj4gQnVkYXBlc3QuCj4gCj4gVGhlIGVtdWxhdG9yIG5lZWRzIHRvIHN0
YXJ0IGhvbm91cmluZyBQMk0gcGVybWlzc2lvbnMgYW55IGdlbmVyYXRpbmcKPiB2bV9ldmVudHMu
Cj4gCj4gVGhlbiwgYSB2bV9ldmVudCByZXNwb25zZSBjYW4gcmVwbHkgc2F5aW5nICJwbGVhc2Ug
ZW11bGF0ZSB0aGUKPiBpbnN0cnVjdGlvbiB3aXRoIHRoaXMgdGVtcG9yYXJ5IGNoYW5nZSB0byB0
aGUgcGVybWlzc2lvbnMiLCBzbwo+IHdyaXRlLWFiaWxpdHkgdG8gYSByZWFkLW9ubHkgcGFnZSBj
YW4gYmUgZ3JhbnRlZCBhdCB0aGUgZGlzY3JldGlvbiBvZgo+IHRoZSBpbnRyb3NwZWN0aW9uIGFn
ZW50Lgo+IAo+IFRoYXQgc2FpZCwgdGhlcmUgaXMgYSBodWdlIGFtb3VudCBvZiB3b3JrIHJlcXVp
cmVkIHRvIG1ha2UgdGhpcyBoYXBwZW4sCj4gYW5kIEkgaGF2ZW4ndCBoYWQgdGltZSB0byBkbyBh
IGNsZWFyIGRlc2lnbiB5ZXQuCgpSaWdodCwgYnV0IGZvciBzdGFydGVycyBhbGwgd2UgbmVlZCBp
cyB0aGUgYWJpbGl0eSB0byBzYXkKImh2bV9lbXVsYXRlX29uZV92bV9ldmVudChib29sIGhvbm91
cl9wYWdlX3dhbGtfZmF1bHRzLCBib29sCmhvbm9yX2dsYV9mYXVsdHMpIi4KClRoZW4gd2UganVz
dCByZXBsYWNlIGFsbCBjYWxsc2l0ZXMgb2YgaHZtX2VtdWxhdGVfb25lX3ZtX2V2ZW50KCkgd2l0
aApodm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQoZmFsc2UsIGZhbHNlKSwgYW5kIHRoZSBvbmUgaW4K
cDJtX21lbV9hY2Nlc3NfY2hlY2soKSB0aGF0IHdlIGN1cnJlbnRseSBoYXZlIHdpdGgKaHZtX2Vt
dWxhdGVfb25lX3ZtX2V2ZW50KGZhbHNlLCB0cnVlKS4KCkhvcGVmdWxseSB0aGF0IG1ha2VzIHNl
bnNlLiA6KQoKRmluZXIgZ3JhaW5lZCB2bV9ldmVudC1iYXNlZCBjb250cm9sIGlzIHByb2JhYmx5
IHVzZWZ1bCwgYnV0IHRvIHRoZSBiZXN0Cm9mIG15IGtub3dsZWRnZSBub3QgY3VycmVudGx5IChv
ciBpbiB0aGUgbmVhci1tZWRpdW0gZnV0dXJlKSBuZWNlc3NhcnkuCgoKVGhhbmtzLApSYXp2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
