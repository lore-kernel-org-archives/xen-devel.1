From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V3] xen/altp2m: set access_required properly
 for all altp2ms
Date: Mon, 23 Jul 2018 12:40:01 +0100
Message-ID: <4e7e8388-fe9f-d423-d69c-63e9e099e556@citrix.com>
References: <1530172441-2553-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmXsLgj==MxmXFOW25qW21OFvxaqRgUWHq5BGDmF7nJvQ@mail.gmail.com>
 <49d57a24-5f94-e00e-634a-ab4651e7d9bb@bitdefender.com>
 <5B4C5CF302000078001D42EE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4C5CF302000078001D42EE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTYvMjAxOCAwOTo1MyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDcu
MTggYXQgMTA6MzUsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gT24gMDYv
MjgvMjAxOCAwNzoxOSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4gT24gVGh1LCBKdW4g
MjgsIDIwMTggYXQgMTo1NCBBTSBSYXp2YW4gQ29qb2NhcnUKPj4+IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEZvciB0aGUgaG9zdHAybSwgYWNjZXNzX3JlcXVp
cmVkIHN0YXJ0cyBvZmYgYXMgMCwgdGhlbiBpdCBjYW4gYmUKPj4+PiBzZXQgd2l0aCB4Y19kb21h
aW5fc2V0X2FjY2Vzc19yZXF1aXJlZCgpLiBIb3dldmVyLCBhbGwgdGhlIGFsdHAybXMKPj4+PiBz
ZXQgaXQgdG8gMSBvbiBpbml0LCBhbmQgaWdub3JlIGJvdGggdGhlIGhvc3RwMm0gYW5kIHRoZSBo
eXBlcmNhbGwuCj4+Pj4gVGhpcyBwYXRjaCBzZXRzIGFjY2Vzc19yZXF1aXJlZCB0byB0aGUgdmFs
dWUgZnJvbSB0aGUgaG9zdHAybQo+Pj4+IG9uIGFsdHAybSBpbml0LCBhbmQgcHJvcGFnYXRlcyB0
aGUgdmFsdWVzIHJlY2VpdmVkIHZpYSBoeXBlcmNhbGwKPj4+PiB0byBhbGwgdGhlIGFjdGl2ZSBh
bHRwMm1zLCB3aGVuIGFwcGxpY2FibGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4g
Q29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4+Pgo+Pj4gTEdUTQo+Pj4KPj4+
IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+Cj4+IFRo
YW5rcyBUYW1hcyEKPj4KPj4gRG9lcyB0aGUgcGF0Y2ggbmVlZCBhZGRpdGlvbmFsIGFjdGlvbiBi
ZWZvcmUgaXQgY2FuIGdvIGluIChzb3JyeSBmb3IgdGhlCj4+IG5vaXNlIGlmIGl0IG9ubHkgaGFz
bid0IGdvbmUgaW4gYmVjYXVzZSBpdCBhdCB0aGUgYmFjayBvZiB0aGUgcXVldWUpLgo+IAo+IE9u
Y2UgYWdhaW4gLSBHZW9yZ2UncyBhY2sgaXMgbWlzc2luZy4gUGxlYXNlIHJlbWVtYmVyIHRoYXQg
Z2VuZXJhbGx5Cj4gaXQncyB0aGUgc3VibWl0dGVyIHRvIGNoYXNlIGFjay1zLCBub3QgcmV2aWV3
ZXJzIG9yIGNvbW1pdHRlcnMuCgpEbyB3ZSBuZWVkIEp1bGllbidzIGFjayB0b28/CgogLUdlb3Jn
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
