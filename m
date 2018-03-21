From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 11/12] hvmloader: use libacpi to build
 MCFG table
Date: Wed, 21 Mar 2018 01:36:41 -0600
Message-ID: <5AB2199902000078001B44D8@prv-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <d9da7e43b56986b7aca9c84ee93e41587f9d5ac1.1520867741.git.x1917x@gmail.com>
 <20180319174909.wrvclevtvttybuhi@MacBook-Pro-de-Roger.local>
 <20180320072053.0000138d@gmail.com>
 <5AB0E44902000078001B3D54@prv-mh.provo.novell.com>
 <20180321065344.0000797f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3tj2=gl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyYIh-0004YE-Cj
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 07:36:47 +0000
In-Reply-To: <20180321065344.0000797f@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDIxOjUzLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24g
VHVlLCAyMCBNYXIgMjAxOCAwMzozNjo1NyAtMDYwMAo+ICJKYW4gQmV1bGljaCIgPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToKPj4+Pj4gT24gMTkuMDMuMTggYXQgMjI6MjAsIDx4MTkxN3hAZ21h
aWwuY29tPiB3cm90ZTogIAo+Pj4gT24gTW9uLCAxOSBNYXIgMjAxOCAxNzo0OTowOSArMDAwMAo+
Pj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOiAgCj4+Pj5P
biBUdWUsIE1hciAxMywgMjAxOCBhdCAwNDozMzo1NkFNICsxMDAwLCBBbGV4ZXkgR2VyYXNpbWVu
a28gd3JvdGU6ICAKPj4+Pj4gKyAgICBzd2l0Y2ggKFBDSUVYQkFSX0xFTkdUSF9CSVRTKHJlZykp
Cj4+Pj4+ICsgICAgewo+Pj4+PiArICAgIGNhc2UgMDoKPj4+Pj4gKyAgICAgICAgYmFzZSAmPSBQ
Q0lFWEJBUl9BRERSX01BU0tfMjU2TUI7Cj4+Pj4+ICsgICAgICAgIGJyZWFrOwo+Pj4+PiArICAg
IGNhc2UgMToKPj4+Pj4gKyAgICAgICAgYmFzZSAmPSBQQ0lFWEJBUl9BRERSX01BU0tfMTI4TUI7
Cj4+Pj4+ICsgICAgICAgIGJyZWFrOwo+Pj4+PiArICAgIGNhc2UgMjoKPj4+Pj4gKyAgICAgICAg
YmFzZSAmPSBQQ0lFWEJBUl9BRERSX01BU0tfNjRNQjsKPj4+Pj4gKyAgICAgICAgYnJlYWs7ICAg
IAo+Pj4+Cj4+Pj5NaXNzaW5nIG5ld2xpbmVzLCBwbHVzIHRoaXMgbG9va3MgbGlrZSBpdCB3YW50
cyB0byB1c2UgdGhlIGRlZmluZXMKPj4+PmludHJvZHVjZWQgaW4gcGF0Y2ggNyAoUENJRVhCQVJf
ezY0LDEyOCwyNTZ9X0JVU0VTKS4gQWxzbyBhbnkgcmVhc29uCj4+Pj50aGlzIHBhdGNoIGFuZCBw
YXRjaCA3IGNhbm5vdCBiZSBwdXQgc2VxdWVudGlhbGx5PyAgCj4+PiAKPj4+IEkgdGhpbmsgYWxs
IHRoZXNlICNkZWZpbmVzIHNob3VsZCBmaW5kIGEgd2F5IHRvIHBjaV9yZWdzLmgsIGl0IHNlZW1z
Cj4+PiBsaWtlIGFuIGFwcHJvcHJpYXRlIHBsYWNlIGZvciB0aGVtLiAgCj4+Cj4+SSBkb24ndCB0
aGluayBkZXZpY2Ugc3BlY2lmaWMgZGVmaW5lcyBiZWxvbmcgaW50byBwY2lfcmVncy5oLgo+IAo+
IFdpbGwgZ2F0aGVyIGFsbCB0aGVzZSAjZGVmaW5lcyBhbmQgbWFjcm9zIGluIHRoZSBuZXcgcGNp
X3JlZ3NfcTM1LmgKPiBmaWxlLiBJdCBzaG91bGQgbm90IGhhcm0gdG8gaW5jbHVkZSBpdCBmcm9t
IHBjaV9yZWdzLmggSSB0aGluaywgaW4KPiBvcmRlciB0byBpbmNsdWRlIHBjaV9yZWdzLmggb25s
eSBpbiAqLmMuCgpXZWxsLCBubyAtIG5vIHVubmVjZXNzYXJ5IGRlcGVuZGVuY2llcyBwbGVhc2Uu
IElmIG9ubHkgYSBzaW5nbGUKZmlsZSBuZWVkcyB0aGVzZSBkZWZpbml0aW9ucywgb25seSB0aGF0
IGZpbGUgc2hvdWxkIGluY2x1ZGUgdGhlCnJlc3BlY3RpdmUgaGVhZGVyIChpZiBvbmUgaXMgd2Fy
cmFudGVkIGluIHRoZSBmaXJzdCBwbGFjZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
