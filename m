From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: remove redundant 'default n' from
 Kconfig
Date: Wed, 17 Oct 2018 10:58:07 +0200
Message-ID: <b7929981-5818-32d6-4a27-c9701c977d39__39514.453468337$1539766633$gmane$org@suse.com>
References: <CGME20181016143359eucas1p1b2033a69cc7b03c090125e1b9566fc1d@eucas1p1.samsung.com>
 <20181016143359eucas1p1b2033a69cc7b03c090125e1b9566fc1d~eHWRlFIki1482014820eucas1p1q@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zaqp=m5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gChed-00034W-TN
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 08:58:11 +0000
In-Reply-To: <20181016143359eucas1p1b2033a69cc7b03c090125e1b9566fc1d~eHWRlFIki1482014820eucas1p1q@eucas1p1.samsung.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMTAvMjAxOCAxNjozMywgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiAn
ZGVmYXVsdCBuJyBpcyB0aGUgZGVmYXVsdCB2YWx1ZSBmb3IgYW55IGJvb2wgb3IgdHJpc3RhdGUg
S2NvbmZpZwo+IHNldHRpbmcgc28gdGhlcmUgaXMgbm8gbmVlZCB0byB3cml0ZSBpdCBleHBsaWNp
dGx5Lgo+IAo+IEFsc28gc2luY2UgY29tbWl0IGY0NjdjNTY0MGMyOSAoImtjb25maWc6IG9ubHkg
d3JpdGUgJyMgQ09ORklHX0ZPTwo+IGlzIG5vdCBzZXQnIGZvciB2aXNpYmxlIHN5bWJvbHMiKSB0
aGUgS2NvbmZpZyBiZWhhdmlvciBpcyB0aGUgc2FtZQo+IHJlZ2FyZGxlc3Mgb2YgJ2RlZmF1bHQg
bicgYmVpbmcgcHJlc2VudCBvciBub3Q6Cj4gCj4gICAgIC4uLgo+ICAgICBPbmUgc2lkZSBlZmZl
Y3Qgb2YgKGFuZCB0aGUgbWFpbiBtb3RpdmF0aW9uIGZvcikgdGhpcyBjaGFuZ2UgaXMgbWFraW5n
Cj4gICAgIHRoZSBmb2xsb3dpbmcgdHdvIGRlZmluaXRpb25zIGJlaGF2ZSBleGFjdGx5IHRoZSBz
YW1lOgo+ICAgICAKPiAgICAgICAgIGNvbmZpZyBGT08KPiAgICAgICAgICAgICAgICAgYm9vbAo+
ICAgICAKPiAgICAgICAgIGNvbmZpZyBGT08KPiAgICAgICAgICAgICAgICAgYm9vbAo+ICAgICAg
ICAgICAgICAgICBkZWZhdWx0IG4KPiAgICAgCj4gICAgIFdpdGggdGhpcyBjaGFuZ2UsIG5laXRo
ZXIgb2YgdGhlc2Ugd2lsbCBnZW5lcmF0ZSBhCj4gICAgICcjIENPTkZJR19GT08gaXMgbm90IHNl
dCcgbGluZSAoYXNzdW1pbmcgRk9PIGlzbid0IHNlbGVjdGVkL2ltcGxpZWQpLgo+ICAgICBUaGF0
IG1pZ2h0IG1ha2UgaXQgY2xlYXJlciB0byBwZW9wbGUgdGhhdCBhIGJhcmUgJ2RlZmF1bHQgbicg
aXMKPiAgICAgcmVkdW5kYW50Lgo+ICAgICAuLi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpSZXZpZXdlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
