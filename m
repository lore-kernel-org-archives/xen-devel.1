From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] build: remove shim related targets
Date: Tue, 20 Feb 2018 15:59:36 +0000
Message-ID: <23180.17896.179849.955660@mariner.uk.xensource.com>
References: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
 <20180220082351.24967-1-roger.pau@citrix.com>
 <23180.14878.76901.987843@mariner.uk.xensource.com>
 <20180220155433.bl7wlzd7gc73vvlq@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zrud=fo=citrix.com=prvs=58295f33d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eoAKW-0006jz-Av
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 15:59:44 +0000
In-Reply-To: <20180220155433.bl7wlzd7gc73vvlq@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1BBVENIXSBidWlsZDogcmVtb3ZlIHNoaW0g
cmVsYXRlZCB0YXJnZXRzIik6Cj4gT24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDM6MDk6MThQTSAr
MDAwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBSb2dlciBQYXUgTW9ubmUgd3JpdGVzICgiW1BB
VENIXSBidWlsZDogcmVtb3ZlIHNoaW0gcmVsYXRlZCB0YXJnZXRzIik6Cj4gPiA+IFRoZXJlJ3Mg
bm8gbmVlZCB0byBoYXZlIHNoaW0gc3BlY2lmaWMgdGFyZ2V0cywgc28ganVzdCB1c2UgdGhlIHJl
Z3VsYXIKPiA+ID4geGVuIG1ha2VmaWxlIHRhcmdldHMgaW4gb3JkZXIgdG8gYnVpbGQgdGhlIHNo
aW0gYmluYXJ5Lgo+ID4gCj4gPiBJIGhhdmVuJ3QgYmVlbiBmb2xsb3dpbmcgdGhpcywgbW9zdGx5
IGJlY2F1c2UgSSd2ZSBiZWVuIGF3YXksIGJ1dDoKPiA+IAo+ID4gUHJldmlvdXNseSAoaW4gdGhl
IENvbWV0IGFkdmljZSBpbiB0aGUgYWR2aXNvcnksIGZvciBleGFtcGxlKSB3ZSB0b2xkCj4gPiBw
ZW9wbGUgdG8gcnVuIHRoaXMgc3BlY2lhbCBNYWtlZmlsZSB0YXJnZXQsIGFuZCB0aGF0IHNwZWNp
YWwgTWFrZWZpbGUKPiA+IHRhcmdldCB3b3VsZCByZWJ1aWxkIHRoZSB3aG9sZSBvZiB0aGUgaHlw
ZXJ2aXNvciBpbiBzb21lIHNwZWNpYWwgd2F5Lgo+ID4gCj4gPiBJcyB0aGF0IGxpbmtmYXJtIGFu
ZCByZWJ1aWxkIG5vdyBubyBsb25nZXIgbmVlZGVkLCB0aGVuID8KPiAKPiBUaGF0J3Mgc3RpbGwg
bmVlZGVkIGluIG9yZGVyIHRvIGJ1aWxkIHRoZSBzaGltIHdpdGggdGhlIHJpZ2h0IEtjb25maWcK
PiAod2hpY2ggc2hvdWxkIGJlIGRpZmZlcmVudCBmcm9tIHRoZSBLY29uZmlnIHVzZWQgZm9yIHRo
ZSBiYXJlIG1ldGFsCj4gaHlwZXJ2aXNvciBidWlsZCkuCj4gCj4gVGhlIG1haW4gZGlmZmVyZW5j
ZSBpcyB0aGF0IHdlIGNhbiBnZXQgcmlkIG9mIHRoZSBzaGltIHJlbGF0ZWQKPiBtYWtlZmlsZSB0
YXJnZXRzIGluc2lkZSBvZiB4ZW4vIGJlY2F1c2UgdGhlIHNhbWUgbWFrZWZpbGUgdGFyZ2V0cyBj
YW4KPiBiZSB1c2VkIHRvIGJ1aWxkIGEgc2hpbSBvciBhIGJhcmUtbWV0YWwgdmVyc2lvbiBvZiBY
ZW4uCgpBaCBJIHNlZS4gIEluZGVlZCBpZiBJIGxvb2sgYXQgdGhlIHBhdGNoIGFnYWluIHRoZSBl
eGlzdGluZyBwdWJsaXNoZWQKZW50cnlwb2ludCBzaGltIHRhcmdldCBpcyBiZWluZyByZXRhaW5l
ZCwgYW5kIEkgYW0gYmVpbmcgbmVlZGxlc3NseQphbGFybWVkIGJ5IHRoZSBwYXRjaCBzdWJqZWN0
IGxpbmUuCgpUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
