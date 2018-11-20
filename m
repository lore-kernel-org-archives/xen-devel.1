From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/5] x86/time: Alter tsc_set_info() to
 return an error value
Date: Tue, 20 Nov 2018 09:26:02 -0700
Message-ID: <5BF4359A02000078001FE2C3@prv1-mh.provo.novell.com>
References: <1542724622-14321-1-git-send-email-andrew.cooper3@citrix.com>
 <1542724622-14321-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542724622-14321-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE1OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ3VycmVudGx5LCB0c2Nfc2V0X2luZm8oKSBwZXJmb3JtcyBubyBwYXJhbWV0ZXIgY2hl
Y2tpbmcsIGFuZCBhbiBpbnZhbGlkCj4gdHNjX21vZGUgZ29lcyBsYXJnZWx5IHVubm90aWNlZC4g
IEZpeCBpdCB0byByZWplY3QgaW52YWxpZCB0c2NfbW9kZXMgd2l0aAo+IC1FSU5WQUwsIGFuZCB1
cGRhdGUgdGhlIGNhbGxlcnMgdG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBvbmUgc3VnZ2VzdGlv
bjoKCj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2Rv
bWFpbi5jCj4gQEAgLTU5OSw4ICs1OTksOCBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVj
dCBkb21haW4gKmQsCj4gICAgICBlbHNlCj4gICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7
IC8qIE5vdCBIVk0gYW5kIG5vdCBQVj8gKi8KPiAgCj4gLSAgICAvKiBpbml0aWFsaXplIGRlZmF1
bHQgdHNjIGJlaGF2aW9yIGluIGNhc2UgdG9vbHMgZG9uJ3QgKi8KPiAtICAgIHRzY19zZXRfaW5m
byhkLCBUU0NfTU9ERV9ERUZBVUxULCAwVUwsIDAsIDApOwo+ICsgICAgaWYgKCAocmMgPSB0c2Nf
c2V0X2luZm8oZCwgVFNDX01PREVfREVGQVVMVCwgMFVMLCAwLCAwKSkgIT0gMCApCj4gKyAgICAg
ICAgZ290byBmYWlsOwoKSSB0aGluayB0aGlzIHNob3VsZCBnYWluIEFTU0VSVF9VTlJFQUNIQUJM
RSgpLiBBY2NvcmRpbmcgdG8KcGF0Y2ggY29udGV4dCB0aGUgImdvdG8gZmFpbDsiIG1pZ2h0IGV2
ZW4gYmUgb21pdHRlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
