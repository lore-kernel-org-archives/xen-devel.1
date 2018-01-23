From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 10:24:56 +0100
Message-ID: <9392fbde-562c-5200-8b1c-33a737ed8972@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@prv-mh.provo.novell.com>
 <1484b1c8-6140-323e-9933-e1120f1e2a0d@citrix.com>
 <0f0af840-a808-a1b5-5397-490816cdce0f@suse.com>
 <5A67061F02000078001A1669@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bxvh=es=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1edupG-00084v-7v
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 09:25:06 +0000
In-Reply-To: <5A67061F02000078001A1669@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMTggMDk6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIzLjAxLjE4IGF0
IDA3OjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjIvMDEvMTggMTk6MzksIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbmUgb2YgbXkgY29uY2VybnMgaXMgdGhhdCB0aGlzIHBh
dGNoIHNlcmllcyBtb3ZlcyBmdXJ0aGVyIGF3YXkgZnJvbSB0aGUKPj4+IHNlY29uZGFyeSBnb2Fs
IG9mIG15IEtBSVNFUiBzZXJpZXMsIHdoaWNoIHdhcyB0byBoYXZlIHRoZSBJRFQgYW5kIEdEVAo+
Pj4gbWFwcGVkIGF0IHRoZSBzYW1lIGxpbmVhciBhZGRyZXNzZXMgb24gZXZlcnkgQ1BVIHNvIGEp
IFNJRFQvU0dEVCBkb24ndAo+Pj4gbGVhayB3aGljaCBDUFUgeW91J3JlIGN1cnJlbnRseSBzY2hl
ZHVsZWQgb24gaW50byBQViBndWVzdHMgYW5kIGIpIHRoZQo+Pj4gY29udGV4dCBzd2l0Y2ggY29k
ZSBjYW4gZHJvcCBhIGxvYWQgb2YgaXRzIHNsb3cgaW5zdHJ1Y3Rpb25zIGxpa2UgTEdEVAo+Pj4g
YW5kIHRoZSBWTVdSSVRFcyB0byB1cGRhdGUgdGhlIFZNQ1MuCj4+Cj4+IFRoZSBHRFQgYWRkcmVz
cyBvZiBhIFBWIHZjcHUgaXMgZGVwZW5kaW5nIG9uIHZjcHVfaWQgb25seS4gSSBkb24ndAo+PiBz
ZWUgd2h5IHRoZSBJRFQgY2FuJ3QgYmUgbWFwcGVkIHRvIHRoZSBzYW1lIGFkZHJlc3Mgb24gZWFj
aCBjcHUgd2l0aAo+PiBteSBhcHByb2FjaC4KPiAKPiBZb3UncmUgbm90IGludHJvZHVjaW5nIGEg
cGVyLUNQVSByYW5nZSBpbiB0aGUgcGFnZSB0YWJsZXMgYWZhaWNzCj4gKGFnYWluIGZyb20gb3Zl
cnZpZXcgYW5kIHRpdGxlcyBvbmx5KSwgeWV0IHdpdGggdGhlIElEVCBuZWVkaW5nCj4gdG8gYmUg
cGVyLUNQVSB5b3UnZCBhbHNvIG5lZWQgYSBwZXItQ1BVIHJhbmdlIHRvIG1hcCBpdCB0byBpZgo+
IHlvdSB3YW50IHRvIGF2b2lkIHRoZSBMSURUIGFzIHdlbGwgYXMgZXhwb3Npbmcgd2hhdCBDUFUg
eW91J3JlCj4gb24gKHNhbWUgZ29lcyBmb3IgdGhlIEdEVCBhbmQgdGhlIHJlc3BlY3RpdmUgYXZv
aWRhbmNlIG9mIExHRFQKPiBhZmFpY3QpLgoKQWZ0ZXIgYSBxdWljayBsb29rIEkgZG9uJ3Qgc2Vl
IHdoeSBhIE1lbHRkb3duIG1pdGlnYXRpb24gY2FuJ3QgdXNlCnRoZSBzYW1lIElEVCBmb3IgYWxs
IGNwdXM6IHRoZSBvbmx5IHJlYXNvbiBJIGNvdWxkIGZpbmQgZm9yIGhhdmluZwpwZXItY3B1IElE
VHMgc2VlbXMgdG8gYmUgaW4gU1ZNIGNvZGUsIHNvIGl0IHNlZW1zIHRvIGJlIEFNRCBzcGVjaWZp
Yy4KQW5kIEFNRCB3b24ndCBuZWVkIFhQVEkgYXQgYWxsLgoKVGhlIEdEVCBvZiBwdiBkb21haW5z
IGlzIGFscmVhZHkgaW4gdGhlIHBlci1kb21haW4gcmVnaW9uIGV2ZW4gd2l0aG91dApteSBwYXRj
aGVzLCBzbyBJIGRvbid0IGhhdmUgdG8gY2hhbmdlIGFueXRoaW5nIHJlZ2FyZGluZyB1c2FnZSBv
ZiBMR0RULgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
