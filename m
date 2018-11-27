From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Tue, 27 Nov 2018 11:59:57 +0000
Message-ID: <285d7c45-9607-9c92-7a79-56074c4e0e92@citrix.com>
References: <20181123085402.663pdh75rhqtxsf4@mac>
 <67fa7dc6-3aff-a5fd-4105-dce19a89448c@bitdefender.com>
 <20181127113205.ohli6saatlwid7ua@mac>
 <8ad5c4f8-b4b5-2a91-73d2-6b7c3ddece5c@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=curg=OG=citrix.com=prvs=86220cbda=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gRc28-0006o6-1y
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 12:00:04 +0000
In-Reply-To: <8ad5c4f8-b4b5-2a91-73d2-6b7c3ddece5c@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAxMTo0NSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDExLzI3LzE4
IDE6MzIgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxl
IHRvIGFkZCBzb21lIGtpbmQgb2YgZmxhZyB0byB0aGUgZW11bGF0b3IgdG8KPj4gc2lnbmFsIHdo
ZXRoZXIgcDJtIHJlc3RyaWN0aW9ucyBzaG91bGQgYmUgZW5mb3JjZWQvaWdub3JlZD8KPj4gaHZt
ZW11bF9hY3F1aXJlX3BhZ2Ugc2VlbXMgbGlrZSBhIHN1aXRhYmxlIHBsYWNlLCBidXQgSSdtIG5v
dCB0aGF0Cj4+IGZhbWlsaWFyIHdpdGggdGhlIGVtdWxhdG9yLgo+Pgo+PiBUaGVuIHlvdSBjb3Vs
ZCBnZW5lcmF0ZSB2bSBldmVudHMgZnJvbSB0aGUgZW11bGF0b3IgaXRzZWxmLCB3aGljaAo+PiBB
RkFJQ1QgaXMgdGhlIG9ubHkgd2F5IHRvIGhhbmRsZSB0aGlzIGluc3RydWN0aW9uIGV4ZWN1dGlv
biBpc3N1ZS4KPiBJIGhvcGUgc28sIHdlJ2xsIGRlZmluaXRlbHkgbG9vayBpbnRvIHRoYXQuCgpG
V0lXLCBUaGVyZSBpcyBhbHJlYWR5IGEgcGxhbih0bSkuwqAgSXQgd2FzIGRpc2N1c3NlZCBhdCBs
ZWFzdCBpbiBwYXJ0IGluCkJ1ZGFwZXN0LgoKVGhlIGVtdWxhdG9yIG5lZWRzIHRvIHN0YXJ0IGhv
bm91cmluZyBQMk0gcGVybWlzc2lvbnMgYW5kIGdlbmVyYXRpbmcKdm1fZXZlbnRzLgoKVGhlbiwg
YSB2bV9ldmVudCByZXNwb25zZSBjYW4gcmVwbHkgc2F5aW5nICJwbGVhc2UgZW11bGF0ZSB0aGUK
aW5zdHJ1Y3Rpb24gd2l0aCB0aGlzIHRlbXBvcmFyeSBjaGFuZ2UgdG8gdGhlIHBlcm1pc3Npb25z
Iiwgc28Kd3JpdGUtYWJpbGl0eSB0byBhIHJlYWQtb25seSBwYWdlIGNhbiBiZSBncmFudGVkIGF0
IHRoZSBkaXNjcmV0aW9uIG9mCnRoZSBpbnRyb3NwZWN0aW9uIGFnZW50LgoKVGhhdCBzYWlkLCB0
aGVyZSBpcyBhIGh1Z2UgYW1vdW50IG9mIHdvcmsgcmVxdWlyZWQgdG8gbWFrZSB0aGlzIGhhcHBl
biwKYW5kIEkgaGF2ZW4ndCBoYWQgdGltZSB0byBkbyBhIGNsZWFyIGRlc2lnbiB5ZXQuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
