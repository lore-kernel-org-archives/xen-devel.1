From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1] x86/emulate: Send vm_event form
 emulate
Date: Wed, 09 Jan 2019 08:56:49 -0700
Message-ID: <5C3619C1020000780020BE6F@prv1-mh.provo.novell.com>
References: <20190107130952.27449-1-aisaila@bitdefender.com>
 <CAPLaKK6+iD1kU5cFc=gEYVR0YeFhf12L89CSGC1BHRLha-r5Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7QHe=PR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghGDt-0004n0-Nu
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 15:56:53 +0000
In-Reply-To: <CAPLaKK6+iD1kU5cFc=gEYVR0YeFhf12L89CSGC1BHRLha-r5Dg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com, royger@FreeBSD.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE5IGF0IDE2OjQ3LCA8cm95Z2VyQGZyZWVic2Qub3JnPiB3cm90ZToKPiBP
biBNb24sIEphbiA3LCAyMDE5IGF0IDI6MTEgUE0gQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFp
c2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gKwo+PiArICAgIHJlcS5yZWFzb24gPSBW
TV9FVkVOVF9SRUFTT05fTUVNX0FDQ0VTUzsKPj4gKyAgICByZXEudS5tZW1fYWNjZXNzLmdmbiA9
IGdmbl94KGdmbik7Cj4+ICsgICAgcmVxLnUubWVtX2FjY2Vzcy5mbGFncyB8PSBNRU1fQUNDRVNT
X0ZBVUxUX1dJVEhfR0xBIHwgTUVNX0FDQ0VTU19HTEFfVkFMSUQ7Cj4+ICsgICAgcmVxLnUubWVt
X2FjY2Vzcy5nbGEgPSBnbGE7Cj4+ICsgICAgcmVxLnUubWVtX2FjY2Vzcy5vZmZzZXQgPSBncGEg
JiAoKDEgPDwgUEFHRV9TSElGVCkgLSAxKTsKPj4gKwo+PiArICAgIGlmICggbW9uaXRvcl90cmFw
cyhjdXJyZW50LCB0cnVlLCAmcmVxKSA8IDAgKQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4+
ICsKPj4gKyAgICByZXR1cm4gdHJ1ZTsKPiAKPiBJIHRoaW5rIHlvdSBjYW4gc2ltcGxpZnkgdGhp
cyB0bzoKPiAKPiByZXR1cm4gbW9uaXRvcl90cmFwcyhjdXJyZW50LCB0cnVlLCAmcmVxKSA8IDAg
PyBmYWxzZSA6IHRydWU7CgpyZXR1cm4gbW9uaXRvcl90cmFwcyhjdXJyZW50LCB0cnVlLCAmcmVx
KSA+PSAwOwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
