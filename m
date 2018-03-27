From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/7] xen/x86: disable global pages for
 domains with XPTI active
Date: Tue, 27 Mar 2018 02:54:54 -0600
Message-ID: <5ABA22FE02000078001B663E@prv1-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-6-jgross@suse.com>
 <5AB3E82402000078001B5408@suse.com>
 <609915b6-99a4-00bd-370b-767850a713a8@suse.com>
 <5ABA0DAF02000078001B6588@suse.com>
 <b6104baf-0243-3b6e-9154-b35b50630012@suse.com>
 <5ABA1DE202000078001B65FD@suse.com>
 <65b816f1-32d9-b5f4-d5c8-3b12918ddbd5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=j1hy=gr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0kNg-0004bz-F9
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 08:55:00 +0000
In-Reply-To: <65b816f1-32d9-b5f4-d5c8-3b12918ddbd5@suse.com>
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
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE4IGF0IDEwOjQ0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ny8wMy8xOCAxMDozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI3LjAzLjE4IGF0IDA5
OjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDI3LzAzLzE4IDA5OjIzLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyNy4wMy4xOCBhdCAwOToxNCwgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+IEkganVzdCByZWFsaXplZCB0aGF0IHVzaW5nIHJlYWRfY3I0KCkg
fCBYODZfQ1I0X1BHRSBpcyB3cm9uZy4gV2Ugd291bGQKPj4+Pj4ga2VlcCBiaXRzIHN3aXRjaGVk
IG9uIHdoaWNoIGEgcHYgZG9tYWluIGlzIGFsbG93ZWQgdG8gbW9kaWZ5IChwbHVzCj4+Pj4+IENS
NF9UU0QgZXZlbnR1YWxseSkuCj4+Pj4+Cj4+Pj4+IERvIHdlIHJlYWxseSB3YW50IHRoYXQ/Cj4+
Pj4KPj4+PiBEb2VzIGl0IG1hdHRlciB3aGF0IGV4YWN0IENSNCBzZXR0aW5ncyB3ZSBydW4gd2l0
aCB3aGVuIGl0J3Mgbm90Cj4+Pj4gYSBQViBndWVzdCB0aGF0J3MgaW4gY29udGV4dCwgYW5kIHdo
ZW4gd2UgZG9uJ3QgZGVwZW5kIG9uIHRoZQo+Pj4+IHNldHRpbmdzIG91cnNlbHZlcz8gSSBkb24n
dCB0aGluayBpdCBkb2VzLCBhbmQgSFZNIGd1ZXN0cyBydW4gd2l0aAo+Pj4+IHRoZWlyIG93biBD
UjQgYW55d2F5LiBJbiBmYWN0IHRoZXJlIG1heSBlbmQgdXAgYmVpbmcgY2FzZXMKPj4+PiB3aGVy
ZSB3ZSB3b24ndCBuZWVkIHRvIHN3aXRjaCBDUjQgYW5vdGhlciB0aW1lIHdoZW4gd2UgY29tZQo+
Pj4+IGhlcmUgdGhlIG5leHQgdGltZSB3aXRoIHYgYmVpbmcgYSBQViB2Q1BVLgo+Pj4KPj4+IEkg
Y291bGQgaW1hZ2luZSB0aGF0IHRoZXJlIGlzIHNvbWUgcGVyZm9ybWFuY2UgaW1wYWN0LiBjcjQu
dHNkIHNldAo+Pj4gbWlnaHQgbWFrZSByZHRzYyBhIGxpdHRsZSBiaXQgc2xvd2VyIGFzIGFuIGFk
ZGl0aW9uYWwgcHJpdmlsZWdlIGxldmVsCj4+PiBjaGVjayBpcyBuZWVkZWQuCj4+IAo+PiBRdWl0
ZSBwb3NzaWJsZSwgaW5kZWVkLiBBbm90aGVyIG9waW5pb24gb24gdGhlIHJvdXRlIHRvIHRha2UK
Pj4gd291bGQgYmUgaGVscGZ1bCBoZXJlLiBBbmRyZXc/Cj4gCj4gSSBjb3VsZCBtYXNrIGF3YXkg
dHNkLCBvZiBjb3Vyc2UuIEkgbmVlZCB0byBkbyBzbyBmb3IgcGNpZGUgYWxyZWFkeSwKPiBzbyB0
aGF0IHdvdWxkIGJlIGp1c3QgYW5vdGhlciBiaXQgcmVzZXQgaW4gdGhlIG1hc2suCgpGaW5lIHdp
dGggbWUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
