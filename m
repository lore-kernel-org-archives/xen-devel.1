From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Fri, 23 Nov 2018 02:07:59 -0700
Message-ID: <5BF7C36F02000078001FF3E1@prv1-mh.provo.novell.com>
References: <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <20181122100554.pyqqa5iw6g27erkv@mac>
 <7efdfb5e-044b-f2a3-6562-d3468997096a@bitdefender.com>
 <20181122105821.6ihjcq5dy2lqjj6j@mac>
 <98f57a8a-288d-45ec-ef01-889fce63eeff@bitdefender.com>
 <20181122144924.ffy6xxwqugoj24nj@mac>
 <c4eca955-0384-7988-ae6c-6385823523ae@bitdefender.com>
 <20181122153756.au3ntxgfqjjhd6sb@mac>
 <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
 <20181122170801.pzdoif2g73aamnmu@mac>
 <f3ec3175-1c2e-e3a2-ed8f-63bf4c235fca@bitdefender.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wxfq=oc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ7RR-0007HO-LF
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 09:08:01 +0000
In-Reply-To: <838191050200006B34861ACF@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai Dontu <mdontu@bitdefender.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDE5OjI0LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gX0hvd2V2ZXJfLCBwbGVhc2UgcGljdHVyZSBhbiBpbnN0cnVjdGlvbiB0aGF0IGJvdGgg
d3JpdGVzIGludG8gYSBwYWdlIFAxCj4gd2UncmUgaW50ZXJlc3RlZCBpbiwgX2FuZF8gY2F1c2Vz
IGEgd3JpdGUgaW50byBhIHJlYWQtb25seSBwYWdlLXdhbGsKPiByZWxhdGVkIHBhZ2UgUDIuIEVt
dWxhdGluZyB0aGUgY3VycmVudCBpbnN0cnVjdGlvbiwgYXMgdGhlIHVwc3RyZWFtCj4gcGF0Y2gg
ZG9lcywgZG9lcyBlbGltaW5hdGUgdGhlIHZtX2V2ZW50IGNhdXNlZCBieSB3cml0aW5nIGludG8g
UDIsIGJ1dAo+IHdpdGggdGhlIHVuZm9ydHVuYXRlIHNpZGUtZWZmZWN0IG9mIGxvc2luZyBhIHBv
dGVudGlhbGx5IGNyaXRpY2FsIGV2ZW50Cj4gZm9yIHRoZSB3cml0ZSBpbnRvIFAxLgo+IAo+IFdo
YXQgdGhpcyBwYXRjaCBhdHRlbXB0cyB0byBkbyBpcyB0byBtYXJrIFAxIHJ3eCAoc28gYWxsb3cg
dGhlIHdyaXRlKSwKPiB0aGVuIHB1dCB0aGUgZmF1bHRpbmcgVkNQVSBpbnRvIHNpbmdsZXN0ZXAg
bW9kZSwgdGhlbiByZXN0b3JlIHRoZQo+IHJlc3RyaWN0aW9ucyBhZnRlciBpdCBoYXMgZmluaXNo
ZWQgc2luZ2xlIHN0ZXBwaW5nLiBCeSBub3cgaXQncyBvYnZpb3VzCj4gd2h5IGFsbCB0aGUgb3Ro
ZXIgVkNQVXMgbmVlZCB0byBiZSBwYXVzZWQ6IG9uZSBvZiB0aGVtIG1pZ2h0IGRvIGEKPiBtYWxp
Y2lvdXMgd3JpdGUgaW50byBQMSB0aGF0IHNpbGVudGx5IHN1Y2NlZWRzIChzaW5jZSB0aGUgRVBU
IGlzIHNoYXJlZAo+IGFtb25nIGFsbCBWQ1BVcyAtIHB1dHRpbmcgYWx0cDJtIGFzaWRlIGZvciBh
IG1vbWVudCkuIFdlIGRvbid0IHdhbnQgdGhhdC4KCkkgdGhpbmsgdGhpcyBhbGwgZ29lcyBpbnRv
IHRoZSBmdW5kYW1lbnRhbGx5IHdyb25nIGRpcmVjdGlvbi4gSWYgbG9zdApldmVudHMgZHVyaW5n
IGVtdWxhdGlvbiBhcmUgeW91ciBpc3N1ZSwgdGhlbiBsZXQncyBtYWtlIHN1cmUKZW11bGF0aW9u
IHBhdGhzIHRyaWdnZXIgdGhlIHNhbWUgZXZlbnRzIGhhcmR3YXJlIHdvdWxkLgoKV2l0aCBhIHN1
ZmZpY2llbnRseSBjb21wbGV0ZSBpbnNuIGVtdWxhdG9yLCBzaW5nbGUtc3RlcHBpbmcgc2hvdWxk
Cm5vdCBiZSBuZWVkZWQgYXQgYWxsIGltby4gR3JhbnRlZCB3ZSdyZSBub3QgcXVpdGUgdGhlcmUg
eWV0IHdpdGgKdGhlIGVtdWxhdG9yLCBidXQgd2UndmUgbWFkZSBxdWl0ZSBhIGJpdCBvZiBwcm9n
cmVzcy4gQXMgYmVmb3JlLAppZiB0aGVyZSBhcmUgcGFydGljdWxhciBpbnN0cnVjdGlvbnMgeW91
IGtub3cgb2YgdGhhdCB0aGUgZW11bGF0b3IKZG9lc24ndCBoYW5kbGUgeWV0LCBwbGVhc2Uga2Vl
cCBwb2ludGluZyB0aGVzZSBvdXQuIExhc3QgSSBrbm93CndlcmUgc29tZSBBVlggbW92ZSBpbnN0
cnVjdGlvbnMsIHdoaWNoIGhhdmUgbG9uZyBiZWVuCmltcGxlbWVudGVkLgoKPiBBbHRlcm5hdGl2
ZWx5LCB3ZSdkIGJlIGhhcHB5IHdpdGggc2ltcGx5IGJlaW5nIGFibGUgdG8gc2V0IHRoZSByZWxl
dmFudAo+IEEvRCBiaXRzIGluIHRoZSBwYWdlcyB0b3VjaGVkIGJ5IHRoZSBwYWdlIHdhbGssIGJ1
dCBhZnRlciBsZW5naHR5Cj4gbmVnb3RpYXRpb25zIHRoYXQgY2FuIGJlIGZvdW5kIGluIHRoZSB4
ZW4tZGV2ZWwgYXJjaGl2ZXMgd2Ugd2VyZSB1bmFibGUKPiB0byBmaW5kIGEgc2FmZSwgYXJjaGl0
ZWN0dXJhbGx5IGNvcnJlY3Qgd2F5IG9mIGRvaW5nIHRoYXQuCgpIbW0sIEkgZG9uJ3QgcmVjYWxs
IHRoYXQgd2UgaGFkIHNldHRsZWQgdGhhdCB0aGlzIHdvdWxkIGJlIGVudGlyZWx5CmltcG9zc2li
bGUsIGJ1dCB0aGVuIGFnYWluIC0gYXMgcGVyIGFib3ZlIC0gdGhpcyBhcyB3ZWxsIHdhcyBvbmx5
CmN1cmluZyBzeW1wdG9tcyByYXRoZXIgdGhhbiB0aGUgY2F1c2UuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
