From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 08/17] x86/msr: Emulation of
 MSR_{SPEC_CTRL, PRED_CMD} for guests
Date: Wed, 17 Jan 2018 02:11:21 -0700
Message-ID: <5A5F2149020000780019F5CB@prv-mh.provo.novell.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-9-git-send-email-andrew.cooper3@citrix.com>
 <1516101037.4937.44.camel@infradead.org>
 <ee324f0e-1109-15e5-37e8-fb16709eda12@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ee324f0e-1109-15e5-37e8-fb16709eda12@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE4IGF0IDE3OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDEvMTggMTE6MTAsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gT24gRnJp
LCAyMDE4LTAxLTEyIGF0IDE4OjAwICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gQEAg
LTE1MiwxNCArMTYzLDM4IEBAIGludCBndWVzdF93cm1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMy
X3QgbXNyLAo+Pj4gdWludDY0X3QgdmFsKQo+Pj4gIHsKPj4+ICAgICAgY29uc3Qgc3RydWN0IHZj
cHUgKmN1cnIgPSBjdXJyZW50Owo+Pj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWlu
Owo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpjcCA9IGQtPmFyY2guY3B1aWQ7
Cj4+PiAgICAgIHN0cnVjdCBtc3JfZG9tYWluX3BvbGljeSAqZHAgPSBkLT5hcmNoLm1zcjsKPj4+
ICAgICAgc3RydWN0IG1zcl92Y3B1X3BvbGljeSAqdnAgPSB2LT5hcmNoLm1zcjsKPj4+ICAKPj4+
ICAgICAgc3dpdGNoICggbXNyICkKPj4+ICAgICAgewo+Pj4gICAgICBjYXNlIE1TUl9JTlRFTF9Q
TEFURk9STV9JTkZPOgo+Pj4gKyAgICAgICAgLyogUmVhZC1vbmx5ICovCj4+PiAgICAgICAgICBn
b3RvIGdwX2ZhdWx0Owo+Pj4gIAo+Pj4gKyAgICBjYXNlIE1TUl9TUEVDX0NUUkw6Cj4+PiArICAg
ICAgICBpZiAoICFjcC0+ZmVhdC5pYnJzYiApCj4+PiArICAgICAgICAgICAgZ290byBncF9mYXVs
dDsgLyogTVNSIGF2YWlsYWJsZT8gKi8KPj4+ICsgICAgICAgIGlmICggdmFsICYgfihTUEVDX0NU
UkxfSUJSUyB8Cj4+PiArICAgICAgICAgICAgICAgICAgICAgKGNwLT5mZWF0LnN0aWJwID8gU1BF
Q19DVFJMX1NUSUJQIDogMCkpICkKPj4gSW50ZWwgZGVmaW5lcyB0aGUgU1RJQlAgYml0IGFzIG5v
bi1mYXVsdGluZyBhbmQgaWdub3JlZCwgZXZlbiB3aGVuCj4+IFNUSUJQIGlzbid0IGFkdmVydGlz
ZWQuIFNvIHlvdSBzaG91bGQgcHJvYmFibHkganVzdCBtYXNrIGl0IG91dAo+PiBpZiAhY3AtPmZl
YXQuc3RpYnAuCj4gCj4gV2VsbCAtIHRoaXMgcHVibGlzaGVkIHNwZWMgZmluYWxseSBhbnN3ZXJz
IHNldmVyYWwgc2V2ZXJhbC1tb250aC1vbGQKPiBvdXRzdGFuZGluZyBxdWVzdGlvbnMgb2YgbWlu
ZS4KPiAKPiBUaW1lIGZvciBzb21lIHJld3JpdGluZy4gIC9zaWdoCgpJbiBsaWdodCBvZiB0aGlz
LCBpcyB0aGVyZSBhY3R1YWxseSBtdWNoIHBvaW50IGluIG1lIGxvb2tpbmcgYXQgdGhlIHR3bwpy
ZW1haW5pbmcgdjggcGF0Y2hlcyAoMTMgYW5kIDE0KT8KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
