From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [ping] Re: [PATCH 2/5] x86/pv: Avoid leaking other
 guests' MSR_TSC_AUX values into PV context
Date: Mon, 26 Feb 2018 19:11:01 +0000
Message-ID: <4b4acfe6-23c3-8a05-cdce-16252fec6f7e@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
 <5A93FCC002000078001ABB41@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A93FCC002000078001ABB41@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMTggMTE6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjAyLjE4IGF0
IDEyOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IElmIHRoZSBDUFUg
cGlwZWxpbmUgc3VwcG9ydHMgUkRUU0NQIG9yIFJEUElELCBhIGd1ZXN0IGNhbiBvYnNlcnZlIHRo
ZSB2YWx1ZSBpbgo+PiBNU1JfVFNDX0FVWCwgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgdGhlIHJl
bGV2YW50IENQVUlEIGZlYXR1cmVzIGFyZQo+PiBhZHZlcnRpc2VkL2hpZGRlbi4KPj4KPj4gQXQg
dGhlIG1vbWVudCwgcGFyYXZpcnRfY3R4dF9zd2l0Y2hfdG8oKSBvbmx5IHdyaXRlcyB0byBNU1Jf
VFNDX0FVWCBpZgo+PiBUU0NfTU9ERV9QVlJEVFNDUCBtb2RlIGlzIGVuYWJsZWQsIGJ1dCB0aGlz
IGlzIG5vdCB0aGUgZGVmYXVsdCBtb2RlLgo+PiBUaGVyZWZvcmUsIGRlZmF1bHQgUFYgZ3Vlc3Rz
IGNhbiByZWFkIHRoZSB2YWx1ZSBmcm9tIGEgcHJldmlvdXNseSBzY2hlZHVsZWQKPj4gSFZNIHZj
cHUsIG9yIFRTQ19NT0RFX1BWUkRUU0NQLWVuYWJsZWQgUFYgZ3Vlc3QuCj4+Cj4+IEFsdGVyIHRo
ZSBQViBwYXRoIHRvIGFsd2F5cyB3cml0ZSB0byBNU1JfVFNDX0FVWCwgdXNpbmcgMCBpbiB0aGUg
Y29tbW9uIAo+PiBjYXNlLgo+Pgo+PiBUbyBhbW9ydGlzZSBvdmVyaGVhZCBjb3N0LCBpbnRyb2R1
Y2Ugd3Jtc3JfdHNjX2F1eCgpIHdoaWNoIHBlcmZvcm1zIGEgbGF6eQo+PiB1cGRhdGUgb2YgdGhl
IE1TUiwgYW5kIHVzZSB0aGlzIGZ1bmN0aW9uIGNvbnNpc3RlbnRseSBhY3Jvc3MgdGhlIGNvZGVi
YXNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IERlc3BpdGUgbWUgY29udGludWluZyB0byB0aGluayB0aGF0IFJEVFNDUCBh
bmQgUkRQSUQgc2hvdWxkIGJlCj4gZnVsbHkgaW5kZXBlbmRlbnQgZmVhdHVyZXMsIHRoaXMgYmVp
bmcgaW4gbGluZSB3aXRoIHRoZSBTRE06Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KClRoYW5rcy4KCkdpdmVuIHRoZSBpbXBvcnRhbnQgb2YgdGhpcyBwYXRjaCwg
SSBmZWVsIGl0IGlzIHRpbWUgdG8gcGluZyB0aGUgVlQteAphbmQgU1ZNIG1haW50YWluZXJzIGZv
ciB0aGVpciBpbnB1dC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
