From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V3 1/3] x86/altp2m: propagate ept.ad changes
 to all active altp2ms
Date: Tue, 30 Oct 2018 18:17:51 +0200
Message-ID: <bb061e80-1d51-5697-8fb1-1644cebb2e1a@bitdefender.com>
References: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
 <1540816837-8936-2-git-send-email-rcojocaru@bitdefender.com>
 <5BD8834B02000078001F66B2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2zng=nk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gHWiL-000237-IQ
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:17:57 +0000
In-Reply-To: <5BD8834B02000078001F66B2@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMzAvMTggNjoxNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMTAuMTgg
YXQgMTM6NDAsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gVGhpcyBwYXRj
aCBpcyBhIHByZS1yZXF1aXNpdGUgZm9yIGZpeGluZyB0aGUgbG9nZGlydHkgVkdBIGlzc3VlCj4+
IChkaXNwbGF5IGZyZWV6ZXMgd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgYWx0cDJtIHZpZXcgZWFy
bHkgaW4gYQo+PiBkb21haW4ncyBsaWZldGltZSksIGJ1dCBzZW50IHNlcGFyYXRlbHkgZm9yIGVh
c2llciByZXZpZXcuCj4+IFRoZSBuZXcgZXB0X3NldF9hZF9zeW5jKCkgZnVuY3Rpb24gaGFzIGJl
ZW4gYWRkZWQgdG8gdXBkYXRlIGFsbAo+PiBhY3RpdmUgYWx0cDJtcycgZXB0LmFkLiBOZXcgYWx0
cDJtcyB3aWxsIGluaGVyaXQgdGhlIGhvc3RwMm0ncwo+PiBlcHQuYWQgdmFsdWUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
Pj4gU3VnZ2VzdGVkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
Cj4gCj4gSSdtIG9rYXkgd2l0aCB0aGUgY29kZSBjaGFuZ2VzIG5vdywgYnV0IEkgdGhpbmsgdGhl
IGFsdGVyZWQgbG9ja2luZwo+IHdvdWxkIGRlc2VydmUgYSBzZW50ZW5jZSBpbiB0aGUgZGVzY3Jp
cHRpb24uCgpPZiBjb3Vyc2UsIEknbGwgY2hhbmdlIHRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgbmV4
dCBpdGVyYXRpb24gb2YgdGhlIHNlcmllcy4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
