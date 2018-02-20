From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/5] x86/pv: Avoid leaking other guests'
 MSR_TSC_AUX values into PV context
Date: Tue, 20 Feb 2018 15:22:44 +0000
Message-ID: <20180220152244.2pv64jva6jsmodph@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6NTg6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJZiB0aGUgQ1BVIHBpcGVsaW5lIHN1cHBvcnRzIFJEVFNDUCBvciBSRFBJRCwgYSBn
dWVzdCBjYW4gb2JzZXJ2ZSB0aGUgdmFsdWUgaW4KPiBNU1JfVFNDX0FVWCwgaXJyZXNwZWN0aXZl
IG9mIHdoZXRoZXIgdGhlIHJlbGV2YW50IENQVUlEIGZlYXR1cmVzIGFyZQo+IGFkdmVydGlzZWQv
aGlkZGVuLgo+IAoKVGhpcyBzZXR1cCB3b3JrcyBvbmx5IGJlY2F1c2UgQ1I0LlRTRD0wPwoKPiBB
dCB0aGUgbW9tZW50LCBwYXJhdmlydF9jdHh0X3N3aXRjaF90bygpIG9ubHkgd3JpdGVzIHRvIE1T
Ul9UU0NfQVVYIGlmCj4gVFNDX01PREVfUFZSRFRTQ1AgbW9kZSBpcyBlbmFibGVkLCBidXQgdGhp
cyBpcyBub3QgdGhlIGRlZmF1bHQgbW9kZS4KPiBUaGVyZWZvcmUsIGRlZmF1bHQgUFYgZ3Vlc3Rz
IGNhbiByZWFkIHRoZSB2YWx1ZSBmcm9tIGEgcHJldmlvdXNseSBzY2hlZHVsZWQKPiBIVk0gdmNw
dSwgb3IgVFNDX01PREVfUFZSRFRTQ1AtZW5hYmxlZCBQViBndWVzdC4KPiAKPiBBbHRlciB0aGUg
UFYgcGF0aCB0byBhbHdheXMgd3JpdGUgdG8gTVNSX1RTQ19BVVgsIHVzaW5nIDAgaW4gdGhlIGNv
bW1vbiBjYXNlLgo+IAo+IFRvIGFtb3J0aXNlIG92ZXJoZWFkIGNvc3QsIGludHJvZHVjZSB3cm1z
cl90c2NfYXV4KCkgd2hpY2ggcGVyZm9ybXMgYSBsYXp5Cj4gdXBkYXRlIG9mIHRoZSBNU1IsIGFu
ZCB1c2UgdGhpcyBmdW5jdGlvbiBjb25zaXN0ZW50bHkgYWNyb3NzIHRoZSBjb2RlYmFzZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKVGhlIGNvZGUgbG9va3MgY29ycmVjdCB0byBtZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
