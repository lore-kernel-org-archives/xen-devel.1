From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 03/18] xen: introduce 'xen-block',
 'xen-disk' and 'xen-cdrom'
Date: Tue, 11 Dec 2018 15:40:30 +0000
Message-ID: <88b1bbdbad294bf5b4013fd144534651@AMSPEX02CL03.citrite.net>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-4-git-send-email-paul.durrant@citrix.com>
 <20181211151636.GQ18875@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yaMN=OU=citrix.com=prvs=87697dac6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWk9I-0003s3-BJ
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:40:40 +0000
In-Reply-To: <20181211151636.GQ18875@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxMSBEZWNlbWJlciAyMDE4IDE1
OjE3Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+OyBNYXgg
UmVpdHoKPiA8bXJlaXR6QHJlZGhhdC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMy8xOF0geGVuOiBpbnRy
b2R1Y2UgJ3hlbi1ibG9jaycsICd4ZW4tZGlzaycgYW5kCj4gJ3hlbi1jZHJvbScKPiAKPiBPbiBU
dWUsIERlYyAxMSwgMjAxOCBhdCAxMDo0NzowM0FNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4gPiBUaGlzIHBhdGNoIGFkZHMgbmV3IFhlbkRldmljZS1zOiAneGVuLWRpc2snIGFuZCAneGVu
LWNkcm9tJywgYm90aAo+IGRlcml2ZWQKPiA+IGZyb20gYSBjb21tb24gJ3hlbi1ibG9jaycgcGFy
ZW50IHR5cGUuIFRoZXNlIHdpbGwgZXZlbnR1YWxseSByZXBsYWNlIHRoZQo+ID4gJ3hlbl9kaXNr
JyAobm90ZSB0aGUgdW5kZXJzY29yZSByYXRoZXIgdGhhbiBoeXBoZW4pIGxlZ2FjeSBQViBiYWNr
ZW5kCj4gYnV0Cj4gPiBpdCBpcyBpbGx1c3RyYXRpdmUgdG8gYnVpbGQgdXAgdGhlIGltcGxlbWVu
dGF0aW9uIGluY3JlbWVudGFsbHksIGFsb25nCj4gd2l0aAo+ID4gdGhlIFhlbkJ1cy9YZW5EZXZp
Y2UgZnJhbWV3b3JrLiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCB0aGVyZWZvcmUgYWRkIHRvCj4g
PiB0aGVzZSBkZXZpY2VzJyBpbXBsZW1lbnRhdGlvbiBhcyBuZXcgZmVhdHVyZXMgYXJlIGFkZGVk
IHRvIHRoZQo+IGZyYW1ld29yay4KPiA+Cj4gPiBBZnRlciB0aGlzIHBhdGNoIGhhcyBiZWVuIGFw
cGxpZWQgaXQgaXMgcG9zc2libGUgdG8gaW5zdGFudGlhdGUgbmV3Cj4gPiAneGVuLWRpc2snIG9y
ICd4ZW4tY2Ryb20nIGRldmljZXMgd2l0aCBhIHNpbmdsZSAndmRldicgcGFyYW1ldGVyLCB3aGlj
aAo+ID4gYWNjZXB0cyB2YWx1ZXMgYWRoZXJpbmcgdG8gdGhlIFhlbiBWQkQgbmFtaW5nIHNjaGVt
ZSBbMV0uIEZvciBleGFtcGxlLCBhCj4gPiBjb21tYW5kLWxpbmUgaW5zdGFudGlhdGlvbiBvZiBh
IHhlbi1kaXNrIGNhbiBiZSBkb25lIHdpdGggYW4gYXJndW1lbnQKPiA+IHNpbWlsYXIgdG8gdGhl
IGZvbGxvd2luZzoKPiA+Cj4gPiAtZGV2aWNlIHhlbi1kaXNrLHZkZXY9aGRhCj4gPgo+ID4gVGhl
IGltcGxlbWVudGF0aW9uIG9mIHRoZSB2ZGV2IHBhcmFtZXRlciBmb3JtdWxhdGVzIHRoZSBhcHBy
b3ByaWF0ZSBWQkQKPiA+IG51bWJlciBmb3IgdXNlIGluIHRoZSBQViBwcm90b2NvbC4KPiA+Cj4g
PiBbMV0gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9tYW4veGVuLXZiZC1p
bnRlcmZhY2UuNy5odG1sCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KPiAKPiBOb3cgd2UgY2FuIGFkZCBhIHhlbi1kaXNrIHdpdGgg
dmRldj14dmRiZ3FjdiA6KQoKWWVwLCB5b3UgY2FuIGtlZXAgZ29pbmcgdW50aWwgeGVuc3RvcmUg
ZXhwbG9kZXMgOi0pCgogIFBhdWwKCj4gCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IFRoYW5rcywKPiAKPiAtLQo+IEFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
