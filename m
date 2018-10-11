From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/vtd: fix IOMMU share PT destruction
 path
Date: Thu, 11 Oct 2018 09:29:14 +0100
Message-ID: <20181011082914.2xzfd5tn2ays6ntb@zion.uk.xensource.com>
References: <20181009145708.23976-1-wei.liu2@citrix.com>
 <20181011082731.2geggfypuq4vquzj@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pv6e=mx=citrix.com=prvs=815dbdced=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAWLO-0007M5-BD
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 08:29:18 +0000
Content-Disposition: inline
In-Reply-To: <20181011082731.2geggfypuq4vquzj@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIEtldmluIGluIHRoZSBUbzogZmllbGQKCk9uIFRodSwgT2N0IDExLCAyMDE4IGF0IDA5OjI3
OjMxQU0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMDksIDIwMTggYXQgMDM6
NTc6MDhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+IENvbW1pdCAyOTE2OTUxYzEgKCJtbSAv
IGlvbW11OiBpbmNsdWRlIG5lZWRfaW9tbXUoKSB0ZXN0IGluCj4gPiBpb21tdV91c2VfaGFwX3B0
KCkiKSBpbmNsdWRlZCBuZWVkX2lvbW11KCkgaW4gaW9tbXVfdXNlX2hhcF9wdCBhbmQKPiA+IDkx
ZDRlY2E3YWRkICgibW0gLyBpb21tdTogc3BsaXQgbmVlZF9pb21tdSgpIGludG8gaGFzX2lvbW11
X3B0KCkgYW5kCj4gPiBuZWVkX2lvbW11X3B0X3N5bmMoKSIpIG1hZGUgdGhpbmdzIGZpbmVyIGdy
YWluIGJ5IHNwbGl0aW5nIG5lZWRfaW9tbXUKPiA+IGludG8gdGhyZWUgc3RhdGVzLgo+ID4gCj4g
PiBUaGUgZGVzdHJ1Y3Rpb24gcGF0aCBjYW4ndCB1c2UgaW9tbXVfdXNlX2hhcF9wdCBiZWNhdXNl
IGF0IHRoZSBwb2ludAo+ID4gcGxhdGZvcm0gb3AgaXMgY2FsbGVkLCBJT01NVSBpcyBlaXRoZXIg
YWxyZWFkeSBzd2l0Y2hlZCB0byBvciBoYXMKPiA+IGFsd2F5cyBiZWVuIGluIGRpc2FibGVkIHN0
YXRlLCBhbmQgdGhlIHNoYXJlZCBQVCB0ZXN0IHdvdWxkIGFsd2F5cyBiZQo+ID4gZmFsc2UuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4g
S2V2aW4sIGNhbiB5b3UgYWNrL25hY2sgdGhpcyBwYXRjaD8gU3RhZ2luZyBpcyBjdXJyZW50bHkg
YmxvY2tlZCBieSBhCj4gYnVnIHdoaWNoIGlzIGZpeGVkIGJ5IHRoaXMgcGF0Y2guCj4gCj4gVGhh
bmtzLAo+IFdlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
