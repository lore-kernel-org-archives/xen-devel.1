From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC] libxl: set 1GB MMIO hole for PVH
Date: Thu, 10 May 2018 09:33:47 +0100
Message-ID: <20180510083347.gtkbbjvpp6skk4qj@MacBook-Pro-de-Roger.local>
References: <20180509160712.26231-1-roger.pau@citrix.com>
 <a897a334-10bb-730c-0e35-af4067bdda70@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tie0=h5=citrix.com=prvs=66130e668=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fGh1W-0003qo-SV
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 08:34:02 +0000
Content-Disposition: inline
In-Reply-To: <a897a334-10bb-730c-0e35-af4067bdda70@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMDksIDIwMTggYXQgMDY6MTI6MjhQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwOS8wNS8xOCAxODowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhp
cyBwcmV2ZW50cyBwYWdlLXNoYXR0ZXJpbmcsIGJ5IGJlaW5nIGFibGUgdG8gcG9wdWxhdGUgdGhl
IFJBTQo+ID4gcmVnaW9ucyBiZWxvdyA0R0IgdXNpbmcgMUdCIHBhZ2VzLCBwcm92aWRlZCB0aGUg
Z3Vlc3QgbWVtb3J5IHNpemUgaXMKPiA+IHNldCB0byBhIG11bHRpcGxlIG9mIGEgR0IuCj4gPiAK
PiA+IE5vdGUgdGhhdCB0aGVyZSBhcmUgc29tZSBzcGVjaWFsIGFuZCBBQ1BJIHBhZ2VzIGluIHRo
ZSBNTUlPIGhvbGUgdGhhdAo+ID4gd2lsbCBiZSBwb3B1bGF0ZWQgdXNpbmcgc21hbGxlciBvcmRl
ciBwYWdlcywgYnV0IHRob3NlIHNob3VsZG4ndCBiZQo+ID4gYWNjZXNzZWQgYXMgb2Z0ZW4gYXMg
UkFNIHJlZ2lvbnMuCj4gCj4gV291bGQgaXQgYmUgcG9zc2libGUgc29tZWhvdyB0byBwdXQgYSBw
b3RlbnRpYWwgZmlybXdhcmUgaW50byB0aGF0Cj4gMUdCIHJlZ2lvbiwgdG9vLCBpZiBpdCBuZWVk
cyBhbnkgbWVtb3J5IGluIGhpZ2ggbWVtb3J5PyBTZWFiaW9zIGUuZy4KPiBpcyB0YWtpbmcgdGhl
IGxhc3QgUkFNIHBhZ2Ugb2YgdGhlIGd1ZXN0IGZvciBpdHMgaHlwZXJjYWxsIHBhZ2UsIHdoaWNo
Cj4gd2lsbCBhZ2FpbiBzaGF0dGVyIEdCIG1hcHBpbmdzLgoKSSBrbm93IHRoaXMgY29tbWVudCBp
cyByZWxhdGVkIHRvIEhWTSBndWVzdHMsIGJ1dCBJJ20gbm90IHN1cmUgSSBzZWUKaG93IHNldHRp
bmcgdGhlIGh5cGVyY2FsbCBwYWdlIHNoYXR0ZXJzIEdCIG1hcHBpbmdzLiBTZXR0aW5nIHRoZQpo
eXBlcmNhbGwgcGFnZSBkb2Vzbid0IGludm9sdmUgY2hhbmdpbmcgYW55IHAybSBtYXBwaW5ncywg
YnV0IGp1c3QKZmlsbGluZyBhIGd1ZXN0IFJBTSBwYWdlIHdpdGggc29tZSBkYXRhLgoKUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
