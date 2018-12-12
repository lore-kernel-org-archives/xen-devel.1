From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 0/3] Performance improvements for
 xen_disk^Wxen-block
Date: Wed, 12 Dec 2018 11:15:35 +0000
Message-ID: <0e275f4235534ac7a6d17603efc862c7__758.249921682541$1544613263$gmane$org@AMSPEX02CL03.citrite.net>
References: <1544613269-21996-1-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lg+2=OV=citrix.com=prvs=877c75a5a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gX2US-00016O-Ga
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 11:15:44 +0000
In-Reply-To: <1544613269-21996-1-git-send-email-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "qemu-del@nongnu.org" <qemu-del@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFBhdWwgRHVycmFudCBbbWFpbHRv
OnBhdWwuZHVycmFudEBjaXRyaXguY29tXQo+IFNlbnQ6IDEyIERlY2VtYmVyIDIwMTggMTE6MTQK
PiBUbzogcWVtdS1kZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4ZW4tCgpG
YXQtZmluZ2VyZWQgdGhlIGVtYWlsIGFkZHJlc3MsIEknbGwgc2VuZCBhZ2Fpbi4KCiAgUGF1bAoK
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPjsgQW50aG9ueSBQZXJhcmQKPiA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT47IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+OyBNYXggUmVpdHoKPiA8bXJlaXR6
QHJlZGhhdC5jb20+OyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBTdGVm
YW5vCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBTdWJqZWN0OiBbUEFU
Q0ggdjMgMC8zXSBQZXJmb3JtYW5jZSBpbXByb3ZlbWVudHMgZm9yIHhlbl9kaXNrXld4ZW4tYmxv
Y2sKPiAKPiBUaGlzIHNlcmllcyBpcyBhIHJlLWJhc2Ugb2YgVGltJ3MgdjIgc2VyaWVzIFsxXSBv
biB0b3Agb2YgbXkgc2VyaWVzIFsyXS4KPiAKPiBbMV0gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2Fy
Y2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMTgtMTEvbXNnMDAyNDMuaHRtbAo+IFsyXSBodHRwczov
L2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAxOC0xMi9tc2cwMjI3MS5o
dG1sCj4gCj4gVGltIFNtaXRoICgzKToKPiAgIHhlbi1ibG9jazogaW1wcm92ZSBiYXRjaGluZyBi
ZWhhdmlvdXIKPiAgIHhlbi1ibG9jazogaW1wcm92ZSByZXNwb25zZSBsYXRlbmN5Cj4gICB4ZW4t
YmxvY2s6IGF2b2lkIHJlcGVhdGVkIG1lbW9yeSBhbGxvY2F0aW9uCj4gCj4gIGh3L2Jsb2NrL2Rh
dGFwbGFuZS94ZW4tYmxvY2suYyB8IDEwNSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0KPiAtLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgNDMgZGVs
ZXRpb25zKC0pCj4gLS0tCj4gQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgo+IENjOiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgo+IENjOiBNYXggUmVp
dHogPG1yZWl0ekByZWRoYXQuY29tPgo+IENjOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPiAtLQo+IDIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
