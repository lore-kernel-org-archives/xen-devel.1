From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 10 Jul 2018 11:43:09 +0200
Message-ID: <20180710094309.ny46hu6g4cl63cpv@mac.bytemobile.com>
References: <20180710093322.10854-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vod0=j2=citrix.com=prvs=722e3bda8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fcpB3-0003Va-2S
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 09:43:21 +0000
Content-Disposition: inline
In-Reply-To: <20180710093322.10854-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMTA6MzM6MjJBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBUaGUgYWx0cDJtIGZ1bmN0aW9uYWxpdHkgd2FzIG9yaWdpbmFsbHkgZW52aXNpb25l
ZCB0byBiZSB1c2VkIGluCj4gc2V2ZXJhbCBkaWZmZXJlbnQgY29uZmlndXJhdGlvbnMsIG9uZSBv
ZiB3aGljaCB3YXMgYSBzaW5nbGUgaW4tZ3Vlc3QKPiBhZ2VudCB0aGF0IGhhZCBmdWxsIG9wZXJh
dGlvbmFsIGNvbnRyb2wgb2YgYWx0cDJtLiAgVGhpcyByZXF1aXJlZCB0aGUKPiBzaW5nbGUgaHlw
ZXJjYWxsIHRvIGJlIGFuIEhWTU9QLCB3aGljaCBpcyB0aGUgb25seSB0eXBlIG9mIGh5cGVyY2Fs
bAo+IGFuIEhWTSBndWVzdCBpcyBhbGxvd2VkIHRvIG1ha2UuCgpUaGF0J3Mgbm90IHRydWUuIEhW
TSBndWVzdHMgY2FuIHVzZSBhIGJ1bmNoIG9mIGh5cGVyY2FsbHMsIGxpa2UKR05UVEFCT1AsIFhF
Tk1FTSwgUEhZU0RFVk9QLi4uCgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
IGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IGluZGV4IGUwMjJmNWFiMGUuLjkwYTRiZTVlODYg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vaHZtLmMKPiBAQCAtNDQ2MCw2ICs0NDYwLDM0IEBAIHN0YXRpYyBpbnQgaHZtb3BfZ2V0
X3BhcmFtKAo+ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBhbHRwMm0gb3Bl
cmF0aW9ucyBhcmUgZW52aXNpb25lZCBhcyBiZWluZyB1c2VkIGluIHNldmVyYWwgZGlmZmVyZW50
IAo+ICsgKiBtb2RlczoKPiArICogCj4gKyAqIC0gZXh0ZXJuYWw6IEFsbCBjb250cm9sIGFuZCBk
ZWNpc2lvbnMgYXJlIG1hZGUgYnkgYW4gZXh0ZXJuYWwgYWdlbnQKPiArICogICBydW5uaW5nIGRv
bWFpbiAwLgo+ICsgKgo+ICsgKiAtIGludGVybmFsOiBhbHRwMm0gb3BlcmF0aW9ucyBhcmUgdXNl
ZCBleGNsdXNpdmVseSBieSBhbiBpbi1ndWVzdCBhZ2VudAo+ICsgKiAgIHRvIHByb3RlY3QgaXRz
ZWxmIGZyb20gdGhlIGd1ZXN0IGtlcm5lbCBhbmQgaW4tZ3Vlc3QgYXR0YWNrZXJzLiAgCj4gKyAq
IAo+ICsgKiAtIGNvb3JkaW5hdGVkOiBBbiBpbi1ndWVzdCBhZ2VudCBoYW5kbGVzICNWRSBhbmQg
Vk1GVU5DcyBsb2NhbGx5LAo+ICsgKiAgIGJ1dCBtYWtlcyByZXF1ZXN0cyBvZiBhbiBleHRlcm5h
bCBlbnRpdHkgZm9yIGJpZ2dlciBjaGFuZ2VzIChzdWNoCj4gKyAqICAgYXMgbW9kaWZ5aW5nIGFs
dHAybSBlbnRpcmVzKS4KPiArICoKPiArICogVGhpcyBjb3JyZXNwb25kcyB0byB0aGUgdGhyZWUg
dmFsdWVzIGZvciBIVk1fUEFSQU1fQUxUUDJNCj4gKyAqIChleHRlcm5hbCwgbWl4ZWQsIGxpbWl0
ZWQpLiBBbGwgdGhyZWUgbW9kZWxzIGhhdmUgYWR2YW50YWdlcyBhbmQKPiArICogZGlzYWR2YW50
YWdlcy4KClNob3VsZG4ndCB5b3UgdXNlIHRoZSBleGlzdGluZyBIVk1fUEFSQU1fQUxUUDJNIHZh
bHVlcyBpbiB0aGUKZW51bWVyYXRpb24gYWJvdmUgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBhIG5l
dyBub21lbmNsYXR1cmU/CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
