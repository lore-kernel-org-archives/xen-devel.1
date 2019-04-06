From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] xen: xen-pciback: fix warning Using plain
 integer as NULL pointer
Date: Sun, 7 Apr 2019 00:33:29 +0530
Message-ID: <8d19e62d-11cd-91dc-6c54-d688d2d67d00__22992.8773989499$1554614684$gmane$org@codeaurora.org>
References: <20190406122912.GA403@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DgqQ=SI=codeaurora.org=mojha@srs-us1.protection.inumbo.net>)
 id 1hCqbM-0007H3-4v
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2019 19:03:40 +0000
In-Reply-To: <20190406122912.GA403@hari-Inspiron-1545>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Ck9uIDQvNi8yMDE5IDU6NTkgUE0sIEhhcmlwcmFzYWQgS2VsYW0gd3JvdGU6Cj4gQ2hhbmdlcyBw
YXNzaW5nIGZ1bmN0aW9uIGFyZ3VtZW50IDAgdG8gTlVMTCB0byBhdm9pZCBiZWxvdyBzcGFyc2UK
PiB3YXJuaW5nCj4KPiAgIENIRUNLICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMK
PiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYzo3MDA6NTE6IHdhcm5pbmc6IFVzaW5n
IHBsYWluIGludGVnZXIgYXMKPiBOVUxMIHBvaW50ZXIKPgo+IFNpZ25lZC1vZmYtYnk6IEhhcmlw
cmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTXVr
ZXNoIE9qaGEgPG1vamhhQGNvZGVhdXJvcmEub3JnPgoKQ2hlZXJzLAotTXVrZXNoCgo+IC0tLQo+
ICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMgfCAyICstCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hl
bmJ1cy5jCj4gaW5kZXggMjNmN2Y2ZS4uODMzYjJkMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay94ZW5idXMuYwo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hl
bmJ1cy5jCj4gQEAgLTY5Nyw3ICs2OTcsNyBAQCBzdGF0aWMgaW50IHhlbl9wY2lia194ZW5idXNf
cHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKPiAgIAkvKiBXZSBuZWVkIHRvIGZvcmNl
IGEgY2FsbCB0byBvdXIgY2FsbGJhY2sgaGVyZSBpbiBjYXNlCj4gICAJICogeGVuZCBhbHJlYWR5
IGNvbmZpZ3VyZWQgdXMhCj4gICAJICovCj4gLQl4ZW5fcGNpYmtfYmVfd2F0Y2goJnBkZXYtPmJl
X3dhdGNoLCBOVUxMLCAwKTsKPiArCXhlbl9wY2lia19iZV93YXRjaCgmcGRldi0+YmVfd2F0Y2gs
IE5VTEwsIE5VTEwpOwo+ICAgCj4gICBvdXQ6Cj4gICAJcmV0dXJuIGVycjsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
