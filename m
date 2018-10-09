From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/HVM: move vendor independent CPU
 save/restore logic to shared code
Date: Tue, 9 Oct 2018 05:22:45 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BDDEFAF@SHSMSX101.ccr.corp.intel.com>
References: <5BB74B9702000078001EECE4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sx2c=mv=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g9kTu-0008Mc-HH
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 05:22:54 +0000
In-Reply-To: <5BB74B9702000078001EECE4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IEZy
aWRheSwgT2N0b2JlciA1LCAyMDE4IDc6MzIgUE0KPiAKPiBBIGZldyBwaWVjZXMgb2YgdGhlIGhh
bmRsaW5nIGhlcmUgYXJlIChubyBsb25nZXI/KSB2ZW5kb3Igc3BlY2lmaWMsIGFuZAo+IGhlbmNl
IHRoZXJlJ3Mgbm8gcG9pbnQgaW4gcmVwbGljYXRpbmcgdGhlIGNvZGUuIE1ha2Ugc3VyZSBub3Qg
b3RoZXJ3aXNlCj4gcHJlLWZpbGxlZCBmaWVsZHMgb2Ygc3RydWN0IGh2bV9od19jcHUgaW5zdGFu
Y2VzIGFyZSB6ZXJvIGZpbGxlZCBiZWZvcmUKPiBjYWxsaW5nIHRoZSB2ZW5kb3IgInNhdmUiIGhv
b2ssIGVsaW1pbmF0aW5nIHRoZSBuZWVkIGZvciB0aGUgaG9vawo+IGZ1bmN0aW9ucyB0byB6ZXJv
IGluZGl2aWR1YWwgZmllbGRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
