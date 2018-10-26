From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Fri, 26 Oct 2018 15:52:45 +0000
Message-ID: <20181026155240.GA10174@amd.com>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
 <20181024094722.ylxa6wmg63d2wfxp@zion.uk.xensource.com>
 <5BD3375702000078001F5537@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1gj2=ng=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1gG4Pv-0004h7-An
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:52:55 +0000
In-Reply-To: <5BD3375702000078001F5537@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <D5607699DDF20C48A6FD853C922088D6@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, "aisaila@bitdefender.com" <aisaila@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMjYsIDIwMTggYXQgMDk6NDg6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI0LjEwLjE4IGF0IDExOjQ3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIE9jdCAyNCwgMjAxOCBhdCAwOToxOTowNkFNICswMDAwLCBBbGV4YW5k
cnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPiA+PiBUaGUgbWF5X2RlZmVyIHZhciB3YXMgbGVmdCB3
aXRoIHRoZSBvbGRlciBib29sX3QgdHlwZS4gVGhpcyBwYXRjaAo+ID4+IGNoYW5nZXMgdGhlIHR5
cGUgdG8gYm9vbC4KPiA+PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiAKQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgoK
LS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
