From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen/cameraif: add ABI for para-virtual
 camera
Date: Tue, 9 Apr 2019 16:26:42 +0300
Message-ID: <e9b3a843-1b1f-94c2-e123-09fb26d89753__22082.9828571127$1554816471$gmane$org@gmail.com>
References: <20190409091546.9606-1-andr2000@gmail.com>
 <9b9ba6b9-f045-80e2-fe8a-595728fb1ec0@suse.com>
 <5bb8c828-b0ae-86c3-dacf-88bf6032dd6f@gmail.com>
 <303b7d57-1785-62b3-fac0-a3e947e691c4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PY99=SL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDqlz-00071q-BU
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:26:47 +0000
Received: by mail-lj1-x241.google.com with SMTP id f18so14433218lja.10
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 06:26:46 -0700 (PDT)
In-Reply-To: <303b7d57-1785-62b3-fac0-a3e947e691c4@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, konrad.wilk@oracle.com, hverkuil@xs4all.nl, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC85LzE5IDEyOjQ2IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LzA0LzIwMTkg
MTE6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiA0LzkvMTkgMTI6Mjgg
UE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwOS8wNC8yMDE5IDExOjE1LCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pj4KPj4+PiBUaGlzIGlzIHRo
ZSBBQkkgZm9yIHRoZSB0d28gaGFsdmVzIG9mIGEgcGFyYS12aXJ0dWFsaXplZAo+Pj4+IGNhbWVy
YSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFiaWxpdGll
cyBldmVuCj4+Pj4gZnVydGhlciBlbmFibGluZyBpdCBmb3IgdmlkZW8gY29uZmVyZW5jaW5nLCBJ
bi1WZWhpY2xlIEluZm90YWlubWVudCwKPj4+PiBoaWdoIGRlZmluaXRpb24gbWFwcyBldGMuCj4+
Pj4KPj4+PiBUaGUgaW5pdGlhbCBnb2FsIGlzIHRvIHN1cHBvcnQgbW9zdCBuZWVkZWQgZnVuY3Rp
b25hbGl0eSB3aXRoIHRoZQo+Pj4+IGZpbmFsIGlkZWEgdG8gbWFrZSBpdCBwb3NzaWJsZSB0byBl
eHRlbmQgdGhlIHByb3RvY29sIGlmIG5lZWQgYmU6Cj4+Pj4KPj4+PiAxLiBQcm92aWRlIG1lYW5z
IGZvciBiYXNlIHZpcnR1YWwgZGV2aWNlIGNvbmZpZ3VyYXRpb246Cj4+Pj4gIMKgIC0gcGl4ZWwg
Zm9ybWF0cwo+Pj4+ICDCoCAtIHJlc29sdXRpb25zCj4+Pj4gIMKgIC0gZnJhbWUgcmF0ZXMKPj4+
PiAyLiBTdXBwb3J0IGJhc2ljIGNhbWVyYSBjb250cm9sczoKPj4+PiAgwqAgLSBjb250cmFzdAo+
Pj4+ICDCoCAtIGJyaWdodG5lc3MKPj4+PiAgwqAgLSBodWUKPj4+PiAgwqAgLSBzYXR1cmF0aW9u
Cj4+Pj4gMy4gU3VwcG9ydCBzdHJlYW1pbmcgY29udHJvbAo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28KPj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+Cj4+Pj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+PiBD
YzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+Pj4+IENj
OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD4KPj4+IEknbSBpbiBwcmluY2lwbGUg
ZmluZSB3aXRoIHRoaXMgcGF0Y2gsIGJ1dCBpdCBzaG91bGQgYmUgc2VudCBhcyBwYXJ0IG9mCj4+
PiBhIHNlcmllcyB1c2luZyB0aGF0IGhlYWRlci4gSW4gY2FzZSB0aGUgcmVsYXRlZCBkcml2ZXIg
aXNuJ3QgYWNjZXB0ZWQKPj4+IHdlJ2QgZW5kIHVwIHdpdGggYSBzdGFsZSBoZWFkZXIgZmlsZS4K
Pj4gSG0sIEkgYW0gZG9pbmcgdGhpcyBhcyBJIGRpZCBmb3IgdGhlIHJlc3Qgb2YgcHJvdG9jb2xz
IGJlZm9yZToKPj4gMS4gR2V0IHRoZSBwcm90b2NvbCBpbiBYZW4KPj4gMi4gR2V0IHRoZSBjb3B5
IGluIExpbnV4Cj4+IDMuIFVwc3RyZWFtIGRyaXZlciAodXNlIGhlYWRlcikKPiBTb3JyeSBmb3Ig
bm90IGhhdmluZyBkb25lIHRoZSByZXZpZXcgcHJvcGVybHkgaW4gdGhlIHBhc3QuIDstKQo+Cj4+
IEV2ZW4gaWYgdGhlIGRyaXZlciBpcyBub3QgYWNjZXB0ZWQgKGhvcGUgdGhpcyB3b24ndCBoYXBw
ZW4pCj4+IHRoZW4gdGhpcyBwYXRjaCBtYWtlcyBYZW4gYW5kIExpbnV4IHByb3Blcmx5IGFsaWdu
ZWQgYW55d2F5Lgo+PiBXaGljaCBpcyBJTU8gZ29vZAo+IEhhdmluZyBhbiB1bnVzZWQgaGVhZGVy
IGZpbGUgaXMgbm90IGdvb2QuCj4KPiBCZSBhc3N1cmVkIEknbSBnb2luZyB0byBnaXZlIHlvdSB0
aGUgbmVlZGVkIFJldmlld2VkLWJ5OiB0YWcgZm9yCj4gdGhlIHBhdGNoIGFkZGluZyB0aGUgaGVh
ZGVyIGluIGEgc2VyaWVzIHVzaW5nIGl0LgpPaywgc291bmRzIGdvb2QKPgo+Cj4gSnVlcmdlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
