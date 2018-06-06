From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH] multiboot2: clarify usage of the address tag
Date: Wed, 6 Jun 2018 19:28:20 +0200
Message-ID: <20180606172820.GW20016__33156.0712460943$1528306049$gmane$org@olila.local.net-space.pl>
References: <20180605095536.44938-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3xsl=iy=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fQcEc-0004gn-2f
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 17:28:34 +0000
Content-Disposition: inline
In-Reply-To: <20180605095536.44938-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMDUsIDIwMTggYXQgMTE6NTU6MzZBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEFkZCBhIG5vdGUgdG8gc3BlbGwgb3V0IHRoYXQgaWYgdGhlIGFkZHJlc3MgdGFn
IGlzIG5vdCBwcmVzZW50IHRoZQo+IGZpbGUgc2hvdWxkIGJlIGxvYWRlZCB1c2luZyB0aGUgZWxm
IGhlYWRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+IC0tLQo+IENjOiBEYW5pZWwgS2lwZXIgPGRhbmllbC5raXBlckBvcmFjbGUu
Y29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiAtLS0KPiAgZG9jL211
bHRpYm9vdC50ZXhpIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RvYy9tdWx0aWJvb3QudGV4aSBiL2RvYy9tdWx0aWJvb3QudGV4
aQo+IGluZGV4IDJlMmQ3ZTc0YS4uMTk2ZjljMTdhIDEwMDY0NAo+IC0tLSBhL2RvYy9tdWx0aWJv
b3QudGV4aQo+ICsrKyBiL2RvYy9tdWx0aWJvb3QudGV4aQo+IEBAIC01MDksNiArNTA5LDEyIEBA
IGFzc3VtZXMgdGhhdCBubyBic3Mgc2VnbWVudCBpcyBwcmVzZW50Lgo+Cj4gIEBlbmQgdGFibGUK
Pgo+ICtOb3RlOiBUaGlzIGluZm9ybWF0aW9uIGRvZXMgbm90IG5lZWQgdG8gYmUgcHJvdmlkZWQg
aWYgdGhlIGtlcm5lbAo+ICtpbWFnZSBpcyBpbiBlbGYgZm9ybWF0LCBidXQgaXQgbXVzdCBiZSBw
cm92aWRlZCBpZiB0aGUgaW1hZ2UgaXMgaW4KCnMvZWxmL0BzY3tlbGZ9LwoKPiArYS5vdXQgZm9y
bWF0IG9yIGluIHNvbWUgb3RoZXIgZm9ybWF0LiBDb21wbGlhbnQgYm9vdCBsb2FkZXJzIG11c3Qg
YmUKPiArYWJsZSB0byBsb2FkIGltYWdlcyB0aGF0IGFyZSBlaXRoZXIgaW4gZWxmIGZvcm1hdCBv
ciBjb250YWluIHRoZQoKRGl0dG8uCgo+ICthZGRyZXNzIHRhZyBlbWJlZGRlZCBpbiB0aGUgTXVs
dGlib290IGhlYWRlci4KCnMvTXVsdGlib290L011bHRpYm9vdDIvCgpJIHRoaW5rIHRoYXQgaXQg
aXMgYWxzbyB3b3J0aCBtZW50aW9uaW5nIHRoYXQgdGhlIGFkZHJlc3MgdGFnIGhhcwpwcmVmZXJl
bmNlIG92ZXIgcmVsZXZhbnQgZGF0YSBwcm92aWRlZCBpbiBFTEYgaGVhZGVyLgoKQWRkaXRpb25h
bGx5LCBtYXkgSSBhc2sgeW91IHRvIHByb3ZpZGUgc2ltaWxhciBwYXRjaCBmb3IgTXVsdGlib290
IHNwZWM/CllvdSBjYW4gZmluZCBpdCBpbiBtdWx0aWJvb3QgYnJhbmNoLiBQbGVhc2UgbG9vayBm
b3IgIlRoZSBhZGRyZXNzIGZpZWxkcwpvZiBNdWx0aWJvb3QgaGVhZGVyIiBwYXJhZ3JhcGguCgpE
YW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
