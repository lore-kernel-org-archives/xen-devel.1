From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11 v2 0/3] x86: XSA-267 follow-up
Date: Tue, 26 Jun 2018 02:50:49 -0600
Message-ID: <5B31FE6902000078001CDE2F@prv1-mh.provo.novell.com>
References: <5B31DC2702000078001CDBEC@suse.com>
 <06acaca2-8652-076c-51dc-d02dc9956e68@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXjgd-0004Q5-IZ
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 08:50:55 +0000
In-Reply-To: <06acaca2-8652-076c-51dc-d02dc9956e68@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA2LjE4IGF0IDA5OjM5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ni8wNi8xOCAwODoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZSBmaXJzdCBwYXRjaCBhbG9u
ZSBzaG91bGQgYmUgc3VmZmljaWVudCB0byBhZGRyZXNzIGFuIGlzc3VlIHdpdGggdGhlCj4+IFhT
QS0yNjcgY2hhbmdlcywgY2F1c2luZyBhIEJVR19PTigpIHRvIGJlIHRyaWdnZXJlZC4gVGhlIG90
aGVyIHR3bwo+PiBwYXRjaGVzIHdvdWxkLCBhZmFpY3QsIGVhY2ggaW5kaXZpZHVhbGx5IGFsc28g
aGF2ZSBhdm9pZGVkIHRoZSBpc3N1ZSwKPj4gaGVuY2UgSSdtIGFsc28gaW5jbHVkaW5nIHRoZW0g
aGVyZS4gV2hpbGUgdGhlIGZpcnN0IHBhdGNoIG9idmlvdXNseSBpcwo+PiBhIHN0cm9uZyBjYW5k
aWRhdGUgZm9yIDQuMTEsIHRoZSBsYXR0ZXIgdHdvIGFyZSBjYW5kaWRhdGVzIHRvbyBpbW87IGF0
Cj4+IGxlYXN0IEkgY29uc2lkZXIgdGhlbSBiYWNrcG9ydGluZyBjYW5kaWRhdGVzIChhbGJlaXQs
IHRvIGJlIGNsZWFyLCBwYXRjaAo+PiAyIGlzIHVzZWZ1bCBvbmx5IGFzIGZhciBiYWNrIGFzIHdl
IGhhdmUgZXhjZXB0aW9uIHJlY292ZXJ5IGF0dGFjaGVkCj4+IHRvIGVtdWxhdG9yIHN0dWJzLCBp
LmUuIG5vIGZhcnRoZXIgdGhhbiA0LjkpLgo+PiAKPj4gMTogeDg2L0hWTTogZG9uJ3QgY2F1c2Ug
I05NIHRvIGJlIHJhaXNlZCBpbiBYZW4KPj4gMjogeDg2OiBndWFyZCBhZ2FpbnN0ICNOTQo+PiAz
OiBWTVg6IGNoZWNrIGhvc3QgQ1IwIGJlZm9yZSBlbnRlcmluZyBndWVzdAo+IAo+IEZvciB0aGUg
c2VyaWVzOgo+IAo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KClRoYW5rcy4gV2hhdCBhYm91dCAieDg2L0VGSTogZnVydGhlciBjb3JyZWN0IEZQVSBz
dGF0ZSBoYW5kbGluZyBhcm91bmQKcnVudGltZSBjYWxscyIsIHdoaWNoIGhhcyBhbGwgb3RoZXIg
bmVjZXNzYXJ5IHRhZ3MgYWxyZWFkeT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
