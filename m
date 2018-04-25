From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.10 0/9] SUPPORT.md backports to
 support matrix generation
Date: Wed, 25 Apr 2018 07:21:32 -0600
Message-ID: <5AE080DC02000078001BE71A@prv1-mh.provo.novell.com>
References: <1524661205-7088-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=adps=ho=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fBKMb-00069h-UW
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 13:21:37 +0000
In-Reply-To: <1524661205-7088-1-git-send-email-ian.jackson@eu.citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@eu.citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA0LjE4IGF0IDE0OjU5LCA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBhIGJhY2twb3J0IG9mIG15IHR3byByZWNlbnQgc2VyaWVzIHRvIGZpeCBi
dWdzIGluIFNVUFBPUlQubWQsCj4gZm9ybWF0IGl0IGFzIHBhcnQgb2YgdGhlIHB1Ymxpc2hlZCBk
b2NzLCBhbmQgdXNlIHJlbGF0aXZlIHBvc2l0aW9uIG9mCj4gdGhlIGBTdGF0dXMnIHN0YW56YSBj
b21wYXJlZCB0byBkZXNjcmlwdGl2ZSB0ZXh0IHRvIGluZGljYXRlIHdoZXRoZXIKPiB0aGUgdGV4
dCBpcyBhIGNhdmVhdCB0aGF0IGRlc2VydmVzIGEgZm9vdG5vdGUuCj4gCj4gTW9zdCBvZiB0aGlz
IGlzIHVuY29udHJvdmVyc2lhbCBhbmQgSSBoYXZlIHJ1biB0aGUgYnVpbGQgYW5kIGNoZWNrZWQK
PiB0aGF0IHRoZSByZXN1bHRpbmcgaW5kZXguaHRtbCBpcyBnb29kLgo+IAo+IEl0IHdvdWxkIGJl
IGdvb2QgaWYgc29tZW9uZSBjb3VsZCByZXZpZXcgcGFydGljdWxhcmx5IHRoZSB3YXkgSQo+IHJl
c29sdmVkIHRoZSBjb25mbGljdHMgaW4gdGhlIGJpZyBwYXRjaCB0byBTVVBQT1JULm1kLCBpZSBp
bgo+ICAgW1BBVENIIDgvOV0gU1VQUE9SVC5tZDogTW92ZSBkZXNjcmlwdGlvbnMgdXAgYmVmb3Jl
IFN0YXR1cyBpbmZvCj4gCj4gVGhlIHJlc3VsdCBmb3IgNC4xMCdzCj4gU1VQUE9SVC5tZCBpcyBo
ZXJlOgo+ICAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL2l3ai8yMDE4L3N1cHBvcnQt
bWF0cml4LWV4YW1wbGUtQy9TVVBQT1JULmh0bWwgCj4gCj4gSSBoYXZlIGFsc28gY2hlY2tlZCB0
aGF0ICh3aXRoIHRoZSBwYXRjaCBJIGFtIGFib3V0IHRvIHNlbmQgZm9yCj4gc3RhZ2luZydzIHBh
cnNlLXN1cHBvcnQtbWQpIHRoYXQgdGhpcyBnZW5lcmF0ZXMgYSBzZW5zaWJsZS1sb29raW5nCj4g
c3VwcG9ydCBtYXRyaXguICBUaGUgcmVzdWx0aW5nIHN1cHBvcnQgbWF0cml4IGNhbiBiZSBmb3Vu
ZCBoZXJlOgo+ICAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL2l3ai8yMDE4L3N1cHBv
cnQtbWF0cml4LWV4YW1wbGUtQy90Lmh0bWwgCj4gKFRoZSBoeXBlcmxpbmsgcmVmZXJlbmNlcyBm
b3Igc3RhZ2luZyBhcmUgdG8gdGhlIGxpdmUgeGVuYml0cyB2ZXJzaW9uOwo+IHRoZSByZWZlcmVu
Y2VzIGZvciA0LjEwIGFyZSB0byB0aGUgZXhhbXBsZSBvdXRwdXQgZmlsZSBtZW50aW9uZWQgYWJv
dmUuKQo+IAo+IEkgaGF2ZSBzcXVhc2hlZCB0aGUgZml4IHRvIG5vdCBkZXBlbmQgb24gSFRNTDo6
VHJlZUJ1aWxkZXI6OlhQYXRoIGludG8KPiB0aGUgcGF0Y2ggdGhhdCBpbnRyb2R1Y2VzIHRoZSBk
ZXBlbmRlbmN5LgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
