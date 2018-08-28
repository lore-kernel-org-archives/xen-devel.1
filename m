From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 15/23] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Tue, 28 Aug 2018 11:41:11 +0100
Message-ID: <20180828104107.4mrzq5vn2v6kujyh@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <1f5209e13cb12be42209f977c97290dd4343d2a8.1535285866.git-series.wei.liu2@citrix.com>
 <20180827090311.lfffjx2xbknpud5e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fubQx-0001BU-NL
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 10:41:15 +0000
Content-Disposition: inline
In-Reply-To: <20180827090311.lfffjx2xbknpud5e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMTA6MDM6MTFBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiA+ICsjaWZkZWYgQ09ORklHX0hWTQo+ID4gICNkZWZpbmUgaGFwX2VuYWJsZWQoZCkgICgoZCkt
PmFyY2guaHZtX2RvbWFpbi5oYXBfZW5hYmxlZCkKPiA+ICsjZWxzZQo+ID4gKyNkZWZpbmUgaGFw
X2VuYWJsZWQoZCkgIGZhbHNlCj4gPiArI2VuZGlmCj4gCj4gSG1tLi4uIEkgdGhvdWdodCBJIGhh
ZCByZXdyaXR0ZW4gdGhpcyB0byBiZSBhIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24uCj4gCj4gSSB3
aWxsIHRyeSB0byBtYWtlIGl0IGEgc3RhdGljIGlubGluZSBmdW5jdGlvbi4KPiAKCkl0IGFsbCBj
YW1lIGJhY2s6IFRoZSByZWFzb24gSSBkaWRuJ3QgdHVybiBpdCBpbnRvIGEgc3RhdGljIGlubGlu
ZQpmdW5jdGlvbiB3YXMgYmVjYXVzZSBhc20vaHZtL2RvbWFpbi5oIGRpZG4ndCBoYXZlIHN0cnVj
dCBkb21haW4KYXZhaWxhYmxlLiBUbyBmaXggdGhhdCBpdCB3b3VsZCBzZWVtIHRvIHJlcXVpcmUg
bW9yZSBjb2RlIGNodXJuIHRvIG1lLgoKSSB3aWxsIGtlZXAgaGFwX2VuYWJsZWQgYSBtYWNyby4K
CldlaS4KCj4gV2VpLgo+IAo+ID4gIAo+ID4gICNlbmRpZiAvKiBfX0FTTV9YODZfSFZNX0RPTUFJ
Tl9IX18gKi8KPiA+ICAKPiA+IC0tIAo+ID4gZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
