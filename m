From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 1/5] docs/qemu-deprivilege: Revise and
 update with status and future plans
Date: Fri, 26 Oct 2018 14:45:44 +0100
Message-ID: <23507.6792.900112.851242@mariner.uk.xensource.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yj2z=ng=citrix.com=prvs=83038c4c6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gG2Qv-0006oJ-W0
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 13:45:50 +0000
In-Reply-To: <20181005165701.28030-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggMS81XSBkb2NzL3FlbXUtZGVwcml2aWxlZ2U6
IFJldmlzZSBhbmQgdXBkYXRlIHdpdGggc3RhdHVzIGFuZCBmdXR1cmUgcGxhbnMiKToKPiBkb2Nz
L3FlbXUtZGVwcml2aWxlZ2UudHh0IGhhZCBzb21lIGJhc2ljIGluc3RydWN0aW9ucyBmb3IgdXNp
bmcKPiBkbV9yZXN0cmljdCwgYnV0IGl0IHdhcyBpbmNvbXBsZXRlLCBtaXNsZWFkaW5nLCBhbmQg
c3RhbGUuCgpUaGFua3MgZm9yIHRoZSB1cGRhdGVzIHRvIHRoZSB1bnNoYXJlIHN0dWZmLgoKPiAr
IyMjIERldmljZSBNb2RlbCBEZXByaXZpbGVnaW5nCj4gKwo+ICsgICAgU3RhdHVzLCBMaW51eDog
VGVjaCBQcmV2aWV3LCB3aXRoIGxpbWl0ZWQgc3VwcG9ydAogICAgICAgICAgICAgICAgICAgIF4K
ICAgICAgICAgICAgICAgICAgICAgZG9tMAoKSSB0aGluayB0aGlzIG1heWJlIG5lZWRzCgogICsg
ICAgU3RhdHVzLCBGcmVlQlNEIGRvbTA6IFVuc3VwcG9ydGVkCgp0b28gPyAgVGhlIHVzdWFsIGRl
ZmF1bHQgaXMgc3VwcG9ydGVkIGFuZCBub3QgbGlzdGluZyBpdCBhdCBhbGwgaXMKY29uZnVzaW5n
LgoKPiArTk9URTogTW9zdCBtb2Rlcm4gc3lzdGVtcyBoYXZlIDMyLWJpdCBVSURzLCBhbmQgc28g
Y2FuIGluIHRoZW9yeSBnbyB1cAo+ICt0byAyXjMxIChvciAyXjMyIGlmIHVpZHMgYXJlIHVuc2ln
bmVkKS4gIFBPU0lYIG9ubHkgZ3VhcmFudGVlcyAxNi1iaXQKPiArVUlEcyBob3dldmVyOyBVSUQg
NjU1MzUgaXMgcmVzZXJ2ZWQgZm9yIGFuIGludmFsaWQgdmFsdWUsIGFuZCA2NTUzNCBpcwo+ICtu
b3JtYWxseSBhbGxvY2F0ZWQgdG8gIm5vYm9keSIuICBBZGRpdGlvbmFsbHksIHNvbWUgY29udGFp
bmVyIHN5c3RlbXMKPiAraGF2ZSBwcm9wb3NlZCB1c2luZyB0aGUgdXBwZXIgMzIgYml0cyBvZiB0
aGUgdWlkIGZvciBhIGNvbnRhaW5lciBJRC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXl4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTYKVGhpcyBpcyBhIGdvb2Qg
cGFyYWdyYXBoLgoKQ2FuIEkgc3VnZ2VzdCB3ZSBwaWNrIGEgZGlmZmVyZW50IGV4YW1wbGUgdG8g
NjU1MzYgPyAgSXQncyB2aXN1YWxseQpzaW1pbGFyIHRvIHRoZSBmYW1pbGlhciB2YWx1ZXMgb2Yg
NjU1MzQgYW5kIDY1NTM1IGFuZCBhYnV0cyB0aGVtLgoKb3NzdGVzdCB1c2VzIDIwMDAwMCBidXQg
dGhhdCdzIG5vdCBhIG11bHRpcGxlIG9mIDJeMTYuCkhvdyBhYm91dCAxMzEwNzIgPwoKVGhhbmtz
LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
