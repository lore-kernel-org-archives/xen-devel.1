From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 1/2] SVM: re-work VMCB sync-ing
Date: Mon, 7 May 2018 08:30:44 +0200
Message-ID: <ce1e0cb6-e55d-37a5-7df9-775ded63ca6b@suse.com>
References: <5AEC773002000078001C0BCE@prv1-mh.provo.novell.com>
 <5AEC77E802000078001C0BEB@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=25p9=h2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFZfc-0004K5-EE
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 06:30:48 +0000
In-Reply-To: <5AEC77E802000078001C0BEB@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDUvMTggMTc6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoaWxlIHRoZSBtYWluIHBy
b2JsZW0gdG8gYmUgYWRkcmVzc2VkIGhlcmUgaXMgdGhlIGlzc3VlIG9mIHdoYXQgc28gZmFyCj4g
d2FzIG5hbWVkICJ2bWNiX2luX3N5bmMiIHN0YXJ0aW5nIG91dCB3aXRoIHRoZSB3cm9uZyB2YWx1
ZSAoc2hvdWxkIGhhdmUKPiBiZWVuIHRydWUgaW5zdGVhZCBvZiBmYWxzZSwgdG8gcHJldmVudCBw
ZXJmb3JtaW5nIGEgVk1TQVZFIHdpdGhvdXQgZXZlcgo+IGhhdmluZyBWTUxPQURlZCB0aGUgdkNQ
VSdzIHN0YXRlKSwgZ28gYSBzdGVwIGZ1cnRoZXIgYW5kIG1ha2UgdGhlCj4gc3luYy1lZCBzdGF0
ZSBhIHRyaXN0YXRlOiBDUFUgYW5kIG1lbW9yeSBtYXkgYmUgaW4gc3luYyBvciBhbiB1cGRhdGUK
PiBtYXkgYmUgcmVxdWlyZWQgaW4gZWl0aGVyIGRpcmVjdGlvbi4gUmVuYW1lIHRoZSBmaWVsZCBh
bmQgaW50cm9kdWNlIGFuCj4gZW51bS4gQ2FsbGVycyBvZiBzdm1fc3luY192bWNiKCkgbm93IGlu
ZGljYXRlIHRoZSBpbnRlbmRlZCBuZXcgc3RhdGUKPiAod2l0aCBhIHNsaWdodCAiYW5vbWFseSIg
d2hlbiByZXF1ZXN0aW5nIFZNTE9BRDogd2UgY291bGQgc3RvcmUKPiB2bWNiX25lZWRzX3Ztc2F2
ZSBpbiB0aG9zZSBjYXNlcyBhcyB0aGUgY2FsbGVycyByZXF1ZXN0LCBidXQgdGhlIFZNQ0IKPiBy
ZWFsbHkgaXMgaW4gc3luYyBhdCB0aGF0IHBvaW50LCBhbmQgaGVuY2UgdGhlcmUncyBubyBuZWVk
IHRvIFZNU0FWRSBpbgo+IGNhc2Ugd2UgZG9uJ3QgbWFrZSBpdCBvdXQgdG8gZ3Vlc3QgY29udGV4
dCksIGFuZCBhbGwgc3luY2luZyBnb2VzCj4gdGhyb3VnaCB0aGF0IGZ1bmN0aW9uLgo+IAo+IFdp
dGggdGhhdCwgdGhlcmUncyBubyBuZWVkIHRvIFZNTE9BRCB0aGUgc3RhdGUgcGVyaGFwcyBtdWx0
aXBsZSB0aW1lczsKPiBhbGwgdGhhdCdzIG5lZWRlZCBpcyBsb2FkaW5nIGl0IG9uY2UgYmVmb3Jl
IFZNIGVudHJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
