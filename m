From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/3] xen: Introduce shared buffer helpers
 for page directory...
Date: Fri, 30 Nov 2018 09:07:29 +0200
Message-ID: <ee394331-282e-9942-a576-73cf714b620e__7652.61747078529$1543561584$gmane$org@gmail.com>
References: <20181122100230.14976-1-andr2000@gmail.com>
 <133b948f-fc31-4505-0b85-5fc7a7beb559@gmail.com>
 <f802385f-3c78-2804-9e47-b590a9580955@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpn8=oj=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gScti-0000LJ-LQ
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 07:07:34 +0000
Received: by mail-lj1-x244.google.com with SMTP id t9-v6so4040717ljh.6
 for <xen-devel@lists.xenproject.org>; Thu, 29 Nov 2018 23:07:32 -0800 (PST)
In-Reply-To: <f802385f-3c78-2804-9e47-b590a9580955@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMzAvMTggODo1MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyOS8xMS8yMDE4
IDEyOjIyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4gcGluZwo+Pgo+PiBPbiAx
MS8yMi8xOCAxMjowMiBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiBGcm9t
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+Cj4+Pgo+Pj4gYmFzZWQgZnJvbnRlbmRzLiBDdXJyZW50bHkgdGhlIGZyb250ZW5kcyB3aGlj
aCBpbXBsZW1lbnQKPj4+IHNpbWlsYXIgY29kZSBmb3Igc2hhcmluZyBiaWcgYnVmZmVycyBiZXR3
ZWVuIGZyb250ZW5kIGFuZAo+Pj4gYmFja2VuZCBhcmUgcGFyYS12aXJ0dWFsaXplZCBEUk0gYW5k
IHNvdW5kIGRyaXZlcnMuCj4+PiBCb3RoIGRlZmluZSB0aGUgc2FtZSB3YXkgdG8gc2hhcmUgZ3Jh
bnQgcmVmZXJlbmNlcyBvZiBhCj4+PiBkYXRhIGJ1ZmZlciB3aXRoIHRoZSBjb3JyZXNwb25kaW5n
IGJhY2tlbmQgd2l0aCBsaXR0bGUKPj4+IGRpZmZlcmVuY2VzLgo+Pj4KPj4+IE1vdmUgc2hhcmVk
IGNvZGUgaW50byBhIGhlbHBlciBtb2R1bGUsIHNvIHRoZXJlIGlzIGEgc2luZ2xlCj4+PiBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGZvciBhbGwuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPgo+IEluIGdlbmVyYWwgSSdtIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNoLgo+
Cj4gV2l0aCB0aGUgY29uY2VybnMgcmFpc2VkIGZvciBvbmUgb2YgdGhlIG90aGVyIHBhdGNoZXMg
SSB3YW50ZWQgdG8gd2FpdAo+IGZvciBWMiBvZiB0aGUgc2VyaWVzLgpBaCwgSSB3YWl0ZWQgZm9y
IGFueSBjb21tZW50cyBiZWZvcmUgcm9sbGluZyB2MiBvdXQgOykKPiAgIE9yIHdvbid0IHRoZSBy
ZXN1bHRpbmcgY2hhbmdlIHJlcXVpcmUgYQo+IG1vZGlmaWNhdGlvbiBvZiB0aGlzIHBhdGNoPwoK
VGhpcyBwYXRjaCB3b24ndCBjaGFuZ2UsIGl0IGlzIG9ubHkgRFJNIHJlbGF0ZWQKClRoZSBjb25j
ZXJuIGZvciB0aGUgRFJNIHBhdGNoIGlzIGFscmVhZHkgcmVzb2x2ZWQKCmFuZCB0aGUgY29ycmVz
cG9uZGluZyBwYXRjaCBpcyBvbiByZXZpZXcgbm93IFsxXQoKPgo+IEl0IHdvdWxkIGJlIG5pY2Ug
aWYgeW91IGNvdWxkIHBvaW50IG91dCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hldGhlcgo+IHlv
dSBhcmUgZG9pbmcgY29kZSBtb3ZlbWVudCAod2l0aCBzb21lIHJlbmFtZXMpIG9ubHksIG9yIGlm
IHRoZXJlIGFyZQo+IGFueSBmdW5jdGlvbmFsIGNoYW5nZXMgaW52b2x2ZWQgKGFuZCB3aGljaCBv
bmVzKS4KU3VyZSwgdGhpcyBpcyBwdXJlIGNvZGUgbW92ZW1lbnQsIG5vIGZ1bmN0aW9uYWwgY2hh
bmdlcwo+ICAgVGhpcyB3b3VsZCBtYWtlIHRoZQo+IHJldmlldyBtdWNoIGVhc2llciBhbmQgbGVz
cyB0aW1lIGNvbnN1bWluZy4KPgo+Cj4gSnVlcmdlbgoKVGhhbmsgeW91LAoKT2xla3NhbmRyCgpb
MV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMTEvMjcvODExCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
