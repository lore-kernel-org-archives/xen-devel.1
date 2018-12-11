From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 09/18] xen: remove unnecessary code from
 dataplane/xen-block.c
Date: Tue, 11 Dec 2018 15:38:52 +0000
Message-ID: <289322a222fa426faf953c88274d4b2f@AMSPEX02CL03.citrite.net>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-10-git-send-email-paul.durrant@citrix.com>
 <20181211153021.GA16149@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yaMN=OU=citrix.com=prvs=87697dac6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWk84-0003E9-Fu
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:39:24 +0000
In-Reply-To: <20181211153021.GA16149@perard.uk.xensource.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxMSBEZWNlbWJlciAyMDE4IDE1
OjMwCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+OyBTdGVm
YW5vCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFN0ZWZhbiBIYWpub2N6
aQo+IDxzdGVmYW5oYUByZWRoYXQuY29tPjsgTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4K
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYzIDA5LzE4XSB4ZW46IHJlbW92ZSB1
bm5lY2Vzc2FyeSBjb2RlCj4gZnJvbSBkYXRhcGxhbmUveGVuLWJsb2NrLmMKPiAKPiBPbiBUdWUs
IERlYyAxMSwgMjAxOCBhdCAxMDo0NzowOUFNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4g
PiB2MjoKPiA+ICAtIExlYXZlIGV4aXN0aW5nIGJvaWxlcnBsYXRlIGFsb25lLCBvdGhlciB0aGFu
IHJlbW92aW5nIHRoZSBub3ctCj4gaW5jb3JyZWN0Cj4gPiAgICBkZXNjcmlwdGlvbgo+ID4gLS0t
Cj4gPiAgaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jIHwgNDA5ICsrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAtLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDM5MyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaHcvYmxv
Y2svZGF0YXBsYW5lL3hlbi1ibG9jay5jIGIvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi0KPiBibG9j
ay5jCj4gPiBpbmRleCA5ZmFlNTA1Li45OGY5ODdkIDEwMDY0NAo+ID4gLS0tIGEvaHcvYmxvY2sv
ZGF0YXBsYW5lL3hlbi1ibG9jay5jCj4gPiArKysgYi9ody9ibG9jay9kYXRhcGxhbmUveGVuLWJs
b2NrLmMKPiA+IEBAIC0xLDYgKzEsNCBAQAo+ID4gIC8qCj4gPiAtICogIHhlbiBwYXJhdmlydCBi
bG9jayBkZXZpY2UgYmFja2VuZAo+ID4gLSAqCj4gPiAgICogIChjKSBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KPiA+ICAgKgo+ID4gICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCj4gbW9kaWZ5Cj4gPiBAQCAt
MTksMjYgKzE3LDEyIEBACj4gPiAgICogIEdOVSBHUEwsIHZlcnNpb24gMiBvciAoYXQgeW91ciBv
cHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ID4gICAqLwo+ID4KPiA+ICsvKgo+ID4gKyAqIENv
cHlyaWdodCAoYykgMjAxOCAgQ2l0cml4IFN5c3RlbXMgSW5jLgo+IAo+IENhbiB5b3UgbW92ZSB0
aGlzIGNvcHlyaWdodCBsaW5lIHRvIHRoZSBleGlzdGluZyBsaWNlbnNlIGJvaWxlcnBsYXRlIGFz
Cj4gSSd2ZSBhc2tlZCBvbiB2Mj8KPiAKCk9vcHMuIEkgdGhvdWdodCBJJ2QgZG9uZSB0aGlzLgoK
PiA+ICsgKgo+ID4gKyAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHUEwsIHZlcnNpb24gMiBvcgo+IGxhdGVyLgo+ID4gKyAqIFNlZSB0aGUgQ09QWUlO
RyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lgo+IAo+IEFuZCB0aGlzIGlzbid0IG5l
ZWRlZCBhcyBpdCBqdXN0IGR1cGxpY2F0ZSB0aGUgYWxyZWFkeSBleGlzdGluZyBvbmUuCj4gCgpT
dXJlLiBJJ2xsIHNlbmQgdjQgd2l0aCBib3RoIHRoZXNlIGZpeGVkLgoKICBQYXVsCgo+ID4gKyAq
Lwo+ID4KPiAKPiBUaGFua3MsCj4gCj4gLS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
