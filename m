From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] x86/vtd: Don't include control register
 state in the table pointers
Date: Thu, 28 Feb 2019 11:28:25 +0000
Message-ID: <c0debdcf-836f-cf10-f881-a56c54213d78@citrix.com>
References: <1550862806-30236-1-git-send-email-andrew.cooper3@citrix.com>
 <1550862806-30236-2-git-send-email-andrew.cooper3@citrix.com>
 <CAFLBxZaCLODbNWCmMm_XUTv+CTuwHbkaM4LuSP7JmodhAYCDzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZaCLODbNWCmMm_XUTv+CTuwHbkaM4LuSP7JmodhAYCDzQ@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDIvMjAxOSAxMTozOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiBGcmksIEZlYiAy
MiwgMjAxOSBhdCA3OjE1IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiBpcmVtYXBfbWFkZHIgYW5kIHFpbnZhbF9tYWRkciBwb2ludCB0byB0aGUg
YmFzZSBvZiBhIGJsb2NrIG9mIGNvbnRpZ3VvdXMgUkFNLAo+PiBhbGxvY2F0ZWQgYnkgdGhlIGRy
aXZlciwgaG9sZGluZyB0aGUgSW50ZXJydXB0IFJlbWFwcGluZyB0YWJsZSwgYW5kIHRoZSBRdWV1
ZWQKPj4gSW52YWxpZGF0aW9uIHJpbmcuCj4+Cj4+IERlc3BpdGUgdGhlaXIgbmFtZSwgdGhleSBh
cmUgYWN0dWFsbHkgdGhlIHZhbHVlcyBvZiB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIsCj4+IGluY2x1
ZGluZyBjb250cm9sIG1ldGFkYXRhIGluIHRoZSBsb3dlciAxMiBiaXRzLiAgV2hpbGUgdXNlcyBv
ZiB0aGVzZSBmaWVsZHMKPj4gZG8gYXBwZWFyIHRvIGNvcnJlY3RseSBzaGlmdCBvdXQgdGhlIG1l
dGFkYXRhLCB0aGlzIGlzIHZlcnkgc3VidGxlIGJlaGF2aW91cgo+PiBhbmQgY29uZnVzaW5nIHRv
IGZvbGxvdy4KPiBDb3VsZCBJIHN1Z2dlc3QgdGhhdCB3ZSBhZGQgYW4gQVNTRVJUKCkgdG8gdGhh
dCBtYWNybywgdGhhdCBtYWRkciBpcwo+IHBhZ2UgYWxpZ25lZD8KPgo+IFRoZSBhbGdvcml0aG0g
dXNlZCBjZXJ0YWlubHkgYXNzdW1lcyB0aGF0J3MgdGhlIGNhc2UsIGFuZCB3b3VsZAo+IHByb2R1
Y2UgaW5jb3JyZWN0IHJlc3VsdHMgaWYgaXQgd2VyZSBldmVyIHZhbGlkbHkgdHJ1ZS4gIFN1Y2gg
YW4KPiBBU1NFUlQoKSB3b3VsZCBhbHNvIGhhdmUgZGV0ZWN0ZWQgdGhlIHN0b3JpbmctZ2FyYmFn
ZS1pbi1tYWRkciBpc3N1ZQo+IGFsbW9zdCBpbW1lZGlhdGVseS4KCldoZXJlIHdvdWxkIHlvdSBz
dWdnZXN0IHB1dHRpbmcgc3VjaCBhbiBBU1NFUlQoKSA/wqAgVGhpcyB2YXJpYWJsZSBpcwp3cml0
dGVuIGV4YWN0bHkgb25jZS4KCklycmVzcGVjdGl2ZSwgSSBwbGFuIHRvIHJlcGxhY2UgdGhlIGV4
aXN0aW5nIHNjaGVtZSB3aXRoIGEgdm1hcCgpJ2Qgb25lCndoaWNoIHdpbGwgZGVsZXRlIHRoaXMg
dmFyaWFibGUgY29tcGxldGVseS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
