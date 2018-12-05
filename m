From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 13/18] xen: purge 'blk' and 'ioreq' from
 function names in dataplane/xen-qdisk.c
Date: Wed, 5 Dec 2018 17:28:54 +0000
Message-ID: <492a875458194132b54ddbe4a690b26b__33435.9940411106$1544030880$gmane$org@AMSPEX02CL03.citrite.net>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-14-paul.durrant@citrix.com>
 <20181204121041.GT14786@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f1m+=oo=citrix.com=prvs=870045bc7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gUaz9-0003ND-L4
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 17:29:19 +0000
In-Reply-To: <20181204121041.GT14786@perard.uk.xensource.com>
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
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAwNCBEZWNlbWJlciAyMDE4IDEy
OjExCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFl
bXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47Cj4gU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgS2V2aW4g
V29sZiA8a3dvbGZAcmVkaGF0LmNvbT47IE1heAo+IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4K
PiBTdWJqZWN0OiBSZTogW1BBVENIIDEzLzE4XSB4ZW46IHB1cmdlICdibGsnIGFuZCAnaW9yZXEn
IGZyb20gZnVuY3Rpb24KPiBuYW1lcyBpbiBkYXRhcGxhbmUveGVuLXFkaXNrLmMKPiAKPiBPbiBX
ZWQsIE5vdiAyMSwgMjAxOCBhdCAwMzoxMjowNlBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4gPiBUaGlzIGlzIGEgcHVyZWx5IGNvc21ldGljIHBhdGNoIHRoYXQgcHVyZ2VzIHJlbWFpbmlu
ZyB1c2Ugb2YgJ2JsaycgYW5kCj4gPiAnaW9yZXEnIGluIGxvY2FsIGZ1bmN0aW9uIG5hbWVzLgo+
ID4KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gCj4gSSBkb24ndCB0aGluayBpdCdz
IGEgZ29vZCBpZGVlIHRvIHVzZSBmdW5jdGlvbiBuYW1lcyB0aGF0IGNvdWxkIGJlIHVzZQo+IGVs
c2V3aGVyZSwgZG9uJ3QgaGF2ZSBhIG5hbWVzcGFjZS4gSXQgbWFrZXMgaXQgbW9yZSBkaWZmaWN1
bHQgdG8gZmlndXJlCj4gb3V0IHdoaWNoIGZ1bmN0aW9uIGlzIGNhbGxlZCBieSBqdXN0IHNlYXJj
aGluZyBmb3IgdGhlIGZ1bmN0aW9uIG5hbWUuCj4gCj4gQ291bGQgeW91IGhhZCBhIHByZWZpeD8K
PiBNYXliZSB4ZW5kaXNrXyBvciB4ZW5fZGlzayBvciB4ZW5fcWRpc2sgb3IgeGVuX2Jsb2NrIG9y
IC4uLiwgc28gd2UgY2FuCj4gaGF2ZSB4ZW5kaXNrX3N0YXJ0X3JlcXVlc3QsIG9yIHhlbmRpc2tf
cmVxdWVzdF9zdGFydC4gSSBkb24ndCBoYXZlIGEKPiBwcmVmZXJlbmNlIGJlc2lkZSBzdGF5aW5n
IGF3YXkgZnJvbSBnZW5lcmljIG5hbWVzLgo+IAoKSSdsbCBhZGQgYSB4ZW5fYmxvY2tfIHByZWZp
eC4KCiAgUGF1bAoKPiBUaGFua3MsCj4gCj4gLS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
