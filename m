From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 17:56:45 +0100
Message-ID: <afd747ee-804a-1350-7823-e362562aea79@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@prv-mh.provo.novell.com>
 <1484b1c8-6140-323e-9933-e1120f1e2a0d@citrix.com>
 <d1ddec7e-6e00-bf38-f105-8e5522721cc4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bxvh=es=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ee1sU-0006sb-B4
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 16:56:54 +0000
In-Reply-To: <d1ddec7e-6e00-bf38-f105-8e5522721cc4@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMTggMTc6NDUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMDEvMjIvMjAxOCAw
NjozOSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSnVlcmdlbjogeW91J3JlIG5vdyBhZGRp
bmcgYSBMVFIgaW50byB0aGUgY29udGV4dCBzd2l0Y2ggcGF0aCB3aGljaAo+PiB0ZW5kcyB0byBi
ZSB2ZXJ5IHNsb3cuwqAgSS5lLiBBcyBjdXJyZW50bHkgcHJlc2VudGVkLCB0aGlzIHNlcmllcwo+
PiBuZWNlc3NhcmlseSBoYXMgYSBoaWdoZXIgcnVudGltZSBvdmVyaGVhZCB0aGFuIEphbidzIFhQ
VEkuCj4gCj4gU28gaGVyZSBhcmUgYSByZXBlYXQgb2YgdGhlICJoeXBlcnZpc29yIGNvbXBpbGUi
IHRlc3RzIEkgZGlkLCBjb21wYXJpbmcKPiB0aGUgZGlmZmVyZW50IFhQVEktbGlrZSBzZXJpZXMg
c28gZmFyLgo+IAo+ICMgRXhwZXJpbWVudGFsIHNldHVwOgo+IEhvc3Q6Cj4gIC0gSW50ZWwoUikg
WGVvbihSKSBDUFUgRTU2MzAgIEAgMi41M0dIego+ICAtIDQgcGNwdXMKPiAgLSBNZW1vcnk6IDRH
aUIKPiBHdWVzdDoKPiAgLSA0dmNwdXMsIDUxMk1pQiwgYmxrYmFjayB0byByYXcgZmlsZQo+ICAt
IENlbnRPUyA2IHVzZXJzcGFjZQo+ICAtIExpbnV4IDQuMTQga2VybmVsIHdpdGggUFYgLyBQVkgg
LyBQVkhWTSAvIEtWTSBndWVzdCBzdXBwb3J0IChhbG9uZwo+IHdpdGggZXhwZWN0ZWQgZHJpdmVy
cykgYnVpbHQtaW4KPiBUZXN0Ogo+ICAtIGNkIHhlbi00LjEwLjAKPiAgLSBtYWtlIC1DIHhlbiBj
bGVhbgo+ICAtIHRpbWUgbWFrZSAtaiA0IHhlbgo+IAoKLi4uCgo+ICogU3RhZ2luZyArIEp1ZXJn
ZW4ncyB2MiBzZXJpZXMKPiByZWFsICAgIDFtMy4wMThzCj4gdXNlciAgICAybTUyLjIxN3MKPiBz
eXMgICAgIDBtNDAuMzU3cwo+IAo+IFJlc3VsdDogNjNzICgwJSBvdmVyaGVhZCkKPiAKPiBVbmZv
cnR1bmF0ZWx5LCBJIGNhbid0IHJlYWxseSB2ZXJpZnkgdGhhdCBKdWVyZ2VuJ3MgcGF0Y2hlcyBh
cmUgaGF2aW5nCj4gYW55IGVmZmVjdDsgdGhlcmUncyBubyBwcmludGsgaW5kaWNhdGluZyB3aGV0
aGVyIGl0J3MgZW5hYmxpbmcgdGhlCj4gbWl0aWdhdGlvbiBvciBub3QuICBJIGhhdmUgdmVyaWZp
ZWQgdGhhdCB0aGUgY2hhbmdlc2V0IHJlcG9ydGVkIGluIGB4bAo+IGRtZXNnYCBjb3JyZXNwb25k
cyB0byB0aGUgYnJhbmNoIEkgaGF2ZSB3aXRoIHRoZSBwYXRjaGVzIGFwcGxpZWQuCj4gCj4gU28g
aXQncyAqcG9zc2libGUqIHNvbWV0aGluZyBoYXMgZ290dGVuIG1peGVkIHVwLCBhbmQgdGhlIG1p
dGlnYXRpb24KPiBpc24ndCBiZWluZyBhcHBsaWVkOyBidXQgaWYgaXQgKmlzKiBhcHBsaWVkLCB0
aGUgcGVyZm9ybWFuY2UgaXMKPiBzaWduaWZpY2FudGx5IGJldHRlciB0aGFuIHRoZSAiYmFuZC1h
aWQiIFhQVEkuCgpBcyB0aGVyZSBpcyBubyByZWFsIG1pdGlnYXRpb24gaW4gcGxhY2UsIGJ1dCBv
bmx5IHRoZSBuZWVkZWQgcmV3b3JrIG9mCnRoZSBpbnRlcnJ1cHQgaGFuZGxpbmcgYW5kIGNvbnRl
eHQgc3dpdGNoaW5nLCBhbnl0aGluZyBub3QgbmV4dCB0bwp4cHRpPW9mZiB3b3VsZCBoYXZlIGJl
ZW4gZGlzYXBwb2ludGluZyBmb3IgbWUuIDotKQoKSSdsbCBhZGQgc29tZSBzdGF0aXN0aWNzIGlu
IHRoZSBuZXh0IHBhdGNoZXMgc28gaXQgY2FuIGJlIHZlcmlmaWVkIHRoZQpwYXRjaGVzIGFyZSBy
ZWFsbHkgZG9pbmcgc29tZXRoaW5nLgoKVGhhbmtzIGZvciBkb2luZyB0aGUgdGVzdHMsCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
