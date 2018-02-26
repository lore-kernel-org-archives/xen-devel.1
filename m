From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/HVM: don't give the wrong impression
 of WRMSR succeeding
Date: Mon, 26 Feb 2018 13:18:28 +0000
Message-ID: <b4c1e7d8-6967-4702-4fa6-c4d8560322dc@citrix.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <5A8FE09E02000078001AABC6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7ddw=fu=citrix.com=prvs=588d4b4b4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eqIfs-00086x-4r
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 13:18:36 +0000
In-Reply-To: <5A8FE09E02000078001AABC6@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDIvMTggMDg6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC4uLiBmb3Igbm9uLWV4aXN0
ZW50IE1TUnM6IHdybXNyX2h5cGVydmlzb3JfcmVncygpJ3MgY29tbWVudCBjbGVhcmx5Cj4gc2F5
cyB0aGF0IHRoZSBmdW5jdGlvbiByZXR1cm5zIDAgZm9yIHVucmVjb2duaXplZCBNU1JzLCBzbwo+
IHtzdm0sdm14fV9tc3Jfd3JpdGVfaW50ZXJjZXB0KCkgc2hvdWxkIG5vdCBjb252ZXJ0IHRoaXMg
aW50byBzdWNjZXNzLiBXZQo+IGRvbid0IHdhbnQgdG8gdW5jb25kaXRpb25hbGx5IGZhaWwgdGhl
IGFjY2VzcyB0aG91Z2gsIGFzIHdlIGNhbid0IGJlCj4gY2VydGFpbiB0aGUgbGlzdCBvZiBoYW5k
bGVkIE1TUnMgaXMgY29tcGxldGUgZW5vdWdoIGZvciB0aGUgZ3Vlc3QgdHlwZXMKPiB3ZSBjYXJl
IGFib3V0LCBzbyBpbnN0ZWFkIG1pcnJvciB3aGF0IHdlIGRvIG9uIHRoZSByZWFkIHBhdGhzIGFu
ZCBwcm9iZQo+IHRoZSBNU1IgdG8gZGVjaWRlIHdoZXRoZXIgdG8gcmFpc2UgI0dQLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSGF2aW5nIHRob3Vn
aHQgdGhpcyB0aHJvdWdoOgoKQXQgdGhlIG1vbWVudCwgYSB3cml0ZSB0byBhbnkgdW5oYW5kbGVk
IE1TUiBpcyB0cmVhdGVkIGFzIHNpbGVudCB3cml0ZQpkaXNjYXJkLsKgIFRoaXMgaXMgdGVycmli
bGUgYmVoYXZpb3VyIGZyb20gdGhlIGd1ZXN0cyBwb2ludCBvZiB2aWV3LgoKV2l0aCB0aGlzIHBh
dGNoIGluIHBsYWNlLCBhIHdyaXRlIHRvIGFueSB1bnJlYWRhYmxlIE1TUiB5aWVsZHMgI0dQLAp3
aGljaCBpcyBiZXR0ZXIgYmVoYXZpb3VyLgoKVGhlIG9ubHkgd3JpdGUtb25seSBNU1JzIEknbSBh
d2FyZSBvZiBhcmUgaW4gdGhlIHgyYXBpYyBibG9jaywgYW5kCk1TUl9QUkVEX0NNRCwgYWxsIG9m
IHdoaWNoIGFyZSBleHBsaWNpdGx5IGhhbmRsZWQuCgpUaGVyZWZvcmUsIFJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwgYXMKdGhpcyBpcyBhbiBp
bXByb3ZlbWVudCBpbiBiZWhhdmlvdXIsIGV2ZW4gaWYgdGhlIHJlc3VsdCBzdGlsbCBpc24ndCBn
cmVhdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
