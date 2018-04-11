From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 06:31:16 -0600
Message-ID: <5ACE1C3402000078001BA4D4@prv1-mh.provo.novell.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de>
 <298ec681a9c38eb7618e6b3e226486691e9eab4d.camel@suse.com>
 <672aa7a1-7e0c-4209-4fbd-649cdb983dc5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <672aa7a1-7e0c-4209-4fbd-649cdb983dc5@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE4IGF0IDEzOjAyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwNC8xMS8yMDE4IDExOjE3IEFNLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4gT24g
V2VkLCAyMDE4LTA0LTExIGF0IDEyOjAwICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToKPj4+IE9u
IFdlZCwgQXByIDExLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4+Cj4+Pj4gT2xhZiwgY2FuIHlv
dSBnaXZlIGl0IGEgdHJ5PyBJdCBzaG91bGQgYmUgZmluZSB0byBydW4gaXQgb24gdG9wIG9mCj4+
Pj4gdGhlCj4+Pj4gbGFzdCBkZWJ1ZyBwYXRjaCAodGhlIG9uZSB0aGF0IHByb2R1Y2VkIHRoaXMg
Y3Jhc2gpLgo+Pj4KPj4+IFllcywgd2l0aCBib3RoIGNoYW5nZXMgaXQgZGlkID40ayBpdGVyYXRp
b25zIGFscmVhZHkuIFRoYW5rcy4KPj4+Cj4+IFRoYXQncyBncmVhdCB0byBoZWFyISA6LUQKPj4g
Cj4+IE5vdywgSSB0aGluayBJJ2xsIHN1Ym1pdCBpdCBhcyBhIHByb3BlciBwYXRjaCBpbiB0aGUg
dmFyaWFudCB0aGF0Cj4+IEp1ZXJnZW4gc3VnZ2VzdGVkLCBhbmQgdGhhdCBJIGFsc28gd2VyZSB0
aGlua2luZyB0byB1c2UuCj4+IAo+PiBHZW9yZ2UsIGFueSBvcGluaW9uPyBJJ20gZ29pbmcgc29t
ZXdoZXJlIG5vdy4gSWYgSSBkb24ndCBoZWFyIGFueQo+PiBwdXNoYmFjaywgSSdsbCBkbyB0aGF0
IGFzIHNvb24gYXMgYmFjay4KPiAKPiBJIHRoaW5rIGZvciBzaW1wbGljaXR5IC8gcmVsaWFiaWxp
dHkgb2YgYmFja3BvcnRpbmcsIHdlIHNob3VsZCBzdGFydAo+IHdpdGggYSBwYXRjaCBsaWtlIHRo
ZSBvbmUgeW91IGdhdmUgdG8gT2xhZiAoaS5lLiwgYWRkaW5nIHRoZSAibWlzc2luZyIKPiB2Y3B1
X3NsZWVwX25vc3luYygpKS4KCk5vdCBzdXJlIC0gSSd2ZSBmYWxsZW4gaW50byBwaXRmYWxscyBs
aWtlIHRoaXMgYSBjb3VwbGUgb2YgdGltZXMgcmVjZW50bHkuCklmIGJhY2twb3J0cyBkaWRuJ3Qg
bW92ZSB0aGUgY2FsbCBpbnRvIHZjcHVfbWlncmF0ZSgpLCBhbmQgbGF0ZXIgd2UnZAphZGQgYSBu
ZXcgY2FsbCB0byB0aGF0IGZ1bmN0aW9uIHNvbWV3aGVyZSBlbHNlLCBhIGJhY2twb3J0IHRoZXJl
b2YKd291bGQgaGF2ZSBiYXNpY2FsbHkgbm8gY2hhbmNlIG9mIG5vdGljaW5nIHRoYXQgYSBjYWxs
IHRvCnZjcHVfc2xlZXBfbm9zeW5jKCkgd291bGQgbmVlZCB0byBiZSBhZGRlZCBhcyB3ZWxsLgoK
SmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
