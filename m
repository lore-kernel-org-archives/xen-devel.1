From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 RFC] xen/console: Handle NUL
 character in buffer sent via CONSOLEIO_write
Date: Tue, 5 Mar 2019 15:12:10 +0100
Message-ID: <f273eb4a-053f-14ec-29e8-530ce7b209e5@suse.com>
References: <20190226230351.12882-1-julien.grall@arm.com>
 <a8c1b423-ed18-36bf-3979-17a4a275658f@arm.com>
 <deec0912-6efe-d129-4c06-6d8ef506964e@suse.com>
 <5a320701-4c7d-d19b-ccb2-7d949ae97623@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1Anp-0003TC-OL
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 14:12:17 +0000
In-Reply-To: <5a320701-4c7d-d19b-ccb2-7d949ae97623@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNTowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEp1ZXJnZW4sCj4g
Cj4gT24gMy81LzE5IDEyOjU3IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyNy8wMi8y
MDE5IDExOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiAoKyBKdWVyZ2VuIEdyb3NzIGFzIFJN
KQo+Pj4KPj4+IEkgZm9yZ290IHRvIENDIEp1ZXJnZW4gZm9yIHRoaXMuCj4+Pgo+Pj4gT24gMi8y
Ni8xOSAxMTowMyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEFmdGVyIHVwZ3JhZGluZyBE
ZWJpYW4gdG8gQnVzdGVyLCBJIHN0YXJ0ZWQgbm90aWNpbmcgY29uc29sZSBtYW5nbGluZwo+Pj4+
IHdoZW4gdXNpbmcgenNoLiBUaGlzIGlzIGhhcHBlbm5pbmcgYmVjYXVzZSBvdXRwdXQgc2VudCBi
eSB6c2ggdG8gdGhlCj4+Pj4gY29uc29sZSBtYXkgY29udGFpbiBOVUwgY2hhcmFjdGVyIGluIHRo
ZSBtaWRkbGUgb2YgdGhlIGJ1ZmZlci4KPj4+Pgo+Pj4+IExpbnV4IGlzIHNlbmRpbmcgdGhlIGJ1
ZmZlciBhcyBpdCBpcyB0byBYZW4gY29uc29sZSB2aWEKPj4+PiBDT05TT0xFSU9fd3JpdGUuCj4+
Pj4gSG93ZXZlciwgdGhlIGltcGxlbWVudGF0aW9uIGluIFhlbiBjb25zaWRlcnMgTlVMIGNoYXJh
Y3RlciBpcyB1c2VkIHRvCj4+Pj4gdGVybWluYXRlIHRoZSBidWZmZXIgYW5kIHRoZXJlZm9yZSB3
aWxsIGlnbm9yZSBhbnl0aGluZyBhZnRlciBpdC4KPj4+Pgo+Pj4+IFRoZSBhY3R1YWwgZG9jdW1l
bnRhdGlvbiBvZiBDT05TT0xFSU9fd3JpdGUgaXMgcHJldHR5IGxpbWl0ZWQuIEZyb20gdGhlCj4+
Pj4gZGVjbGFyYXRpb24sIHRoZSBoeXBlcmNhbGwgdGFrZXMgYSBidWZmZXIgYW5kIHNpemUuIFNv
IHRoaXMgY291bGQgbGVhZAo+Pj4+IHRvIHRoaW5rIHRoZSBOVUwgY2hhcmFjdGVyIGlzIGFsbG93
ZWQgaW4gdGhlIG1pZGRsZSBvZiB0aGUgYnVmZmVyLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCB1cGRh
dGVzIHRoZSBjb25zb2xlIEFQSSB0byBwYXNzIHRoZSBzaXplIGFsb25nIHRoZSBidWZmZXIKPj4+
PiBkb3duIHNvIHdlIGNhbiByZW1vdmUgdGhlIHJlbGlhbmNlIG9uIGJ1ZmZlciB0ZXJtaW5hdGlu
ZyBieSBhIE5VTAo+Pj4+IGNoYXJhY3Rlci4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IFRoZSByaXNrIGZvciBhIHJlZ3Jl
c3Npb24gaXMgdG9vIGhpZ2ggdGhpcyBsYXRlIGluIHRoZSA0LjEyIHJlbGVhc2UKPj4gcHJvY2Vz
cyBJTU8uCj4gCj4gVGhpcyBjb2RlIHBhdGggaXMgZmFpcmx5IHdlbGwgdGVzdGVkIChjb25zb2xl
IGFyZSB1c2VkIHByZXR0eSBtdWNoIGFsbAo+IHRoZSB0aW1lcykuIFNvIGEgcmVncmVzc2lvbiB3
b3VsZCBiZSBxdWlja2x5IG5vdGljZWQuCgpPbmx5IGlmIHlvdSB0ZXN0IGFsbCB0aGUgZ3Vlc3Rz
IG91dCBpbiB0aGUgd2lsZC4KCj4gVGhpcyBwYXRjaCBoYXMgdGhlIGFkdmFudGFnZSB0byBhbGxv
dyB1cGdyYWRlIHRvIGEgbmV3ZXIgRGViaWFuIHdpdGhvdXQKPiBsb29zaW5nIHBhcnQgb2YgeW91
ciBwcm9tcHQgb24genNoLiBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgdGhlIHByb2JsZW0gaXMKPiB0
aGUgc2FtZSB3aXRoIG90aGVyIERpc3Ryb3MuCj4gCj4+Cj4+IE15IHBsYW4gaXMgdG8gaGF2ZSBv
bmx5IG9uZSBmdXJ0aGVyIFJDIGJlZm9yZSBicmFuY2hpbmcgb2ZmIDQuMTIsCj4+IHNvIHBsZWFz
ZSBsZXQgdXMgc2hpZnQgdGhpcyBwYXRjaCB0byA0LjEzLgo+IAo+IEkgdW5kZXJzdGFuZC4gSXQg
aXMgcG9zc2libGUgdG8gd29ya2Fyb3VuZCB0aGUgcHJvYmxlbSBhdCBsZWFzdCB3aXRoCj4genNo
LiBTbyBhIHJlbGVhc2Ugbm90ZSBpbiBYZW4gKGFuZCBtYXliZSBEZWJpYW4pIHNob3VsZCBkbyB0
aGUgam9iLgoKQ291bGQgeW91IHBsZWFzZSBwb3N0IHRoZSBuZWVkZWQgaW5mb3JtYXRpb24gZm9y
IHRoZSA0LjEyIFJOPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
